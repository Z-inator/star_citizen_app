import 'dart:developer';

// import 'dart:html';

class Weapon {
  final String name;
  final String description;
  final int size;
  final int grade;
  final String manufacturer;
  final String type;
  // final double dps700;
  // final double dps300;
  final Map<String, dynamic> alphaDamage; // TODO: ammunition[impactDamage; physical]
  final Map<String, dynamic> dps;
  // final double explosionRadius;
  final double fireRate;
  final double range;
  final double speed;
  final double ammoCount;
  final double pelletsPerShot;
  // final double dpsDropPerMeter;
  // final double dpsMin;
  // final double dpsDropStartDistance;
  // final double dpsDropMaxDistance700;
  // final double dpsDropMaxDistance300;
  // final double spreadFirstAttack;
  // final double spreadAttack;
  // final double spreadMin;
  // final double spreadMax;
  // final double spreadDecay;
  // final Map<String, double> ammoDMG;
  // final double Biochemical
  // final double distortion
  // final double energy
  // final double physical
  // final double stun
  // final double thermal;
  // final double powerDrawRequestTime;
  final double powerBase;
  final double powerDraw;
  // final double powerToEM;
  // final double decayRateOfEM;
  final double maxCoolingRate;
  // final double heatPerShot;
  // final double heatRateOnline;
  final double thermalEnergyBase;
  final double thermalEnergyDraw;
  // final double temperatureToIR;
  // final double thermalConductivity;
  // final double specificHeatCapacity;
  // final double thermalMass;
  // final double surfaceArea;
  // final double startCoolingTemperature;
  // final double overheatTemperature;
  // final double maxTemperature;
  // final double revoveryTemperature;
  // final double overpowerPerformance;
  // final double overpowerDMGMultiplier;
  // final double overpowerFireRateMultiplier;
  // final double overpowerPellets;
  // final double overpowerHeat;
  // final double overclockPerformance;
  // final double overclockDMGMultiplier;
  // final double overclockFireRateMultiplier;
  // final double overclockPellets;
  // final double overclockThresholdMin;
  // final double overclockThresholdMax;
  // final double overclockThresholdMinHeat;
  // final double overclockthresholdMaxHeat;
  // final double heatDMGMultiplier;
  // final double heatFireRateMultiplier;
  // final double heatPellets;
  final double health;
  // final double distortionDecayRate;
  // final double maxDistortionDMG;
  // final double distortionOverloadRation;
  // final double distortionRecoveryRation;
  // final double distortionRecoveryTime;
  // final double basePrice;

  Weapon({
    required this.name,
    required this.description,
    required this.manufacturer,
    required this.size,
    required this.grade,
    required this.type,
    // required this.dps700,
    // required this.dps300,
    required this.alphaDamage,
    required this.dps,
    // required this.explosionRadius,
    required this.fireRate,
    required this.range,
    required this.speed,
    required this.ammoCount,
    required this.pelletsPerShot,
    // required this.dpsDropPerMeter,
    // required this.dpsMin,
    // required this.dpsDropStartDistance,
    // required this.dpsDropMaxDistance700,
    // required this.dpsDropMaxDistance300,
    // required this.spreadFirstAttack,
    // required this.spreadAttack,
    // required this.spreadMin,
    // required this.spreadMax,
    // required this.spreadDecay,
    // required this.ammoDMG,
    // required this.powerDrawRequestTime,
    required this.powerBase,
    required this.powerDraw,
    // required this.powerToEM,
    // required this.decayRateOfEM,
    required this.maxCoolingRate,
    // required this.heatPerShot,
    // required this.heatRateOnline,
    required this.thermalEnergyBase,
    required this.thermalEnergyDraw,
    // required this.temperatureToIR,
    // required this.thermalConductivity,
    // required this.specificHeatCapacity,
    // required this.thermalMass,
    // required this.surfaceArea,
    // required this.startCoolingTemperature,
    // required this.overheatTemperature,
    // required this.maxTemperature,
    // required this.revoveryTemperature,
    // required this.overpowerPerformance,
    // required this.overpowerDMGMultiplier,
    // required this.overpowerFireRateMultiplier,
    // required this.overpowerPellets,
    // required this.overpowerHeat,
    // required this.overclockPerformance,
    // required this.overclockDMGMultiplier,
    // required this.overclockFireRateMultiplier,
    // required this.overclockPellets,
    // required this.overclockThresholdMin,
    // required this.overclockThresholdMax,
    // required this.overclockThresholdMinHeat,
    // required this.overclockthresholdMaxHeat,
    // required this.heatDMGMultiplier,
    // required this.heatFireRateMultiplier,
    // required this.heatPellets,
    required this.health,
    // required this.distortionDecayRate,
    // required this.maxDistortionDMG,
    // required this.distortionOverloadRation,
    // required this.distortionRecoveryRation,
    // required this.distortionRecoveryTime,
    // required this.basePrice
  });

  factory Weapon.fromJson(Map<String, dynamic> json) {
    // cannon
    // repeater
    // scattergun
    // gatling
    // pod
    String getWeaponType(String type) {
      String? weaponType = weaponTypes[type];
      return weaponType ?? '';
    }

    String getWeaponName(String name, String type) {
      String weaponName = name;
      List<String> typeString = type.split(' ');
      for (var item in typeString) {
        weaponName = weaponName.replaceAll(item, ' ');
      }
      weaponName = weaponName.trimRight().replaceAll('  ', ' ');
      return weaponName;
    }

    String weaponType;
    if (json['classification'] == 'Ship.Weapon.Rocket') {
      List<String> classType = json['className'].split('_');
      weaponType = getWeaponType(classType[0]);
    } else {
      List<String> classType = json['className'].split('_');
      weaponType = getWeaponType(classType[1]);
    }
    String weaponName = getWeaponName(json['stdItem']['Name'], weaponType);

    if (weaponType == '') throw Exception('No Type');
    if (weaponName == '') throw Exception('No Name');

    return Weapon(
        name: weaponName,
        description: json['stdItem']['Description'],
        manufacturer: json['stdItem']['Manufacturer']['Name'],
        size: json['size'],
        grade: json['grade'],
        type: weaponType,
        // dps700: json['stdItem']['Weapon']['Modes'][0]['DamagePerSecond']['Physical'],
        // dps300: json['stdItem']['Weapon']['Modes'][0]['DamagePerSecond']['Physical'],
        alphaDamage: json['stdItem']['Ammunition']['ImpactDamage'],
        dps: json['stdItem']['Weapon']['Modes'][0]['DamagePerSecond'],
        fireRate: json['stdItem']['Weapon']['Modes'][0]['RoundsPerMinute'],
        range: json['stdItem']['Ammunition']['Range'] ?? 0.0,
        speed: json['stdItem']['Ammunition']['Speed'] ?? 0.0,
        ammoCount: json['stdItem']['Ammunition']['Capacity'] ?? 0.0,
        pelletsPerShot: json['stdItem']['Weapon']['Modes'][0]['PelletsPerShot'] ?? 0.0,
        powerBase: json['stdItem']['PowerConnection']['PowerBase'] ?? 0.0,
        powerDraw: json['stdItem']['PowerConnection']['PowerDraw'] ?? 0.0,
        maxCoolingRate: json['stdItem']['HeatConnection']['CoolingRate'] ?? 0.0,
        thermalEnergyBase:
            json['stdItem']['HeatConnection']['ThermalEnergyBase'] ?? 0,
        thermalEnergyDraw:
            json['stdItem']['HeatConnection']['ThermalEnergyDraw'] ?? 0,
        health: json['stdItem']['Durability']['Health'] ?? 0);
  }
}

Map<String, String> weaponTypes = {
  'PlasmaCannon': 'Plasma Cannon',
  'ScatterGun': 'Plasma Scattergun',
  'BallisticCannon': 'Ballistic Cannon',
  'BallisticGatling': 'Ballistic Gatling',
  'BallisticRepeater': 'Ballistic Repeater',
  'BallisticScatterGun': 'Ballistic Scattergun',
  'LaserCannon': 'Laser Cannon',
  'LaserRepeater': 'Laser Repeater',
  'LaserScatterGun': 'Laser Scattergun',
  'DistortionRepeater': 'Distortion Repeater',
  'DistortionCannon': 'Distortion Cannon',
  'DistortionScatterGun': 'Distortion Scattergun',
  'NeutronRepeater': 'Neutron Repeater',
  'NeutronCannon': 'Neutron Cannon',
  'TachyonCannon': 'Tachyon Cannon',
  'MassDriver': 'Mass Driver Cannon',
  'JavelinBallisticCannon': 'Ballistic Cannon',
  'RPOD': 'Rocket Pod',
};

List<String> baseTypes = [
  'Cannon',
  'Scattergun',
  'Gatling',
  'Repeater',
  'Mass Driver Cannon',
  'Rocket Pod'
];
