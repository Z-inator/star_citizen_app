import 'package:flutter/material.dart';
import 'package:star_citizen_app/Screens/account_screen.dart';
import 'package:star_citizen_app/Screens/cart_screen.dart';
import 'package:star_citizen_app/Screens/data_screen.dart';
import 'package:star_citizen_app/Screens/hanger_screen.dart';
import 'package:star_citizen_app/Screens/mobile_screen.dart';

import 'Screens/backdrop.dart';
import 'Screens/widgets/component_selection.dart';
import 'Screens/widgets/stats_dashboard.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case 'Calculator':
      return MaterialPageRoute(
          builder: (context) => Backdrop(
                frontLayer: StatsDashboard(),
                backLayer: ComponentSelectionList(),
                frontTitle: 'CALCULATOR',
                backTitle: 'BUILD',
              ));
    case 'Cart':
      return MaterialPageRoute(builder: (context) => CartScreen());
    case 'Hanger':
      return MaterialPageRoute(builder: (context) => HangerScreen());
    case 'Ships&Vehicles':
      return MaterialPageRoute(
          builder: (context) => MobileFrameWork(title: Text(settings.name!), body: ComponentDataTable(componentItems: [])));
    case 'Weapons':
      return MaterialPageRoute(
          builder: (context) => MobileFrameWork(title: Text(settings.name!), body: ComponentDataTable(componentItems: [])));
    case 'Missiles':
      return MaterialPageRoute(
          builder: (context) => MobileFrameWork(title: Text(settings.name!), body: ComponentDataTable(componentItems: [])));
    case 'Shields':
      return MaterialPageRoute(
          builder: (context) => MobileFrameWork(title: Text(settings.name!), body: ComponentDataTable(componentItems: [])));
    case 'PowerPlants':
      return MaterialPageRoute(
          builder: (context) => MobileFrameWork(title: Text(settings.name!), body: ComponentDataTable(componentItems: [])));
    case 'Coolers':
      return MaterialPageRoute(
          builder: (context) => MobileFrameWork(title: Text(settings.name!), body: ComponentDataTable(componentItems: [])));
    case 'QuantumDrives':
      return MaterialPageRoute(
          builder: (context) => MobileFrameWork(title: Text(settings.name!), body: ComponentDataTable(componentItems: [])));
    case 'EMPs':
      return MaterialPageRoute(
          builder: (context) => MobileFrameWork(title: Text(settings.name!), body: ComponentDataTable(componentItems: [])));
    case 'QEDs':
      return MaterialPageRoute(
          builder: (context) => MobileFrameWork(title: Text(settings.name!), body: ComponentDataTable(componentItems: [])));
    case 'MiningLasers':
      return MaterialPageRoute(
          builder: (context) => MobileFrameWork(title: Text(settings.name!), body: ComponentDataTable(componentItems: [])));
    case 'Account':
      return MaterialPageRoute(builder: (context) => AccountScreen());
    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
                body: Center(
                  child: Text('404 Page not found'),
                ),
              ));
  }
}
