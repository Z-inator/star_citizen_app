class Ship {
  final String className;
  final String name;
  final String description;
  final String career;
  final String role;
  final int size;
  final int cargo;
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
  // final List<Map<String, dynamic>> pilotHardpoints;
  final List<Map<String, dynamic>> weapons;
  // final List<Map<String, dynamic>> missiles;
  final List<Map<String, dynamic>> missileRack;
  final List<Map<String, dynamic>> mannedTurrets;
  final List<Map<String, dynamic>> remoteTurrets;
  final List<Map<String, dynamic>> shields;
  final List<Map<String, dynamic>> powerPlants;
  final List<Map<String, dynamic>> coolers;
  final List<Map<String, dynamic>> quantumDrives;
  final List<Map<String, dynamic>> mainThrusters;
  final List<Map<String, dynamic>> retroThrusters;
  final List<Map<String, dynamic>> vtolThrusters;
  final List<Map<String, dynamic>> maneuveringThrusters;


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
    required this.weapons,
    required this.missileRack,
    required this.mannedTurrets,
    required this.remoteTurrets,
    required this.shields,
    required this.powerPlants,
    required this.coolers,
    required this.quantumDrives,
    required this.mainThrusters,
    required this.retroThrusters,
    required this.vtolThrusters,
    required this.maneuveringThrusters,
  });

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
      // 'pilotHardpoints': pilotHardpoints,
      'weapons': weapons,
      // 'missiles': missiles,
      'missileRack': missileRack,
      'mannedTurrets': mannedTurrets,
      'remoteTurrets': remoteTurrets,
      'shields': shields,
      'powerPlants': powerPlants,
      'coolers': coolers,
      'quantumDrives': quantumDrives,
      'mainThrusters': mainThrusters,
      'retroThrusters': retroThrusters,
      'vtolThrusters': vtolThrusters,
      'maneuveringThrusters': maneuveringThrusters,
    };
  }

  factory Ship.fromMap(Map<String, dynamic> shipFileJson,
      Map<String, dynamic> shipPortsFileJson) {
    List<Map<String, dynamic>> getWeapons(List pilotHardpoints) {
      List<Map<String, dynamic>> result = [];
      for (var item in pilotHardpoints) {
        try {
          if (item['InstalledItem']['Type'].contains('Turret')) {
            result.add({
              'ClassName': item['Loadout'],
              'size': item['Size'],
              'type': item['InstalledItem']['Name'],
              'powerBase': item['InstalledItem']['PowerConnection']
                  ['PowerBase'],
              'powerDraw': item['InstalledItem']['PowerConnection']
                  ['PowerDraw'],
              'thermalEnergyBase': item['InstalledItem']['HeatConnection']
                  ['ThermalEnergyBase'],
              'thermalEnergyDraw': item['InstalledItem']['HeatConnection']
                  ['ThermalEnergyDraw'],
              'coolingRate': item['InstalledItem']['HeatConnection']
                  ['CoolingRate'],
              'Weapon': List<Map<String, dynamic>>.from(
                  item['InstalledItem']['Ports']?.map((y) {
                return {'ClassName': y['Loadout']};
              }))
            });
          } else {
            result.add({
              'ClassName': item['Loadout'],
              'size': item['Size'],
              'type': 'Fixed',
            });
          }
        } catch (e) {
          continue;
        }
      }
      return result;
    }

    List<Map<String, dynamic>> getMissileRack(List missileRacks) {
      List<Map<String, dynamic>> result = [];
      for (var item in missileRacks) {
        try {
          result.add({
            'ClassName': item['Loadout'],
            'Count': item['InstalledItem']['MissileRack']['Count'],
            'MissileSize': item['InstalledItem']['MissileRack']['Size'],
            'Missile': item['InstalledItem']['Ports']?.map((y) {
              return {'ClassName': y['Loadout']};
            }).toList()
          });
        } catch (e) {
          continue;
        }
      }
      return result;
    }

    List<Map<String, dynamic>> getTurrets(List turrets) {
      List<Map<String, dynamic>> result = [];
      for (var item in turrets) {
        try {
          result.add({
            'type': item['InstalledItem']['Name'],
            'size': item['Size'],
            'powerBase': item['InstalledItem']['PowerConnection']['PowerBase'],
            'powerDraw': item['InstalledItem']['PowerConnection']['PowerDraw'],
            'thermalEnergyBase': item['InstalledItem']['HeatConnection']
                ['ThermalEnergyBase'],
            'thermalEnergyDraw': item['InstalledItem']['HeatConnection']
                ['ThermalEnergyDraw'],
            'coolingRate': item['InstalledItem']['HeatConnection']
                ['CoolingRate'],
            'turretList': List<Map<String, dynamic>>.from(
                item['InstalledItem']['Ports'].map((y) {
              return {'ClassName': y['Loadoat']};
            }))
          });
        } catch (e) {
          continue;
        }
      }
      return result;
    }

    List<Map<String, dynamic>> getShields(List shields) {
      List<Map<String, dynamic>> result = [];
      for (var item in shields) {
        try {
          result.add({'className': item['Loadout']});
        } catch (e) {
          continue;
        }
      }
      return result;
    }

    List<Map<String, dynamic>> getPowerPlants(List powerPlants) {
      List<Map<String, dynamic>> result = [];
      for (var item in powerPlants) {
        try {
          result.add({'className': item['Loadout']});
        } catch (e) {
          continue;
        }
      }
      return result;
    }

    List<Map<String, dynamic>> getCoolers(List coolers) {
      List<Map<String, dynamic>> result = [];
      for (var item in coolers) {
        try {
          result.add({'className': item['Loadout']});
        } catch (e) {
          continue;
        }
      }
      return result;
    }

    List<Map<String, dynamic>> getQuantumDrives(List quantumDrives) {
      List<Map<String, dynamic>> result = [];
      for (var item in quantumDrives) {
        try {
          result.add({'className': item['Loadout']});
        } catch (e) {
          continue;
        }
      }
      return result;
    }

    List<Map<String, dynamic>> getThrusters(List thrusters) {
      List<Map<String, dynamic>> result = [];
      for (var item in thrusters) {
        try {
          result.add({
            'className': item['Loadout'],
            'size': item['InstalledItem']['Size'],
            'thruster': item['InstalledItem']['Thruster'],
            'powerBase': item['InstalledItem']['PowerConnection']['PowerBase'],
            'powerDraw': item['InstalledItem']['PowerConnection']['PowerDraw'],
            'thermalEnergyBase': item['InstalledItem']['HeatConnection']
                ['ThermalEnergyBase'],
            'thermalEnergyDraw': item['InstalledItem']['HeatConnection']
                ['ThermalEnergyDraw'],
            'CoolingRate': item['InstalledItem']['HeatConnection']
                ['CoolingRate'],
          });
        } catch (e) {
          continue;
        }
      }
      return result;
    }

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
      fuelCapacity: shipFileJson['Propulsion']['FuelCapacity'],
      fuelUsage:
          Map<String, double>.from(shipFileJson['Propulsion']['FuelUsage']),
      thrustCapacity: Map<String, double>.from(
          shipFileJson['Propulsion']['ThrustCapacity']),
      quantumTravelSpeed: shipFileJson['QuantumTravel']['Speed'],
      quantumTravelFuelCapacity: shipFileJson['QuantumTravel']['FuelCapacity'],
      quantumTravelRange: shipFileJson['QuantumTravel']['Range'],
      weapons: getWeapons(shipPortsFileJson['PilotHardpoints']),
      missileRack: getMissileRack(shipPortsFileJson['MissileRacks']),
      mannedTurrets: getTurrets(shipPortsFileJson['MannedTurrets']),
      remoteTurrets: getTurrets(shipPortsFileJson['RemoteTurrets']),
      shields: getShields(shipPortsFileJson['Shields']),
      powerPlants: getPowerPlants(shipPortsFileJson['PowerPlants']),
      coolers: getCoolers(shipPortsFileJson['Coolers']),
      quantumDrives: getQuantumDrives(shipPortsFileJson['QuantumDrives']),
      mainThrusters: getThrusters(shipPortsFileJson['MainThrusters']),
      retroThrusters: getThrusters(shipPortsFileJson['RetroThrusters']),
      vtolThrusters: getThrusters(shipPortsFileJson['VtolThrusters']),
      maneuveringThrusters:
          getThrusters(shipPortsFileJson['ManeuveringThrusters']),
      // radars: {
      //   'className': shipPortsFileJson['Avionics'][0]['Loadout'],
      //   'size': shipPortsFileJson['Avionics'][0]['InstalledItem']['Size'],
      //   'name': shipPortsFileJson['Avionics'][0]['InstalledItem']['Name'],
      //   ''
      // }
    );
  }
}
