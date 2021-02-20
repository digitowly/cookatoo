import 'package:flutter/material.dart';

import 'modules/task_item_list/screens/task_item_list.dart';


void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TaskItemList());
  }
}
