import 'package:flutter/material.dart';

import 'FileHierarchyExplorer/fileMetaEditor.dart';
import 'filesView/OpenFilesAreas.dart';
import 'FileHierarchyExplorer/FileExplorer.dart';
import 'ResizableWidget.dart';
import 'filesView/XmlPropDetailsEditor.dart';
import 'filesView/outliner.dart';
import 'filesView/searchPanel.dart';
import 'filesView/sidebar.dart';

class EditorLayout extends StatelessWidget {
  const EditorLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Sidebar(
          initialWidth: MediaQuery.of(context).size.width * 0.22,
          entries: [
            SidebarEntryConfig(
              name: "Files",
              icon: Icons.folder,
              child: ResizableWidget(
                axis: Axis.vertical,
                percentages: const [0.6, 0.4],
                draggableThickness: 5,
                children: [
                  FileExplorer(),
                  FileMetaEditor()
                ],
              ),
            ),
            SidebarEntryConfig(
              name: "Search",
              icon: Icons.search,
              child: const SearchPanel(),
            )
          ],
        ),
        Expanded(child: OpenFilesAreas()),
        Sidebar(
          initialWidth: MediaQuery.of(context).size.width * 0.25,
          switcherPosition: SidebarSwitcherPosition.right,
          entries: [
            SidebarEntryConfig(
              name: "Details",
              child: ResizableWidget(
                axis: Axis.vertical,
                percentages: const [0.4, 0.6],
                children: [
                  Outliner(),
                  XmlPropDetailsEditor(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
