import 'dart:convert';

class HeatConnection {
  final double temperatureToIR;
  final double overpowerHeat;
  final double overclockThresholdMinHeat;
  final double overclockThresholdMaxHeat;
  final double thermalEnergyBase;
  final double thermalEnergyDraw;
  final double thermalConductivity;
  final double specificHeatCapacity;
  final double thermalMass;
  final double surfaceArea;
  final double startCoolingTemperature;
  final double maxCoolingRate;
  final double maxTemperature;
  final double overheatTemperature;
  final double recoveryTemperature;
  final double minTemperature;
  final double misfireMinTemperature;
  final double misfireMaxTemperature;
  HeatConnection({
    required this.temperatureToIR,
    required this.overpowerHeat,
    required this.overclockThresholdMinHeat,
    required this.overclockThresholdMaxHeat,
    required this.thermalEnergyBase,
    required this.thermalEnergyDraw,
    required this.thermalConductivity,
    required this.specificHeatCapacity,
    required this.thermalMass,
    required this.surfaceArea,
    required this.startCoolingTemperature,
    required this.maxCoolingRate,
    required this.maxTemperature,
    required this.overheatTemperature,
    required this.recoveryTemperature,
    required this.minTemperature,
    required this.misfireMinTemperature,
    required this.misfireMaxTemperature,
  });

  Map<String, dynamic> toMap() {
    return {
      'temperatureToIR': temperatureToIR,
      'overpowerHeat': overpowerHeat,
      'overclockThresholdMinHeat': overclockThresholdMinHeat,
      'overclockThresholdMaxHeat': overclockThresholdMaxHeat,
      'thermalEnergyBase': thermalEnergyBase,
      'thermalEnergyDraw': thermalEnergyDraw,
      'thermalConductivity': thermalConductivity,
      'specificHeatCapacity': specificHeatCapacity,
      'mass': thermalMass,
      'surfaceArea': surfaceArea,
      'startCoolingTemperature': startCoolingTemperature,
      'maxCoolingRate': maxCoolingRate,
      'maxTemperature': maxTemperature,
      'overheatTemperature': overheatTemperature,
      'recoveryTemperature': recoveryTemperature,
      'minTemperature': minTemperature,
      'misfireMinTemperature': misfireMinTemperature,
      'misfireMaxTemperature': misfireMaxTemperature,
    };
  }

  factory HeatConnection.fromMap(Map<String, dynamic> map) {
    return HeatConnection(
      temperatureToIR: map['temperatureToIR'],
      overpowerHeat: map['overpowerHeat'],
      overclockThresholdMinHeat: map['overclockThresholdMinHeat'],
      overclockThresholdMaxHeat: map['overclockThresholdMaxHeat'],
      thermalEnergyBase: map['thermalEnergyBase'],
      thermalEnergyDraw: map['thermalEnergyDraw'],
      thermalConductivity: map['thermalConductivity'],
      specificHeatCapacity: map['specificHeatCapacity'],
      thermalMass: map['mass'],
      surfaceArea: map['surfaceArea'],
      startCoolingTemperature: map['startCoolingTemperature'],
      maxCoolingRate: map['maxCoolingRate'],
      maxTemperature: map['maxTemperature'],
      overheatTemperature: map['overheatTemperature'],
      recoveryTemperature: map['recoveryTemperature'],
      minTemperature: map['minTemperature'],
      misfireMinTemperature: map['misfireMinTemperature'],
      misfireMaxTemperature: map['misfireMaxTemperature'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HeatConnection.fromJson(String source) => HeatConnection.fromMap(json.decode(source));
}
