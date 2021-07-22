import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:star_citizen_app/Screens/data_screen.dart';
import 'package:star_citizen_app/Screens/widgets/component_selection.dart';
import 'package:star_citizen_app/Screens/widgets/stats_dashboard.dart';
import 'package:star_citizen_app/Services/providers/backdrop_provider.dart';
import 'package:star_citizen_app/Services/providers/content_provider.dart';

import '../constants.dart';
import 'backdrop.dart';

class MobileFramework extends StatelessWidget {
  MobileFramework({Key? key}) : super(key: key);

  Icon icon = Icon(Icons.data_usage_sharp);

  Drawer buildDrawer(BuildContext context) {
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
                leading: icon,
                title: Text(contentState.drawerList[index]),
                onTap: () {
                  contentState.changePage(index);
                });
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ContentProvider(),
        builder: (context, child) {
          ContentProvider contentState = Provider.of<ContentProvider>(context);
          List<TestData> testData = [];
          for (var item in contentState.content['Weapons']!) {
            testData.add(TestData.fromJson(item));
          }

          return SafeArea(
            child: Scaffold(
              backgroundColor: Theme.of(context).colorScheme.background,
              // appBar: buildAppBar(context),
              body: ComponentDataTable(
                      componentItems: testData),
              // contentState.pageName == 'Calculator'
              //     ? Backdrop(
              //         frontLayer: StatsDashboard(),
              //         backLayer: ComponentSelectionList())
              //     : ComponentDataTable(
              //         componentItems:
              //             contentState.content[contentState.currentPage]!),
              endDrawer: buildDrawer(context),
            ),
          );
        });
  }
}
