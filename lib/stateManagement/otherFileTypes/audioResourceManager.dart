
import 'dart:io';
import 'dart:math';

import 'package:mutex/mutex.dart';
import 'package:tuple/tuple.dart';

import '../../fileTypeUtils/audio/riffParser.dart';
import '../../fileTypeUtils/audio/wemToWavConverter.dart';

class AudioResource {
  String wavPath;
  int sampleRate;
  int totalSamples;
  Duration duration;
  List<double>? previewSamples;
  int previewSampleRate;
  int _refCount = 0;
  final bool _deleteOnDispose;

  AudioResource(this.wavPath, this.sampleRate, this.totalSamples, this.duration, this.previewSamples, this.previewSampleRate, this._deleteOnDispose);

  Future<void> dispose() => audioResourcesManager._disposeAudioResource(this);
}

/// Through this class, you can get a reference to an audio file and have to dispose it when you're done with it.
class AudioResourcesManager {
  final Map<String, AudioResource> _resources = {};
  final Map<String, Mutex> _loadingMutexes = {};

  /// Returns a reference to the audio file at the given path.
  /// If the file is already loaded, it will return the same reference.
  /// If the file is not loaded, it will load it.
  Future<AudioResource> getAudioResource(String path) async {
    if (!_loadingMutexes.containsKey(path))
      _loadingMutexes[path] = Mutex();
    await _loadingMutexes[path]!.acquire();

    if (_resources.containsKey(path)) {
      _resources[path]!._refCount++;
      _loadingMutexes[path]!.release();
      return _resources[path]!;
    }

    var wavPath = path;
    bool deleteOnDispose = false;
    if (path.endsWith(".wem")) {
      wavPath = await wemToWavTmp(path);
      deleteOnDispose = true;
    }

    var riff = await RiffFile.fromFile(wavPath);
    Tuple2<List<double>, int>? previewData = await _getPreviewData(riff);
    int totalSamples = riff.data.samples.length ~/ riff.format.channels;
    var resource = AudioResource(
      wavPath,
      riff.format.samplesPerSec,
      totalSamples,
      Duration(microseconds: (totalSamples * 1000000 ~/ riff.format.samplesPerSec)),
      previewData?.item1,
      previewData?.item2 ?? 1,
      deleteOnDispose
    );
    resource._refCount++;
    _resources[path] = resource;

    _loadingMutexes[path]!.release();

    return resource;
  }

  Future<void> reloadAudioResource(AudioResource resource) async {
    var riff = await RiffFile.fromFile(resource.wavPath);
    Tuple2<List<double>, int>? previewData = await _getPreviewData(riff);
    int totalSamples = riff.data.samples.length ~/ riff.format.channels;
    resource.sampleRate = riff.format.samplesPerSec;
    resource.totalSamples = totalSamples;
    resource.duration = Duration(microseconds: (totalSamples * 1000000 ~/ riff.format.samplesPerSec));
    resource.previewSamples = previewData?.item1;
    resource.previewSampleRate = previewData?.item2 ?? 1;
  }

  /// Disposes the reference to the audio file at the given path.
  /// If the reference count reaches 0, the file will be unloaded.
  Future<void> _disposeAudioResource(AudioResource resource) async {
    resource._refCount--;
    if (resource._refCount <= 0) {
      if (resource._deleteOnDispose)
        File(resource.wavPath).delete();
      _resources.removeWhere((key, value) => value == resource);
    }
  }

  Future<Tuple2<List<double>, int>?> _getPreviewData(RiffFile riff) async {
    if (riff.format.formatTag != 1 && riff.format.formatTag != 3)
      return null;
    const previewSampleRate = 200;
    var rawSamples = riff.data.samples;
    int previewSampleCount = rawSamples.length ~/ riff.format.blockAlign ~/ previewSampleRate;
    int bitsPerSample = riff.format.bitsPerSample;
    var scaleFactor = pow(2, bitsPerSample - 1);
    var wavSamples = List.generate(previewSampleCount, (i) => rawSamples[i * previewSampleRate] / scaleFactor);
    return Tuple2(wavSamples, previewSampleRate);
  }
}
final audioResourcesManager = AudioResourcesManager();