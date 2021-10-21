import 'dart:convert';

class DamageResistance {
  final double multiplier;
  final double threshold;
  DamageResistance({
    required this.multiplier,
    required this.threshold,
  });

  Map<String, dynamic> toMap() {
    return {
      'multiplier': multiplier,
      'threshold': threshold,
    };
  }

  factory DamageResistance.fromMap(Map<String, dynamic> map) {
    return DamageResistance(
      multiplier: map['multiplier'],
      threshold: map['threshold'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DamageResistance.fromJson(String source) =>
      DamageResistance.fromMap(json.decode(source));
}
