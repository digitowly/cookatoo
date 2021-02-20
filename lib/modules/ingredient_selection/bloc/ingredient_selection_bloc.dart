import 'package:cookatoo/modules/ingredient_selection/bloc/ingredient_selection_event.dart';
import 'package:cookatoo/modules/ingredient_selection/bloc/ingredient_selection_state.dart';

class IngredientSelectionBloc {
  IngredientSelectionState state = IngredientSelectionState();

  IngredientSelectionEvent event = IngredientSelectionEvent();

  IngredientSelectionBloc() {
    event.stream.listen(
      (event) {
        if (event.action == IngredientSelectionAction.UPDATE) {
          state.ingredientData["type"] = event.type;
        } else if (event.action == IngredientSelectionAction.ADD) {
          state.ingredientData["amount"]++;
        } else if (event.action == IngredientSelectionAction.SUBSTRACT) {
          state.ingredientData["amount"]--;
        }

        state.sink.add(state.ingredientData);
      },
    );
  }

  void dissolve() {
    state.dissolve();
    event.dissolve();
  }
}
