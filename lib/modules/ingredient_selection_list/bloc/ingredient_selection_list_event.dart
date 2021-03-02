import 'dart:async';

import 'package:flutter/material.dart';

enum IngredientSelectionListAction { ADD, REMOVE, REORDER, RENAME }

class Reorder {
  final int oldIndex;
  final int newIndex;
  Reorder({@required this.oldIndex, @required this.newIndex});
}

class EventType {
  final IngredientSelectionListAction action;
  final int id;
  final Reorder reorder;
  final String rename;
  EventType({this.id, @required this.action, this.reorder, this.rename});
}

class IngredientSelectionListEvent {
  final _eventController = StreamController<EventType>.broadcast();

  StreamSink<EventType> get sink => _eventController.sink;
  Stream<EventType> get stream => _eventController.stream;

  void dissolve() => _eventController.close();
}
