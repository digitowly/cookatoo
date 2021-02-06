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
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  FlatButton(
                    child:
                        Text('${snapshot.hasData ? snapshot.data : "no data"}'),
                    onPressed: () => showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Row(
                          children: [
                            FlatButton(
                              child: Text('Onion'),
                              onPressed: () => _selectionItemBloc.eventSink.add(
                                EventType(
                                    action: SelectionItemAction.UPDATE,
                                    type: 'Onion'),
                              ),
                            ),
                            FlatButton(
                              child: Text('Tomato'),
                              onPressed: () => _selectionItemBloc.eventSink.add(
                                EventType(
                                    action: SelectionItemAction.UPDATE,
                                    type: 'Tomato'),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
              Column(
                children: [Text('3')],
              ),
            ],
          );
        });
  }
}
