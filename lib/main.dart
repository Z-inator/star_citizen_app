import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:star_citizen_app/Models/weapon.dart';
import 'package:star_citizen_app/Screens/backdrop.dart';
import 'package:star_citizen_app/Screens/data_screen.dart';
import 'package:star_citizen_app/Screens/mobile_screen.dart';
import 'package:star_citizen_app/Services/api.dart';
import 'package:star_citizen_app/constants.dart';
import 'package:star_citizen_app/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Models/ship.dart';
import 'Screens/widgets/component_selection.dart';
import 'Screens/widgets/stats_dashboard.dart';

///
/// TODO: ReGex for camelCase to be used later,
/// Regex(?<=[a-z])(?=[A-Z])|(?<=[A-Z])(?=[A-Z][a-z])
/// eclipseRCPExt > eclipse/RCP/Ext

import 'package:flutter/material.dart';

// Import the firebase_core plugin

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

/// We are using a StatefulWidget such that we only create the [Future] once,
/// no matter how many times our widget rebuild.
/// If we used a [StatelessWidget], in the event where [App] is rebuilt, that
/// would re-initialize FlutterFire and make our application re-enter loading state,
/// which is undesired.
class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          log(snapshot.error.toString());
          return CircularProgressIndicator();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // PageRouterDelegate _routerDelegate = PageRouterDelegate();

  // PageRouteInformationParser _routeInformationParser =
  //     PageRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo', theme: buildAppTheme(), home: MobileFramework());

    // TODO: use this for webpage
    // MaterialApp.router(
    //   title: 'Flutter Demo',
    //   theme: buildAppTheme(),
    //   routeInformationParser: _routeInformationParser,
    //   routerDelegate: _routerDelegate

    //
    // home: APITest(),
    // initialRoute: 'Calculator',
    // onGenerateRoute: generateRoutes

    // Backdrop(
    //   frontLayer: StatsDashboard(),
    //   backLayer: ComponentSelectionList(),
    //   frontTitle: Text('CALCULATOR',
    //       style: Theme.of(context).primaryTextTheme.headline6),
    //   backTitle:
    //       Text('BUILD', style: Theme.of(context).primaryTextTheme.headline6),
    // ),
    // );
  }
}

class APITest extends StatefulWidget {
  APITest({Key? key}) : super(key: key);

  @override
  _APITestState createState() => _APITestState();
}

class _APITestState extends State<APITest> {
  List<Ship> ships = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: kPrimaryNavy,
        // body: FutureBuilder(
        //   initialData: ships,
        //   future: getShipsFromJSON(context),
        //   builder: (context, AsyncSnapshot snapshot) {
        //     ships = snapshot.data;
        //     return ListView.builder(
        //     itemCount: ships.length,
        //     itemBuilder: (context, int index) {
        //       return ListTile(
        //         leading: Text(ships[index].career),
        //         title: Text(ships[index].name),
        //         subtitle: Text(ships[index].role),
        //         trailing: Text(ships[index].size.toString()),
        //       );
        //     });
        //   }
        // ),

        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.ac_unit),
            onPressed: () {
              getShipsFromJSON(context);
              // setState(() {
              // });
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
    toggleableActiveColor: kSecondaryCyan,
    unselectedWidgetColor: kOnPrimaryNavy,
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
