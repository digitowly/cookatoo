import 'package:cookatoo/models/ingredient_item.model.dart';
import 'package:cookatoo/models/task.model.dart';
import 'package:flutter/material.dart';

class TaskItem {
  final Task task;
  final List<IngredientItem> ingredientItems;

  TaskItem({@required this.task, @required this.ingredientItems});
}
