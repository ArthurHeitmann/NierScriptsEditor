
import 'package:flutter/material.dart';

import '../main.dart';
import '../stateManagement/openFilesManager.dart';
import '../stateManagement/undoable.dart';
import '../utils/utils.dart';
import '../widgets/misc/Selectable.dart';
import 'intents.dart';

class TabChangeAction extends Action<TabChangeIntent> {
  TabChangeAction();

  @override
  void invoke(TabChangeIntent intent) {
    if (intent.direction == HorizontalDirection.right)
      areasManager.activeArea?.switchToNextFile();
    else
      areasManager.activeArea?.switchToPreviousFile();
  }
}

class CloseTabAction extends Action<CloseTabIntent> {
  CloseTabAction();

  @override
  void invoke(CloseTabIntent intent) {
    if (areasManager.activeArea?.currentFile != null)
      areasManager.activeArea?.closeFile(areasManager.activeArea!.currentFile!);
  }
}

class SaveTabAction extends Action<SaveTabIntent> {
  SaveTabAction();

  @override
  void invoke(SaveTabIntent intent) {
    areasManager.saveAll();
  }
}

class UndoAction extends Action<UndoIntent> {
  UndoAction();

  @override
  void invoke(UndoIntent intent) {
    undoHistoryManager.undo();
  }
}

class RedoAction extends Action<RedoIntent> {
  RedoAction();

  @override
  void invoke(RedoIntent intent) {
    undoHistoryManager.redo();
  }
}

class ChildKeyboardAction extends Action<ChildKeyboardActionIntent> {
  ChildKeyboardAction();

  @override
  void invoke(ChildKeyboardActionIntent intent) {
    // abort if some text field is selected
    var focusNode = FocusScope.of(getGlobalContext()).focusedChild;
    if (focusNode?.hasFocus == true)
      return;

    selectable.active.value?.onKeyboardAction?.call(intent.action);
  }
}
