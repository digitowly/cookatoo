import 'dart:async';

import 'package:cookatoo/models/task_item.model.dart';

class TaskItemListState {
  List<TaskItem> tasks = [];

  final _stateController = StreamController<List<TaskItem>>();

  StreamSink<List<TaskItem>> get sink => _stateController.sink;
  Stream<List<TaskItem>> get stream => _stateController.stream;

  void dissolve() => _stateController.close();
}
