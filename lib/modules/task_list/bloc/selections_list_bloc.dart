import 'dart:async';
import 'dart:math';

import 'package:cookatoo/modules/task_list/screens/ingredient_selection.dart';
import 'package:flutter/material.dart';

enum SelectionsListAction { ADD, REMOVE }

class EventType {
  final SelectionsListAction action;
  final int id;
  EventType({this.id, @required this.action});
}

class SelectionsListBloc {
  List<IngredientSelection> _ingredientSelections = [];

  // State
  final _stateController =
      StreamController<List<IngredientSelection>>.broadcast();

  StreamSink<List<IngredientSelection>> get stateSink => _stateController.sink;

  Stream<List<IngredientSelection>> get stateStream => _stateController.stream;

  // Events
  final _eventController = StreamController<EventType>.broadcast();

  StreamSink<EventType> get eventSink => _eventController.sink;

  Stream<EventType> get eventStream => _eventController.stream;

  SelectionsListBloc() {
    eventStream.listen((event) {
      if (event.action == SelectionsListAction.ADD) {
        print('add');
        _ingredientSelections.add(IngredientSelection(
          delete: delete,
          id: new Random().nextInt(100),
          key: UniqueKey(),
        ));
        print(_ingredientSelections);
      } else if (event.action == SelectionsListAction.REMOVE) {
        _ingredientSelections = _ingredientSelections
            .where((ingredient) => ingredient.id != event.id)
            .toList();
        print(_ingredientSelections);
      }
      stateSink.add(_ingredientSelections);
    });
  }

  void delete(int id) {
    print(id);
    this.eventSink.add(EventType(id: id, action: SelectionsListAction.REMOVE));
  }

  void dissolve() {
    _stateController.close();
    _eventController.close();
  }
}
