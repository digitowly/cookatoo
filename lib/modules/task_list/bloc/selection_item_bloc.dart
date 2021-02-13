import 'dart:async';

import 'package:flutter/material.dart';

enum SelectionItemAction { UPDATE, ADD, SUBSTRACT }

class EventType {
  final String type;
  final SelectionItemAction action;

  EventType({this.type, @required this.action});
}

class SelectionItemBloc {
  Map _ingredientData = {"type": 'placeholder', "amount": 0};

  // State
  final _stateController = StreamController<Map>.broadcast();

  StreamSink<Map> get stateSink => _stateController.sink;
  Stream<Map> get stateSteam => _stateController.stream;

  // Events
  final _eventController = StreamController<EventType>.broadcast();

  StreamSink<EventType> get eventSink => _eventController.sink;
  Stream<EventType> get eventSteam => _eventController.stream;

  SelectionItemBloc() {
    eventSteam.listen(
      (event) {
        if (event.action == SelectionItemAction.UPDATE) {
          _ingredientData["type"] = event.type;
        } else if (event.action == SelectionItemAction.ADD) {
          _ingredientData["amount"]++;
        } else if (event.action == SelectionItemAction.SUBSTRACT) {
          _ingredientData["amount"]--;
        }

        stateSink.add(_ingredientData);
      },
    );
  }

  void dissolve() {
    _stateController.close();
    _eventController.close();
  }
}
