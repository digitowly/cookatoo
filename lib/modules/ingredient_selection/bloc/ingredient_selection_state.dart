import 'dart:async';

import 'package:cookatoo/models/ingredient.model.dart';

class IngredientSelectionState {
  Map ingredientData = {
    "type":
        new Ingredient(imgRef: 'tomatoes', name: 'placeholder', type: 'none'),
    "amount": 1
  };

  final _stateController = StreamController<Map>.broadcast();

  StreamSink<Map> get sink => _stateController.sink;
  Stream<Map> get stream => _stateController.stream;

  void dissolve() => _stateController.close();
}
