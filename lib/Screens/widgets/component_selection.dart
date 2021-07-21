import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'component_tile.dart';

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
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 22.5),
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
          ComponentTable(
            // componentItem: element, 
            // componentSize: 'Gimbal S4',
            sizeComponentRow: [
              ComponentSize(size: 'Gimbal S4'),
              ComponentItem(item: element, type: 'Ballistic Scattergun')
            ],
            powerCoolerRow: [
              buildPowerAndCooler(),
              buildAdjustmentButtons(),
              buildPowerAndCooler()
            ],
          ));
    });
    return componentBlock;
  }
}


 // Expanded(
            //   child: Material(
            //     clipBehavior: Clip.hardEdge,
            //     borderOnForeground: true,
            //     shape: buildBeveledRectangleBorder(kPrimaryNavyVariant, kLargeBevel, kLargeBevelWidth),
            //     color: Theme.of(context).colorScheme.primary,
            //     child: SingleChildScrollView(
            //       child: Material(
            //               clipBehavior: Clip.hardEdge,
            //               borderOnForeground: true,
            //               shape: buildBeveledRectangleBorder(kPrimaryNavyVariant, kLargeBevel, kLargeBevelWidth),
            //               // BeveledRectangleBorder(
            //               //   borderRadius: BorderRadius.o(top: Radius.circular(kLargeBevel)),
            //               //   side: BorderSide(color: kPrimaryNavyVariant, width: kLargeBevelWidth)
            //               // ),
                          
            //               color: Theme.of(context).colorScheme.primary,
            //               child: ListView.separated(
            //                 shrinkWrap: true,
            //                 physics: NeverScrollableScrollPhysics(),
            //                 padding: EdgeInsets.all(25.0),
            //                 itemCount: components.length,
            //                 separatorBuilder: (context, index) => Divider(
            //                   color: Theme.of(context).colorScheme.primaryVariant,
            //                   thickness: 2.0
            //                 ),
            //                 itemBuilder: (context, index) => ComponentTile(
            //                       componentTitle: ComponentTitle(title: components[index]),
            //                       componentBlock: buildComponentBlock(),
            //                     )),
            //             ),
            //     ),
            //   ),
            // )