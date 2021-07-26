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
    return 
    Theme(
      data: Theme.of(context).copyWith(
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
        padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
        side: BorderSide(color: kPrimaryNavyVariant),
        shape: buildBeveledRectangleBorder(
            kPrimaryNavyVariant, kSmallBevel, kSmallBevelWidth),
        textStyle: Theme.of(context).textTheme.subtitle1,
        primary: Theme.of(context).textTheme.subtitle1!.color,
      ))),
      child: Container(
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
    attributeList.remove('name');
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

  @override
  Widget build(BuildContext context) {
    componentList = buildTitleRows();
    componentAttributes = buildTitleColumns();
    List<List<String>> data = buildData();
    return StickyHeadersTable(
      columnsLength: componentAttributes.length,
      rowsLength: componentList.length,
      columnsTitleBuilder: (i) =>
          TextButton(onPressed: () {}, child: Text(componentAttributes[i])),
      rowsTitleBuilder: (i) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ComponentCheckBox(),
          Text(componentList[i]),
        ],
      ),
      contentCellBuilder: (i, j) => Text(data[i][j]),
      legendCell: TextButton(onPressed: () {}, child: Text('Name')),
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
