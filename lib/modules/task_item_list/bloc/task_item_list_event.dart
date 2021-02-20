import 'dart:async';

import 'package:cookatoo/models/task_item_model.dart';
import 'package:flutter/material.dart';

enum TaskItemListAction { ADD }

class EventType {
  final TaskItemListAction action;
  TaskItemModel taskItem;

  EventType({@required this.action, this.taskItem});
}

class TaskItemListEvent {
  final _eventController = StreamController<EventType>.broadcast();

  StreamSink<EventType> get sink => _eventController.sink;
  Stream<EventType> get stream => _eventController.stream;

  void dissolve() => _eventController.close();
}
