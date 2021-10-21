import 'dart:convert';

class PowerConnection {
  final double powerBase;
  final double powerDraw;
  final double powerDrawRequestTime;
  final double overclockThresholdMin;
  final double overclockThresholdMax;
  final double overpowerPerformance;
  final double overclockPerformance;
  final double powerToEM;
  final double decayRateOfEM;

  PowerConnection({
    required this.powerBase,
    required this.powerDraw,
    required this.powerDrawRequestTime,
    required this.overclockThresholdMin,
    required this.overclockThresholdMax,
    required this.overpowerPerformance,
    required this.overclockPerformance,
    required this.powerToEM,
    required this.decayRateOfEM,
  });

  Map<String, dynamic> toMap() {
    return {
      'powerBase': powerBase,
      'powerDraw': powerDraw,
      'powerDrawRequestTime': powerDrawRequestTime,
      'overclockThresholdMin': overclockThresholdMin,
      'overclockThresholdMax': overclockThresholdMax,
      'overpowerPerformance': overpowerPerformance,
      'overclockPerformance': overclockPerformance,
      'powerToEM': powerToEM,
      'decayRateOfEM': decayRateOfEM,
    };
  }

  factory PowerConnection.fromMap(Map<String, dynamic> map) {
    return PowerConnection(
      powerBase: map['powerBase'],
      powerDraw: map['powerDraw'],
      powerDrawRequestTime: map['powerDrawRequestTime'],
      overclockThresholdMin: map['overclockThresholdMin'],
      overclockThresholdMax: map['overclockThresholdMax'],
      overpowerPerformance: map['overpowerPerformance'],
      overclockPerformance: map['overclockPerformance'],
      powerToEM: map['powerToEM'],
      decayRateOfEM: map['decayRateOfEM'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PowerConnection.fromJson(String source) =>
      PowerConnection.fromMap(json.decode(source));
}
