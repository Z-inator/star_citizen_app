import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cooler.g.dart';

@JsonSerializable()
class Cooler {
  final String name;
  final String manufacturer;
  final String type;
  final double size;
  final String grade;
  final double coolingRate;
  final double suppressionIRFactor;
  final double suppressionHeatFactor;
  final double powerDrawRequestTime;
  final double powerBase;
  final double powerDraw;
  final double powerToEM;
  final double decayRateOfEM;
  final double thermalEnergyBase;
  final double thermalEnergyDraw;
  final double temperatureToIR;
  final double thermalConductivity;
  final double specificHeatCapacity;
  final double thermalMass;
  final double surfaceArea;
  final double startCoolingTemperature;
  final double overheatTemperature;
  final double maxTemperature;
  final double recoveryTemperature;
  final double overpowerPerformance;
  final double overpowerHeat;
  final double overclockPerformance;
  final double overclockThresholdMin;
  final double overclockThresholdMax;
  final double overclockThresholdMinHeat;
  final double overclockThresholdMaxHeat;
  final double health;
  final double distortionDecayRate;
  final double maxDistortionDMG;
  final double distortionOverloadRatio;
  final double distortionRecoveryRatio;
  final double distortionRecoveryTime;
  final double basePrice;

  Cooler({
    required this.name,
    required this.manufacturer,
    required this.type,
    required this.size,
    required this.grade,
    required this.coolingRate,
    required this.suppressionIRFactor,
    required this.suppressionHeatFactor,
    required this.powerDrawRequestTime,
    required this.powerBase,
    required this.powerDraw,
    required this.powerToEM,
    required this.decayRateOfEM,
    required this.thermalEnergyBase,
    required this.thermalEnergyDraw,
    required this.temperatureToIR,
    required this.thermalConductivity,
    required this.specificHeatCapacity,
    required this.thermalMass,
    required this.surfaceArea,
    required this.startCoolingTemperature,
    required this.overheatTemperature,
    required this.maxTemperature,
    required this.recoveryTemperature,
    required this.overpowerPerformance,
    required this.overpowerHeat,
    required this.overclockPerformance,
    required this.overclockThresholdMin,
    required this.overclockThresholdMax,
    required this.overclockThresholdMinHeat,
    required this.overclockThresholdMaxHeat,
    required this.health,
    required this.distortionDecayRate,
    required this.maxDistortionDMG,
    required this.distortionOverloadRatio,
    required this.distortionRecoveryRatio,
    required this.distortionRecoveryTime,
    required this.basePrice,
  });

  Cooler copyWith({
    String? name,
    String? manufacturer,
    String? type,
    double? size,
    String? grade,
    double? coolingRate,
    double? suppressionIRFactor,
    double? suppressionHeatFactor,
    double? powerDrawRequestTime,
    double? powerBase,
    double? powerDraw,
    double? powerToEM,
    double? decayRateOfEM,
    double? thermalEnergyBase,
    double? thermalEnergyDraw,
    double? temperatureToIR,
    double? thermalConductivity,
    double? specificHeatCapacity,
    double? thermalMass,
    double? surfaceArea,
    double? startCoolingTemperature,
    double? overheatTemperature,
    double? maxTemperature,
    double? recoveryTemperature,
    double? overpowerPerformance,
    double? overpowerHeat,
    double? overclockPerformance,
    double? overclockThresholdMin,
    double? overclockThresholdMax,
    double? overclockThresholdMinHeat,
    double? overclockThresholdMaxHeat,
    double? health,
    double? distortionDecayRate,
    double? maxDistortionDMG,
    double? distortionOverloadRatio,
    double? distortionRecoveryRatio,
    double? distortionRecoveryTime,
    double? basePrice,
  }) {
    return Cooler(
      name: name ?? this.name,
      manufacturer: manufacturer ?? this.manufacturer,
      type: type ?? this.type,
      size: size ?? this.size,
      grade: grade ?? this.grade,
      coolingRate: coolingRate ?? this.coolingRate,
      suppressionIRFactor: suppressionIRFactor ?? this.suppressionIRFactor,
      suppressionHeatFactor:
          suppressionHeatFactor ?? this.suppressionHeatFactor,
      powerDrawRequestTime: powerDrawRequestTime ?? this.powerDrawRequestTime,
      powerBase: powerBase ?? this.powerBase,
      powerDraw: powerDraw ?? this.powerDraw,
      powerToEM: powerToEM ?? this.powerToEM,
      decayRateOfEM: decayRateOfEM ?? this.decayRateOfEM,
      thermalEnergyBase: thermalEnergyBase ?? this.thermalEnergyBase,
      thermalEnergyDraw: thermalEnergyDraw ?? this.thermalEnergyDraw,
      temperatureToIR: temperatureToIR ?? this.temperatureToIR,
      thermalConductivity: thermalConductivity ?? this.thermalConductivity,
      specificHeatCapacity: specificHeatCapacity ?? this.specificHeatCapacity,
      thermalMass: thermalMass ?? this.thermalMass,
      surfaceArea: surfaceArea ?? this.surfaceArea,
      startCoolingTemperature:
          startCoolingTemperature ?? this.startCoolingTemperature,
      overheatTemperature: overheatTemperature ?? this.overheatTemperature,
      maxTemperature: maxTemperature ?? this.maxTemperature,
      recoveryTemperature: recoveryTemperature ?? this.recoveryTemperature,
      overpowerPerformance: overpowerPerformance ?? this.overpowerPerformance,
      overpowerHeat: overpowerHeat ?? this.overpowerHeat,
      overclockPerformance: overclockPerformance ?? this.overclockPerformance,
      overclockThresholdMin:
          overclockThresholdMin ?? this.overclockThresholdMin,
      overclockThresholdMax:
          overclockThresholdMax ?? this.overclockThresholdMax,
      overclockThresholdMinHeat:
          overclockThresholdMinHeat ?? this.overclockThresholdMinHeat,
      overclockThresholdMaxHeat:
          overclockThresholdMaxHeat ?? this.overclockThresholdMaxHeat,
      health: health ?? this.health,
      distortionDecayRate: distortionDecayRate ?? this.distortionDecayRate,
      maxDistortionDMG: maxDistortionDMG ?? this.maxDistortionDMG,
      distortionOverloadRatio:
          distortionOverloadRatio ?? this.distortionOverloadRatio,
      distortionRecoveryRatio:
          distortionRecoveryRatio ?? this.distortionRecoveryRatio,
      distortionRecoveryTime:
          distortionRecoveryTime ?? this.distortionRecoveryTime,
      basePrice: basePrice ?? this.basePrice,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'manufacturer': manufacturer,
      'type': type,
      'size': size,
      'grade': grade,
      'coolingRate': coolingRate,
      'suppressionIRFactor': suppressionIRFactor,
      'suppressionHeatFactor': suppressionHeatFactor,
      'powerDrawRequestTime': powerDrawRequestTime,
      'powerBase': powerBase,
      'powerDraw': powerDraw,
      'powerToEM': powerToEM,
      'decayRateOfEM': decayRateOfEM,
      'thermalEnergyBase': thermalEnergyBase,
      'thermalEnergyDraw': thermalEnergyDraw,
      'temperatureToIR': temperatureToIR,
      'thermalConductivity': thermalConductivity,
      'specificHeatCapacity': specificHeatCapacity,
      'thermalMass': thermalMass,
      'surfaceArea': surfaceArea,
      'startCoolingTemperature': startCoolingTemperature,
      'overheatTemperature': overheatTemperature,
      'maxTemperature': maxTemperature,
      'recoveryTemperature': recoveryTemperature,
      'overpowerPerformance': overpowerPerformance,
      'overpowerHeat': overpowerHeat,
      'overclockPerformance': overclockPerformance,
      'overclockThresholdMin': overclockThresholdMin,
      'overclockThresholdMax': overclockThresholdMax,
      'overclockThresholdMinHeat': overclockThresholdMinHeat,
      'overclockThresholdMaxHeat': overclockThresholdMaxHeat,
      'health': health,
      'distortionDecayRate': distortionDecayRate,
      'maxDistortionDMG': maxDistortionDMG,
      'distortionOverloadRatio': distortionOverloadRatio,
      'distortionRecoveryRatio': distortionRecoveryRatio,
      'distortionRecoveryTime': distortionRecoveryTime,
      'basePrice': basePrice,
    };
  }

  factory Cooler.fromMap(Map<String, dynamic> map) {
    return Cooler(
      name: map['name'],
      manufacturer: map['manufacturer'],
      type: map['type'],
      size: map['size'],
      grade: map['grade'],
      coolingRate: map['coolingRate'],
      suppressionIRFactor: map['suppressionIRFactor'],
      suppressionHeatFactor: map['suppressionHeatFactor'],
      powerDrawRequestTime: map['powerDrawRequestTime'],
      powerBase: map['powerBase'],
      powerDraw: map['powerDraw'],
      powerToEM: map['powerToEM'],
      decayRateOfEM: map['decayRateOfEM'],
      thermalEnergyBase: map['thermalEnergyBase'],
      thermalEnergyDraw: map['thermalEnergyDraw'],
      temperatureToIR: map['temperatureToIR'],
      thermalConductivity: map['thermalConductivity'],
      specificHeatCapacity: map['specificHeatCapacity'],
      thermalMass: map['thermalMass'],
      surfaceArea: map['surfaceArea'],
      startCoolingTemperature: map['startCoolingTemperature'],
      overheatTemperature: map['overheatTemperature'],
      maxTemperature: map['maxTemperature'],
      recoveryTemperature: map['recoveryTemperature'],
      overpowerPerformance: map['overpowerPerformance'],
      overpowerHeat: map['overpowerHeat'],
      overclockPerformance: map['overclockPerformance'],
      overclockThresholdMin: map['overclockThresholdMin'],
      overclockThresholdMax: map['overclockThresholdMax'],
      overclockThresholdMinHeat: map['overclockThresholdMinHeat'],
      overclockThresholdMaxHeat: map['overclockThresholdMaxHeat'],
      health: map['health'],
      distortionDecayRate: map['distortionDecayRate'],
      maxDistortionDMG: map['maxDistortionDMG'],
      distortionOverloadRatio: map['distortionOverloadRatio'],
      distortionRecoveryRatio: map['distortionRecoveryRatio'],
      distortionRecoveryTime: map['distortionRecoveryTime'],
      basePrice: map['basePrice'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Cooler.fromJson(String source) => Cooler.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Cooler(name: $name, manufacturer: $manufacturer, type: $type, size: $size, grade: $grade, coolingRate: $coolingRate, suppressionIRFactor: $suppressionIRFactor, suppressionHeatFactor: $suppressionHeatFactor, powerDrawRequestTime: $powerDrawRequestTime, powerBase: $powerBase, powerDraw: $powerDraw, powerToEM: $powerToEM, decayRateOfEM: $decayRateOfEM, thermalEnergyBase: $thermalEnergyBase, thermalEnergyDraw: $thermalEnergyDraw, temperatureToIR: $temperatureToIR, thermalConductivity: $thermalConductivity, specificHeatCapacity: $specificHeatCapacity, thermalMass: $thermalMass, surfaceArea: $surfaceArea, startCoolingTemperature: $startCoolingTemperature, overheatTemperature: $overheatTemperature, maxTemperature: $maxTemperature, recoveryTemperature: $recoveryTemperature, overpowerPerformance: $overpowerPerformance, overpowerHeat: $overpowerHeat, overclockPerformance: $overclockPerformance, overclockThresholdMin: $overclockThresholdMin, overclockThresholdMax: $overclockThresholdMax, overclockThresholdMinHeat: $overclockThresholdMinHeat, overclockThresholdMaxHeat: $overclockThresholdMaxHeat, health: $health, distortionDecayRate: $distortionDecayRate, maxDistortionDMG: $maxDistortionDMG, distortionOverloadRatio: $distortionOverloadRatio, distortionRecoveryRatio: $distortionRecoveryRatio, distortionRecoveryTime: $distortionRecoveryTime, basePrice: $basePrice)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Cooler &&
        other.name == name &&
        other.manufacturer == manufacturer &&
        other.type == type &&
        other.size == size &&
        other.grade == grade &&
        other.coolingRate == coolingRate &&
        other.suppressionIRFactor == suppressionIRFactor &&
        other.suppressionHeatFactor == suppressionHeatFactor &&
        other.powerDrawRequestTime == powerDrawRequestTime &&
        other.powerBase == powerBase &&
        other.powerDraw == powerDraw &&
        other.powerToEM == powerToEM &&
        other.decayRateOfEM == decayRateOfEM &&
        other.thermalEnergyBase == thermalEnergyBase &&
        other.thermalEnergyDraw == thermalEnergyDraw &&
        other.temperatureToIR == temperatureToIR &&
        other.thermalConductivity == thermalConductivity &&
        other.specificHeatCapacity == specificHeatCapacity &&
        other.thermalMass == thermalMass &&
        other.surfaceArea == surfaceArea &&
        other.startCoolingTemperature == startCoolingTemperature &&
        other.overheatTemperature == overheatTemperature &&
        other.maxTemperature == maxTemperature &&
        other.recoveryTemperature == recoveryTemperature &&
        other.overpowerPerformance == overpowerPerformance &&
        other.overpowerHeat == overpowerHeat &&
        other.overclockPerformance == overclockPerformance &&
        other.overclockThresholdMin == overclockThresholdMin &&
        other.overclockThresholdMax == overclockThresholdMax &&
        other.overclockThresholdMinHeat == overclockThresholdMinHeat &&
        other.overclockThresholdMaxHeat == overclockThresholdMaxHeat &&
        other.health == health &&
        other.distortionDecayRate == distortionDecayRate &&
        other.maxDistortionDMG == maxDistortionDMG &&
        other.distortionOverloadRatio == distortionOverloadRatio &&
        other.distortionRecoveryRatio == distortionRecoveryRatio &&
        other.distortionRecoveryTime == distortionRecoveryTime &&
        other.basePrice == basePrice;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        manufacturer.hashCode ^
        type.hashCode ^
        size.hashCode ^
        grade.hashCode ^
        coolingRate.hashCode ^
        suppressionIRFactor.hashCode ^
        suppressionHeatFactor.hashCode ^
        powerDrawRequestTime.hashCode ^
        powerBase.hashCode ^
        powerDraw.hashCode ^
        powerToEM.hashCode ^
        decayRateOfEM.hashCode ^
        thermalEnergyBase.hashCode ^
        thermalEnergyDraw.hashCode ^
        temperatureToIR.hashCode ^
        thermalConductivity.hashCode ^
        specificHeatCapacity.hashCode ^
        thermalMass.hashCode ^
        surfaceArea.hashCode ^
        startCoolingTemperature.hashCode ^
        overheatTemperature.hashCode ^
        maxTemperature.hashCode ^
        recoveryTemperature.hashCode ^
        overpowerPerformance.hashCode ^
        overpowerHeat.hashCode ^
        overclockPerformance.hashCode ^
        overclockThresholdMin.hashCode ^
        overclockThresholdMax.hashCode ^
        overclockThresholdMinHeat.hashCode ^
        overclockThresholdMaxHeat.hashCode ^
        health.hashCode ^
        distortionDecayRate.hashCode ^
        maxDistortionDMG.hashCode ^
        distortionOverloadRatio.hashCode ^
        distortionRecoveryRatio.hashCode ^
        distortionRecoveryTime.hashCode ^
        basePrice.hashCode;
  }
}
