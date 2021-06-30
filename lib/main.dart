import 'package:flutter/material.dart';
import 'package:star_citizen_app/Screens/backdrop.dart';
import 'package:star_citizen_app/constants.dart';

import 'Screens/components/component_selection.dart';
import 'Screens/components/stats_dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: buildAppTheme(),
      home: Backdrop(
        frontLayer: StatsDashboard(),
        backLayer: ComponentSelection(),
        frontTitle: Text('Ship Name',
            style: Theme.of(context).primaryTextTheme.headline6),
        backTitle:
            Text('BUILD', style: Theme.of(context).primaryTextTheme.headline6),
      ),
    );
  }
}

ThemeData buildAppTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
          primary: kPrimaryNavy,
          primaryVariant: kPrimaryNavyVariant,
          onPrimary: kOnPrimaryNavy,
          secondary: kSecondaryCyan,
          secondaryVariant: kSecondaryCyanVariant,
          onSecondary: kOnSecondaryCyan,
          background: kPrimaryNavy,
          onBackground: kOnPrimaryNavy,
          surface: kSurface,
          onSurface: kOnPrimaryNavy),
      appBarTheme: base.appBarTheme.copyWith(
        brightness: Brightness.dark,
        backgroundColor: kPrimaryNavy,
        elevation: 0.0,
        titleSpacing: 0.0
      ),
      iconTheme: base.iconTheme.copyWith(
        color: kSecondaryCyan
      ),
      primaryIconTheme: base.primaryIconTheme.copyWith(
        color: kSecondaryCyan
      ),
  );
}
