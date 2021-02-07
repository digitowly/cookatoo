import 'package:cookatoo/data/ingredients.data.dart';
import 'package:flutter/material.dart';

class IngredientFinder extends StatelessWidget {
  final updateSelection;

  IngredientFinder({this.updateSelection});

  Iterable<FlatButton> getIngredientList() {
    return ingredients.map(
      (ingredient) => FlatButton(
        child: Text(ingredient.name),
        onPressed: () => updateSelection(ingredient.name),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: [...getIngredientList()],
    );
  }
}
