import 'package:cookatoo/models/task_item_model.dart';
import 'package:cookatoo/modules/ingredient_finder/screens/ingredient_preview.dart';
import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final TaskItemModel taskItem;

  TaskItem({@required this.taskItem});

  Iterable<Widget> get ingredients => taskItem.ingredientItems.map(
        (item) => Column(
          children: [
            IngredientPreview(ingredient: item.ingredient),
            Text(
              item.amount.toString(),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [...ingredients],
      ),
    );
  }
}
