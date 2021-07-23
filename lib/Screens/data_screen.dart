import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star_citizen_app/Screens/widgets/data_table/data_tables.dart';
import 'package:star_citizen_app/Services/providers/content_provider.dart';

class ComponentDataTable extends StatelessWidget {
  final List<dynamic> componentItems;

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
    List<String> columns = [];
    var tempItem = componentItems[0];
    Map<String, dynamic> itemMap = tempItem.toMap();
    List attributeList = itemMap.keys.toList();
    attributeList.remove('name');
    RegExp regExp = RegExp(
        '(?<=[a-z])(?=[A-Z])|(?<=[A-Z])(?=[A-Z][a-z])|(?<=[0-9])(?=[A-Z][a-z])|(?<=[a-zA-Z])(?=[0-9])');
    List attributeListFormatted = [];
    for (String attribute in attributeList) {
      String newString = attribute.split(regExp).join();
    }
    columns.addAll(itemMap.keys);
    return columns;
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
    return Center(
      child: StickyHeadersTable(
        columnsLength: componentAttributes.length,
        rowsLength: componentList.length,
        columnsTitleBuilder: (i) => Text(componentAttributes[i]),
        rowsTitleBuilder: (i) => Text(componentList[i]),
        contentCellBuilder: (i, j) => Text(data[i][j]),
        legendCell: Text('sticky'),
      ),
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

  factory TestData.fromJson(json) {
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
