import 'package:flutter/material.dart';
import 'package:star_citizen_app/Screens/components/component_tile.dart';

class ComponentSelectionList extends StatelessWidget {
  const ComponentSelectionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemBuilder: (context, index) => ComponentTile(
              componentTitle: ListTile(
                title: Text(components[index]),
              ),
              componentItems: weapons,
    )));
  }
}