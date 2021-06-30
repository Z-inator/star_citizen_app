import 'package:flutter/material.dart';
import 'package:star_citizen_app/Screens/components/component_tile.dart';

class ComponentSelection extends StatelessWidget {
  const ComponentSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          ComponentTile(),
          ListTile(
            title: Text('Build Name'),
          ),
          ListTile(
            title: Text('Weapons'),
          ),
          ListTile(
            title: Text('Turrets'),
          ),
          ListTile(
            title: Text('Missiles'),
          ),
          ListTile(
            title: Text('EMPS'),
          ),
          ListTile(
            title: Text('Shields'),
          ),
          ListTile(
            title: Text('Power'),
          ),
          ListTile(
            title: Text('Cooling'),
          ),
          ListTile(
            title: Text('EM/IR'),
          ),
        ],
      ),
    );
  }
}