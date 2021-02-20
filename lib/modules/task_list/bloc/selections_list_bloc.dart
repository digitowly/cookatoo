import 'dart:async';
import 'dart:math';

import 'package:cookatoo/modules/task_list/screens/ingredient_selection.dart';
import 'package:flutter/material.dart';

enum SelectionsListAction { ADD, REMOVE, REORDER }

class EventType {
  final SelectionsListAction action;
  final int id;
  final Reorder reorder;
  EventType({this.id, @required this.action, this.reorder});
}

class Reorder {
  final int oldIndex;
  final int newIndex;
  Reorder({@required this.oldIndex, @required this.newIndex});
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
    eventStream.listen(
      (event) {
        if (event.action == SelectionsListAction.ADD) {
          _ingredientSelections.add(
            IngredientSelection(
              delete: delete,
              id: new Random().nextInt(100),
              key: UniqueKey(),
            ),
          );
        } else if (event.action == SelectionsListAction.REMOVE) {
          _ingredientSelections = _ingredientSelections
              .where((ingredient) => ingredient.id != event.id)
              .toList();
        } else if (event.action == SelectionsListAction.REORDER) {
          reorderList(
              list: _ingredientSelections,
              oldIndex: event.reorder.oldIndex,
              newIndex: event.reorder.newIndex);
        }
        stateSink.add(_ingredientSelections);
      },
    );
  }

  void reorderList({List list, int oldIndex, int newIndex}) {
    if (newIndex > list.length) newIndex = list.length;
    if (oldIndex < newIndex) newIndex--;

    var temp = list[oldIndex];
    list.remove(temp);
    list.insert(newIndex, temp);
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
