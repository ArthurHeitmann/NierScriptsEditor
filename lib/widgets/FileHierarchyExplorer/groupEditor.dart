
import 'package:flutter/material.dart';

import '../../stateManagement/ChangeNotifierWidget.dart';
import '../../stateManagement/FileHierarchy.dart';
import '../../stateManagement/Property.dart';
import '../misc/smallButton.dart';
import '../propEditors/genericTextField.dart';

class GroupEditor extends ChangeNotifierWidget {
  GroupEditor({super.key}) : super(notifier: openHierarchyManager);

  @override
  State<GroupEditor> createState() => _GroupEditorState();
}

class _GroupEditorState extends ChangeNotifierState<GroupEditor> {
  @override
  Widget build(BuildContext context) {
    var entry = openHierarchyManager.selectedEntry;
    HapGroupHierarchyEntry? groupEntry;
    if (entry is HapGroupHierarchyEntry)
      groupEntry = entry;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        makeTopRow(),
        Divider(height: 1),
        Expanded(
          key: Key(openHierarchyManager.selectedEntry?.name.value ?? "noGroup"),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: groupEntry != null ? makeGroupEditor(groupEntry) : makeFallback(),
            ),
          ),
        ),
      ],
    );
  }

  Widget makeTopRow() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Text("GROUP EDITOR", 
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Row(
          children: [
            // Tooltip(
            //   message: "Expand all",
            //   waitDuration: Duration(milliseconds: 500),
            //   child: IconButton(
            //     padding: EdgeInsets.all(5),
            //     constraints: BoxConstraints(),
            //     iconSize: 20,
            //     splashRadius: 20,
            //     icon: Icon(Icons.unfold_more),
            //     onPressed: openHierarchyManager.expandAll,
            //   ),
            // ),
            // Tooltip(
            //   message: "Collapse all",
            //   waitDuration: Duration(milliseconds: 500),
            //   child: IconButton(
            //     padding: EdgeInsets.all(5),
            //     constraints: BoxConstraints(),
            //     iconSize: 20,
            //     splashRadius: 20,
            //     icon: Icon(Icons.unfold_less),
            //     onPressed: openHierarchyManager.collapseAll,
            //   ),
            // ),
          ],
        ),
      ],
    );
  }

  Widget makeGroupEditor(HapGroupHierarchyEntry groupEntry) {
    return ChangeNotifierBuilder(
      notifier: groupEntry,
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(flex: 1, child: Text("Name:")),
              Flexible(flex: 3, child: PropTextField(prop: groupEntry.name)),
            ],
          ),
          SizedBox(height: 5),
          Text("Tokens:"),
          SizedBox(height: 5),
          for (var token in groupEntry.tokens)
            Row(
              children: [
                Expanded(child: makePropEditor(token.code)),
                SizedBox(width: 5),
                Expanded(child: makePropEditor(token.id)),
                SizedBox(width: 5),
                SmallButton(
                  onPressed: () => groupEntry.tokens.remove(token),
                  constraints: BoxConstraints(maxWidth: 30),
                  child: Icon(Icons.close, size: 15,),
                )
              ],
            ),
          SmallButton(
            onPressed: () {
              groupEntry.tokens.add(GroupToken(HexProp(0), HexProp(0)));
            },
            constraints: BoxConstraints(maxWidth: 60),
            child: Icon(Icons.add, size: 20,),
          )
        ]
      ),
    );
  }

  Widget makeFallback() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("No group selected"),
    );
  }
}