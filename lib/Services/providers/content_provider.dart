import 'package:flutter/material.dart';
import 'package:star_citizen_app/Screens/backdrop.dart';
import 'package:star_citizen_app/Screens/widgets/component_selection.dart';
import 'package:star_citizen_app/Screens/widgets/stats_dashboard.dart';

class ContentProvider extends ChangeNotifier {
  int currentPage = 0;
  String pageName = 'Calculator';
  bool ptuLive = true;
  AnimationController controller;
  double velocity;

  ContentProvider({required this.controller, required this.velocity});

  // AnimationStatus status;

  bool get isExpanded {
    final AnimationStatus status = controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  // AnimationStatus get status {

  // }

  void toggleBackdropLayerVisibility() async {
    isExpanded ? controller.reverse() : controller.forward();
    // await controller.fling(velocity: isExpanded ? -velocity : velocity);
  }

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
}
