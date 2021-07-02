import 'package:flutter/material.dart';

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

class ComponentTile extends StatelessWidget {
  const ComponentTile(
      {Key? key, required this.componentTitle, required this.componentItems})
      : super(key: key);

  final Widget componentTitle;
  final List<String> componentItems;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Material(
          color: Theme.of(context).colorScheme.background,
          borderOnForeground: true,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            side: BorderSide(
              color: Theme.of(context).colorScheme.primaryVariant,
              width: 2.0
            )
          ),
          child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch, 
                children: [
                  componentTitle,
                  ListView(
                    shrinkWrap: true,
                    children: componentItems.map((name) => ComponentTable()).toList(),
                  )
                ]),
        ));
  }
}

class ComponentTable extends StatelessWidget {
  const ComponentTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(children: [
            ComponentSize(),
            Container(
              height: 2.0,
              width: 20.0,
              color: Theme.of(context).colorScheme.secondary,
            ),
            ComponentItem()
          ]),
          TableRow(children: [
            buildPowerAndCooler(),
            Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [buildPowerButton(context), buildPowerAndCooler()],
            )
          ])
        ],
        columnWidths: {
          0: FlexColumnWidth(3),
          1: FlexColumnWidth(1),
          2: FlexColumnWidth(9)
        },
      ),
    );
  }
}

class ComponentRow extends StatelessWidget {
  const ComponentRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          ComponentSize(),
          // Expanded(
          //   flex: 1,
          //   child: ComponentSize()),
          Container(
            height: 2.0,
            width: 20.0,
            color: Theme.of(context).colorScheme.secondary,
          ),
          Expanded(child: ComponentItem()),
          // Expanded(
          //   flex: 3,
          //   child: ComponentItem())
        ],
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  const DetailRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          buildPowerAndCooler(),
          buildPowerButton(context),
          buildPowerAndCooler()
        ],
      ),
    );
  }
}

class ComponentSize extends StatelessWidget {
  const ComponentSize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: OutlinedButton(
        child: Text('Gimbal S4'),
        onPressed: () {},
      ),
    );
  }
}

class ComponentItem extends StatelessWidget {
  const ComponentItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: OutlinedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text('Revenant'), 
            Text('972dps')
          ],
        ),
        //   ListTile(
        //     title: Text('Revenant'),
        // trailing: Text('672dps'),
        //   ),
        onPressed: () {},
      ),
    );
  }
}

Widget buildPower() {
  return Row(
    children: [Icon(Icons.bolt_sharp), Text('20')],
  );
}

Widget buildCooler() {
  return Row(
    children: [Icon(Icons.ac_unit_sharp), Text('34')],
  );
}

Widget buildPowerAndCooler() {
  return Row(
    children: [buildPower(), buildCooler()],
  );
}

Widget buildPowerButton(BuildContext context) {
  return Row(
    children: [
      TextButton(onPressed: () {}, child: Text('Power')),
      TextButton(onPressed: () {}, child: Text('Overclock'))
    ],
  );
}

// Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Material(
//             color: Theme.of(context).colorScheme.primaryVariant,
//             elevation: 4,
//             shape: BeveledRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(8.0)),
//             ),
//             child: Container(
//               width: 80.0,
//               child: Column(
//                 children: [
//                   TextButton(
//                     child: Text('Gimbal S4'),
//                     onPressed: () {},
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Icon(Icons.bolt_rounded),
//                       Text('34'),
//                       Spacer(),
//                       Icon(Icons.ac_unit_rounded),
//                       Text('26')
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             width: 24.0,
//             height: 2.0,
//             color: Theme.of(context).colorScheme.secondary,
//           ),
//           Material(
//             color: Theme.of(context).colorScheme.primaryVariant,
//             elevation: 4,
//             shape: BeveledRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(8.0)),
//             ),
//             child: Container(
//               width: 80.0,
//               child: Column(
//                 children: [
//                   TextButton(
//                     child: Text('Revenant'),
//                     onPressed: () {},
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Icon(Icons.bolt_rounded),
//                       Text('34'),
//                       Spacer(),
//                       Icon(Icons.ac_unit_rounded),
//                       Text('26')
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),

// List<SpannableGridCellData> cells = [
//   SpannableGridCellData(
//     id: 'Component Size', 
//     column: 1,
//     columnSpan: 5,
//     row: 1,
//     child: ComponentSize()
//   ),
//   SpannableGridCellData(
//     id: 'Line Link', 
//     column: 6, 
//     row: 1,
//     child: linkLine
//   ),
//   SpannableGridCellData(
//     id: 'Component Item', 
//     column: 7, 
//     columnSpan: 8,
//     row: 1,
//     child: ComponentItem()
//   ),
//   SpannableGridCellData(
//     id: 'Component Size Power icon', 
//     column: 1, 
//     row: 2,
//     child: Icon(Icons.bolt_sharp)
//   ),
//   SpannableGridCellData(
//     id: 'Component Size Power number', 
//     column: 2, 
//     row: 2,
//     child: Text('34')
//   ),
//   SpannableGridCellData(
//     id: 'empty space1', 
//     column: 3, 
//     row: 2,
//     child: Container()
//   ),
//   SpannableGridCellData(
//     id: 'Component Size Cooler icon', 
//     column: 4, 
//     row: 2,
//     child: Icon(Icons.ac_unit_sharp)
//   ),
//   SpannableGridCellData(
//     id: 'Component Size Cooler number', 
//     column: 5, 
//     row: 2,
//     child: Text('20')
//   ),
//   SpannableGridCellData(
//     id: 'empty space2', 
//     column: 6, 
//     row: 2,
//     child: Container()
//   ),
//   SpannableGridCellData(
//     id: 'Component Item Power button', 
//     column: 7, 
//     row: 2,
//     child: TextButton(
//       child: Text('POWER'),
//       onPressed: () {},
//     )
//   ),
//   SpannableGridCellData(
//     id: 'Component Item Overclock button', 
//     column: 8, 
//     row: 2,
//     child: TextButton(
//       child: Text('OVERCLOCK'),
//       onPressed: () {},
//     )
//   ),
//   SpannableGridCellData(
//     id: 'empty space3', 
//     column: 9, 
//     row: 2,
//     child: Container()
//   ),
//   SpannableGridCellData(
//     id: 'Component Item Power icon', 
//     column: 10, 
//     row: 2,
//     child: Icon(Icons.bolt_sharp)
//   ),
//   SpannableGridCellData(
//     id: 'Component Item Power number', 
//     column: 11, 
//     row: 2,
//     child: Text('34')
//   ),
//   SpannableGridCellData(
//     id: 'empty space', 
//     column: 12, 
//     row: 2,
//     child: Container()
//   ),
//   SpannableGridCellData(
//     id: 'Component Item Cooler icon', 
//     column: 13, 
//     row: 2,
//     child: Icon(Icons.ac_unit_sharp)
//   ),
//   SpannableGridCellData(
//     id: 'Component Item Cooler number', 
//     column: 14, 
//     row: 2,
//     child: Text('20')
//   ),
// ];