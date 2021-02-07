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
          return Column(
            children: [
              Row(
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
                  Container(
                    padding: EdgeInsets.all(0),
                    width: 210,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton(
                          child: Icon(
                            Icons.chevron_left,
                            color: Colors.grey.shade400,
                          ),
                          onPressed: () => _selectionItemBloc.eventSink.add(
                              EventType(action: SelectionItemAction.SUBSTRACT)),
                        ),
                        Text(
                          '${snapshot.hasData ? content['amount'] : "0"}',
                          style: TextStyle(fontSize: 18),
                        ),
                        FlatButton(
                          child: Icon(
                            Icons.chevron_right,
                            color: Colors.grey.shade400,
                          ),
                          onPressed: () => _selectionItemBloc.eventSink
                              .add(EventType(action: SelectionItemAction.ADD)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          );
        });
  }
}
