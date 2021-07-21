import 'package:flutter/material.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

class ComponentDataTable extends StatelessWidget {
  final List<dynamic> componentItems;
  // final List<String> componentList;
  // final List<String> componentAttributes;
  // final List<String> componentData;
  ComponentDataTable(
      {Key? key,
      // required this.componentList,
      // required this.componentAttributes,
      // required this.componentData,
      required this.componentItems})
      : super(key: key);

  late List<String> componentList;
  late List<String> componentAttributes;

  List<String> buildColumn() {
    List<String> column = [];
    componentItems.map((weapon) {
      column.add(weapon.name);
    });
    return column;
  }

  List<String> buildRow() {
    List<String> row = [];
    var tempItem = componentItems[0];
    Map<String, dynamic> jsonMap = tempItem.toMap();
    row.addAll(jsonMap.keys);
    return row;
  }

  List<List<String>> buildData(int numberOfColumns, int numberOfRows) {
    List<List<String>> output = [];
    for (int i = 0; i < numberOfColumns; i++) {
      List<String> row = [];
      Map<String, dynamic> tempItem = componentItems[i].toMap();
      List<dynamic> tempAttributes = tempItem.values.toList();
      for (int j = 0; j < numberOfRows; j++) {
        row.add(tempAttributes[j]);
      }
      output.add(row);
    }
    return output;
  }

  @override
  Widget build(BuildContext context) {
    componentList = buildColumn();
    componentAttributes = buildRow();
    return StickyHeadersTable(
        columnsLength: componentList.length,
        rowsLength: componentAttributes.length,
        columnsTitleBuilder: (i) => Text(componentList[i]),
        rowsTitleBuilder: (i) => Text(componentAttributes[i]),
        contentCellBuilder: (i, j) => Text(
            buildData(componentList.length, componentAttributes.length)[i][j]));
  }
}

// Ship
// i=0,j=0
// Ship1, name
// i=0,j=1
// Ship1, Manufacterer
