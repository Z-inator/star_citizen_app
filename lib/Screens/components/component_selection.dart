import 'package:flutter/material.dart';
import 'package:star_citizen_app/Screens/components/component_tile.dart';

class ComponentSelectionList extends StatelessWidget {
  const ComponentSelectionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: ListView.builder(
          padding: EdgeInsets.fromLTRB(0, 25, 0, 50),
          itemCount: components.length,
          itemBuilder: (context, index) => ComponentTile(
              componentTitle: ListTile(
                title: Text(components[index], style: Theme.of(context).textTheme.headline6),
              ),
              componentItems: weapons,
    )));
  }
}