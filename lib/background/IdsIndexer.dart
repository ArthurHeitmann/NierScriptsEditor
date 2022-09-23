
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:path/path.dart';
import 'package:xml/xml.dart';

import '../../fileTypeUtils/dat/datExtractor.dart';
import '../../fileTypeUtils/utils/ByteDataWrapper.dart';
import '../../fileTypeUtils/yax/yaxToXml.dart';
import '../../utils.dart';
import '../fileTypeUtils/pak/pakExtractor.dart';

class IndexedIdData {
  final int id;
  final String datPath;
  final String pakPath;
  final String xmlPath;

  IndexedIdData(this.id, this.datPath, this.pakPath, this.xmlPath);

  @override
  String toString() {
    return "IndexedIdData(\n"
      "  id: $id,\n"
      "  datPath: $datPath,\n"
      "  pakPath: $pakPath,\n"
      "  xmlPath: $xmlPath,\n"
      ")";
  }
}

class IndexedEntityIdData extends IndexedIdData {
  final String objId;
  final int actionId;
  final String? name;
  final int? level;

  IndexedEntityIdData(int id, String datPath, String pakPath, String xmlPath, this.objId, this.actionId, this.name, this.level) : super(id, datPath, pakPath, xmlPath);

  @override
  String toString() {
    return "IndexedEntityIdData(\n"
      "  id: $id,\n"
      "  datPath: $datPath,\n"
      "  pakPath: $pakPath,\n"
      "  xmlPath: $xmlPath,\n"
      "  objId: $objId,\n"
      "  actionId: $actionId,\n"
      "  name: $name,\n"
      "  level: $level,\n"
      ")";
  }
}

enum InitStatus {
  notInitialized,
  initializing,
  initialized,
}

class IdsIndexer {
  String? _path;
  bool _stop = false;
  final Map<int, IndexedIdData> indexedIds = {};

  InitStatus _initStatus = InitStatus.notInitialized;
  Completer<void> _awaitInitializedCompleter = Completer<void>();

  String? get path => _path;

  Future<void> indexPath(String path) async {
    _path = path;
    _initStatus = InitStatus.notInitialized;
    await _init(path);
  }

  void indexXml(XmlElement xml, String path) {
    _path = path;
    _initStatus = InitStatus.notInitialized;
    _initXml(xml, path);
  }

  void clear() {
    _path = null;
    indexedIds.clear();
    _initStatus = InitStatus.notInitialized;
  }

  Future<void> awaitInitialized() {
    switch (_initStatus) {
      case InitStatus.notInitialized:
        if (_path == null)
          return Future.value();
        return _init(_path!);
      case InitStatus.initializing:
        return _awaitInitializedCompleter.future;
      case InitStatus.initialized:
        return Future.value();
    }
  }

  void stop() {
    _stop = true;
  }

  Future<void> _init(String path) async {
    if (_initStatus != InitStatus.notInitialized)
      return;
    _initStatus = InitStatus.initializing;
    _stop = false;
    _awaitInitializedCompleter = Completer<void>();

    await _indexAllIds(path);

    _initStatus = InitStatus.initialized;
    _awaitInitializedCompleter.complete();
  }

  void _initXml(XmlElement xml, String xmlPath) {
    if (_initStatus != InitStatus.notInitialized)
      return;
    print("Indexing $xmlPath");
    int t1 = DateTime.now().millisecondsSinceEpoch;

    _initStatus = InitStatus.initializing;
    _stop = false;
    _awaitInitializedCompleter = Completer<void>();

    String pakExtractDir = dirname(xmlPath);
    String pakName = basename(pakExtractDir);
    String datExtractDir = dirname(dirname(pakExtractDir));
    String pakPath = join(datExtractDir, pakName);
    String datName = basename(datExtractDir);
    String datPath = join(dirname(dirname(datExtractDir)), datName);

    _indexXmlContents(datPath, pakPath, xmlPath, xml);

    _initStatus = InitStatus.initialized;
    _awaitInitializedCompleter.complete();

    int t2 = DateTime.now().millisecondsSinceEpoch;
    print("Found ${indexedIds.length} IDs in ${t2 - t1}ms");
  }

  int foundXmlFiles = 0;
  Future<void> _indexAllIds(String indexPath) async {
    if (_stop)
      return;
    print("Indexing ids in $indexPath");
    foundXmlFiles = 0;
    int t1 = DateTime.now().millisecondsSinceEpoch;

    if (await Directory(indexPath).exists()) {
      await _indexAllIdsInDir(indexPath);
    }
    else if (indexPath.endsWith(".dat")) {
      _indexDatContents(indexPath);
    }
    else if (indexPath.endsWith(".pak")) {
      String datExtractDir = dirname(indexPath);
      String datName = basename(datExtractDir);
      String datPath = join(dirname(dirname(datExtractDir)), datName);
      String pakName = basename(indexPath);
      String pakExtractDir = join(datExtractDir, "pakExtracted", pakName);
      ByteBuffer pakBytes = (await File(indexPath).readAsBytes()).buffer;
      _indexPakContents(datPath, indexPath, pakExtractDir, ByteDataWrapper(pakBytes));
    }
    else if (indexPath.endsWith(".yax") || indexPath.endsWith(".xml")) {
      String pakExtractDir = dirname(indexPath);
      String pakName = basename(pakExtractDir);
      String datExtractDir = dirname(dirname(pakExtractDir));
      String pakPath = join(datExtractDir, pakName);
      String datName = basename(datExtractDir);
      String datPath = join(dirname(dirname(datExtractDir)), datName);

      if (indexPath.endsWith(".yax")) {
        ByteBuffer yaxBytes = (await File(indexPath).readAsBytes()).buffer;
        _indexYaxContents(datPath, pakPath, indexPath, ByteDataWrapper(yaxBytes));
      }
      else {
        String xml = await File(indexPath).readAsString();
        XmlDocument xmlDoc = XmlDocument.parse(xml);
        _indexXmlContents(datPath, pakPath, indexPath, xmlDoc.rootElement);
      }
    }
    else {
      print("Unknown file type: $indexPath");
    }
    
    int t2 = DateTime.now().millisecondsSinceEpoch;
    print("Found $foundXmlFiles xml files with ${indexedIds.length} IDs in ${t2 - t1}ms");
  }

  Future<void> _indexAllIdsInDir(String dir) async {
    List<Future<void>> futures = [];
    var files = Directory(dir)
      .list(recursive: true)
      .where((f) => f is File && f.path.endsWith(".dat"));
    await for (var entry in files) {
      if (_stop)
        return;

      futures.add(_indexDatContents(entry.path));
    }
    await Future.wait(futures);
  }

  Future<void> _indexDatContents(String datPath) async {
    if (_stop)
      return;
    List<Future<void>> futures = [];
    var fileName = basename(datPath);
    var datFolder = dirname(datPath);
    var datExtractDir = join(datFolder, "nier2blender_extracted", fileName);

    if (await Directory(datExtractDir).exists()) {
      var pakFiles = (await getDatFiles(datExtractDir))
                    .where((f) => f.endsWith(".pak"));
      for (var pakFile in pakFiles) {
        var pakPath = join(datExtractDir, pakFile);
        var pakExtractDir = join(datExtractDir, "pakExtracted", basename(pakFile));
        var pakFileBytes = (await File(pakPath).readAsBytes()).buffer;
        // futures.add(_indexPakContents(datPath, pakPath, pakExtractDir, pakFileBytes));
        await _indexPakContents(datPath, pakPath, pakExtractDir, ByteDataWrapper(pakFileBytes));
      }
    }
    else {
      await for (var fileData in extractDatFilesAsStream(datPath)) {
        if (_stop)
          return;
        if (!fileData.path.endsWith(".pak"))
          continue;
        var pakExtractDir = join(datExtractDir, "pakExtracted", basename(fileData.path));
        // futures.add(_indexPakContents(datPath, fileData.path, pakExtractDir, fileData.bytes.asByteData()));
        await _indexPakContents(datPath, fileData.path, pakExtractDir, fileData.bytes);
      }
    }

    await Future.wait(futures);
  }

  Future<void> _indexPakContents(String datPath, String pakPath, String pakExtractPath, ByteDataWrapper bytes) async {
    if (_stop)
      return;
    List<Future<void>> futures = [];
    var pakInfoPath = join(pakExtractPath, "pakInfo.json");

    if (await File(pakInfoPath).exists()) {
      var pakInfoJson = jsonDecode(await File(pakInfoPath).readAsString());
      var pakFiles = (pakInfoJson["files"] as List)
                      .map((f) => f["name"])
                      .toList();
      for (var yaxFile in pakFiles) {
        var yaxPath = join(pakExtractPath, yaxFile);
        var yaxBytes = (await File(yaxPath).readAsBytes());
        // futures.add(_indexYaxContents(datPath, pakPath, yaxPath, yaxBytes.buffer.asByteData()));
        await _indexYaxContents(datPath, pakPath, yaxPath, ByteDataWrapper(yaxBytes.buffer));
      }
    }
    else {
      await for (var fileData in extractPakBytesAsStream(pakPath, bytes)) {
        if (_stop)
          return;
        // futures.add(_indexYaxContents(datPath, pakPath, fileData.path, fileData.bytes.asByteData()));
        await _indexYaxContents(datPath, pakPath, fileData.path, fileData.bytes);
      }
    }

    await Future.wait(futures);
  }

  Future<void> _indexYaxContents(String datPath, String pakPath, String yaxPath, ByteDataWrapper bytes) async {
    if (_stop)
      return;
    var xmlPath = setExtension(yaxPath, ".xml");
    
    if (await File(xmlPath).exists()) {
      var xmlDoc = XmlDocument.parse(await File(xmlPath).readAsString());
      var xmlRoot = xmlDoc.rootElement;
      _indexXmlContents(datPath, pakPath, yaxPath, xmlRoot);
    }
    else {
      var xmlRoot = yaxToXml(bytes, includeAnnotations: false);
      _indexXmlContents(datPath, pakPath, yaxPath, xmlRoot);
    }
  }

  void _indexXmlContents(String datPath, String pakPath, String xmlPath, XmlElement root) {
    if (_stop)
      return;
    foundXmlFiles++;

    var hapIdL = root.findElements("id");
    if (hapIdL.isNotEmpty) {
      var hapId = int.parse(hapIdL.first.text);
      indexedIds[hapId] = IndexedIdData(hapId, datPath, pakPath, xmlPath);
    }

    for (var action in root.findElements("action")) {
      var actionId = int.parse(action.findElements("id").first.text);
      indexedIds[actionId] = IndexedIdData(actionId, datPath, pakPath, xmlPath);

      for (var normal in action.findAllElements("normal")) {  // entities
        var normalLayouts = normal.findElements("layouts").first;
        for (var value in normalLayouts.findElements("value")) {
          var entityId = int.parse(value.childElements.first.text);
          var objId = value.findElements("objId").first.text;
          String? name;
          int? level;
          var aliasL = value.findElements("alias");
          if (aliasL.isNotEmpty)
            name = aliasL.first.text;
          var paramsL = value.findElements("param");
          if (paramsL.isNotEmpty) {
            for (var param in paramsL.first.findElements("value")) {
              var paramName = param.childElements.first.text;
              var paramBody = param.childElements.elementAt(2).text;
              if (paramName == "NameTag")
                name = paramBody;
              else if (paramName == "Lv")
                level = int.parse(paramBody);
            }
          }

          indexedIds[entityId] = IndexedEntityIdData(entityId, datPath, pakPath, xmlPath, objId, actionId, name, level);
        }
      }
    }
  }
}