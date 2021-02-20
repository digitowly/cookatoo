import 'package:cookatoo/models/ingredient_item.model.dart';
import 'package:cookatoo/models/task.model.dart';
import 'package:flutter/material.dart';

class TaskItemModel {
  final String title;
  final Task task;
  final List<IngredientItem> ingredientItems;

  TaskItemModel(
      {@required this.title,
      @required this.task,
      @required this.ingredientItems});
}
