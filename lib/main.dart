import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:star_citizen_app/Models/weapon.dart';
import 'package:star_citizen_app/Screens/backdrop.dart';
import 'package:star_citizen_app/Services/api.dart';
import 'package:star_citizen_app/constants.dart';

import 'Screens/widgets/component_selection.dart';
import 'Screens/widgets/stats_dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo', theme: buildAppTheme(), home: APITest()
        // Backdrop(
        //   frontLayer: StatsDashboard(),
        //   backLayer: ComponentSelectionList(),
        //   frontTitle: Text('CALCULATOR',
        //       style: Theme.of(context).primaryTextTheme.headline6),
        //   backTitle:
        //       Text('BUILD', style: Theme.of(context).primaryTextTheme.headline6),
        // ),
        );
  }
}

class APITest extends StatefulWidget {
  APITest({Key? key}) : super(key: key);

  @override
  _APITestState createState() => _APITestState();
}

class _APITestState extends State<APITest> {
  List<Weapon> weapons = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: kPrimaryNavy,
        body: FutureBuilder(
          initialData: weapons,
          future: getWeaponsFromJSON(context),
          builder: (context, AsyncSnapshot snapshot) {
            weapons = snapshot.data;
            return ListView.builder(
            itemCount: weapons.length,
            itemBuilder: (context, int index) {
              return ListTile(
                title: Text(weapons[index].name),
                subtitle: Text(weapons[index].type),
              );
            });
          }
        ),
        
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.ac_unit),
            onPressed: () {
              setState(() {
              });
            }),
      ),
    );
  }
}

ThemeData buildAppTheme() {
  final ThemeData base = ThemeData.light();
  final TextTheme textTheme = buildTextTheme(base.textTheme, kOnPrimaryNavy);
  return base.copyWith(
    brightness: Brightness.dark,
    canvasColor: kSurface,
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
        titleSpacing: 0.0),
    iconTheme: base.iconTheme.copyWith(color: kSecondaryCyan),
    primaryIconTheme: base.primaryIconTheme.copyWith(color: kSecondaryCyan),
    accentIconTheme: base.accentIconTheme.copyWith(color: kSecondaryCyan),
    textTheme: textTheme,
    primaryTextTheme: textTheme,
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
      minimumSize: Size.fromHeight(42),
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      side: BorderSide(color: kSecondaryCyan),
      shape: buildBeveledRectangleBorder(
          kSecondaryCyan, kSmallBevel, kSmallBevelWidth),
      textStyle: textTheme.subtitle1!.copyWith(fontSize: 16),
      primary: kOnPrimaryNavy,
    )),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            padding: EdgeInsets.all(4.0),
            textStyle: base.textTheme.caption!.copyWith(fontSize: 12),
            primary: kOnPrimaryNavy,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: Size.zero)),
  );
}

TextTheme buildTextTheme(TextTheme base, Color color) {
  return base.copyWith(
    headline1: base.headline1!.copyWith(color: color),
    headline2: base.headline2!.copyWith(color: color),
    headline3: base.headline3!.copyWith(color: color),
    headline4: base.headline4!.copyWith(color: color),
    headline5: base.headline5!.copyWith(color: color),
    headline6: base.headline6!.copyWith(color: color),
    subtitle1:
        base.subtitle1!.copyWith(color: color, fontWeight: FontWeight.bold),
    subtitle2: base.subtitle2!.copyWith(color: color),
    bodyText1: base.bodyText1!.copyWith(color: color),
    bodyText2: base.bodyText2!.copyWith(color: color),
    caption: base.caption!.copyWith(color: color),
  );
}
