import 'package:flutter/material.dart';
import 'package:star_citizen_app/Screens/widgets/component_tile.dart';

import '../../constants.dart';

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
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 25),
            Expanded(
              child: Material(
                clipBehavior: Clip.hardEdge,
                borderOnForeground: true,
                shape: buildBeveledRectangleBorder(kPrimaryNavyVariant, kLargeBevel, kLargeBevelWidth),
                color: Theme.of(context).colorScheme.primary,
                child: ListView.separated(
                    padding: EdgeInsets.all(25.0),
                    itemCount: components.length,
                    separatorBuilder: (context, index) => Divider(
                      color: Theme.of(context).colorScheme.primaryVariant,
                      thickness: 2.0
                    ),
                    itemBuilder: (context, index) => ComponentTile(
                          componentTitle: ComponentTitle(title: components[index]),
                          componentBlock: buildComponentBlock(),
                        )),
              ),
            ),
          ],
        ));
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
