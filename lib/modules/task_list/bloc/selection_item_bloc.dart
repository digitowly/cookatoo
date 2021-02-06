import 'dart:async';

import 'package:flutter/material.dart';

enum SelectionItemAction { UPDATE }

class EventType {
  final String type;
  final SelectionItemAction action;

  EventType({@required this.type, @required this.action});
}

class SelectionItemBloc {
  String _ingredientName;

  // State
  final _stateController = StreamController<String>();

  StreamSink<String> get stateSink => _stateController.sink;
  Stream<String> get stateSteam => _stateController.stream;

  // Events
  final _eventController = StreamController<EventType>();

  StreamSink<EventType> get eventSink => _eventController.sink;
  Stream<EventType> get eventSteam => _eventController.stream;

  SelectionItemBloc() {
    eventSteam.listen(
      (event) {
        if (event.action == SelectionItemAction.UPDATE) {
          _ingredientName = event.type;
        }

        stateSink.add(_ingredientName);
      },
    );
  }
}
