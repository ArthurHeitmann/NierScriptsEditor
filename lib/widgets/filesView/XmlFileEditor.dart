
import 'package:flutter/material.dart';

import '../../stateManagement/ChangeNotifierWidget.dart';
import '../../stateManagement/charNamesXmlWrapper.dart';
import '../../stateManagement/openFileTypes.dart';
import '../../stateManagement/xmlProps/xmlProp.dart';
import '../../utils/assetDirFinder.dart';
import '../../utils/utils.dart';
import '../misc/onHoverBuilder.dart';
import '../propEditors/otherFileTypes/genericTable/tableEditor.dart';
import '../propEditors/simpleProps/XmlPropEditor.dart';
import 'XmlActionsEditor.dart';

class XmlFileEditor extends ChangeNotifierWidget {
  late final XmlFileData fileContent;

  XmlFileEditor({Key? key, required this.fileContent}) : super(key: key, notifier: fileContent);

  @override
  ChangeNotifierState<XmlFileEditor> createState() => _XmlEditorState();
}

class _XmlEditorState extends ChangeNotifierState<XmlFileEditor> {
  Future<bool>? supportVsCodeEditing;

  @override
  void initState() {
    super.initState();
    widget.fileContent.load();
    supportVsCodeEditing = hasVsCode();
  }

  @override
  Widget build(BuildContext context) {
    return widget.fileContent.root != null
      ? _makeXmlEditor(widget.fileContent.root!)
      : Column(
        children: const [
          SizedBox(height: 35),
          SizedBox(
            height: 2,
            child: LinearProgressIndicator(backgroundColor: Colors.transparent,)
          ),
        ],
      );
  }

  Widget _makeXmlEditor(XmlProp root) {
    if (_isActionsXml(root))
      return XmlActionsEditor(root: root);
    if (root is CharNamesXmlProp)
      return TableEditor(config: root);
    return Stack(
      children: [
        SingleChildScrollView(
          child: XmlPropEditor(prop: root, showDetails: true,)
        ),
        FutureBuilder(
          future: supportVsCodeEditing,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data == true)
              return Positioned(
                top: 16,
                right: 16,
                child: OnHoverBuilder(
                  builder: (context, isHovering) => AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: isHovering ? 1 : 0.5,
                    child: IconButton(
                      icon: Image.asset("assets/images/vscode.png", width: 32, height: 32),
                      onPressed: () => openInVsCode(widget.fileContent.path),
                    ),
                  ),
                ),
              );
            return const SizedBox();
          },
        ),
      ],
    );
  }
}

bool _isActionsXml(XmlProp root) {
  return
    root.any((element) => element.tagName == "name") &&
    root.any((element) => element.tagName == "id") &&
    root.any((element) => element.tagName == "size") &&
    root.any((element) => element.tagName == "action");
}
