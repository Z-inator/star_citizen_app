import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'ships.g.dart';

// @JsonSerializable()
class Ship {
  final String className;
  final String name;
  final String description;
  final String career;
  final String role;
  final int size;
  final double cargo;
  final int crew;
  final int weaponCrew;
  final int operationsCrew;
  final double mass;
  final bool isSpaceship;
  final String manufacturer;

  // Map {Nose: double, Body: double}
  final Map<String, double> hullHP;
  // final String dimensions;
  final double scmSpeed;
  final double maxSpeed;
  // final String movement;
  final double fuelCapacity;

  /// Map {Main: double, Retro: double, Vtol: double, Maneuvering: double}
  final Map<String, double> fuelUsage;

  /// Map {Main: double, Retro: double, Vtol: double, Maneuvering: double}
  final Map<String, double> thrustCapacity;
  final double quantumTravelSpeed;
  final double quantumTravelFuelCapacity;
  final double quantumTravelRange;
  // final Map<String, double> portToPortRange;
  final List<Map<String, dynamic>> pilotHardpoints;
  final List<Map<String, dynamic>> weapons;
  final List<Map<String, dynamic>> missiles;
  final List<Map<String, dynamic>> missileRack;
  final List<Map<String, dynamic>> mannedTurrets;
  final List<Map<String, dynamic>> remoteTurrets;

  Ship({
    required this.className,
    required this.name,
    required this.description,
    required this.career,
    required this.role,
    required this.size,
    required this.cargo,
    required this.crew,
    required this.weaponCrew,
    required this.operationsCrew,
    required this.mass,
    required this.isSpaceship,
    required this.manufacturer,
    required this.hullHP,
    required this.scmSpeed,
    required this.maxSpeed,
    required this.fuelCapacity,
    required this.fuelUsage,
    required this.thrustCapacity,
    required this.quantumTravelSpeed,
    required this.quantumTravelFuelCapacity,
    required this.quantumTravelRange,
    required this.pilotHardpoints,
    required this.weapons,
    required this.missiles,
    required this.missileRack,
    required this.mannedTurrets,
    required this.remoteTurrets,
  });
  // final List<Map<String, dynamic>> missiles;
  // final String buyLocation;
  // final String cost;

  // factory TestShip.fromJson(Map<String, dynamic> json) =>
  //     _$TestShipFromJson(json);

  // Map<String, dynamic> toJson() => _$TestShipToJson(this);

  Ship copyWith({
    String? className,
    String? name,
    String? description,
    String? career,
    String? role,
    int? size,
    double? cargo,
    int? crew,
    int? weaponCrew,
    int? operationsCrew,
    double? mass,
    bool? isSpaceship,
    String? manufacturer,
    Map<String, double>? hullHP,
    double? scmSpeed,
    double? maxSpeed,
    double? fuelCapacity,
    Map<String, double>? fuelUsage,
    Map<String, double>? thrustCapacity,
    double? quantumTravelSpeed,
    double? quantumTravelFuelCapacity,
    double? quantumTravelRange,
    List<Map<String, dynamic>>? pilotHardpoints,
    List<Map<String, dynamic>>? weapons,
    List<Map<String, dynamic>>? missiles,
    List<Map<String, dynamic>>? missileRack,
    List<Map<String, dynamic>>? mannedTurrets,
    List<Map<String, dynamic>>? remoteTurrets,
  }) {
    return Ship(
      className: className ?? this.className,
      name: name ?? this.name,
      description: description ?? this.description,
      career: career ?? this.career,
      role: role ?? this.role,
      size: size ?? this.size,
      cargo: cargo ?? this.cargo,
      crew: crew ?? this.crew,
      weaponCrew: weaponCrew ?? this.weaponCrew,
      operationsCrew: operationsCrew ?? this.operationsCrew,
      mass: mass ?? this.mass,
      isSpaceship: isSpaceship ?? this.isSpaceship,
      manufacturer: manufacturer ?? this.manufacturer,
      hullHP: hullHP ?? this.hullHP,
      scmSpeed: scmSpeed ?? this.scmSpeed,
      maxSpeed: maxSpeed ?? this.maxSpeed,
      fuelCapacity: fuelCapacity ?? this.fuelCapacity,
      fuelUsage: fuelUsage ?? this.fuelUsage,
      thrustCapacity: thrustCapacity ?? this.thrustCapacity,
      quantumTravelSpeed: quantumTravelSpeed ?? this.quantumTravelSpeed,
      quantumTravelFuelCapacity:
          quantumTravelFuelCapacity ?? this.quantumTravelFuelCapacity,
      quantumTravelRange: quantumTravelRange ?? this.quantumTravelRange,
      pilotHardpoints: pilotHardpoints ?? this.pilotHardpoints,
      weapons: weapons ?? this.weapons,
      missiles: missiles ?? this.missiles,
      missileRack: missileRack ?? this.missileRack,
      mannedTurrets: mannedTurrets ?? this.mannedTurrets,
      remoteTurrets: remoteTurrets ?? this.remoteTurrets,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'className': className,
      'name': name,
      'description': description,
      'career': career,
      'role': role,
      'size': size,
      'cargo': cargo,
      'crew': crew,
      'weaponCrew': weaponCrew,
      'operationsCrew': operationsCrew,
      'mass': mass,
      'isSpaceship': isSpaceship,
      'manufacturer': manufacturer,
      'hullHP': hullHP,
      'scmSpeed': scmSpeed,
      'maxSpeed': maxSpeed,
      'fuelCapacity': fuelCapacity,
      'fuelUsage': fuelUsage,
      'thrustCapacity': thrustCapacity,
      'quantumTravelSpeed': quantumTravelSpeed,
      'quantumTravelFuelCapacity': quantumTravelFuelCapacity,
      'quantumTravelRange': quantumTravelRange,
      'pilotHardpoints': pilotHardpoints,
      'weapons': weapons,
      'missiles': missiles,
      'missileRack': missileRack,
      'mannedTurrets': mannedTurrets,
      'remoteTurrets': remoteTurrets,
    };
  }

  List<Map<String, dynamic>> getPilotHardpoints(
      List<Map<String, dynamic>> hardPoints) {
    List<Map<String, dynamic>> pilotHardPoints = [];
    hardPoints.forEach((element) {
      if (element['Loadout'].contains('Gimbal')) {
        pilotHardpoints.add({
          'gimbal': true,
          'size': element['Size'],
        });
      } else {
        pilotHardpoints.add({'gimbal': false, 'size': element['Size']});
      }
    });
    return pilotHardPoints;
  }

  factory Ship.fromMap(
      Map<String, dynamic> shipFileJson, Map<String, dynamic> shipPortsFile) {
    return Ship(
      className: shipFileJson['ClassName'],
      name: shipFileJson['Name'],
      description: shipFileJson['Description'],
      career: shipFileJson['Career'],
      role: shipFileJson['Role'],
      size: shipFileJson['Size'],
      cargo: shipFileJson['Cargo'],
      crew: shipFileJson['Crew'],
      weaponCrew: shipFileJson['WeaponCrew'],
      operationsCrew: shipFileJson['OperationsCrew'],
      mass: shipFileJson['Mass'],
      isSpaceship: shipFileJson['IsSpaceship'],
      manufacturer: shipFileJson['Manufacturer']['Name'],
      hullHP: Map<String, double>.from(shipFileJson['DamageBeforeDestruction']),
      scmSpeed: shipFileJson['FlightCharacteristics']['ScmSpeed'],
      maxSpeed: shipFileJson['FlightCharacteristics']['MaxSpeed'],
      fuelCapacity: shipFileJson['Populsion']['FuelCapacity'],
      fuelUsage:
          Map<String, double>.from(shipFileJson['Propulsion']['FuelUsage']),
      thrustCapacity: Map<String, double>.from(
          shipFileJson['Propulsion']['ThrustCapacity']),
      quantumTravelSpeed: shipFileJson['QuantumTravel']['Speed'],
      quantumTravelFuelCapacity: shipFileJson['QuantumTravel']['FuelCapacity'],
      quantumTravelRange: shipFileJson['QuantumTravel']['Range'],
      pilotHardpoints: List<Map<String, dynamic>>.from(
          shipPortsFile['PilotHardpoints']?.map((x) {
        if (x['Loadout'].contains('Gimbal')) {
          return {
            'gimbal': true,
            'size': x['Size'],
          };
        } else {
          return {'gimbal': false, 'size': x['Size']};
        }
      })).toList(),
      weapons: List<Map<String, dynamic>>.from(
          shipPortsFile['PilotHardpoints']?.map((x) {
        if (x['Loadout'].contains('Gimbal')) {
          return {'ClassName': x['Ports'][0]['Loadout']};
        } else {
          return {'ClassName': x['Loadout']};
        }
      })).toList(),
      missiles: List<Map<String, dynamic>>.from(
          shipFileJson['MissileRacks']?.map((x) {
        return x['Ports'].map((y) {
          return {'ClassName': y['Loadout']};
        }).toList();
      })).toList(),
      missileRack: List<Map<String, dynamic>>.from(
          shipPortsFile['MissileRacks']?.map((x) {
        return {'ClassName': x['Loadout']};
      })).toList(),
      mannedTurrets: List<Map<String, dynamic>>.from(
          shipFileJson['mannedTurrets']?.map((x) => x)),
      remoteTurrets: List<Map<String, dynamic>>.from(
          shipFileJson['remoteTurrets']?.map((x) => x)),
    );
  }

  String toJson() => json.encode(toMap());

  factory Ship.fromJson(String shipFileSource, String shipPortFileSource) =>
      Ship.fromMap(
          json.decode(shipFileSource), json.decode(shipPortFileSource));

  @override
  String toString() {
    return 'TestShip(className: $className, name: $name, description: $description, career: $career, role: $role, size: $size, cargo: $cargo, crew: $crew, weaponCrew: $weaponCrew, operationsCrew: $operationsCrew, mass: $mass, isSpaceship: $isSpaceship, manufacturer: $manufacturer, hullHP: $hullHP, scmSpeed: $scmSpeed, maxSpeed: $maxSpeed, fuelCapacity: $fuelCapacity, fuelUsage: $fuelUsage, thrustCapacity: $thrustCapacity, quantumTravelSpeed: $quantumTravelSpeed, quantumTravelFuelCapacity: $quantumTravelFuelCapacity, quantumTravelRange: $quantumTravelRange, pilotHardpoints: $pilotHardpoints, weapons: $weapons, missiles: $missiles, mannedTurrets: $mannedTurrets, remoteTurrets: $remoteTurrets)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final collectionEquals = const DeepCollectionEquality().equals;

    return other is Ship &&
        other.className == className &&
        other.name == name &&
        other.description == description &&
        other.career == career &&
        other.role == role &&
        other.size == size &&
        other.cargo == cargo &&
        other.crew == crew &&
        other.weaponCrew == weaponCrew &&
        other.operationsCrew == operationsCrew &&
        other.mass == mass &&
        other.isSpaceship == isSpaceship &&
        other.manufacturer == manufacturer &&
        collectionEquals(other.hullHP, hullHP) &&
        other.scmSpeed == scmSpeed &&
        other.maxSpeed == maxSpeed &&
        other.fuelCapacity == fuelCapacity &&
        collectionEquals(other.fuelUsage, fuelUsage) &&
        collectionEquals(other.thrustCapacity, thrustCapacity) &&
        other.quantumTravelSpeed == quantumTravelSpeed &&
        other.quantumTravelFuelCapacity == quantumTravelFuelCapacity &&
        other.quantumTravelRange == quantumTravelRange &&
        collectionEquals(other.pilotHardpoints, pilotHardpoints) &&
        collectionEquals(other.weapons, weapons) &&
        collectionEquals(other.missiles, missiles) &&
        collectionEquals(other.mannedTurrets, mannedTurrets) &&
        collectionEquals(other.remoteTurrets, remoteTurrets);
  }

  @override
  int get hashCode {
    return className.hashCode ^
        name.hashCode ^
        description.hashCode ^
        career.hashCode ^
        role.hashCode ^
        size.hashCode ^
        cargo.hashCode ^
        crew.hashCode ^
        weaponCrew.hashCode ^
        operationsCrew.hashCode ^
        mass.hashCode ^
        isSpaceship.hashCode ^
        manufacturer.hashCode ^
        hullHP.hashCode ^
        scmSpeed.hashCode ^
        maxSpeed.hashCode ^
        fuelCapacity.hashCode ^
        fuelUsage.hashCode ^
        thrustCapacity.hashCode ^
        quantumTravelSpeed.hashCode ^
        quantumTravelFuelCapacity.hashCode ^
        quantumTravelRange.hashCode ^
        pilotHardpoints.hashCode ^
        weapons.hashCode ^
        missiles.hashCode ^
        mannedTurrets.hashCode ^
        remoteTurrets.hashCode;
  }
}

// class Ship {
//   final String name;
//   final String description;
//   final String career;
//   final String role;
//   final int shipSize;
//   final double cargo;
//   final int crew;
//   final int weaponCrew;
//   final int operationsCrew;
//   final double mass;
//   final bool isSpaceship;
//   final String manufacturer;
//   final Map<String, double> hullHP;
//   // final String dimensions;
//   final double speed;
//   final double afterburnerSpeed;
//   // final String movement;
//   final double hydrogenCapacity;
//   final Map<String, double> thrustCapacity;
//   final Map<String, double> fuelUsage;
//   final double qtFuelCapacity;
//   final double qtFuelRange;
//   final double qtSpeed;
//   // final Map<String, double> portToPortRange;
//   final List<Map<String, dynamic>> pilotHardpoints;
//   final List<Map<String, dynamic>> weapons;
//   final List<Map<String, dynamic>> mannedTurrets;
//   final List<Map<String, dynamic>> remoteTurrets;
//   final List<Map<String, dynamic>> missiles;
//   // final String buyLocation;
//   // final String cost;

//   Ship({
//     required this.pilotHardpoints,
//     required this.qtSpeed,
//     required this.thrustCapacity,
//     required this.fuelUsage,
//     required this.qtFuelRange,
//     // required this.portToPortRange,
//     required this.missiles,
//     required this.weapons,
//     required this.mannedTurrets,
//     required this.remoteTurrets,
//     required this.cargo,
//     required this.crew,
//     required this.weaponCrew,
//     required this.operationsCrew,
//     required this.isSpaceship,
//     required this.manufacturer,
//     // required this.cost,
//     required this.name,
//     required this.description,
//     required this.role,
//     required this.career,
//     required this.shipSize,
//     required this.mass,
//     required this.hullHP,
//     // required this.dimensions,
//     required this.speed,
//     required this.afterburnerSpeed,
//     // required this.movement,
//     required this.hydrogenCapacity,
//     required this.qtFuelCapacity,
//     // required this.buyLocation
//   });

//   factory Ship.fromJson(Map<String, dynamic> json) {
//     return Ship(
//       name: json['Name'],
//       description: json['Description'],
//       career: json['Career'],
//       role: json['Role'],
//       shipSize: json['Size'],
//       cargo: json['Cargo'],
//       crew: json['Crew'],
//       operationsCrew: json['OperationsCrew'],
//       weaponCrew: json['WeaponsCrew'],
//       mass: json['Mass'],
//       manufacturer: json['Manufacturer']['Name'],
//       hullHP: json['DamageBeforeDestruction']['Body'],
//       // dimensions: json[''],
//       speed: json['FlightCharacteristics']['ScmSpeed'],
//       afterburnerSpeed: json['FlightCharacteristics']['MaxSpeed'],
//       // movement: json[''],
//       hydrogenCapacity: json['Propulsion']['FuelCapacity'],
//       fuelUsage: json['Propulsion']['FuelUsage'],
//       thrustCapacity: json['Propulsion']['ThrustCapacity'],
//       qtFuelCapacity: json['QuantumTravel']['Fuelcapacity'],
//       qtFuelRange: json['QuantumTravel']['Range'],
//       qtSpeed: json['QuantumTravel']['Speed'],
//       pilotHardpoints: json['PilotHardpoints'],
//       // buyLocation: json[''],
//       // cost: '',
//       isSpaceship: json['IsSpaceship'],
//       mannedTurrets: json['MannedTurrets'],
//       remoteTurrets: json['RemoteTurrets'],
//       weapons: json[''],
//       missiles: json[''],
//       // portToPortRange: json[''],
//     );
//   }

//   Map<String, dynamic> toJson(Ship ship) {
//     return {
//       'role': ship.role,
//       'career': ship.career,
//       'shipSize': ship.shipSize,
//       'hullHP': ship.hullHP,
//       // 'dimensions': ship.dimensions,
//       'mass': ship.mass,
//       'speed': ship.speed,
//       'afterburnerSpeed': ship.afterburnerSpeed,
//       // 'movement': ship.movement,
//       'hydrogenCapacity': ship.hydrogenCapacity,
//       'qtFuelCapacity': ship.qtFuelCapacity,
//       // 'buyLocation': ship.buyLocation
//     };
//   }
// }
