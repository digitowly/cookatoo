import 'package:cookatoo/modules/ingredient_finder/screens/ingredient_finder.dart';
import 'package:cookatoo/modules/task_list/bloc/selection_item_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IngredientSelection extends StatelessWidget {
  final _selectionItemBloc = SelectionItemBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: _selectionItemBloc.stateSteam,
        builder: (context, snapshot) {
          Map content = snapshot.data;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  FlatButton(
                    child: Text(
                        '${snapshot.hasData ? content['type'] : "no data"}'),
                    onPressed: () => showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return IngredientFinder(
                          updateSelection: (String type) {
                            _selectionItemBloc.eventSink.add(
                              EventType(
                                  action: SelectionItemAction.UPDATE,
                                  type: type),
                            );
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  FlatButton(
                    child: Text('+'),
                    onPressed: () => _selectionItemBloc.eventSink
                        .add(EventType(action: SelectionItemAction.ADD)),
                  ),
                  Text('${snapshot.hasData ? content['amount'] : "0"}'),
                  FlatButton(
                    child: Text('-'),
                    onPressed: () => _selectionItemBloc.eventSink
                        .add(EventType(action: SelectionItemAction.SUBSTRACT)),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
