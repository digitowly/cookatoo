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
      child: ListView(
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
              height: 250,
              child: StreamBuilder(
                stream: _ingredientSelectionsBloc.stateStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    listData = snapshot.data;
                    return ReorderableListView(
                      onReorder: (oldIndex, newIndex) => {print('reorder')},
                      children: [...listData],
                    );
                  } else {
                    return Text('no data');
                  }
                },
              )),
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
