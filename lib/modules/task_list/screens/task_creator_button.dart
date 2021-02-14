import 'package:cookatoo/modules/task_list/screens/task_creator.dart';
import 'package:flutter/material.dart';

class TaskCreatorButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlatButton(
          child: Text('show bottom modal'),
          onPressed: () {
            showModalBottomSheet(
              isDismissible: false,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (BuildContext context) {
                return TaskCreator();
              },
            );
          },
        )
      ],
    );
  }
}
