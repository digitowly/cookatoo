import 'package:cookatoo/modules/task_item_list/bloc/task_item_list_event.dart';
import 'package:cookatoo/modules/task_item_list/bloc/task_item_list_state.dart';

class TaskItemListBloc {
  final state = TaskItemListState();
  final event = TaskItemListEvent();

  TaskItemListBloc() {
    event.stream.listen((event) {
      if (event.action == TaskItemListAction.ADD) {
        print('new item');
        // state.tasks.add();
        print(event.taskItem);
        state.tasks.add(event.taskItem);
      }
      state.sink.add(state.tasks);
    });
  }

  void addTask() {}
}
