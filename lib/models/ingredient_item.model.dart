import 'package:cookatoo/models/ingredient.model.dart';
import 'package:flutter/material.dart';

class IngredientItem {
  final Ingredient ingredient;
  final int amount;

  IngredientItem({@required this.ingredient, @required this.amount});
}
