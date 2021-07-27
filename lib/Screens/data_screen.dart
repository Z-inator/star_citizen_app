import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star_citizen_app/Screens/widgets/data_table/data_tables.dart';
import 'package:star_citizen_app/Services/providers/content_provider.dart';
import 'package:star_citizen_app/constants.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> data = [];
    for (var i = 0; i < 25; i++) {
      data.add(TestData.fromJson({
        'name': 'name$i',
        'type': 'type$i',
        'weapon': 'weapon$i',
        'heat': 'heat$i',
        'power': 'power$i'
      }));
    }
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FilterButtons(),
          // Expanded(
          //     child: ScrollableTable(
          //   componentItems: data,
          // ))
          Expanded(child: ComponentDataTable(componentItems: data))
        ],
      ),
    );
  }
}

class FilterButtons extends StatelessWidget {
  const FilterButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
            outlinedButtonTheme: OutlinedButtonThemeData(
                style: OutlinedButton.styleFrom(
          padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
          side: BorderSide(color: kSecondaryCyan),
          shape: buildBeveledRectangleBorder(
              kSecondaryCyan, kSmallBevel, kSmallBevelWidth),
          textStyle: Theme.of(context).textTheme.subtitle1,
          primary: Theme.of(context).textTheme.subtitle1!.color,
        ))),
        child: Container(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              OutlinedButton(onPressed: () {}, child: Text('Compare Selected')),
              OutlinedButton(onPressed: () {}, child: Text('Size Filter')),
              OutlinedButton(onPressed: () {}, child: Text('Reset Filter')),
            ],
          ),
        ));
  }
}

class ComponentDataTable extends StatelessWidget {
  List<dynamic> componentItems = [];

  ComponentDataTable({Key? key, required this.componentItems})
      : super(key: key);

  late List<String> componentList;
  late List<String> componentAttributes;

  List<String> buildTitleRows() {
    List<String> rows = [];
    componentItems.forEach((element) {
      rows.add(element.name);
    });
    return rows;
  }

  List<String> buildTitleColumns() {
    var tempItem = componentItems[0];
    Map<String, dynamic> itemMap = tempItem.toMap();
    List<String> attributeList = itemMap.keys.toList();
    // attributeList.remove('name');
    RegExp regExp = RegExp(
        '(?<=[a-z])(?=[A-Z])|(?<=[A-Z])(?=[A-Z][a-z])|(?<=[0-9])(?=[A-Z][a-z])|(?<=[a-zA-Z])(?=[0-9])');
    List<String> attributeListFormatted = [];
    for (String attribute in attributeList) {
      attributeListFormatted.add(attribute.split(regExp).join(' '));
    }
    return attributeListFormatted;
  }

  List<List<String>> buildData() {
    List<List<String>> output = [];
    for (int i = 0; i < componentAttributes.length; i++) {
      List<String> rowsPerColumn = [];
      // for all componentlist items for "name"
      for (int j = 0; j < componentList.length; j++) {
        Map tempComponent = componentItems[j].toMap();
        rowsPerColumn.add(tempComponent[componentAttributes[i]]);
      }
      output.add(rowsPerColumn);
    }
    return output;
  }

  Widget buildStickyRow(String attribute) {
    return Container(
      // width: double.infinity,
      height: double.infinity,
      color: kPrimaryNavyVariant,
      child: Center(child: Text(attribute)),
    );
  }

  Widget buildStickyColumn(String name) {
    return Container(
        color: kPrimaryNavyVariant,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ComponentCheckBox(),
                    Text(name),
                  ],
                ),
              ),
            ),
            Divider(
              height: 2.0,
            )
            // Container(
            //   width: double.infinity,
            //   height: 1.0,
            //   color: kGreyOnSurface,
            // )
          ],
        ));
  }

  Widget buildCell(dynamic infoPoint) {
    return Container(
      // width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(child: Center(child: Text(infoPoint.toString()))),
          Divider(
            height: 2.0,
          )
          // Container(
          //   width: double.infinity,
          //   height: 1.0,
          //   color: kGreyOnSurface,
          // )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    componentList = buildTitleRows();
    componentAttributes = buildTitleColumns();
    List<List<String>> data = buildData();

    // return SingleChildScrollView(
    //   scrollDirection: Axis.horizontal,
    //   child: SingleChildScrollView(
    //     child: DataTable(
    //       columns: componentAttributes.map((attribute) => DataColumn(label: Text(attribute))).toList(), 
    //       rows: List.generate(componentList.length, (index) => )
    //     ),
    //   ),
    // )

    return StickyHeadersTable(
      columnsLength: componentAttributes.length,
      rowsLength: componentList.length,
      columnsTitleBuilder: (i) => buildStickyRow(componentAttributes[i]),
      onColumnTitlePressed: (i) {},
      rowsTitleBuilder: (i) => buildStickyColumn(componentList[i]),
      onRowTitlePressed: (i) {},
      contentCellBuilder: (i, j) => buildCell(data[i][j]),
      legendCell: buildStickyRow('Name'),
      // cellDimensions: CellDimensions.variableColumnWidth(columnWidths: columnWidths, contentCellHeight: contentCellHeight, stickyLegendWidth: stickyLegendWidth, stickyLegendHeight: stickyLegendHeight),
    );
  }
}

class ComponentCheckBox extends StatefulWidget {
  ComponentCheckBox({Key? key}) : super(key: key);

  @override
  _ComponentCheckBoxState createState() => _ComponentCheckBoxState();
}

class _ComponentCheckBoxState extends State<ComponentCheckBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}

class TestData {
  final String name;
  final String type;
  final String weapon;
  final String heat;
  final String power;

  TestData(
      {required this.name,
      required this.type,
      required this.weapon,
      required this.heat,
      required this.power});

  factory TestData.fromJson(Map<String, dynamic> json) {
    return TestData(
        name: json['name'],
        type: json['type'],
        weapon: json['weapon'],
        heat: json['heat'],
        power: json['power']);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': type,
      'weapon': weapon,
      'heat': heat,
      'power': power
    };
  }
}

// class ScrollableTable extends StatelessWidget {
//   ScrollableTable({Key? key, required this.componentItems}) : super(key: key);
//   List<dynamic> componentItems;
//   late List<String> componentAttributes;
//   late List<String> componentList;
//   // HDTRefreshController _hdtRefreshController = HDTRefreshController();
//   // static const int sortName = 0;
//   // static const int sortStatus = 1;
//   // bool isAscending = true;
//   // int sortType = sortName;
//   List<String> buildTitleRows() {
//     List<String> rows = [];
//     componentItems.forEach((element) {
//       rows.add(element.name);
//     });
//     return rows;
//   }

//   List<String> buildTitleColumns() {
//     var tempItem = componentItems[0];
//     Map<String, dynamic> itemMap = tempItem.toMap();
//     List<String> attributeList = itemMap.keys.toList();
//     // attributeList.remove('name');
//     RegExp regExp = RegExp(
//         '(?<=[a-z])(?=[A-Z])|(?<=[A-Z])(?=[A-Z][a-z])|(?<=[0-9])(?=[A-Z][a-z])|(?<=[a-zA-Z])(?=[0-9])');
//     List<String> attributeListFormatted = [];
//     for (String attribute in attributeList) {
//       attributeListFormatted.add(attribute.split(regExp).join(' '));
//     }
//     return attributeListFormatted;
//   }

//   List<List<String>> buildData() {
//     List<List<String>> output = [];
//     for (int i = 0; i < componentAttributes.length; i++) {
//       List<String> rowsPerColumn = [];
//       // for all componentlist items for "name"
//       for (int j = 0; j < componentList.length; j++) {
//         Map tempComponent = componentItems[j].toMap();
//         rowsPerColumn.add(tempComponent[componentAttributes[i]]);
//       }
//       output.add(rowsPerColumn);
//     }
//     return output;
//   }

//   Widget buildColumn(String attribute) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: componentList.map((component) => Container(
//         padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(component),
//             Divider()
//           ],
//         ),
//       )).toList()
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     componentAttributes = buildTitleColumns();
//     componentList = buildTitleRows();
//     return Column(
//       children: [
//         Row(
//           NotificationListener<ScrollNotification>(
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: List.generate(componentAttributes.length, (index) => GestureDetector(
//                   behavior: HitTestBehavior.opaque,
//                   onTap: () {},
//                   child: Container(
//                     height: 50.0,
//                     child: Text(componentAttributes[index])
//                   ),
//                 )),
//               ),
//               controller: scrollControllers.horizontalTitleController,
//             ),
//             onNotification: (ScrollNotification notification) {
//               final didEndScrolling = ho
//             },
//           )
//         )
//       ],
//     )

    //   return Container(
    //     child: HorizontalDataTable(
    //       leftHandSideColumnWidth: 100,
    //       rightHandSideColumnWidth: 600,
    //       isFixedHeader: true,
    //       headerWidgets: _getTitleWidget(),
    //       leftSideItemBuilder: _generateFirstColumnRow,
    //       rightSideItemBuilder: _generateRightHandSideColumnRow,
    //       itemCount: componentItems.length,
    //       rowSeparatorWidget: const Divider(
    //         color: Colors.black54,
    //         height: 1.0,
    //         thickness: 0.0,
    //       ),
    //       leftHandSideColBackgroundColor: kPrimaryNavyVariant,
    //       rightHandSideColBackgroundColor: kGreyOnSurface,
    //       verticalScrollbarStyle: const ScrollbarStyle(
    //         isAlwaysShown: true,
    //         thickness: 4.0,
    //         radius: Radius.circular(5.0),
    //       ),
    //       horizontalScrollbarStyle: const ScrollbarStyle(
    //         isAlwaysShown: true,
    //         thickness: 4.0,
    //         radius: Radius.circular(5.0),
    //       ),
    //       enablePullToRefresh: true,
    //       refreshIndicator: const WaterDropHeader(),
    //       refreshIndicatorHeight: 60,
    //       onRefresh: () async {
    //         //Do sth
    //         await Future.delayed(const Duration(milliseconds: 500));
    //         _hdtRefreshController.refreshCompleted();
    //       },
    //       htdRefreshController: _hdtRefreshController,
    //     ),
    //     height: MediaQuery.of(context).size.height,
    //   );
    // }

    // List<Widget> _getTitleWidget() {
    //   return [
    //     TextButton(
    //       style: TextButton.styleFrom(
    //         padding: EdgeInsets.zero,
    //       ),
    //       child: _getTitleItemWidget(
    //           'Name' + (sortType == sortName ? (isAscending ? '↓' : '↑') : ''),
    //           100),
    //       onPressed: () {
    //         sortType = sortName;
    //         isAscending = !isAscending;
    //         // user.sortName(isAscending);
    //         // setState(() {});
    //       },
    //     ),
    //     TextButton(
    //       style: TextButton.styleFrom(
    //         padding: EdgeInsets.zero,
    //       ),
    //       child: _getTitleItemWidget(
    //           'Type' +
    //               (sortType == sortStatus ? (isAscending ? '↓' : '↑') : ''),
    //           100),
    //       onPressed: () {
    //         sortType = sortStatus;
    //         isAscending = !isAscending;
    //         // user.sortStatus(isAscending);
    //         // setState(() {});
    //       },
    //     ),
    //     _getTitleItemWidget('Weapon', 200),
    //     _getTitleItemWidget('Heat', 100),
    //     _getTitleItemWidget('Power', 200),
    //   ];
    // }

    // Widget _getTitleItemWidget(String label, double width) {
    //   return Container(
    //     child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
    //     // width: width,
    //     height: 56,
    //     padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
    //     alignment: Alignment.centerLeft,
    //   );
    // }

    // Widget _generateFirstColumnRow(BuildContext context, int index) {
    //   return Container(
    //     child: Text(componentItems[index].name),
    //     // width: 100,
    //     height: 52,
    //     padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
    //     alignment: Alignment.centerLeft,
    //   );
    // }

    // Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    //   return Row(
    //     children: <Widget>[
    //       Container(
    //         child: Row(
    //           children: <Widget>[
    //             Icon(
    //                 Icons.notifications_active,
    //                 color:
    //                     Colors.green),
    //             Text(componentItems[index].type)
    //           ],
    //         ),
    //         // width: 100,
    //         height: 52,
    //         padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
    //         alignment: Alignment.centerLeft,
    //       ),
    //       Container(
    //         child: Text(componentItems[index].weapon),
    //         // width: 200,
    //         height: 52,
    //         padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
    //         alignment: Alignment.centerLeft,
    //       ),
    //       Container(
    //         child: Text(componentItems[index].heat),
    //         // width: 100,
    //         height: 52,
    //         padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
    //         alignment: Alignment.centerLeft,
    //       ),
    //       Container(
    //         child: Text(componentItems[index].power),
    //         // width: 200,
    //         height: 52,
    //         padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
    //         alignment: Alignment.centerLeft,
    //       ),
    //     ],
    //   );
//   }
// }
