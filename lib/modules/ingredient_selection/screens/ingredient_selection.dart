import 'package:cookatoo/models/ingredient.model.dart';
import 'package:cookatoo/modules/ingredient_finder/screens/ingredient_finder.dart';
import 'package:cookatoo/modules/ingredient_finder/screens/ingredient_preview.dart';
import 'package:cookatoo/modules/ingredient_selection/bloc/ingredient_selection_bloc.dart';
import 'package:cookatoo/modules/ingredient_selection/bloc/ingredient_selection_event.dart';
import 'package:cookatoo/widgets/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IngredientSelection extends StatelessWidget {
  final _selectionItemBloc = IngredientSelectionBloc();

  final Function delete;
  final int id;
  final Key key;

  IngredientSelection(
      {@required this.delete, @required this.id, @required this.key});

  void dissolve() {
    _selectionItemBloc.dissolve();
  }

  @override
  Widget build(BuildContext context) {
    void showIngredientsList() => showModalBottomSheet(
          isDismissible: false,
          context: context,
          backgroundColor: Colors.white,
          builder: (context) {
            return IngredientFinder(
              updateSelection: (Ingredient ingredient) {
                _selectionItemBloc.event.sink.add(
                  EventType(
                      action: IngredientSelectionAction.UPDATE,
                      type: ingredient),
                );
                Navigator.pop(context);
              },
            );
          },
        );

    return Container(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.only(bottom: 10),
      height: 90,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: StreamBuilder<Object>(
        key: key,
        stream: _selectionItemBloc.state.stream,
        builder: (context, snapshot) {
          Map content = snapshot.data;
          return StatefulWrapper(
            onInit: () => showIngredientsList(),
            child: Dismissible(
              key: key,
              onDismissed: (direction) => delete(id),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          FlatButton(
                              child: IngredientPreview(
                                ingredient: snapshot.hasData
                                    ? content['type']
                                    : new Ingredient(
                                        imgRef: 'tomatoes',
                                        name: 'placeholder',
                                        type: 'none'),
                              ),
                              onPressed: () => showIngredientsList())
                        ],
                      ),
                      Container(
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlatButton(
                              child: Icon(
                                Icons.chevron_left,
                                color: Colors.grey.shade400,
                              ),
                              onPressed: () => (content['amount'] > 1)
                                  ? _selectionItemBloc.event.sink.add(EventType(
                                      action:
                                          IngredientSelectionAction.SUBSTRACT))
                                  : '',
                            ),
                            Text(
                              '${snapshot.hasData ? content['amount'] : 1}',
                              style: TextStyle(fontSize: 18),
                            ),
                            FlatButton(
                              child: Icon(
                                Icons.chevron_right,
                                color: Colors.grey.shade400,
                              ),
                              onPressed: () => _selectionItemBloc.event.sink
                                  .add(EventType(
                                      action: IngredientSelectionAction.ADD)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
