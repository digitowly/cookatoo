import 'package:cookatoo/components/bottom_drawer/task_creator.dart';
import 'package:cookatoo/models/task.model.dart';
import 'package:flutter/material.dart';

class TaskCreationButton extends StatelessWidget {
  final Task task;

  TaskCreationButton(this.task);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(task.name),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return TaskCreator(
              type: task.type,
            );
          },
        );
      },
    );
  }
}
