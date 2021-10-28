import 'dart:convert';
import 'dart:developer';
// import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:star_citizen_app/Models/ship.dart';
import 'package:star_citizen_app/Models/weapon.dart';

/*
Uploader I am working on:
Future<void> generateRequest() async {
  String shipPath =
      'D:/Zach\'s PC/Downloads/scunpacked-master/scunpacked-master/api/dist/json/v2/ships.json';
  try {
    File(shipPath)
        .readAsString()
        .then((fileContents) => processResponse(fileContents));
  } catch (e) {
    print(e.toString());
  }
}

void processResponse(String jsonString) {
  List<dynamic> raw = jsonDecode(jsonString);
  print('obtained raw JSON');
  List<Ship> ships = [];
  Ship? newShip;
  for (var item in raw) {
    String currentShipName = item['ClassName'];
    print(currentShipName);
    String currentShipFilePath =
        'D:/Zach\'s PC/Downloads/scunpacked-master/scunpacked-master/api/dist/json/v2/ships/$currentShipName.json';
    Map<String, dynamic> currentShipRaw = {};
    try {
      File(currentShipFilePath).readAsString().then((fileContents) {
        currentShipRaw = jsonDecode(fileContents);
      });
    } catch (e) {
      print(e.toString());
    }
    print('got currentShipRaw ---------------');
    String currentShipPortsFilePath =
        'D:/Zach\'s PC/Downloads/scunpacked-master/scunpacked-master/api/dist/json/v2/ships/$currentShipName-ports.json';
    Map<String, dynamic> currentShipPortsRaw = {};
    try {
      File(currentShipFilePath).readAsString().then((fileContents) {
        currentShipPortsRaw = jsonDecode(fileContents);
      });
    } catch (e) {
      print(e.toString());
    }
    print('got currentShipPortsRaw -------------------- ');
    try {
      newShip = Ship.fromMap(currentShipRaw, currentShipPortsRaw);
    } catch (e) {
      print(e.toString());
    }
  }
  print(ships.length.toString());
}
*/

// List<Weapon> getWeapons(List<dynamic> raw) {
//   List<dynamic> weaponRaw =
//       raw.where((element) => element['type'] == 'WeaponGun').toList();
//   log(weaponRaw.length.toString());
//   return weaponRaw.map((item) => Weapon.fromJson(item)).toList();
// }

Future<List<Ship>> getShipsFromJSON(BuildContext context) async {
  String jsonString =
      await DefaultAssetBundle.of(context).loadString('assets/data/ships.json');
  // String jsonString =
  //     await DefaultAssetBundle.of(context).loadString('assets/data/ships.json');
  List<dynamic> raw = jsonDecode(jsonString);
  List<Ship> ships = [];
  Ship? newShip;
  Map<String, dynamic> currentShipRaw = {};
  Map<String, dynamic> currentShipPortsRaw = {};
  for (var item in raw) {
    String currentShipName = item['ClassName'];
    String currentShipFilePath =
        'D:/Zach\'s PC/Downloads/scunpacked-master/scunpacked-master/api/dist/json/v2/ships/${currentShipName.toLowerCase()}.json';
    String currentShipPortsFilePath =
        'D:/Zach\'s PC/Downloads/scunpacked-master/scunpacked-master/api/dist/json/v2/ships/${currentShipName.toLowerCase()}-ports.json';
    try {
      String shipFileContents = await File(currentShipFilePath).readAsString();
      currentShipRaw = jsonDecode(shipFileContents);
      String portFileContents =
          await File(currentShipPortsFilePath).readAsString();
      currentShipPortsRaw = jsonDecode(portFileContents);
    } catch (e) {
      log(e.toString());
    } finally {
      try {
        newShip = Ship.fromMap(currentShipRaw, currentShipPortsRaw);
        ships.add(newShip);
      } catch (e) {
        print(e.toString());
        print(item['ClassName']);
      }
    }
  }
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

// class ShipFuture extends StatefulWidget {
//   ShipFuture({Key? key}) : super(key: key);

//   @override
//   _ShipFutureState createState() => _ShipFutureState();
// }

// class _ShipFutureState extends State<ShipFuture> {
//   late Future<Ship> futureShip;

//   // @override
//   // void initState() {
//   //   futureShip = fetchShip();
//   //   super.initState();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: FutureBuilder(
//           future: futureShip,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return Text('Successful API call');
//             } else if (snapshot.hasError) {
//               return Text('${snapshot.error}');
//             }
//             return CircularProgressIndicator();
//           }),
//     );
//   }
// }

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