import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Ship> fetchShip() async {
  http.Response response = await http.get(
    Uri.parse('https://api.starcitizen-api.com/AXIkbpms1J3jJcesgsvqVI0mlA5BR0GW/v1/gamedata/get/3.6.1/ship?name=Avenger'),
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

class Ship {
  final String shipID;
  final String shipName;

  Ship({required this.shipID, required this.shipName});

  factory Ship.fromJson(Map<String, dynamic> json) {
    return Ship(
      shipID: json['data']['displayname'], 
      shipName: json['data']['name']);
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
