// Justification: StatefulWidget is chosen because this screen manages interactive  widget states
// (reordering lists and removing dismissed items) that require setState() to update the UI dynamically.

import 'package:flutter/material.dart';

class WidgetScreen extends StatefulWidget {
  const WidgetScreen({super.key});

  @override
  State<WidgetScreen> createState() => _WidgetScreenState();
}

class _WidgetScreenState extends State<WidgetScreen> {
  List<String> dismissibleItems = [
    "Swipe me left or right",
    "Flutter widgets",
    "Swipe to delete",
  ];

  List<String> reorderableItems = [
    "Item 1: Drag me around",
    "Item 2: Long press to reorder",
    "Item 3: Move me up or down",
  ];

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final item = reorderableItems.removeAt(oldIndex);
      reorderableItems.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    String whatIsFlutterExp =
        "Flutter is Google's UI toolkit for building natively compiled applicatons for mobile, web, and desktop from a single codebase";
    return Scaffold(
      appBar: AppBar(title: Text("Widget Showcase")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("1. ExpansionTile"),
            Card(
              child: ExpansionTile(
                leading: Icon(Icons.info_outline),
                title: Text("What is Flutter?"),
                subtitle: Text("Tap to expand/collapse"),
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(whatIsFlutterExp),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // 2: Interactive Viewer
            _buildSectionTitle("2. InteractiveViewer (Pans & Zoom)"),
            Text("Ping or drag the box below to zoom and pan: "),
            SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                height: 200,
                width: double.infinity,
                color: Colors.blueGrey[100],
                child: InteractiveViewer(
                  boundaryMargin: EdgeInsets.all(20),
                  minScale: 0.5,
                  maxScale: 3.0,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      color: Colors.deepPurple,
                      child: Text(
                        "Zoom & Drag me!",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),

            _buildSectionTitle("3. Dismissible (Swipe to Dismiss)"),
            Text("Swipe any item below horizontally to delete it: "),
            SizedBox(height: 8),
            for (final item in dismissibleItems)
              Dismissible(
                key: Key(item),
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                secondaryBackground: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (direction) {
                  setState(() {
                    dismissibleItems.remove(item);
                  });
                },
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.swipe),
                    title: Text(item),
                  ),
                ),
              ),
            SizedBox(height: 24),

            // 4: ReorderbleListView
            _buildSectionTitle("4. ReorderableListView (Drag to Reorder)"),
            Text("Long press and drag any item to change its position: "),
            SizedBox(height: 8),
            ReorderableListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              onReorder: _onReorder,
              children: [
                for (String item in reorderableItems)
                  Card(
                    key: ValueKey(item),
                    child: ListTile(
                      leading: Icon(Icons.drag_handle),
                      title: Text(item),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
