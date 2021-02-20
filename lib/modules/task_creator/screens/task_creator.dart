import 'package:cookatoo/modules/ingredient_selection_list/screen/ingredient_selection_list.dart';
import 'package:cookatoo/modules/task_creator/screens/task_creator.dart';
import 'package:flutter/material.dart';

class TaskCreator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlatButton(
          child: Text('show bottom modal'),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              isDismissible: false,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (BuildContext context) {
                return Wrap(
                  children: [
                    IngredientSelectionList(),
                  ],
                );
              },
            );
          },
        )
      ],
    );
  }
}
