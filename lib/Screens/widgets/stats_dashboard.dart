import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:star_citizen_app/Services/providers/backdrop_provider.dart';
import '../../constants.dart';
import '../../main.dart';

Map<String, String> statItem = {
  'Weapons': '587 117',
  'Turrets': '0 0',
  'Missiles': '1365728',
  'EMPS': '0',
  'Shields': '6120 684 10',
  'Power Plants': '1148 1788',
  'Coolers': '235 340',
  'EM': '1658',
  'IR': '4308 958 180 1417 3600'
};

class StatsDashboardHeader extends AnimatedWidget {
  const StatsDashboardHeader({Key? key, required Animation<double> listenable})
      : listenable = listenable,
        super(key: key, listenable: listenable);

  final Animation<double> listenable;

  // bool isExpanded = true;
  // late Widget animatedWidget;

  Widget buildListTile(BuildContext context) {
    return ListTile(
      title: Text(
        'Ship Name',
        style: Theme.of(context).textTheme.headline4,
        textAlign: TextAlign.center,
      ),
      trailing: Icon(Icons.flight_sharp),
    );
  }

  Widget buildIconButton(BuildContext context) {
    BackdropProvider backDropProvider =
        Provider.of<BackdropProvider>(context, listen: false);
    double width = MediaQuery.of(context).size.width;
    return Container(
      // The thought process here is to put the icon in the middle of the sliver
      // the sliver cuts to 1/4 of the biggest constraints and half of that
      // would be 1/8 then subtract half the icon size
      margin: EdgeInsets.only(left: width / 8 - 12),
      child: IconButton(
          onPressed: () => backDropProvider.toggleBackdropLayerVisibility(),
          alignment: Alignment.centerLeft,
          icon: Icon(MdiIcons.rocket)),
    );
  }

  @override
  Widget build(BuildContext context) {
    // BackdropProvider backDropProvider = Provider.of<BackdropProvider>(context);
    final Animation<double> animation = listenable;
    // backDropProvider.isExpanded
    //     ? animatedWidget = buildListTile(context)
    //     : animatedWidget = buildIconButton(context);
    // backDropProvider.controller.addStatusListener((status) {
    //   if (status == AnimationStatus.forward) {
    //     setState(() {
    //       // isExpanded = true;
    //       animatedWidget = buildListTile(context);
    //     });
    //   } else if (status == AnimationStatus.reverse) {
    //     setState(() {
    //       // isExpanded = false;
    //       animatedWidget = buildIconButton(context);
    //     });
    //   }
    // });
    return Stack(
      children: [
        Opacity(
          opacity: CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeIn)
              .value,
          child: buildListTile(context),
        ),
        Opacity(
          opacity: CurvedAnimation(
              parent: ReverseAnimation(animation), 
              curve: Curves.easeIn)
              .value,
          child: buildIconButton(context),
        ),
      ],
    );
    // AnimatedCrossFade(
    //     firstChild: buildListTile(context),
    //     secondChild: buildIconButton(context),
    //     crossFadeState:
    //         isExpanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    //     duration: Duration(milliseconds: 300));
    // AnimatedSwitcher(
    //   duration: Duration(milliseconds: 500),
    //   // transitionBuilder: (Widget child, Animation<double> animation) {
    //   //   return ScaleTransition(scale: animation, child: child);
    //   // },
    //   child: animatedWidget,
    // );
  }
}

class StatsDashboard extends StatefulWidget {
  StatsDashboard({Key? key}) : super(key: key);

  @override
  _StatsDashboardState createState() => _StatsDashboardState();
}

class _StatsDashboardState extends State<StatsDashboard> {
  late ScrollController scrollController;
  bool isExpanded = true;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  List<Widget> buildStatRows() {
    List<Widget> statRows = [];
    statItem.forEach((key, value) {
      Map<String, String> currentItem = {key: value};
      statRows.add(StatDashboardRows(
          icon: Icon(Icons.data_usage_sharp), stats: currentItem));
    });
    return statRows;
  }

  @override
  Widget build(BuildContext context) {
    BackdropProvider backDropProvider = Provider.of<BackdropProvider>(context);
    return Theme(
      data: Theme.of(context).copyWith(
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
        padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
        side: BorderSide(color: kGreyOnSurface),
        shape: buildBeveledRectangleBorder(
            kGreyOnSurface, kSmallBevel, kSmallBevelWidth),
        textStyle: Theme.of(context).textTheme.subtitle1,
        primary: Theme.of(context).textTheme.subtitle1!.color,
      ))),
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StatsDashboardHeader(listenable: backDropProvider.controller.view),
            Expanded(child: buildStatsDashboardBody(context)),
          ],
        ),
      ),
    );
  }

  Widget buildStatsDashboardBody(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      borderOnForeground: true,
      shape: buildBeveledRectangleBorder(
          kGreyOnSurface, kLargeBevel, kLargeBevelWidth),
      child: ListView(
        controller: scrollController,
        padding: EdgeInsets.all(25.0),
        physics: ClampingScrollPhysics(),
        children: [
          OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.flight_sharp,
                  color: Theme.of(context).colorScheme.secondary),
              label: Text('Select Ship or Vehicle')),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.info_sharp,
                      color: Theme.of(context).colorScheme.secondary),
                  label: Text('Ship Info')),
              OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.save_sharp,
                      color: Theme.of(context).colorScheme.secondary),
                  label: Text('Save')),
              OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.share_sharp,
                      color: Theme.of(context).colorScheme.secondary),
                  label: Text('Share'))
            ],
          ),
          Column(
            children: buildStatRows(),
          ),
          StatsDashboardFilters(scrollController: scrollController),
        ],
      ),
    );
  }
}

class StatDashboardRows extends StatelessWidget {
  StatDashboardRows({Key? key, required this.icon, required this.stats})
      : super(key: key);
  final Icon icon;
  final Map<String, String> stats;
  late final ThemeData themeData;

  Widget selectWidget(BuildContext context) {
    String widgetType = stats.keys.single;
    List<String> splitStat = stats.values.single.split(' ');
    switch (widgetType) {
      case 'Weapons':
        return buildWeaponStat(splitStat);
      case 'Turrets':
        return buildWeaponStat(splitStat);
      case 'Missiles':
        return buildMissileStat(splitStat);
      case 'EMPS':
        return buildEMPStat(splitStat);
      case 'Shields':
        return buildShieldStat(splitStat);
      case 'Power Plants':
        return buildPowerStat(splitStat);
      case 'Coolers':
        return buildCoolerStat(splitStat);
      case 'EM':
        return buildEMStat(splitStat);
      case 'IR':
        return buildIRStat(splitStat);
      default:
        return ListTile();
    }
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    Widget statWidget = selectWidget(context);
    return Container(
      child: statWidget,
    );
  }

  Widget buildWeaponStat(List<String> statList) {
    return ListTile(
      leading: icon,
      title: RichText(
        text: TextSpan(
            text: statList[0],
            style: statList[0] != '0'
                ? themeData.textTheme.headline4
                : themeData.textTheme.headline4!
                    .copyWith(color: kGreyOnSurface),
            children: [
              TextSpan(
                  text: 'dps  ',
                  style: themeData.textTheme.caption!
                      .copyWith(color: themeData.colorScheme.secondary)),
              TextSpan(
                text: statList[1],
                style: statList[1] != '0'
                    ? themeData.textTheme.headline6
                    : themeData.textTheme.headline6!
                        .copyWith(color: kGreyOnSurface),
              ),
              TextSpan(
                  text: 'alpha',
                  style: themeData.textTheme.caption!
                      .copyWith(color: themeData.colorScheme.secondary)),
            ]),
      ),
    );
  }

  Widget buildMissileStat(List<String> statList) {
    return ListTile(
      leading: icon,
      title: RichText(
        text: TextSpan(
            text: statList[0],
            style: statList[0] != '0'
                ? themeData.textTheme.headline4
                : themeData.textTheme.headline4!
                    .copyWith(color: kGreyOnSurface),
            children: [
              TextSpan(
                  text: 'dmg',
                  style: themeData.textTheme.caption!
                      .copyWith(color: themeData.colorScheme.secondary)),
            ]),
      ),
    );
  }

  Widget buildEMPStat(List<String> statList) {
    return ListTile(
      leading: icon,
      title: RichText(
        text: TextSpan(
            text: statList[0],
            style: statList[0] != '0'
                ? themeData.textTheme.headline4
                : themeData.textTheme.headline4!
                    .copyWith(color: kGreyOnSurface),
            children: [
              TextSpan(
                  text: 'dmg',
                  style: themeData.textTheme.caption!
                      .copyWith(color: themeData.colorScheme.secondary)),
            ]),
      ),
    );
  }

  Widget buildShieldStat(List<String> statList) {
    return ListTile(
      leading: icon,
      title: RichText(
        text: TextSpan(
            text: statList[0],
            style: statList[0] != '0'
                ? themeData.textTheme.headline4
                : themeData.textTheme.headline4!
                    .copyWith(color: kGreyOnSurface),
            children: [
              TextSpan(
                  text: 'hp  ',
                  style: themeData.textTheme.caption!
                      .copyWith(color: themeData.colorScheme.secondary)),
              TextSpan(
                text: statList[1],
                style: statList[1] != '0'
                    ? themeData.textTheme.headline6
                    : themeData.textTheme.headline6!
                        .copyWith(color: kGreyOnSurface),
              ),
              TextSpan(
                  text: 'hp/s',
                  style: themeData.textTheme.caption!
                      .copyWith(color: themeData.colorScheme.secondary)),
            ]),
      ),
      subtitle: RichText(
          text: TextSpan(text: 'Full Charge in ', children: [
        TextSpan(
            text: '${statList[2]}s',
            style: themeData.textTheme.bodyText2!
                .copyWith(color: themeData.colorScheme.secondary))
      ])),
    );
  }

  Widget buildPowerStat(List<String> statList) {
    return ListTile(
      leading: icon,
      title: RichText(
        text: TextSpan(
            text: statList[0],
            style: statList[0] != '0'
                ? themeData.textTheme.headline4
                : themeData.textTheme.headline4!
                    .copyWith(color: kGreyOnSurface),
            children: [
              TextSpan(
                text: '/${statList[1]}',
                style: statList[1] != '0'
                    ? themeData.textTheme.subtitle1!
                        .copyWith(color: themeData.colorScheme.secondary)
                    : themeData.textTheme.headline4!
                        .copyWith(color: kGreyOnSurface),
              ),
              TextSpan(
                  text: 'pwr/s',
                  style: themeData.textTheme.caption!
                      .copyWith(color: themeData.colorScheme.secondary)),
            ]),
      ),
    );
  }

  Widget buildCoolerStat(List<String> statList) {
    return ListTile(
      leading: icon,
      title: RichText(
        text: TextSpan(
            text: statList[0],
            style: statList[0] != '0'
                ? themeData.textTheme.headline4
                : themeData.textTheme.headline4!
                    .copyWith(color: kGreyOnSurface),
            children: [
              TextSpan(
                text: 'K/${statList[1]}',
                style: statList[1] != '0'
                    ? themeData.textTheme.subtitle1!
                        .copyWith(color: themeData.colorScheme.secondary)
                    : themeData.textTheme.headline4!
                        .copyWith(color: kGreyOnSurface),
              ),
              TextSpan(
                  text: 'Kcooling/s',
                  style: themeData.textTheme.caption!
                      .copyWith(color: themeData.colorScheme.secondary)),
            ]),
      ),
    );
  }

  Widget buildEMStat(List<String> statList) {
    return ListTile(
        leading: icon,
        title: Text(statList[0],
            style: statList[0] != '0'
                ? themeData.textTheme.headline4
                : themeData.textTheme.headline4!
                    .copyWith(color: kGreyOnSurface)));
  }

  Widget buildIRStat(List<String> statList) {
    return ListTile(
        leading: icon,
        title: Text(
          statList[0],
          style: statList[0] != '0'
              ? themeData.textTheme.headline4
              : themeData.textTheme.headline4!.copyWith(color: kGreyOnSurface),
        ),
        subtitle: Row(
          children: [
            RichText(
                text: TextSpan(children: [
              WidgetSpan(child: Icon(Icons.data_usage_sharp, size: 16.0)),
              TextSpan(text: statList[1]),
            ])),
            RichText(
                text: TextSpan(children: [
              WidgetSpan(child: Icon(Icons.data_usage_sharp, size: 16.0)),
              TextSpan(text: statList[2]),
            ])),
            RichText(
                text: TextSpan(children: [
              WidgetSpan(child: Icon(Icons.data_usage_sharp, size: 16.0)),
              TextSpan(text: statList[3]),
            ])),
            RichText(
                text: TextSpan(children: [
              WidgetSpan(child: Icon(Icons.data_usage_sharp, size: 16.0)),
              TextSpan(text: statList[4]),
            ]))
          ],
        ));
  }
}

class StatsDashboardFilters extends StatefulWidget {
  StatsDashboardFilters({Key? key, required this.scrollController})
      : super(key: key);

  final ScrollController scrollController;

  @override
  _StatsDashboardFiltersState createState() => _StatsDashboardFiltersState();
}

class _StatsDashboardFiltersState extends State<StatsDashboardFilters> {
  final GlobalKey expansionTileKey = GlobalKey();

  bool weaponsFiring = true;
  bool mining = true;
  bool shieldsRecharging = true;
  bool turretsFiring = true;
  bool empsCharging = true;
  bool maneuvering = true;

  void scrollToSelectedContent(GlobalKey expansionTileKey) {
    final keyContext = expansionTileKey.currentContext;
    if (keyContext != null) {
      // Feels kind of hacky but the ListView doesn't properly scroll without
      // the expansion finishing and I didn't find a solution to add a listener
      // to the animation.
      Future.delayed(Duration(milliseconds: 220)).then((value) =>
          Scrollable.ensureVisible(keyContext,
              duration: Duration(milliseconds: 300)));
    }
  }

  @override
  Widget build(BuildContext context) {
    Color switchColor = Theme.of(context).colorScheme.secondary;
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Material(
        borderOnForeground: true,
        shape: buildBeveledRectangleBorder(
            kGreyOnSurface, kMediumBevel, kMediumBevelWidth),
        child: ExpansionTile(
          title: Text('SIMULATION'),
          collapsedIconColor: Theme.of(context).colorScheme.onPrimary,
          textColor: Theme.of(context).colorScheme.onPrimary,
          iconColor: Theme.of(context).colorScheme.onPrimary,
          key: expansionTileKey,
          onExpansionChanged: (isExpanded) {
            if (isExpanded) {
              scrollToSelectedContent(expansionTileKey);
            }
          },
          children: [
            SwitchListTile(
                value: weaponsFiring,
                title: Text('Weapons Firing'),
                activeColor: switchColor,
                activeTrackColor: switchColor.withOpacity(.5),
                secondary: Icon(Icons.data_usage_sharp, color: switchColor),
                onChanged: (bool value) {
                  setState(() {
                    weaponsFiring = value;
                  });
                }),
            SwitchListTile(
                value: mining,
                title: Text('Mining'),
                activeColor: switchColor,
                activeTrackColor: switchColor.withOpacity(.5),
                secondary: Icon(Icons.data_usage_sharp, color: switchColor),
                onChanged: (bool value) {
                  setState(() {
                    mining = value;
                  });
                }),
            SwitchListTile(
                value: shieldsRecharging,
                title: Text('Shields Recharging'),
                activeColor: switchColor,
                activeTrackColor: switchColor.withOpacity(.5),
                secondary: Icon(Icons.data_usage_sharp, color: switchColor),
                onChanged: (bool value) {
                  setState(() {
                    shieldsRecharging = value;
                  });
                }),
            SwitchListTile(
                value: turretsFiring,
                title: Text('Turrets Firing'),
                activeColor: switchColor,
                activeTrackColor: switchColor.withOpacity(.5),
                secondary: Icon(Icons.data_usage_sharp, color: switchColor),
                onChanged: (bool value) {
                  setState(() {
                    turretsFiring = value;
                  });
                }),
            SwitchListTile(
                value: empsCharging,
                title: Text('EMPs Charging'),
                activeColor: switchColor,
                activeTrackColor: switchColor.withOpacity(.5),
                secondary: Icon(Icons.data_usage_sharp, color: switchColor),
                onChanged: (bool value) {
                  setState(() {
                    empsCharging = value;
                  });
                }),
            SwitchListTile(
                value: maneuvering,
                title: Text('Maneuvering'),
                activeColor: switchColor,
                activeTrackColor: switchColor.withOpacity(.5),
                secondary: Icon(Icons.data_usage_sharp, color: switchColor),
                onChanged: (bool value) {
                  setState(() {
                    maneuvering = value;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
