import 'dart:async';

import 'package:cookatoo/modules/task_list/screens/ingredient_selection.dart';

enum SelectionsListAction { ADD }

class SelectionsListBloc {
  List<IngredientSelection> _ingredientSelections = [];

  // State
  final _stateController = StreamController<List<IngredientSelection>>();

  StreamSink<List<IngredientSelection>> get stateSink => _stateController.sink;

  Stream<List<IngredientSelection>> get stateStream => _stateController.stream;

  // Events
  final _eventController = StreamController<SelectionsListAction>();

  StreamSink<SelectionsListAction> get eventSink => _eventController.sink;

  Stream<SelectionsListAction> get eventStream => _eventController.stream;

  SelectionsListBloc() {
    eventStream.listen((event) {
      if (event == SelectionsListAction.ADD) {
        print('add');
        _ingredientSelections.add(IngredientSelection());
        print(_ingredientSelections);
      }
      stateSink.add(_ingredientSelections);
    });
  }

  void dissolve() {
    _stateController.close();
    _eventController.close();
  }
}
