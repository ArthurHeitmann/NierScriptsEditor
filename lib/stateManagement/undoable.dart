
import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'FileHierarchy.dart';
import 'hasUuid.dart';
import 'miscValues.dart';
import 'openFilesManager.dart';

mixin Undoable on HasUuid {
  Undoable takeSnapshot();
  void restoreWith(Undoable snapshot);
}

class _UndoSnapshot {
  late final Undoable fileAreasSnapshot;
  late final Undoable openHierarchySnapshot;

  _UndoSnapshot(this.fileAreasSnapshot, this.openHierarchySnapshot);

  _UndoSnapshot.take() {
    fileAreasSnapshot = areasManager.takeSnapshot();
    openHierarchySnapshot = openHierarchyManager.takeSnapshot();
  }

  void restore() {
    areasManager.restoreWith(fileAreasSnapshot);
    openHierarchyManager.restoreWith(openHierarchySnapshot);
  }

  void dispose() {
    (fileAreasSnapshot as OpenFilesAreasManager).dispose();
    (openHierarchySnapshot as OpenHierarchyManager).dispose();
  }
}

class UndoHistoryManager with ChangeNotifier {
  final List<_UndoSnapshot> _undoStack = [];
  int _undoIndex = 0;
  bool _isRestoring = false;
  late final void Function() _pushSnapshotThrottled;

  UndoHistoryManager() {
    _pushSnapshotThrottled =  debounce(_pushSnapshot, 450);
    Future.delayed(const Duration(milliseconds: 500), _pushSnapshot);
  }

  void onUndoableEvent() {
    if (_isRestoring) return;
    if (disableFileChanges) return;
    _pushSnapshotThrottled();
  }
  
  void _pushSnapshot() {
    if (_isRestoring) return;
    if (_undoStack.length - 1 > _undoIndex) {
      for (int i = _undoStack.length - 1; i > _undoIndex; i--) {
        _undoStack.removeAt(i)
          .dispose();
      }
    }
    int t1 = DateTime.now().millisecondsSinceEpoch;
    _undoStack.add(_UndoSnapshot.take());
    _undoIndex = clamp(_undoIndex + 1, 0, _undoStack.length - 1);
    
    int tD = DateTime.now().millisecondsSinceEpoch - t1;
    if (tD > 8)
      print("WARNING: Pushing history snapshot took ${tD}ms");
    
    notifyListeners();
  }

  void undo() {
    if (_undoStack.isEmpty || _undoIndex == 0)
      return;
    _undoIndex--;
    _isRestoring = true;
    try {
      _undoStack[_undoIndex].restore();
    } finally {
      _isRestoring = false;
    }
    notifyListeners();
  }

  void redo() {
    if (_undoStack.isEmpty || _undoIndex == _undoStack.length - 1)
      return;
    _undoIndex++;
    _isRestoring = true;
    try {
      _undoStack[_undoIndex].restore();
    } finally {
      _isRestoring = false;
    }
    notifyListeners();
  }

  bool get canUndo {
    return _undoStack.length > 1 && _undoIndex > 0;
  }

  bool get canRedo {
    return _undoStack.length > 1 && _undoIndex < _undoStack.length - 1;
  }
}

final undoHistoryManager = UndoHistoryManager();
