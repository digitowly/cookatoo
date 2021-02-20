import 'dart:async';

import 'package:cookatoo/modules/task_list/bloc/task_item_list_event.dart';
import 'package:cookatoo/modules/task_list/bloc/task_item_list_state.dart';

class TaskItemListBloc {
  final state = TaskItemListState();
  final event = TaskItemListEvent();

  TaskItemListBloc() {
    event.stream.listen((event) {
      if (event.action == TaskItemListAction.ADD) {
        print('new item');
      }
      state.sink.add(state.tasks);
    });
  }
}
