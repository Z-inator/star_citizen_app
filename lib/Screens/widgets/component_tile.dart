import 'package:flutter/material.dart';
import 'package:star_citizen_app/constants.dart';

class ComponentTile extends StatelessWidget {
  const ComponentTile(
      {Key? key, required this.componentTitle, required this.componentBlock})
      : super(key: key);

  final Widget componentTitle;

  final List<Widget> componentBlock;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: 16.0),
        child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, 
            children: [
              componentTitle,
              Column(
                children: componentBlock,
              )
            ]));
  }
}

class ComponentTable extends StatelessWidget {
  const ComponentTable(
      {Key? key,
      // required this.componentItem,
      // required this.componentSize,
      required this.powerCoolerRow,
      required this.sizeComponentRow})
      : super(key: key);

  // final String componentItem;
  // final String componentSize;

  final List<Widget> powerCoolerRow;
  final List<Widget> sizeComponentRow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 6),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(children: [
            sizeComponentRow[0],
            // ComponentSize(size: componentSize),
            Container(
              height: 2.0,
              width: 15.0,
              color: Theme.of(context).colorScheme.secondary,
            ),
            sizeComponentRow[1],
            // ComponentItem(
            //   item: componentItem,
            //   type: ' Ballistic Scattergun',
            // )
          ]),
          TableRow(children: [
            powerCoolerRow[0],
            // buildPowerAndCooler(),
            Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                powerCoolerRow[1],
                // buildPowerButton(context), 
                powerCoolerRow[2]
                // buildPowerAndCooler()
              ],
            )
          ])
        ],
        columnWidths: {
          // Item column needs to be 3x the size column
          0: FlexColumnWidth(4),
          1: FlexColumnWidth(1),
          2: FlexColumnWidth(12)
        },
      ),
    );
  }
}

class ComponentTitle extends StatelessWidget {
  const ComponentTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(title, style: Theme.of(context).textTheme.headline6),
      ),
    );
  }
}

class ComponentSize extends StatelessWidget {
  const ComponentSize({Key? key, required this.size}) : super(key: key);

  final String size;

  @override
  Widget build(BuildContext context) {
    List<String> sizeStringList = size.split(' ');
    return Container(
      child: OutlinedButton(
        // child: ListTile(
        //   title: Text(sizeStringList[1],
        //         style: Theme.of(context).textTheme.subtitle1),
        //   subtitle: Text(sizeStringList[0],
        //         style: Theme.of(context).textTheme.caption),
        // ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(sizeStringList[1],
                // style: Theme.of(context).textTheme.subtitle1
            ),
            Text(sizeStringList[0],
                style: Theme.of(context).textTheme.caption),
          ],
        ),
        // RichText(
        //   text: TextSpan(
        //       text: sizeStringList[1],
        //       style: Theme.of(context).textTheme.subtitle1,
        //       children: [
        //         TextSpan(
        //             text: ' ${sizeStringList[0]}',
        //             style: Theme.of(context).textTheme.caption)
        //       ]),
        // ),
        onPressed: () {},   // TODO: activate selection menu
      ),
    );
  }
}

class ComponentItem extends StatelessWidget {
  const ComponentItem({Key? key, required this.item, required this.type})
      : super(key: key);

  final String item;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: OutlinedButton(
        // child: ListTile(
        //   title: Text(item,
        //     // style: Theme.of(context).textTheme.subtitle1
        //   ),
        //   subtitle: Text(type, 
        //       style: Theme.of(context).textTheme.caption
        //   ),
        //   trailing: RichText(
        //         text: TextSpan(
        //             text: '972',
        //             style: Theme.of(context).textTheme.subtitle1,
        //             children: [
        //           TextSpan(
        //               text: 'dps', style: Theme.of(context).textTheme.caption)
        //         ])),
        // ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item,
                  style: Theme.of(context).textTheme.subtitle1),
                Text(type, 
                  style: Theme.of(context).textTheme.caption),
              ],
            ),
                // RichText(
                //     text: TextSpan(
                //         text: item,
                //         style: Theme.of(context).textTheme.subtitle1,
                //         children: [
                //       TextSpan(
                //           text: type, style: Theme.of(context).textTheme.caption)
                //     ])),
            RichText(
                text: TextSpan(
                    text: '972',
                    style: Theme.of(context).textTheme.subtitle1,
                    children: [
                  TextSpan(
                      text: 'dps', style: Theme.of(context).textTheme.caption)
                ]))
          ],
        ),
        onPressed: () {}, // TODO: onPrewssed activates selection menu
        onLongPress: () {}, // TODO: onLongPress activates the info panel
      ),
    );
  }
}

Widget buildPower() {
  return Row(
    children: [
      Icon(Icons.bolt_sharp, size: 16), 
      Text('20')
    ],
  );
}

Widget buildCooler() {
  return Row(
    children: [
      Icon(
        Icons.ac_unit_sharp,
        size: 16,
      ),
      Text('34')
    ],
  );
}

Widget buildPowerAndCooler() {
  return Row(
    children: [
      Container(
        padding: EdgeInsets.all(4.0),
        child: buildPower()
      ), 
      Container(
        padding: EdgeInsets.all(4.0),
        child: buildCooler()
      )
    ],
  );
}

Widget buildAdjustmentButtons() {
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