import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star_citizen_app/Screens/widgets/data_table/data_tables.dart';
import 'package:star_citizen_app/Services/providers/content_provider.dart';


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
    componentItems.map((item) {
      column.add(item.name);
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

  int columns = 10;
  int rows = 20;

  List<List<String>> makeData() {
    final List<List<String>> output = [];
    for (int i = 0; i < columns; i++) {
      final List<String> row = [];
      for (int j = 0; j < rows; j++) {
        row.add('L$j : T$i');
      }
      output.add(row);
    }
    return output;
  }

  List<String> makeTitleColumn() => List.generate(columns, (i) => 'Top $i');

  List<String> makeTitleRow() => List.generate(rows, (i) => 'Left $i');

  PreferredSizeWidget buildAppBar(BuildContext context) {
    ContentProvider contentState = Provider.of<ContentProvider>(context);
    return AppBar(title: Text(contentState.pageName));
  }

  @override
  Widget build(BuildContext context) {
    componentList = makeTitleColumn();
    componentAttributes = makeTitleRow();
    List<List<String>> data = makeData();
    return Center(
      child: StickyHeadersTable(
          columnsLength: componentList.length,
          rowsLength: componentAttributes.length,
          columnsTitleBuilder: (i) => Text(componentList[i]),
          rowsTitleBuilder: (i) => Text(componentAttributes[i]),
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
