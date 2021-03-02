import 'package:cookatoo/data/TaskTypes.dart';
import 'package:cookatoo/models/ingredient_item.model.dart';
import 'package:cookatoo/models/task_item_model.dart';
import 'package:cookatoo/modules/ingredient_selection/screens/ingredient_selection.dart';
import 'package:cookatoo/modules/ingredient_selection_list/bloc/ingredient_selection_list_bloc.dart';
import 'package:cookatoo/modules/ingredient_selection_list/bloc/ingredient_selection_list_event.dart';
import 'package:cookatoo/modules/ingredient_selection_list/models/ingredient_selection_list_model.dart';
import 'package:flutter/material.dart';

class IngredientSelectionListScreen extends StatelessWidget {
  final _ingredientSelectionsBloc = IngredientSelectionListBloc();
  final Function addToTaskList;
  final Function dismissModal;

  IngredientSelectionListScreen(
      {@required this.addToTaskList, @required this.dismissModal});

  IngredientItem selectionToItem(IngredientSelection ingredientSelection) {
    return IngredientItem(
        amount: ingredientSelection.amount,
        ingredient: ingredientSelection.type);
  }

// TODO: Move to different file
  void complete(IngredientSelectionList listData) {
    if (listData != null) {
      final taskItem = TaskItemModel(
        title: listData.title,
        task: taskTypes['cut'],
        ingredientItems: [
          ...listData.ingredientSelections
              .map((selection) => selectionToItem(selection))
        ],
      );
      addToTaskList(taskItem);
      listData.ingredientSelections.forEach((data) => data.dissolve());
    }
    _ingredientSelectionsBloc.dissolve();
    dismissModal();
  }

  @override
  Widget build(BuildContext context) {
    IngredientSelectionList listData;

    return Container(
      padding: EdgeInsets.all(50),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: const Radius.circular(30),
          bottom: const Radius.circular(0),
        ),
      ),
      child: Column(
        children: [
          // Container(
          //   child: TextField(
          //     decoration: InputDecoration(
          //       labelText: 'Title',
          //     ),
          //   ),
          // ),
          Container(
            height: 600,
            child: StreamBuilder(
              stream: _ingredientSelectionsBloc.state.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  listData = snapshot.data;
                }
                return Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        child: TextField(
                          onChanged: (text) {
                            _ingredientSelectionsBloc.event.sink.add(EventType(
                                action: IngredientSelectionListAction.RENAME,
                                rename: text));
                          },
                          decoration: InputDecoration(
                            labelText: 'Title',
                          ),
                        ),
                      ),
                      if (snapshot.hasData)
                        Container(
                          height: 500,
                          child: ReorderableListView(
                            onReorder: (oldIndex, newIndex) =>
                                _ingredientSelectionsBloc.event.sink.add(
                              EventType(
                                action: IngredientSelectionListAction.REORDER,
                                reorder: Reorder(
                                  oldIndex: oldIndex,
                                  newIndex: newIndex,
                                ),
                              ),
                            ),
                            children: [...listData.ingredientSelections],
                          ),
                        )
                    ],
                  ),
                );
              },
            ),
          ),
          FlatButton(
            child: Text('+'),
            onPressed: () => _ingredientSelectionsBloc.event.sink
                .add(EventType(action: IngredientSelectionListAction.ADD)),
          ),
          FlatButton(
            child: Text('complete'),
            onPressed: () => complete(listData),
          )
        ],
      ),
    );
  }
}
