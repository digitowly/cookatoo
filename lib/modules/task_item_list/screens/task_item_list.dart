import 'package:cookatoo/models/task_item_model.dart';
import 'package:cookatoo/modules/task_creator/screens/task_creator.dart';
import 'package:cookatoo/modules/task_item/screens/task_item.dart';
import 'package:cookatoo/modules/task_item_list/bloc/task_item_list_bloc.dart';
import 'package:cookatoo/modules/task_item_list/bloc/task_item_list_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TaskItemList extends StatelessWidget {
  final _taskItemListBloc = TaskItemListBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('Tasks'),
          StreamBuilder(
            stream: _taskItemListBloc.state.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<TaskItemModel> taskList = snapshot.data;
                return Container(
                  height: 600,
                  child: ListView(
                    children: [
                      ...taskList.map(
                        (task) => TaskItem(
                          taskItem: task,
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return Text('no tasks');
              }
            },
          )
        ],
      ),
      floatingActionButton: TaskCreator(
        addToTaskList: (TaskItemModel taskItem) => _taskItemListBloc.event.sink
            .add(EventType(action: TaskItemListAction.ADD, taskItem: taskItem)),
      ),
    );
  }
}
