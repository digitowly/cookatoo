import 'dart:async';

import 'package:cookatoo/models/task_item.model.dart';
import 'package:flutter/material.dart';

enum TaskItemListAction { ADD }

class EventType {
  final TaskItemListAction action;

  EventType({@required this.action});
}

class TaskItemListBloc {
  List<TaskItem> _tasks = [];

  // State
  final _stateController = StreamController<List<TaskItem>>();
  StreamSink<List<TaskItem>> get stateSink => _stateController.sink;
  Stream<List<TaskItem>> get stateStream => _stateController.stream;

  // Event
  final _eventController = StreamController<EventType>();
  StreamSink<EventType> get eventSink => _eventController.sink;
  Stream<EventType> get eventStream => _eventController.stream;

  TaskItemListBloc() {
    eventStream.listen((event) {
      if (event.action == TaskItemListAction.ADD) {
        print('new item');
      }
      stateSink.add(_tasks);
    });
  }
}
