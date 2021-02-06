import 'package:flutter/widgets.dart';

class IngredientSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [Text('Ing')],
        ),
        Column(
          children: [Text('3')],
        ),
      ],
    );
  }
}
