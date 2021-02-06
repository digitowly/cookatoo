import 'package:cookatoo/modules/task_list/screens/task_creator_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [Text('Tasks')],
      ),
      floatingActionButton: TaskCreatorButton(),
    );
  }
}
