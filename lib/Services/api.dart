import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:star_citizen_app/Models/ship.dart';
import 'package:star_citizen_app/Models/weapon.dart';
import 'package:star_citizen_app/Screens/widgets/component_selection.dart';

List<Weapon> getWeapons(List<dynamic> raw) {
  List<dynamic> weaponRaw =
      raw.where((element) => element['type'] == 'WeaponGun').toList();
  log(weaponRaw.length.toString());
  return weaponRaw.map((item) => Weapon.fromJson(item)).toList();
}

Future<List<Weapon>> getWeaponsFromJSON(BuildContext context) async {
  int number = 0;
  String jsonString = await DefaultAssetBundle.of(context)
      .loadString('assets/data/ship-items.json');
  List<dynamic> raw = jsonDecode(jsonString);
  // log(raw.length.toString());
  // List<Weapon> weapons = getWeapons(raw);
  List<dynamic> weaponRaw =
      raw.where((element) => element['type'] == 'WeaponGun').toList();
  // for (var item in weaponRaw) {
  //   try {
  //     var temp = item['stdItem']['Ammunition']['ImpactDamage'][0];
  //     log('temp: ${temp.toString()}');
  //     number += 1;
  //   } catch (e) {
  //     log('number: ${number.toString()}');
  //   }
  // }
  // log(weaponRaw.length.toString());
  List<dynamic> noHealth = [];
  noHealth.addAll(
      weaponRaw.where((element) => (element['stdItem']['Description'] as String).split('\n').length < 4));
  noHealth.forEach((element) {
    log(element['reference'].toString());
  });
  List<Weapon> weapons =
      weaponRaw.map((item) => Weapon.fromJson(item)).toList();
  return weapons;
}

Future<Ship> fetchShip() async {
  http.Response response = await http.get(
    Uri.parse(
        'https://api.starcitizen-api.com/AXIkbpms1J3jJcesgsvqVI0mlA5BR0GW/v1/gamedata/get/3.6.1/ship?name=Avenger'),
    // headers: {
    //   HttpHeaders.authorizationHeader: 'AXIkbpms1J3jJcesgsvqVI0mlA5BR0GW'
    // }
  );
  if (response.statusCode == 200) {
    return Ship.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load ship');
  }
}

class ShipFuture extends StatefulWidget {
  ShipFuture({Key? key}) : super(key: key);

  @override
  _ShipFutureState createState() => _ShipFutureState();
}

class _ShipFutureState extends State<ShipFuture> {
  late Future<Ship> futureShip;

  @override
  void initState() {
    futureShip = fetchShip();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: futureShip,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text('Successful API call');
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
