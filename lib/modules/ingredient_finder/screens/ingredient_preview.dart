import 'package:cookatoo/models/ingredient.model.dart';
import 'package:flutter/material.dart';

class IngredientPreview extends StatelessWidget {
  final Ingredient ingredient;

  IngredientPreview({@required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage('assets/images/${ingredient.imgRef}.png'),
          width: 70,
          height: 70,
        ),
        Text('${ingredient.name}'),
      ],
    );
  }
}
