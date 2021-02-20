import 'package:cookatoo/data/TaskTypes.dart';
import 'package:cookatoo/data/ingredients.data.dart';
import 'package:cookatoo/models/ingredient.model.dart';
import 'package:cookatoo/models/ingredient_item.model.dart';
import 'package:cookatoo/models/task_item_model.dart';
import 'package:cookatoo/modules/ingredient_selection/screens/ingredient_selection.dart';
import 'package:cookatoo/modules/ingredient_selection_list/bloc/ingredient_selection_list_bloc.dart';
import 'package:cookatoo/modules/ingredient_selection_list/bloc/ingredient_selection_list_event.dart';
import 'package:flutter/material.dart';

class IngredientSelectionList extends StatelessWidget {
  final _ingredientSelectionsBloc = IngredientSelectionListBloc();
  final Function addToTaskList;

  IngredientSelectionList({@required this.addToTaskList});

  IngredientItem selectionToItem(IngredientSelection ingredientSelection) {
    return IngredientItem(
        amount: ingredientSelection.amount,
        ingredient: ingredientSelection.type);
  }

  @override
  Widget build(BuildContext context) {
    List<IngredientSelection> listData;

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
          Container(
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 500,
            child: StreamBuilder(
              stream: _ingredientSelectionsBloc.state.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  listData = snapshot.data;
                  return Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
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
                      children: [...listData],
                    ),
                  );
                } else {
                  return Text('no data');
                }
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
            onPressed: () {
              TaskItemModel taskItem = TaskItemModel(
                title: 'Test Task',
                task: taskTypes['cut'],
                ingredientItems: [
                  ...listData.map((selection) => selectionToItem(selection))
                ],
              );
              addToTaskList(taskItem);
              listData.forEach((data) => data.dissolve());
              _ingredientSelectionsBloc.dissolve();
            },
          )
        ],
      ),
    );
  }
}
