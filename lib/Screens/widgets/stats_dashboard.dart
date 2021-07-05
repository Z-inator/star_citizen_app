import 'package:flutter/material.dart';
import 'package:star_citizen_app/constants.dart';

class StatsDashboard extends StatelessWidget {
  const StatsDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.fromLTRB(10, 22, 10, 20),
        physics: ClampingScrollPhysics(),
        children: [
          OutlinedButton(
              onPressed: () {}, child: Text('Select Ship or Vehicle')),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.info_sharp)),
              OutlinedButton(onPressed: () {}, child: Text('Save')),
              OutlinedButton(onPressed: () {}, child: Text('Share'))
            ],
          ),
          ListTile(
            title: Text('Build Name'),
          ),
          ListTile(
            title: Text('Weapons'),
          ),
          ListTile(
            title: Text('Turrets'),
          ),
          ListTile(
            title: Text('Missiles'),
          ),
          ListTile(
            title: Text('EMPS'),
          ),
          ListTile(
            title: Text('Shields'),
          ),
          ListTile(
            title: Text('Power'),
          ),
          ListTile(
            title: Text('Cooling'),
          ),
          ListTile(
            title: Text('EM/IR'),
          ),
          StatsDashboardFilters()
        ],
      ),
    );
  }
}

class StatsDashboardFilters extends StatefulWidget {
  StatsDashboardFilters({Key? key}) : super(key: key);

  @override
  _StatsDashboardFiltersState createState() => _StatsDashboardFiltersState();
}

class _StatsDashboardFiltersState extends State<StatsDashboardFilters> {
  bool weaponsFiring = true;
  bool mining = true;
  bool shieldsRecharging = true;
  bool turretsFiring = true;
  bool empsCharging = true;
  bool maneuvering = true;

  @override
  Widget build(BuildContext context) {
    Color switchColor = Theme.of(context).colorScheme.secondary;
    return Material(
      borderOnForeground: true,
      shape: buildBeveledRectangleBorder(kGreyOnSurface, kMediumBevel, kMediumBevelWidth),
      child: Column(
        children: [
          SwitchListTile(
              value: weaponsFiring,
              title: Text('Weapons Firing'),
              activeColor: switchColor,
              activeTrackColor: switchColor.withOpacity(.5),
              secondary: Icon(Icons.data_usage_sharp),
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
              secondary: Icon(Icons.data_usage_sharp),
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
              secondary: Icon(Icons.data_usage_sharp),
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
              secondary: Icon(Icons.data_usage_sharp),
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
              secondary: Icon(Icons.data_usage_sharp),
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
              secondary: Icon(Icons.data_usage_sharp),
              onChanged: (bool value) {
                setState(() {
                  maneuvering = value;
                });
              })
        ],
      ),
    );
  }
}
