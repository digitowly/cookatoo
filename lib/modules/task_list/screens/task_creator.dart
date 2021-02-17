import 'package:cookatoo/modules/task_list/bloc/selections_list_bloc.dart';
import 'package:cookatoo/modules/task_list/screens/ingredient_selection.dart';
import 'package:flutter/material.dart';

class TaskCreator extends StatelessWidget {
  final _ingredientSelectionsBloc = SelectionsListBloc();

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
              stream: _ingredientSelectionsBloc.stateStream,
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
                          _ingredientSelectionsBloc.eventSink.add(
                        EventType(
                          action: SelectionsListAction.REORDER,
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
            onPressed: () => _ingredientSelectionsBloc.eventSink
                .add(EventType(action: SelectionsListAction.ADD)),
          ),
          FlatButton(
            child: Text('complete'),
            onPressed: () {
              listData.forEach((data) => data.dissolve());
              _ingredientSelectionsBloc.dissolve();
            },
          )
        ],
      ),
    );
  }
}
