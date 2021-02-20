import 'dart:async';

import 'package:cookatoo/models/task_item_model.dart';

class TaskItemListState {
  List<TaskItemModel> tasks = [];

  final _stateController = StreamController<List<TaskItemModel>>.broadcast();

  StreamSink<List<TaskItemModel>> get sink => _stateController.sink;
  Stream<List<TaskItemModel>> get stream => _stateController.stream;

  void dissolve() => _stateController.close();
}
