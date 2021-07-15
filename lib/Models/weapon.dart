class Weapon {
  final String name;
  final String description;
  final int size;
  final int grade;
  final String manufacturer;
  final String type;
  final double dps700;
  final double dps300;
  final double alphaDamage; // TODO: ammunition[impactDamage; physical]
  // final double explosionRadius;
  final double fireRate;
  final double range;
  final double speed;
  final int ammoCount;
  final int pelletsPerShot;
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
    required this.dps700,
    required this.dps300,
    required this.alphaDamage,
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
    return Weapon(
        name: json['stdItem']['Name'],
        description: json['stdItem']['Descriptions'],
        manufacturer: json['manufacturer'],
        size: json['size'],
        grade: json['grade'],
        type: (json['tags'] as String).split(' ')[1],
        dps700: json['stdItem']['Weapon']['Modes'][0]['DamagePerSecond']['Physical'],
        dps300: json['stdItem']['Weapon']['Modes'][0]['DamagePerSecond']['Physical'],
        alphaDamage: json['stdItem']['Weapon']['Ammunition']['ImpactDamage']['Physical'],
        fireRate: json['stdItem']['Weapon']['Modes'][0]['RoundsPerMinute'],
        range: json['stdItem']['Weapon']['Ammunition']['Speed'],
        speed: json['stdItem']['Weapon']['Ammunition']['Range'],
        ammoCount: json['stdItem']['Weapon']['Ammunition']['Capacity'],
        pelletsPerShot: json['stdItem']['Weapon']['Modes'][0]['PelletsPerShot'],
        powerBase: json['stdItem']['PowerConnection']['PowerBase'],
        powerDraw: json['stdItem']['PowerConnection']['PowerDraw'],
        maxCoolingRate: json['stdItem']['HeatConnection']['CoolingRate'],
        thermalEnergyBase: json['stdItem']['HeatConnection']['ThermalEnergyBase'],
        thermalEnergyDraw: json['stdItem']['HeatConnection']['ThermalEnergyDraw'],
        health: json['stdItem']['Durability']['Health'],);
  }
}
