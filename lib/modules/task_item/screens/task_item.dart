import 'package:cookatoo/models/task_item_model.dart';
import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final TaskItemModel taskItem;

  TaskItem({@required this.taskItem});

  Iterable<Widget> get ingredients => taskItem.ingredientItems.map(
        (item) => Column(
          children: [
            Text(item.ingredient.name),
            Text(
              item.amount.toString(),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [...ingredients],
      ),
    );
  }
}
