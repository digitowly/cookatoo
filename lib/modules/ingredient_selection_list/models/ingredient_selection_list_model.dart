import 'package:cookatoo/modules/ingredient_selection/screens/ingredient_selection.dart';
import 'package:flutter/material.dart';

class IngredientSelectionList {
  String title;
  List<IngredientSelection> ingredientSelections;

  IngredientSelectionList(
      {@required this.title, @required this.ingredientSelections});
}
