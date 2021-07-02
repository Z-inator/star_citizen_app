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
        backLayer: ComponentSelectionList(),
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
  // final TextTheme textTheme = buildTextTheme(base.textTheme, kOnPrimaryNavy);
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
          titleSpacing: 0.0),
      iconTheme: base.iconTheme.copyWith(color: kSecondaryCyan),
      primaryIconTheme: base.primaryIconTheme.copyWith(color: kSecondaryCyan),
      // textTheme: textTheme,
      // primaryTextTheme: textTheme,
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              padding: EdgeInsets.all(4),
              side: BorderSide(color: kSecondaryCyan),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              textStyle: base.textTheme.subtitle1!.copyWith(fontSize: 16.0),
              primary: base.textTheme.subtitle1!.color,
              // onSurface: base.textTheme.subtitle1!.color,
              )),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 2),
          textStyle: base.textTheme.caption!.copyWith(fontSize: 12),
          primary: base.textTheme.caption!.color,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: Size.zero
        )
      )
  );
}

// TextTheme buildTextTheme(TextTheme base, Color color) {
//   return base.copyWith(
//     headline1: base.headline1!.copyWith(color: color),
//     headline2: base.headline2!.copyWith(color: color),
//     headline3: base.headline3!.copyWith(color: color),
//     headline4: base.headline4!.copyWith(color: color),
//     headline5: base.headline5!.copyWith(color: color),
//     headline6: base.headline6!.copyWith(color: color),
//     subtitle1: base.subtitle1!.copyWith(color: color, fontWeight: FontWeight.bold),
//     subtitle2: base.subtitle2!.copyWith(color: color),
//     bodyText1: base.bodyText1!.copyWith(color: color),
//     bodyText2: base.bodyText2!.copyWith(color: color),
//     caption: base.caption!.copyWith(color: color),
//   );
// }
