import 'dart:convert';
import 'dart:developer';

import 'package:collection/collection.dart';

import 'package:star_citizen_app/Models/ship_item.dart';

class Weapon {
  final ShipItem shipItem;
  final Ammunition ammunition;
  final List<FireMode> fireMode;
  Weapon(
      {required this.shipItem,
      required this.ammunition,
      required this.fireMode});

  Map<String, dynamic> toMap() {
    return {
      'shipItem': shipItem.toMap(),
      'ammunition': ammunition.toMap(),
      'fireMode': fireMode.map((x) => x.toMap()).toList(),
    };
  }

  factory Weapon.fromMap(Map<String, dynamic> map) {
    return Weapon(
      shipItem: ShipItem.fromMap(map['stdItem']),
      ammunition: Ammunition.fromMap(map['stdItem']['Ammunition']),
      fireMode: List<FireMode>.from(
          map['stdItem']['Modes']?.map((x) => FireMode.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Weapon.fromJson(String source) => Weapon.fromMap(json.decode(source));
}

class FireMode {
  final String name;
  final double roundsPerMinute;
  final double ammoPerShot;
  final double pelletsPerShot;
  final double heatPerShot;
  final PelletSpread pelletSpread;
  FireMode({
    required this.name,
    required this.roundsPerMinute,
    required this.ammoPerShot,
    required this.pelletsPerShot,
    required this.heatPerShot,
    required this.pelletSpread,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'roundsPerMinute': roundsPerMinute,
      'ammoPerShot': ammoPerShot,
      'pelletsPerShot': pelletsPerShot,
      'heatPerShot': heatPerShot,
      'pelletSpread': pelletSpread.toMap(),
    };
  }

  factory FireMode.fromMap(Map<String, dynamic> map) {
    return FireMode(
      name: map['name'],
      roundsPerMinute: map['roundsPerMinute'],
      ammoPerShot: map['ammoPerShot'],
      pelletsPerShot: map['pelletsPerShot'],
      heatPerShot: map['heatPerShot'],
      pelletSpread: PelletSpread.fromMap(map['pelletSpread']),
    );
  }

  String toJson() => json.encode(toMap());

  factory FireMode.fromJson(String source) =>
      FireMode.fromMap(json.decode(source));
}

class PelletSpread {
  final double min;
  final double max;
  final double firstAttack;
  final double attack;
  final double decay;
  PelletSpread({
    required this.min,
    required this.max,
    required this.firstAttack,
    required this.attack,
    required this.decay,
  });

  Map<String, dynamic> toMap() {
    return {
      'min': min,
      'max': max,
      'firstAttack': firstAttack,
      'attack': attack,
      'decay': decay,
    };
  }

  factory PelletSpread.fromMap(Map<String, dynamic> map) {
    return PelletSpread(
      min: map['min'],
      max: map['max'],
      firstAttack: map['firstAttack'],
      attack: map['attack'],
      decay: map['decay'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PelletSpread.fromJson(String source) =>
      PelletSpread.fromMap(json.decode(source));
}

class Ammunition {
  final double speed;
  final double range;
  final double size;
  final double capacity;
  final ImpactDamage impactDamage;
  Ammunition({
    required this.speed,
    required this.range,
    required this.size,
    required this.capacity,
    required this.impactDamage,
  });

  Map<String, dynamic> toMap() {
    return {
      'speed': speed,
      'range': range,
      'size': size,
      'capacity': capacity,
    };
  }

  factory Ammunition.fromMap(Map<String, dynamic> map) {
    return Ammunition(
      speed: map['Speed'] ?? 0,
      range: map['Range'] ?? 0,
      size: map['Size'] ?? 0,
      capacity: map['Capacity'] ?? 0,
      impactDamage: ImpactDamage.fromMap(map['ImpactDamage']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Ammunition.fromJson(String source) =>
      Ammunition.fromMap(json.decode(source));
}

class ImpactDamage {
  final double physical;
  final double energy;
  final double distortion;
  ImpactDamage({
    required this.physical,
    required this.energy,
    required this.distortion,
  });

  Map<String, dynamic> toMap() {
    return {
      'physical': physical,
      'energy': energy,
      'distortion': distortion,
    };
  }

  factory ImpactDamage.fromMap(Map<String, dynamic> map) {
    return ImpactDamage(
      physical: map['Physical'] ?? 0,
      energy: map['Energy'] ?? 0,
      distortion: map['Distortion'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImpactDamage.fromJson(String source) =>
      ImpactDamage.fromMap(json.decode(source));
}

class OverPowerStats {
  final double fireRateMultiplier;
  final double damageMultiplier;
  final double pellets;
  final double heatGenerationMultiplier;
  OverPowerStats({
    required this.fireRateMultiplier,
    required this.damageMultiplier,
    required this.pellets,
    required this.heatGenerationMultiplier,
  });

  Map<String, dynamic> toMap() {
    return {
      'fireRateMultiplier': fireRateMultiplier,
      'damageMultiplier': damageMultiplier,
      'pellets': pellets,
      'heatGenerationMultiplier': heatGenerationMultiplier,
    };
  }

  factory OverPowerStats.fromMap(Map<String, dynamic> map) {
    return OverPowerStats(
      fireRateMultiplier: map['fireRateMultiplier'],
      damageMultiplier: map['damageMultiplier'],
      pellets: map['pellets'],
      heatGenerationMultiplier: map['heatGenerationMultiplier'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OverPowerStats.fromJson(String source) =>
      OverPowerStats.fromMap(json.decode(source));
}

class OverClockStats {
  final double fireRateMultiplier;
  final double damageMultiplier;
  final double pellets;
  final double heatGenerationMultiplier;
  OverClockStats({
    required this.fireRateMultiplier,
    required this.damageMultiplier,
    required this.pellets,
    required this.heatGenerationMultiplier,
  });

  Map<String, dynamic> toMap() {
    return {
      'fireRateMultiplier': fireRateMultiplier,
      'damageMultiplier': damageMultiplier,
      'pellets': pellets,
      'heatGenerationMultiplier': heatGenerationMultiplier,
    };
  }

  factory OverClockStats.fromMap(Map<String, dynamic> map) {
    return OverClockStats(
      fireRateMultiplier: map['fireRateMultiplier'],
      damageMultiplier: map['damageMultiplier'],
      pellets: map['pellets'],
      heatGenerationMultiplier: map['heatGenerationMultiplier'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OverClockStats.fromJson(String source) =>
      OverClockStats.fromMap(json.decode(source));
}

class HeatStats {
  final double fireRateMultiplier;
  final double damageMultiplier;
  final double pellets;
  final double heatGenerationMultiplier;
  HeatStats({
    required this.fireRateMultiplier,
    required this.damageMultiplier,
    required this.pellets,
    required this.heatGenerationMultiplier,
  });

  Map<String, dynamic> toMap() {
    return {
      'fireRateMultiplier': fireRateMultiplier,
      'damageMultiplier': damageMultiplier,
      'pellets': pellets,
      'heatGenerationMultiplier': heatGenerationMultiplier,
    };
  }

  factory HeatStats.fromMap(Map<String, dynamic> map) {
    return HeatStats(
      fireRateMultiplier: map['fireRateMultiplier'],
      damageMultiplier: map['damageMultiplier'],
      pellets: map['pellets'],
      heatGenerationMultiplier: map['heatGenerationMultiplier'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HeatStats.fromJson(String source) =>
      HeatStats.fromMap(json.decode(source));
}

// class Weapon {
//   final String className;
//   final String name;
//   final String description;
//   final int size;
//   final int grade;
//   final String manufacturer;
//   final String type;
//   final double dps700;
//   final double dps300;
//   final double alphaDamage; // TODO: ammunition[impactDamage; physical]
//   final Map<String, dynamic> dps;
//   final double explosionRadius;
//   final double fireRate;
//   final double range;
//   final double speed;
//   final double ammoCount;
//   final double pelletsPerShot;
//   final double dpsDropPerMeter;
//   final double dpsMin;
//   final double dpsDropStartDistance;
//   final double dpsDropMaxDistance700;
//   final double dpsDropMaxDistance300;
//   final double spreadFirstAttack;
//   final double spreadAttack;
//   final double spreadMin;
//   final double spreadMax;
//   final double spreadDecay;
//   final Map<String, double> ammoDMG;
//   final double biochemical;
//   final double distortion;
//   final double energy;
//   final double physical;
//   final double stun;
//   final double thermal;
//   final double powerDrawRequestTime;
//   final double powerBase;
//   final double powerDraw;
//   final double powerToEM;
//   final double decayRateOfEM;
//   final double maxCoolingRate;
//   final double heatPerShot;
//   final double heatRateOnline;
//   final double thermalEnergyBase;
//   final double thermalEnergyDraw;
//   final double temperatureToIR;
//   final double thermalConductivity;
//   final double specificHeatCapacity;
//   final double thermalMass;
//   final double surfaceArea;
//   final double startCoolingTemperature;
//   final double overheatTemperature;
//   final double maxTemperature;
//   final double revoveryTemperature;
//   final double overpowerPerformance;
//   final double overpowerDMGMultiplier;
//   final double overpowerFireRateMultiplier;
//   final double overpowerPellets;
//   final double overpowerHeat;
//   final double overclockPerformance;
//   final double overclockDMGMultiplier;
//   final double overclockFireRateMultiplier;
//   final double overclockPellets;
//   final double overclockThresholdMin;
//   final double overclockThresholdMax;
//   final double overclockThresholdMinHeat;
//   final double overclockthresholdMaxHeat;
//   final double heatDMGMultiplier;
//   final double heatFireRateMultiplier;
//   final double heatPellets;
//   final double health;
//   final double distortionDecayRate;
//   final double maxDistortionDMG;
//   final double distortionOverloadRation;
//   final double distortionRecoveryRation;
//   final double distortionRecoveryTime;
//   final double basePrice;
//   Weapon({
//     required this.className,
//     required this.name,
//     required this.description,
//     required this.size,
//     required this.grade,
//     required this.manufacturer,
//     required this.type,
//     required this.dps700,
//     required this.dps300,
//     required this.alphaDamage,
//     required this.dps,
//     required this.explosionRadius,
//     required this.fireRate,
//     required this.range,
//     required this.speed,
//     required this.ammoCount,
//     required this.pelletsPerShot,
//     required this.dpsDropPerMeter,
//     required this.dpsMin,
//     required this.dpsDropStartDistance,
//     required this.dpsDropMaxDistance700,
//     required this.dpsDropMaxDistance300,
//     required this.spreadFirstAttack,
//     required this.spreadAttack,
//     required this.spreadMin,
//     required this.spreadMax,
//     required this.spreadDecay,
//     required this.ammoDMG,
//     required this.biochemical,
//     required this.distortion,
//     required this.energy,
//     required this.physical,
//     required this.stun,
//     required this.thermal,
//     required this.powerDrawRequestTime,
//     required this.powerBase,
//     required this.powerDraw,
//     required this.powerToEM,
//     required this.decayRateOfEM,
//     required this.maxCoolingRate,
//     required this.heatPerShot,
//     required this.heatRateOnline,
//     required this.thermalEnergyBase,
//     required this.thermalEnergyDraw,
//     required this.temperatureToIR,
//     required this.thermalConductivity,
//     required this.specificHeatCapacity,
//     required this.thermalMass,
//     required this.surfaceArea,
//     required this.startCoolingTemperature,
//     required this.overheatTemperature,
//     required this.maxTemperature,
//     required this.revoveryTemperature,
//     required this.overpowerPerformance,
//     required this.overpowerDMGMultiplier,
//     required this.overpowerFireRateMultiplier,
//     required this.overpowerPellets,
//     required this.overpowerHeat,
//     required this.overclockPerformance,
//     required this.overclockDMGMultiplier,
//     required this.overclockFireRateMultiplier,
//     required this.overclockPellets,
//     required this.overclockThresholdMin,
//     required this.overclockThresholdMax,
//     required this.overclockThresholdMinHeat,
//     required this.overclockthresholdMaxHeat,
//     required this.heatDMGMultiplier,
//     required this.heatFireRateMultiplier,
//     required this.heatPellets,
//     required this.health,
//     required this.distortionDecayRate,
//     required this.maxDistortionDMG,
//     required this.distortionOverloadRation,
//     required this.distortionRecoveryRation,
//     required this.distortionRecoveryTime,
//     required this.basePrice,
//   });

//   // factory Weapon.fromJson(Map<String, dynamic> json) {
//   //   // cannon
//   //   // repeater
//   //   // scattergun
//   //   // gatling
//   //   // pod
//   //   String getWeaponType(String type) {
//   //     String? weaponType = weaponTypes[type];
//   //     return weaponType ?? '';
//   //   }

//   //   String getWeaponName(String name, String type) {
//   //     String weaponName = name;
//   //     List<String> typeString = type.split(' ');
//   //     for (var item in typeString) {
//   //       weaponName = weaponName.replaceAll(item, ' ');
//   //     }
//   //     weaponName = weaponName.trimRight().replaceAll('  ', ' ');
//   //     return weaponName;
//   //   }

//   //   String weaponType;
//   //   if (json['classification'] == 'Ship.Weapon.Rocket') {
//   //     List<String> classType = json['className'].split('_');
//   //     weaponType = getWeaponType(classType[0]);
//   //   } else {
//   //     List<String> classType = json['className'].split('_');
//   //     weaponType = getWeaponType(classType[1]);
//   //   }
//   //   String weaponName = getWeaponName(json['stdItem']['Name'], weaponType);

//   //   if (weaponType == '') throw Exception('No Type');
//   //   if (weaponName == '') throw Exception('No Name');

//   //   return Weapon(
//   //       className: json['className'],
//   //       name: weaponName,
//   //       description: json['stdItem']['Description'],
//   //       manufacturer: json['stdItem']['Manufacturer']['Name'],
//   //       size: json['size'],
//   //       grade: json['grade'],
//   //       type: weaponType,
//   //       // dps700: json['stdItem']['Weapon']['Modes'][0]['DamagePerSecond']['Physical'],
//   //       // dps300: json['stdItem']['Weapon']['Modes'][0]['DamagePerSecond']['Physical'],
//   //       alphaDamage: json['stdItem']['Ammunition']['ImpactDamage'],
//   //       dps: json['stdItem']['Weapon']['Modes'][0]['DamagePerSecond'],
//   //       fireRate: json['stdItem']['Weapon']['Modes'][0]['RoundsPerMinute'],
//   //       range: json['stdItem']['Ammunition']['Range'] ?? 0.0,
//   //       speed: json['stdItem']['Ammunition']['Speed'] ?? 0.0,
//   //       ammoCount: json['stdItem']['Ammunition']['Capacity'] ?? 0.0,
//   //       pelletsPerShot:
//   //           json['stdItem']['Weapon']['Modes'][0]['PelletsPerShot'] ?? 0.0,
//   //       powerBase: json['stdItem']['PowerConnection']['PowerBase'] ?? 0.0,
//   //       powerDraw: json['stdItem']['PowerConnection']['PowerDraw'] ?? 0.0,
//   //       maxCoolingRate: json['stdItem']['HeatConnection']['CoolingRate'] ?? 0.0,
//   //       thermalEnergyBase:
//   //           json['stdItem']['HeatConnection']['ThermalEnergyBase'] ?? 0,
//   //       thermalEnergyDraw:
//   //           json['stdItem']['HeatConnection']['ThermalEnergyDraw'] ?? 0,
//   //       health: json['stdItem']['Durability']['Health'] ?? 0);
//   // }

// // Map<String, String> weaponTypes = {
// //   'PlasmaCannon': 'Plasma Cannon',
// //   'ScatterGun': 'Plasma Scattergun',
// //   'BallisticCannon': 'Ballistic Cannon',
// //   'BallisticGatling': 'Ballistic Gatling',
// //   'BallisticRepeater': 'Ballistic Repeater',
// //   'BallisticScatterGun': 'Ballistic Scattergun',
// //   'LaserCannon': 'Laser Cannon',
// //   'LaserRepeater': 'Laser Repeater',
// //   'LaserScatterGun': 'Laser Scattergun',
// //   'DistortionRepeater': 'Distortion Repeater',
// //   'DistortionCannon': 'Distortion Cannon',
// //   'DistortionScatterGun': 'Distortion Scattergun',
// //   'NeutronRepeater': 'Neutron Repeater',
// //   'NeutronCannon': 'Neutron Cannon',
// //   'TachyonCannon': 'Tachyon Cannon',
// //   'MassDriver': 'Mass Driver Cannon',
// //   'JavelinBallisticCannon': 'Ballistic Cannon',
// //   'RPOD': 'Rocket Pod',
// // };

// // List<String> baseTypes = [
// //   'Cannon',
// //   'Scattergun',
// //   'Gatling',
// //   'Repeater',
// //   'Mass Driver Cannon',
// //   'Rocket Pod'
// // ];

//   Weapon copyWith({
//     String? className,
//     String? name,
//     String? description,
//     int? size,
//     int? grade,
//     String? manufacturer,
//     String? type,
//     double? dps700,
//     double? dps300,
//     double? alphaDamage,
//     Map<String, dynamic>? dps,
//     double? explosionRadius,
//     double? fireRate,
//     double? range,
//     double? speed,
//     double? ammoCount,
//     double? pelletsPerShot,
//     double? dpsDropPerMeter,
//     double? dpsMin,
//     double? dpsDropStartDistance,
//     double? dpsDropMaxDistance700,
//     double? dpsDropMaxDistance300,
//     double? spreadFirstAttack,
//     double? spreadAttack,
//     double? spreadMin,
//     double? spreadMax,
//     double? spreadDecay,
//     Map<String, double>? ammoDMG,
//     double? biochemical,
//     double? distortion,
//     double? energy,
//     double? physical,
//     double? stun,
//     double? thermal,
//     double? powerDrawRequestTime,
//     double? powerBase,
//     double? powerDraw,
//     double? powerToEM,
//     double? decayRateOfEM,
//     double? maxCoolingRate,
//     double? heatPerShot,
//     double? heatRateOnline,
//     double? thermalEnergyBase,
//     double? thermalEnergyDraw,
//     double? temperatureToIR,
//     double? thermalConductivity,
//     double? specificHeatCapacity,
//     double? thermalMass,
//     double? surfaceArea,
//     double? startCoolingTemperature,
//     double? overheatTemperature,
//     double? maxTemperature,
//     double? revoveryTemperature,
//     double? overpowerPerformance,
//     double? overpowerDMGMultiplier,
//     double? overpowerFireRateMultiplier,
//     double? overpowerPellets,
//     double? overpowerHeat,
//     double? overclockPerformance,
//     double? overclockDMGMultiplier,
//     double? overclockFireRateMultiplier,
//     double? overclockPellets,
//     double? overclockThresholdMin,
//     double? overclockThresholdMax,
//     double? overclockThresholdMinHeat,
//     double? overclockthresholdMaxHeat,
//     double? heatDMGMultiplier,
//     double? heatFireRateMultiplier,
//     double? heatPellets,
//     double? health,
//     double? distortionDecayRate,
//     double? maxDistortionDMG,
//     double? distortionOverloadRation,
//     double? distortionRecoveryRation,
//     double? distortionRecoveryTime,
//     double? basePrice,
//   }) {
//     return Weapon(
//       className: className ?? this.className,
//       name: name ?? this.name,
//       description: description ?? this.description,
//       size: size ?? this.size,
//       grade: grade ?? this.grade,
//       manufacturer: manufacturer ?? this.manufacturer,
//       type: type ?? this.type,
//       dps700: dps700 ?? this.dps700,
//       dps300: dps300 ?? this.dps300,
//       alphaDamage: alphaDamage ?? this.alphaDamage,
//       dps: dps ?? this.dps,
//       explosionRadius: explosionRadius ?? this.explosionRadius,
//       fireRate: fireRate ?? this.fireRate,
//       range: range ?? this.range,
//       speed: speed ?? this.speed,
//       ammoCount: ammoCount ?? this.ammoCount,
//       pelletsPerShot: pelletsPerShot ?? this.pelletsPerShot,
//       dpsDropPerMeter: dpsDropPerMeter ?? this.dpsDropPerMeter,
//       dpsMin: dpsMin ?? this.dpsMin,
//       dpsDropStartDistance: dpsDropStartDistance ?? this.dpsDropStartDistance,
//       dpsDropMaxDistance700:
//           dpsDropMaxDistance700 ?? this.dpsDropMaxDistance700,
//       dpsDropMaxDistance300:
//           dpsDropMaxDistance300 ?? this.dpsDropMaxDistance300,
//       spreadFirstAttack: spreadFirstAttack ?? this.spreadFirstAttack,
//       spreadAttack: spreadAttack ?? this.spreadAttack,
//       spreadMin: spreadMin ?? this.spreadMin,
//       spreadMax: spreadMax ?? this.spreadMax,
//       spreadDecay: spreadDecay ?? this.spreadDecay,
//       ammoDMG: ammoDMG ?? this.ammoDMG,
//       biochemical: biochemical ?? this.biochemical,
//       distortion: distortion ?? this.distortion,
//       energy: energy ?? this.energy,
//       physical: physical ?? this.physical,
//       stun: stun ?? this.stun,
//       thermal: thermal ?? this.thermal,
//       powerDrawRequestTime: powerDrawRequestTime ?? this.powerDrawRequestTime,
//       powerBase: powerBase ?? this.powerBase,
//       powerDraw: powerDraw ?? this.powerDraw,
//       powerToEM: powerToEM ?? this.powerToEM,
//       decayRateOfEM: decayRateOfEM ?? this.decayRateOfEM,
//       maxCoolingRate: maxCoolingRate ?? this.maxCoolingRate,
//       heatPerShot: heatPerShot ?? this.heatPerShot,
//       heatRateOnline: heatRateOnline ?? this.heatRateOnline,
//       thermalEnergyBase: thermalEnergyBase ?? this.thermalEnergyBase,
//       thermalEnergyDraw: thermalEnergyDraw ?? this.thermalEnergyDraw,
//       temperatureToIR: temperatureToIR ?? this.temperatureToIR,
//       thermalConductivity: thermalConductivity ?? this.thermalConductivity,
//       specificHeatCapacity: specificHeatCapacity ?? this.specificHeatCapacity,
//       thermalMass: thermalMass ?? this.thermalMass,
//       surfaceArea: surfaceArea ?? this.surfaceArea,
//       startCoolingTemperature:
//           startCoolingTemperature ?? this.startCoolingTemperature,
//       overheatTemperature: overheatTemperature ?? this.overheatTemperature,
//       maxTemperature: maxTemperature ?? this.maxTemperature,
//       revoveryTemperature: revoveryTemperature ?? this.revoveryTemperature,
//       overpowerPerformance: overpowerPerformance ?? this.overpowerPerformance,
//       overpowerDMGMultiplier:
//           overpowerDMGMultiplier ?? this.overpowerDMGMultiplier,
//       overpowerFireRateMultiplier:
//           overpowerFireRateMultiplier ?? this.overpowerFireRateMultiplier,
//       overpowerPellets: overpowerPellets ?? this.overpowerPellets,
//       overpowerHeat: overpowerHeat ?? this.overpowerHeat,
//       overclockPerformance: overclockPerformance ?? this.overclockPerformance,
//       overclockDMGMultiplier:
//           overclockDMGMultiplier ?? this.overclockDMGMultiplier,
//       overclockFireRateMultiplier:
//           overclockFireRateMultiplier ?? this.overclockFireRateMultiplier,
//       overclockPellets: overclockPellets ?? this.overclockPellets,
//       overclockThresholdMin:
//           overclockThresholdMin ?? this.overclockThresholdMin,
//       overclockThresholdMax:
//           overclockThresholdMax ?? this.overclockThresholdMax,
//       overclockThresholdMinHeat:
//           overclockThresholdMinHeat ?? this.overclockThresholdMinHeat,
//       overclockthresholdMaxHeat:
//           overclockthresholdMaxHeat ?? this.overclockthresholdMaxHeat,
//       heatDMGMultiplier: heatDMGMultiplier ?? this.heatDMGMultiplier,
//       heatFireRateMultiplier:
//           heatFireRateMultiplier ?? this.heatFireRateMultiplier,
//       heatPellets: heatPellets ?? this.heatPellets,
//       health: health ?? this.health,
//       distortionDecayRate: distortionDecayRate ?? this.distortionDecayRate,
//       maxDistortionDMG: maxDistortionDMG ?? this.maxDistortionDMG,
//       distortionOverloadRation:
//           distortionOverloadRation ?? this.distortionOverloadRation,
//       distortionRecoveryRation:
//           distortionRecoveryRation ?? this.distortionRecoveryRation,
//       distortionRecoveryTime:
//           distortionRecoveryTime ?? this.distortionRecoveryTime,
//       basePrice: basePrice ?? this.basePrice,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'className': className,
//       'name': name,
//       'description': description,
//       'size': size,
//       'grade': grade,
//       'manufacturer': manufacturer,
//       'type': type,
//       'dps700': dps700,
//       'dps300': dps300,
//       'alphaDamage': alphaDamage,
//       'dps': dps,
//       'explosionRadius': explosionRadius,
//       'fireRate': fireRate,
//       'range': range,
//       'speed': speed,
//       'ammoCount': ammoCount,
//       'pelletsPerShot': pelletsPerShot,
//       'dpsDropPerMeter': dpsDropPerMeter,
//       'dpsMin': dpsMin,
//       'dpsDropStartDistance': dpsDropStartDistance,
//       'dpsDropMaxDistance700': dpsDropMaxDistance700,
//       'dpsDropMaxDistance300': dpsDropMaxDistance300,
//       'spreadFirstAttack': spreadFirstAttack,
//       'spreadAttack': spreadAttack,
//       'spreadMin': spreadMin,
//       'spreadMax': spreadMax,
//       'spreadDecay': spreadDecay,
//       'ammoDMG': ammoDMG,
//       'biochemical': biochemical,
//       'distortion': distortion,
//       'energy': energy,
//       'physical': physical,
//       'stun': stun,
//       'thermal': thermal,
//       'powerDrawRequestTime': powerDrawRequestTime,
//       'powerBase': powerBase,
//       'powerDraw': powerDraw,
//       'powerToEM': powerToEM,
//       'decayRateOfEM': decayRateOfEM,
//       'maxCoolingRate': maxCoolingRate,
//       'heatPerShot': heatPerShot,
//       'heatRateOnline': heatRateOnline,
//       'thermalEnergyBase': thermalEnergyBase,
//       'thermalEnergyDraw': thermalEnergyDraw,
//       'temperatureToIR': temperatureToIR,
//       'thermalConductivity': thermalConductivity,
//       'specificHeatCapacity': specificHeatCapacity,
//       'thermalMass': thermalMass,
//       'surfaceArea': surfaceArea,
//       'startCoolingTemperature': startCoolingTemperature,
//       'overheatTemperature': overheatTemperature,
//       'maxTemperature': maxTemperature,
//       'revoveryTemperature': revoveryTemperature,
//       'overpowerPerformance': overpowerPerformance,
//       'overpowerDMGMultiplier': overpowerDMGMultiplier,
//       'overpowerFireRateMultiplier': overpowerFireRateMultiplier,
//       'overpowerPellets': overpowerPellets,
//       'overpowerHeat': overpowerHeat,
//       'overclockPerformance': overclockPerformance,
//       'overclockDMGMultiplier': overclockDMGMultiplier,
//       'overclockFireRateMultiplier': overclockFireRateMultiplier,
//       'overclockPellets': overclockPellets,
//       'overclockThresholdMin': overclockThresholdMin,
//       'overclockThresholdMax': overclockThresholdMax,
//       'overclockThresholdMinHeat': overclockThresholdMinHeat,
//       'overclockthresholdMaxHeat': overclockthresholdMaxHeat,
//       'heatDMGMultiplier': heatDMGMultiplier,
//       'heatFireRateMultiplier': heatFireRateMultiplier,
//       'heatPellets': heatPellets,
//       'health': health,
//       'distortionDecayRate': distortionDecayRate,
//       'maxDistortionDMG': maxDistortionDMG,
//       'distortionOverloadRation': distortionOverloadRation,
//       'distortionRecoveryRation': distortionRecoveryRation,
//       'distortionRecoveryTime': distortionRecoveryTime,
//       'basePrice': basePrice,
//     };
//   }

//   factory Weapon.fromMap(Map<String, dynamic> map) {
//     return Weapon(
//       className: map['className'],
//       name: map['name'],
//       description: map['description'],
//       size: map['size'],
//       grade: map['grade'],
//       manufacturer: map['manufacturer'],
//       type: map['type'],
//       dps700: map['dps700'],
//       dps300: map['dps300'],
//       alphaDamage: map['alphaDamage'],
//       dps: Map<String, dynamic>.from(map['dps']),
//       explosionRadius: map['explosionRadius'],
//       fireRate: map['fireRate'],
//       range: map['range'],
//       speed: map['speed'],
//       ammoCount: map['ammoCount'],
//       pelletsPerShot: map['pelletsPerShot'],
//       dpsDropPerMeter: map['dpsDropPerMeter'],
//       dpsMin: map['dpsMin'],
//       dpsDropStartDistance: map['dpsDropStartDistance'],
//       dpsDropMaxDistance700: map['dpsDropMaxDistance700'],
//       dpsDropMaxDistance300: map['dpsDropMaxDistance300'],
//       spreadFirstAttack: map['spreadFirstAttack'],
//       spreadAttack: map['spreadAttack'],
//       spreadMin: map['spreadMin'],
//       spreadMax: map['spreadMax'],
//       spreadDecay: map['spreadDecay'],
//       ammoDMG: Map<String, double>.from(map['ammoDMG']),
//       biochemical: map['biochemical'],
//       distortion: map['distortion'],
//       energy: map['energy'],
//       physical: map['physical'],
//       stun: map['stun'],
//       thermal: map['thermal'],
//       powerDrawRequestTime: map['powerDrawRequestTime'],
//       powerBase: map['powerBase'],
//       powerDraw: map['powerDraw'],
//       powerToEM: map['powerToEM'],
//       decayRateOfEM: map['decayRateOfEM'],
//       maxCoolingRate: map['maxCoolingRate'],
//       heatPerShot: map['heatPerShot'],
//       heatRateOnline: map['heatRateOnline'],
//       thermalEnergyBase: map['thermalEnergyBase'],
//       thermalEnergyDraw: map['thermalEnergyDraw'],
//       temperatureToIR: map['temperatureToIR'],
//       thermalConductivity: map['thermalConductivity'],
//       specificHeatCapacity: map['specificHeatCapacity'],
//       thermalMass: map['thermalMass'],
//       surfaceArea: map['surfaceArea'],
//       startCoolingTemperature: map['startCoolingTemperature'],
//       overheatTemperature: map['overheatTemperature'],
//       maxTemperature: map['maxTemperature'],
//       revoveryTemperature: map['revoveryTemperature'],
//       overpowerPerformance: map['overpowerPerformance'],
//       overpowerDMGMultiplier: map['overpowerDMGMultiplier'],
//       overpowerFireRateMultiplier: map['overpowerFireRateMultiplier'],
//       overpowerPellets: map['overpowerPellets'],
//       overpowerHeat: map['overpowerHeat'],
//       overclockPerformance: map['overclockPerformance'],
//       overclockDMGMultiplier: map['overclockDMGMultiplier'],
//       overclockFireRateMultiplier: map['overclockFireRateMultiplier'],
//       overclockPellets: map['overclockPellets'],
//       overclockThresholdMin: map['overclockThresholdMin'],
//       overclockThresholdMax: map['overclockThresholdMax'],
//       overclockThresholdMinHeat: map['overclockThresholdMinHeat'],
//       overclockthresholdMaxHeat: map['overclockthresholdMaxHeat'],
//       heatDMGMultiplier: map['heatDMGMultiplier'],
//       heatFireRateMultiplier: map['heatFireRateMultiplier'],
//       heatPellets: map['heatPellets'],
//       health: map['health'],
//       distortionDecayRate: map['distortionDecayRate'],
//       maxDistortionDMG: map['maxDistortionDMG'],
//       distortionOverloadRation: map['distortionOverloadRation'],
//       distortionRecoveryRation: map['distortionRecoveryRation'],
//       distortionRecoveryTime: map['distortionRecoveryTime'],
//       basePrice: map['basePrice'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Weapon.fromJson(String source) => Weapon.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'Weapon(className: $className, name: $name, description: $description, size: $size, grade: $grade, manufacturer: $manufacturer, type: $type, dps700: $dps700, dps300: $dps300, alphaDamage: $alphaDamage, dps: $dps, explosionRadius: $explosionRadius, fireRate: $fireRate, range: $range, speed: $speed, ammoCount: $ammoCount, pelletsPerShot: $pelletsPerShot, dpsDropPerMeter: $dpsDropPerMeter, dpsMin: $dpsMin, dpsDropStartDistance: $dpsDropStartDistance, dpsDropMaxDistance700: $dpsDropMaxDistance700, dpsDropMaxDistance300: $dpsDropMaxDistance300, spreadFirstAttack: $spreadFirstAttack, spreadAttack: $spreadAttack, spreadMin: $spreadMin, spreadMax: $spreadMax, spreadDecay: $spreadDecay, ammoDMG: $ammoDMG, biochemical: $biochemical, distortion: $distortion, energy: $energy, physical: $physical, stun: $stun, thermal: $thermal, powerDrawRequestTime: $powerDrawRequestTime, powerBase: $powerBase, powerDraw: $powerDraw, powerToEM: $powerToEM, decayRateOfEM: $decayRateOfEM, maxCoolingRate: $maxCoolingRate, heatPerShot: $heatPerShot, heatRateOnline: $heatRateOnline, thermalEnergyBase: $thermalEnergyBase, thermalEnergyDraw: $thermalEnergyDraw, temperatureToIR: $temperatureToIR, thermalConductivity: $thermalConductivity, specificHeatCapacity: $specificHeatCapacity, thermalMass: $thermalMass, surfaceArea: $surfaceArea, startCoolingTemperature: $startCoolingTemperature, overheatTemperature: $overheatTemperature, maxTemperature: $maxTemperature, revoveryTemperature: $revoveryTemperature, overpowerPerformance: $overpowerPerformance, overpowerDMGMultiplier: $overpowerDMGMultiplier, overpowerFireRateMultiplier: $overpowerFireRateMultiplier, overpowerPellets: $overpowerPellets, overpowerHeat: $overpowerHeat, overclockPerformance: $overclockPerformance, overclockDMGMultiplier: $overclockDMGMultiplier, overclockFireRateMultiplier: $overclockFireRateMultiplier, overclockPellets: $overclockPellets, overclockThresholdMin: $overclockThresholdMin, overclockThresholdMax: $overclockThresholdMax, overclockThresholdMinHeat: $overclockThresholdMinHeat, overclockthresholdMaxHeat: $overclockthresholdMaxHeat, heatDMGMultiplier: $heatDMGMultiplier, heatFireRateMultiplier: $heatFireRateMultiplier, heatPellets: $heatPellets, health: $health, distortionDecayRate: $distortionDecayRate, maxDistortionDMG: $maxDistortionDMG, distortionOverloadRation: $distortionOverloadRation, distortionRecoveryRation: $distortionRecoveryRation, distortionRecoveryTime: $distortionRecoveryTime, basePrice: $basePrice)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
//     final mapEquals = const DeepCollectionEquality().equals;

//     return other is Weapon &&
//         other.className == className &&
//         other.name == name &&
//         other.description == description &&
//         other.size == size &&
//         other.grade == grade &&
//         other.manufacturer == manufacturer &&
//         other.type == type &&
//         other.dps700 == dps700 &&
//         other.dps300 == dps300 &&
//         other.alphaDamage == alphaDamage &&
//         mapEquals(other.dps, dps) &&
//         other.explosionRadius == explosionRadius &&
//         other.fireRate == fireRate &&
//         other.range == range &&
//         other.speed == speed &&
//         other.ammoCount == ammoCount &&
//         other.pelletsPerShot == pelletsPerShot &&
//         other.dpsDropPerMeter == dpsDropPerMeter &&
//         other.dpsMin == dpsMin &&
//         other.dpsDropStartDistance == dpsDropStartDistance &&
//         other.dpsDropMaxDistance700 == dpsDropMaxDistance700 &&
//         other.dpsDropMaxDistance300 == dpsDropMaxDistance300 &&
//         other.spreadFirstAttack == spreadFirstAttack &&
//         other.spreadAttack == spreadAttack &&
//         other.spreadMin == spreadMin &&
//         other.spreadMax == spreadMax &&
//         other.spreadDecay == spreadDecay &&
//         mapEquals(other.ammoDMG, ammoDMG) &&
//         other.biochemical == biochemical &&
//         other.distortion == distortion &&
//         other.energy == energy &&
//         other.physical == physical &&
//         other.stun == stun &&
//         other.thermal == thermal &&
//         other.powerDrawRequestTime == powerDrawRequestTime &&
//         other.powerBase == powerBase &&
//         other.powerDraw == powerDraw &&
//         other.powerToEM == powerToEM &&
//         other.decayRateOfEM == decayRateOfEM &&
//         other.maxCoolingRate == maxCoolingRate &&
//         other.heatPerShot == heatPerShot &&
//         other.heatRateOnline == heatRateOnline &&
//         other.thermalEnergyBase == thermalEnergyBase &&
//         other.thermalEnergyDraw == thermalEnergyDraw &&
//         other.temperatureToIR == temperatureToIR &&
//         other.thermalConductivity == thermalConductivity &&
//         other.specificHeatCapacity == specificHeatCapacity &&
//         other.thermalMass == thermalMass &&
//         other.surfaceArea == surfaceArea &&
//         other.startCoolingTemperature == startCoolingTemperature &&
//         other.overheatTemperature == overheatTemperature &&
//         other.maxTemperature == maxTemperature &&
//         other.revoveryTemperature == revoveryTemperature &&
//         other.overpowerPerformance == overpowerPerformance &&
//         other.overpowerDMGMultiplier == overpowerDMGMultiplier &&
//         other.overpowerFireRateMultiplier == overpowerFireRateMultiplier &&
//         other.overpowerPellets == overpowerPellets &&
//         other.overpowerHeat == overpowerHeat &&
//         other.overclockPerformance == overclockPerformance &&
//         other.overclockDMGMultiplier == overclockDMGMultiplier &&
//         other.overclockFireRateMultiplier == overclockFireRateMultiplier &&
//         other.overclockPellets == overclockPellets &&
//         other.overclockThresholdMin == overclockThresholdMin &&
//         other.overclockThresholdMax == overclockThresholdMax &&
//         other.overclockThresholdMinHeat == overclockThresholdMinHeat &&
//         other.overclockthresholdMaxHeat == overclockthresholdMaxHeat &&
//         other.heatDMGMultiplier == heatDMGMultiplier &&
//         other.heatFireRateMultiplier == heatFireRateMultiplier &&
//         other.heatPellets == heatPellets &&
//         other.health == health &&
//         other.distortionDecayRate == distortionDecayRate &&
//         other.maxDistortionDMG == maxDistortionDMG &&
//         other.distortionOverloadRation == distortionOverloadRation &&
//         other.distortionRecoveryRation == distortionRecoveryRation &&
//         other.distortionRecoveryTime == distortionRecoveryTime &&
//         other.basePrice == basePrice;
//   }

//   @override
//   int get hashCode {
//     return className.hashCode ^
//         name.hashCode ^
//         description.hashCode ^
//         size.hashCode ^
//         grade.hashCode ^
//         manufacturer.hashCode ^
//         type.hashCode ^
//         dps700.hashCode ^
//         dps300.hashCode ^
//         alphaDamage.hashCode ^
//         dps.hashCode ^
//         explosionRadius.hashCode ^
//         fireRate.hashCode ^
//         range.hashCode ^
//         speed.hashCode ^
//         ammoCount.hashCode ^
//         pelletsPerShot.hashCode ^
//         dpsDropPerMeter.hashCode ^
//         dpsMin.hashCode ^
//         dpsDropStartDistance.hashCode ^
//         dpsDropMaxDistance700.hashCode ^
//         dpsDropMaxDistance300.hashCode ^
//         spreadFirstAttack.hashCode ^
//         spreadAttack.hashCode ^
//         spreadMin.hashCode ^
//         spreadMax.hashCode ^
//         spreadDecay.hashCode ^
//         ammoDMG.hashCode ^
//         biochemical.hashCode ^
//         distortion.hashCode ^
//         energy.hashCode ^
//         physical.hashCode ^
//         stun.hashCode ^
//         thermal.hashCode ^
//         powerDrawRequestTime.hashCode ^
//         powerBase.hashCode ^
//         powerDraw.hashCode ^
//         powerToEM.hashCode ^
//         decayRateOfEM.hashCode ^
//         maxCoolingRate.hashCode ^
//         heatPerShot.hashCode ^
//         heatRateOnline.hashCode ^
//         thermalEnergyBase.hashCode ^
//         thermalEnergyDraw.hashCode ^
//         temperatureToIR.hashCode ^
//         thermalConductivity.hashCode ^
//         specificHeatCapacity.hashCode ^
//         thermalMass.hashCode ^
//         surfaceArea.hashCode ^
//         startCoolingTemperature.hashCode ^
//         overheatTemperature.hashCode ^
//         maxTemperature.hashCode ^
//         revoveryTemperature.hashCode ^
//         overpowerPerformance.hashCode ^
//         overpowerDMGMultiplier.hashCode ^
//         overpowerFireRateMultiplier.hashCode ^
//         overpowerPellets.hashCode ^
//         overpowerHeat.hashCode ^
//         overclockPerformance.hashCode ^
//         overclockDMGMultiplier.hashCode ^
//         overclockFireRateMultiplier.hashCode ^
//         overclockPellets.hashCode ^
//         overclockThresholdMin.hashCode ^
//         overclockThresholdMax.hashCode ^
//         overclockThresholdMinHeat.hashCode ^
//         overclockthresholdMaxHeat.hashCode ^
//         heatDMGMultiplier.hashCode ^
//         heatFireRateMultiplier.hashCode ^
//         heatPellets.hashCode ^
//         health.hashCode ^
//         distortionDecayRate.hashCode ^
//         maxDistortionDMG.hashCode ^
//         distortionOverloadRation.hashCode ^
//         distortionRecoveryRation.hashCode ^
//         distortionRecoveryTime.hashCode ^
//         basePrice.hashCode;
//   }
// }
