import 'package:flutter/material.dart';

class DataTableProvider extends ChangeNotifier {
  List<dynamic> fullList;
  late List<dynamic> currentList;
  DataTableProvider({required this.fullList}) {
    currentList = fullList;
  }
  
  void updateCurrentList(List<dynamic> items) {
    currentList = items;
    notifyListeners();
  }

  void compareSelected(List<dynamic> items) {
    currentList = items;
    notifyListeners();
  }

  void sizeFilter(double size) {
    currentList = fullList.where((element) => element.size == size).toList();
    notifyListeners();
  }
}
