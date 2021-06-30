import 'package:flutter/material.dart';
import 'package:star_citizen_app/Screens/backdrop.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: Backdrop(
        frontLayer: ComponentSelection(),
        backLayer: StatsDashboard(),
        frontTitle: Text('Ship Name', style: Theme.of(context).primaryTextTheme.headline6),
        backTitle: Text('BUILD', style: Theme.of(context).primaryTextTheme.headline6),
      ),
    );
  }
}

