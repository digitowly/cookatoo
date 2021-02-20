import 'dart:math';

import 'package:cookatoo/modules/ingredient_selection/screens/ingredient_selection.dart';
import 'package:cookatoo/modules/ingredient_selection_list/bloc/ingredient_selection_list_event.dart';
import 'package:cookatoo/modules/ingredient_selection_list/bloc/ingredient_selection_list_state.dart';
import 'package:flutter/material.dart';

class IngredientSelectionListBloc {
  final state = IngredientSelectionListState();
  final event = IngredientSelectionListEvent();

  IngredientSelectionListBloc() {
    event.stream.listen(
      (event) {
        if (event.action == IngredientSelectionListAction.ADD) {
          state.ingredientSelections.add(
            IngredientSelection(
              delete: delete,
              id: new Random().nextInt(100),
              key: UniqueKey(),
            ),
          );
        } else if (event.action == IngredientSelectionListAction.REMOVE) {
          state.ingredientSelections = state.ingredientSelections
              .where((ingredient) => ingredient.id != event.id)
              .toList();
        } else if (event.action == IngredientSelectionListAction.REORDER) {
          reorderList(
              list: state.ingredientSelections,
              oldIndex: event.reorder.oldIndex,
              newIndex: event.reorder.newIndex);
        }
        state.sink.add(state.ingredientSelections);
      },
    );
  }

  void reorderList({List list, int oldIndex, int newIndex}) {
    if (newIndex > list.length) newIndex = list.length;
    if (oldIndex < newIndex) newIndex--;

    var temp = list[oldIndex];
    list.remove(temp);
    list.insert(newIndex, temp);
  }

  void delete(int id) {
    print(id);
    this
        .event
        .sink
        .add(EventType(id: id, action: IngredientSelectionListAction.REMOVE));
  }

  void dissolve() {
    state.dissolve();
    event.dissolve();
  }
}
