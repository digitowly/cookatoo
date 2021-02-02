import 'package:cookatoo/components/bottom_drawer/task_creation_button.dart';
import 'package:cookatoo/components/bottom_drawer/task_creator.dart';
import 'package:cookatoo/data/TaskTypes.dart';
import 'package:flutter/material.dart';

class TaskCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        child: Text('show bottom modal'),
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext context) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: const Radius.circular(30),
                    bottom: const Radius.circular(0),
                  ),
                ),
                child: GridView.count(
                  crossAxisCount: 3,
                  children: [
                    TaskCreationButton(TaskTypes['cut']),
                    TaskCreationButton(TaskTypes['boil']),
                    TaskCreationButton(TaskTypes['fry']),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
