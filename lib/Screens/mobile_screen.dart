import 'package:flutter/material.dart';

import '../constants.dart';

class MobileFrameWork extends StatefulWidget {
  Widget body;
  Widget title;

  MobileFrameWork({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  _MobileFrameWorkState createState() => _MobileFrameWorkState();
}

class _MobileFrameWorkState extends State<MobileFrameWork> {
  String currentPage = 'Calculator';
  final List<String> drawerList = [
    'Calculator',
    'Cart',
    'Hangar',
    '',
    'Ships&Vehicles',
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

  Drawer buildDrawer(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    bool ptuLive = true;
    Icon icon = Icon(Icons.data_usage_sharp);
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
                  value: ptuLive,
                  activeColor: themeData.colorScheme.secondary,
                  activeTrackColor:
                      themeData.colorScheme.secondary.withOpacity(0.5),
                  onChanged: (bool value) {
                    setState(() {
                      ptuLive = value;
                    });
                  })
            ],
          )),
      Expanded(
        child: ListView.builder(
          itemCount: drawerList.length,
          itemBuilder: (BuildContext context, int index) {
            String routeName = '/${drawerList[index]}';
            if (index == 3 || index == 14) {
              return Divider(color: kGreyOnSurface, thickness: 2.0);
            } else {
              return ListTile(
                  leading: icon,
                  title: Text(drawerList[index]),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, routeName);
                  });
            }
          },
        ),
      )
    ]));
  }

  PreferredSizeWidget buildAppBar(Widget title) {
    return AppBar(
      title: title,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: buildAppBar(widget.title),
          body: widget.body,
          endDrawer: buildDrawer(context),
        ),
      ),
    );
  }
}
