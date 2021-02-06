import 'package:flutter/material.dart';

class TaskCreator extends StatelessWidget {
  final String type;

  TaskCreator({@required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.green),
      child: Text(type),
    );
  }
}
