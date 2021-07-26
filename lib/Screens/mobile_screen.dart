import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:star_citizen_app/Screens/data_screen.dart';
import 'package:star_citizen_app/Screens/widgets/component_selection.dart';
import 'package:star_citizen_app/Screens/widgets/stats_dashboard.dart';
import 'package:star_citizen_app/Services/providers/backdrop_provider.dart';
import 'package:star_citizen_app/Services/providers/content_provider.dart';

import '../constants.dart';
import 'backdrop.dart';

class MobileFramework extends StatefulWidget {
  MobileFramework({Key? key}) : super(key: key);

  @override
  _MobileFrameworkState createState() => _MobileFrameworkState();
}

class _MobileFrameworkState extends State<MobileFramework>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
        duration: Duration(milliseconds: 300), value: 1.0, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) =>
            ContentProvider(controller: controller, velocity: kFlingVelocity),
        builder: (context, child) {
          ContentProvider contentState = Provider.of<ContentProvider>(context);
          return SafeArea(
            child: Scaffold(
              backgroundColor: Theme.of(context).colorScheme.background,
              appBar: AppBar(
                title: contentState.pageName == 'Calculator'
                    ? BackdropTitle(
                        onPress: contentState.toggleBackdropLayerVisibility,
                        frontTitle: 'Calculator',
                        backTitle: 'Build',
                        listenable: controller.view)
                    : Row(
                        children: [
                          SizedBox(
                            width: 72.0,
                            child: Icon(Icons.data_usage_sharp),
                          ),
                          Text(contentState.pageName)
                        ],
                      ),
              ),
              body:
                  // ComponentDataTable(
                  //         componentItems: testData),
                  contentState.pageName == 'Calculator'
                      ? NewBackdrop()
                      : DataScreen(),
              endDrawer: NavigationDrawer(),
            ),
          );
        });
  }
}

class NavigationDrawer extends StatefulWidget {
  NavigationDrawer({Key? key}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  Widget buildMenu(BuildContext context) {
    ContentProvider contentState = Provider.of<ContentProvider>(context);
    return ListView.builder(
        itemCount: contentState.drawerList.length,
        itemBuilder: (BuildContext context, int index) {
          // String routeName = '/${drawerList[index]}';
          if (index == 3 || index == 14) {
            return Divider(color: kGreyOnSurface, thickness: 2.0);
          } else {
            return ListTile(
                selected: index == contentState.currentPage,
                selectedTileColor: kPrimaryNavyVariant,
                leading: Icon(Icons.data_usage_sharp),
                title: Text(contentState.drawerList[index]),
                onTap: () {
                  Navigator.pop(context);
                  contentState.changePage(index);
                });
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    ContentProvider contentProvider = Provider.of<ContentProvider>(context);
    ThemeData themeData = Theme.of(context);
    return Drawer(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
      DrawerHeader(
          margin: EdgeInsets.all(0.0),
          decoration:
              BoxDecoration(color: Theme.of(context).colorScheme.primary),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RichText(
                text: TextSpan(
                    text: '#DPS',
                    style: themeData.textTheme.headline5!
                        .copyWith(color: themeData.colorScheme.secondary),
                    children: [
                      TextSpan(
                          text: 'Calculator',
                          style: themeData.textTheme.headline5),
                      TextSpan(
                        text: 'LIVE',
                        style: themeData.textTheme.headline5!
                            .copyWith(color: themeData.colorScheme.secondary),
                      )
                    ]),
              ),
              SwitchListTile(
                  title: Text('3.13.1-LIVE.7491200'),
                  value: contentProvider.ptuLive,
                  activeColor: themeData.colorScheme.secondary,
                  activeTrackColor:
                      themeData.colorScheme.secondary.withOpacity(0.5),
                  onChanged: (bool value) =>
                      contentProvider.changePTULive(value))
            ],
          )),
      Expanded(child: buildMenu(context))
    ]));
  }
}
