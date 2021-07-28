import 'dart:convert';
import 'dart:developer';
// import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'package:star_citizen_app/Models/ship.dart';
import 'package:star_citizen_app/Models/weapon.dart';
import 'package:path_provider/path_provider.dart';

// List<Weapon> getWeapons(List<dynamic> raw) {
//   List<dynamic> weaponRaw =
//       raw.where((element) => element['type'] == 'WeaponGun').toList();
//   log(weaponRaw.length.toString());
//   return weaponRaw.map((item) => Weapon.fromJson(item)).toList();
// }

// Future getShipFromShipFile(BuildContext context, String classPath) async {
//   String fileString = 'D:/Zach\'s PC/Downloads/scunpacked-master/scunpacked-master/api/dist/json/v2/ships/${classPath}-parts.json';
//   List<dynamic> raw = jsonDecode(fileString);
//   List<dynamic> weapons = [];
//   weapons.add(raw.where((element) => element['Parts'][1]['Parts'][]))
// }

Future<List<Ship>> getShipsFromJSON(BuildContext context) async {
  String jsonString =
      await DefaultAssetBundle.of(context).loadString('assets/data/ships.json');
  // String jsonString =
  //     await DefaultAssetBundle.of(context).loadString('assets/data/ships.json');
  List<dynamic> raw = jsonDecode(jsonString);
  List<Ship> ships = [];
  Ship? newShip;
  for (var item in raw) {
    String currentShipName = item['ClassName'];
    Directory localDirectory = await getApplicationDocumentsDirectory();
    String localPath = localDirectory.path;
    String currentShipFile =
        '$localPath/../../../../Downloads/scunpacked-master/scunpacked-master/api/dist/json/v2/ships/$currentShipName.json';
    Map<String, dynamic> currentShipRaw = jsonDecode(currentShipFile);
    String currentShipPortsFile =
        '$localPath/../../../../Downloads/scunpacked-master/scunpacked-master/api/dist/json/v2/ships/$currentShipName-ports.json';
    Map<String, dynamic> currentShipPortsRaw = jsonDecode(currentShipPortsFile);
    try {
      newShip = Ship.fromMap(currentShipRaw, currentShipPortsRaw);
      ships.add(newShip);
    } catch (e) {
      log(e.toString());
    }
  }
  List<String> classPath = [];

  // raw.map((json) {
  //   String className = json['ClassName'];

  // })
  // List<Ship> ships = [];
  // Ship? newShip;
  // for (var item in raw) {
  //   try {
  //     newShip = Ship.fromJson(item);
  //     ships.add(newShip);
  //   } catch (e) {
  //     log(e.toString());
  //     log(item['reference'].toString());
  //   }
  // }
  // weapons.forEach((Weapon weapon) {
  //   log(weapon.type);
  //   if (weapon.type == 'UNKNOWN') log(weapon.name);
  // });
  // List<dynamic> noHealth = [];
  // noHealth.addAll(weaponRaw.where((element) =>
  //     (element['stdItem']['Description'] as String).split('/n').length < 4));
  // noHealth.forEach((element) {
  //   log(element['reference'].toString());
  // });
  // List<Weapon> weapons =
  //     weaponRaw.map((item) => Weapon.fromJson(item)).toList();
  return ships;
}

Future<List<Weapon>> getWeaponsFromJSON(BuildContext context) async {
  String jsonString = await DefaultAssetBundle.of(context)
      .loadString('assets/data/ship-items.json');
  List<dynamic> raw = jsonDecode(jsonString);
  List<dynamic> weaponRaw = raw
      .where((element) =>
          element['classification'] == 'Ship.Weapon.Gun' ||
          element['classification'] == 'Ship.Weapon.NoseMounted' ||
          element['classification'] == 'Ship.Weapon.Rocket')
      .toList();

  List<Weapon> weapons = [];
  Weapon? newWeapon;
  for (var item in weaponRaw) {
    try {
      newWeapon = Weapon.fromJson(item);
      weapons.add(newWeapon);
    } catch (e) {
      log(e.toString());
      log(item['reference'].toString());
    }
  }
  // weapons.forEach((Weapon weapon) {
  //   log(weapon.type);
  //   if (weapon.type == 'UNKNOWN') log(weapon.name);
  // });
  // List<dynamic> noHealth = [];
  // noHealth.addAll(weaponRaw.where((element) =>
  //     (element['stdItem']['Description'] as String).split('/n').length < 4));
  // noHealth.forEach((element) {
  //   log(element['reference'].toString());
  // });
  // List<Weapon> weapons =
  //     weaponRaw.map((item) => Weapon.fromJson(item)).toList();
  return weapons;
}

// Future<List<Weapon>> getWeaponsFromXML(BuildContext context) async {
//   String xmlString =
//       await DefaultAssetBundle.of(context).loadString('assets/data/game.xml');
//   var raw = xml.XmlDocument.parse(xmlString);
//   var elements = raw.findAllElements('EntityClassDefinition.${className}');

// }

class ShipFuture extends StatefulWidget {
  ShipFuture({Key? key}) : super(key: key);

  @override
  _ShipFutureState createState() => _ShipFutureState();
}

class _ShipFutureState extends State<ShipFuture> {
  late Future<Ship> futureShip;

  // @override
  // void initState() {
  //   futureShip = fetchShip();
  //   super.initState();
  // }

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

// Future<Ship> fetchShip() async {
//   http.Response response = await http.get(
//     Uri.parse(
//         'https://api.starcitizen-api.com/AXIkbpms1J3jJcesgsvqVI0mlA5BR0GW/v1/gamedata/get/3.6.1/ship?name=Avenger'),
//     // headers: {
//     //   HttpHeaders.authorizationHeader: 'AXIkbpms1J3jJcesgsvqVI0mlA5BR0GW'
//     // }
//   );
//   if (response.statusCode == 200) {
//     return Ship.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load ship');
//   }
// }