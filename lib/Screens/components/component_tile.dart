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
          type: MaterialType.card,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            componentTitle,
            ListView(
              shrinkWrap: true,
              children: componentItems
                  .map((name) => ComponentRow())
                  .toList(),
            )
          ]),
        ));
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
          Expanded(
            flex: 1,
            child: ComponentSize()),
          Container(
            height: 2.0,
            width: 20.0,
            color: Theme.of(context).colorScheme.secondary,
          ),
          Expanded(
            flex: 3,
            child: ComponentItem())
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
      child: null,
    );
  }
}

class ComponentSize extends StatelessWidget {
  const ComponentSize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutlinedButton(
            child: Text('Gimbal S4'),
            onPressed: () {},
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [buildPower(), buildCooler()],
          )
        ],
      ),
    );
  }

  Widget buildPower() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [Icon(Icons.bolt_sharp), Text('20')],
    );
  }

  Widget buildCooler() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [Icon(Icons.ac_unit_sharp), Text('34')],
    );
  }
}

class ComponentItem extends StatelessWidget {
  const ComponentItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [buildPowerButton(), buildPowerAndCooler()],
          )
        ],
      ),
    );
  }

  Widget buildPowerAndCooler() {
    return Row(
      children: [buildPower(), buildCooler()],
    );
  }

  Widget buildPowerButton() {
    return Row(
      children: [
        TextButton(onPressed: () {}, child: Text('Power')),
        TextButton(onPressed: () {}, child: Text('Overclock'))
      ],
    );
  }

  Widget buildPower() {
    return Row(
      children: [Icon(Icons.bolt_sharp), Text('283')],
    );
  }

  Widget buildCooler() {
    return Row(
      children: [Icon(Icons.ac_unit_sharp), Text('41925')],
    );
  }
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