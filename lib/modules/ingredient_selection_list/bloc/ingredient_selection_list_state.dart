import 'dart:async';

import 'package:cookatoo/modules/ingredient_selection_list/models/ingredient_selection_list_model.dart';

class IngredientSelectionListState {
  // List<IngredientSelection> ingredientSelections = [];
  IngredientSelectionList ingredientSelectionList =
      IngredientSelectionList(title: 'TestTitle', ingredientSelections: []);

  final _stateController =
      StreamController<IngredientSelectionList>.broadcast();

  StreamSink<IngredientSelectionList> get sink => _stateController.sink;
  Stream<IngredientSelectionList> get stream => _stateController.stream;

  void dissolve() => _stateController.close();
}
