import 'package:flutter/material.dart';

class StatsDashboard extends StatelessWidget {
  const StatsDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
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
        ],
      ),
    );
  }
}

