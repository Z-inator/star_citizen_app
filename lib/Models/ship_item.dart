import 'dart:convert';
import 'dart:html';

import 'package:star_citizen_app/Models/entity_models/entity_distortion.dart';
import 'package:star_citizen_app/Models/entity_models/entity_durability.dart';
import 'package:star_citizen_app/Models/entity_models/entity_heat_connection.dart';
import 'package:star_citizen_app/Models/entity_models/entity_power_connection.dart';

class ShipItem {
  final String className;
  final String type;
  final String subType;
  final String size;
  final String grade;
  final String manufacturer;
  final String classification;
  final String description;
  final Durability durability;
  final PowerConnection powerConnection;
  final HeatConnection heatConnection;
  final Distortion distortion;
  
  ShipItem({
    required this.className,
    required this.type,
    required this.subType,
    required this.size,
    required this.grade,
    required this.manufacturer,
    required this.classification,
    required this.description,
    required this.durability,
    required this.powerConnection,
    required this.heatConnection,
    required this.distortion,
  });

  Map<String, dynamic> toMap() {
    return {
      'className': className,
      'type': type,
      'subType': subType,
      'size': size,
      'grade': grade,
      'manufacturer': manufacturer,
      'classification': classification,
      'description': description,
      'durability': durability.toMap(),
      'powerConnection': powerConnection.toMap(),
      'heatConnection': heatConnection.toMap(),
      'distortion': distortion.toMap(),
    };
  }

  factory ShipItem.fromMap(Map<String, dynamic> map) {
    return ShipItem(
      className: map['className'],
      type: map['type'],
      subType: map['subType'],
      size: map['size'],
      grade: map['grade'],
      manufacturer: map['manufacturer'],
      classification: map['classification'],
      description: map['description'],
      durability: Durability.fromMap(map['durability']),
      powerConnection: PowerConnection.fromMap(map['powerConnection']),
      heatConnection: HeatConnection.fromMap(map['heatConnection']),
      distortion: Distortion.fromMap(map['distortion']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShipItem.fromJson(String source) =>
      ShipItem.fromMap(json.decode(source));
}
