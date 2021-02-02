import 'package:cookatoo/components/bottom_drawer/task_categories.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cookatoo'),
        ),
        body: Column(
          children: [
            Text('Hello Cooks'),
            TaskCategories(),
          ],
        ),
      ),
    );
  }
}
