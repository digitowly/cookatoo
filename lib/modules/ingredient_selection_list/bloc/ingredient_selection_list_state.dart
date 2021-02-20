import 'dart:async';

import 'package:cookatoo/modules/ingredient_selection/screens/ingredient_selection.dart';

class IngredientSelectionListState {
  List<IngredientSelection> ingredientSelections = [];

  final _stateController =
      StreamController<List<IngredientSelection>>.broadcast();

  StreamSink<List<IngredientSelection>> get sink => _stateController.sink;
  Stream<List<IngredientSelection>> get stream => _stateController.stream;

  void dissolve() => _stateController.close();
}
