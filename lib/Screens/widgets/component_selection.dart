import 'package:flutter/material.dart';
import 'package:star_citizen_app/Screens/widgets/component_tile.dart';

List<String> components = [
  'Weapons',
  'Turrets',
  'Missiles',
  'EMPS',
  'QEDS',
  'Utilities',
  'Shields',
  'Power Plants',
  'Coolers',
  'Quantum Drive',
  'Radars',
  'Thrusters',
];

List<String> weapons = ['Revenant', 'Revenant'];

class ComponentSelectionList extends StatelessWidget {
  const ComponentSelectionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            padding: EdgeInsets.fromLTRB(0, 25, 0, 50),
            itemCount: components.length,
            itemBuilder: (context, index) => ComponentTile(
                  componentTitle: ComponentTitle(title: components[index]),
                  componentBlock: buildComponentBlock(),
                )));
  }

  List<Widget> buildComponentBlock() {
    List<Widget> componentBlock = [];
    weapons.forEach((element) {
      componentBlock.add(
          ComponentTable(componentItem: element, componentSize: 'Gimbal S4'));
    });
    return componentBlock;
  }
}
