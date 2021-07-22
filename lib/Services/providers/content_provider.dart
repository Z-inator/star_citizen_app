import 'package:flutter/cupertino.dart';
import 'package:star_citizen_app/Screens/backdrop.dart';
import 'package:star_citizen_app/Screens/widgets/component_selection.dart';
import 'package:star_citizen_app/Screens/widgets/stats_dashboard.dart';

class ContentProvider extends ChangeNotifier {
  int currentPage = 0;
  String pageName = 'Calculator';
  bool ptuLive = true;

  final List<String> drawerList = [
    'Calculator',
    'Cart',
    'Hangar',
    '',
    'Ships & Vehicles',
    'Weapons',
    'Missiles',
    'Shields',
    'Power Plants',
    'Coolers',
    'Quantum Drives',
    'EMPs',
    'QEDs',
    'Mining Lasers',
    '',
    'Account',
    'Spread Love',
    'About',
  ];

  void changePage(int newPage) {
    currentPage = newPage;
    pageName = drawerList[newPage];
    notifyListeners();
  }

  void changePTULive(bool value) {
    ptuLive = value;
    notifyListeners();
  }

  Map<String, List<dynamic>> content = {
    'Weapons': [
      {
        'name': 'name0',
        'type': 'type0',
        'weapon': 'weapon0',
        'heat': 'heat0',
        'power': 'power0'
      },
      {
        'name': 'name1',
        'type': 'type1',
        'weapon': 'weapon1',
        'heat': 'heat1',
        'power': 'power1'
      },
      {
        'name': 'name2',
        'type': 'type2',
        'weapon': 'weapon2',
        'heat': 'heat2',
        'power': 'power2'
      },
      {
        'name': 'name3',
        'type': 'type3',
        'weapon': 'weapon3',
        'heat': 'heat3',
        'power': 'power3'
      },
      {
        'name': 'name4',
        'type': 'type4',
        'weapon': 'weapon4',
        'heat': 'heat4',
        'power': 'power4'
      },
      {
        'name': 'name5',
        'type': 'type5',
        'weapon': 'weapon5',
        'heat': 'heat5',
        'power': 'power5'
      },
      {
        'name': 'name6',
        'type': 'type6',
        'weapon': 'weapon6',
        'heat': 'heat6',
        'power': 'power6'
      },
      {
        'name': 'name7',
        'type': 'type7',
        'weapon': 'weapon7',
        'heat': 'heat7',
        'power': 'power7'
      },
      {
        'name': 'name8',
        'type': 'type8',
        'weapon': 'weapon8',
        'heat': 'heat8',
        'power': 'power8'
      },
      {
        'name': 'name9',
        'type': 'type9',
        'weapon': 'weapon9',
        'heat': 'heat9',
        'power': 'power9'
      },
      {
        'name': 'name10',
        'type': 'type10',
        'weapon': 'weapon10',
        'heat': 'heat10',
        'power': 'power10'
      },
      {
        'name': 'name11',
        'type': 'type11',
        'weapon': 'weapon11',
        'heat': 'heat11',
        'power': 'power11'
      },
      {
        'name': 'name12',
        'type': 'type12',
        'weapon': 'weapon12',
        'heat': 'heat12',
        'power': 'power12'
      },
      {
        'name': 'name13',
        'type': 'type13',
        'weapon': 'weapon13',
        'heat': 'heat13',
        'power': 'power13'
      },
      {
        'name': 'name14',
        'type': 'type14',
        'weapon': 'weapon14',
        'heat': 'heat14',
        'power': 'power14'
      },
      {
        'name': 'name15',
        'type': 'type15',
        'weapon': 'weapon15',
        'heat': 'heat15',
        'power': 'power15'
      },
      {
        'name': 'name16',
        'type': 'type16',
        'weapon': 'weapon16',
        'heat': 'heat16',
        'power': 'power16'
      },
      {
        'name': 'name17',
        'type': 'type17',
        'weapon': 'weapon17',
        'heat': 'heat17',
        'power': 'power17'
      },
      {
        'name': 'name18',
        'type': 'type18',
        'weapon': 'weapon18',
        'heat': 'heat18',
        'power': 'power18'
      },
      {
        'name': 'name19',
        'type': 'type19',
        'weapon': 'weapon19',
        'heat': 'heat19',
        'power': 'power19'
      },
      {
        'name': 'name20',
        'type': 'type20',
        'weapon': 'weapon20',
        'heat': 'heat20',
        'power': 'power20'
      },
      {
        'name': 'name21',
        'type': 'type21',
        'weapon': 'weapon21',
        'heat': 'heat21',
        'power': 'power21'
      },
      {
        'name': 'name22',
        'type': 'type22',
        'weapon': 'weapon22',
        'heat': 'heat22',
        'power': 'power22'
      },
      {
        'name': 'name23',
        'type': 'type23',
        'weapon': 'weapon23',
        'heat': 'heat23',
        'power': 'power23'
      },
      {
        'name': 'name24',
        'type': 'type24',
        'weapon': 'weapon24',
        'heat': 'heat24',
        'power': 'power24'
      },
    ]
  };
}
