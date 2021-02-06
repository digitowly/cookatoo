import 'package:flutter/material.dart';

class TaskCreator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        children: [],
      ),
    );
  }
}
