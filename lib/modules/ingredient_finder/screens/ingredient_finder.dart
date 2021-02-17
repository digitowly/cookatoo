import 'package:cookatoo/data/ingredients.data.dart';
import 'package:cookatoo/modules/ingredient_finder/screens/ingredient_preview.dart';
import 'package:flutter/material.dart';

class IngredientFinder extends StatelessWidget {
  final Function updateSelection;

  IngredientFinder({this.updateSelection});

  Iterable<FlatButton> getIngredientList() {
    return ingredients.map(
      (ingredient) => FlatButton(
        child: IngredientPreview(
          ingredient: ingredient,
        ),
        onPressed: () => updateSelection(ingredient),
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
