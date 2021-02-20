import 'dart:async';

import 'package:cookatoo/models/ingredient.model.dart';
import 'package:flutter/material.dart';

enum IngredientSelectionAction { UPDATE, ADD, SUBSTRACT }

class EventType {
  final Ingredient type;
  final IngredientSelectionAction action;

  EventType({this.type, @required this.action});
}

class IngredientSelectionEvent {
  final _eventController = StreamController<EventType>.broadcast();

  StreamSink<EventType> get sink => _eventController.sink;
  Stream<EventType> get stream => _eventController.stream;

  void dissolve() => _eventController.close();
}
