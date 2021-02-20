import 'dart:async';

import 'package:flutter/material.dart';

enum TaskItemListAction { ADD }

class EventType {
  final TaskItemListAction action;

  EventType({@required this.action});
}

class TaskItemListEvent {
  final _eventController = StreamController<EventType>();

  StreamSink<EventType> get sink => _eventController.sink;
  Stream<EventType> get stream => _eventController.stream;

  void dissolve() => _eventController.close();
}
