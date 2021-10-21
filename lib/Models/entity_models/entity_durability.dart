import 'dart:convert';

import 'package:star_citizen_app/Models/entity_models/entity_damage_resistance.dart';

class Durability {
  final double health;
  final double lifetime;
  final DamageResistance physicalResistance;
  final DamageResistance energyResistance;
  final DamageResistance distortionResistance;
  final DamageResistance thermalResistance;
  final DamageResistance biochemicalResistance;
  final DamageResistance stunResistance;

  Durability({
    required this.health,
    required this.lifetime,
    required this.physicalResistance,
    required this.energyResistance,
    required this.distortionResistance,
    required this.thermalResistance,
    required this.biochemicalResistance,
    required this.stunResistance,
  });

  Map<String, dynamic> toMap() {
    return {
      'health': health,
      'lifetime': lifetime,
      'physicalResistance': physicalResistance.toMap(),
      'energyResistance': energyResistance.toMap(),
      'distortionResistance': distortionResistance.toMap(),
      'thermalResistance': thermalResistance.toMap(),
      'biochemicalResistance': biochemicalResistance.toMap(),
      'stunResistance': stunResistance.toMap(),
    };
  }

  factory Durability.fromMap(Map<String, dynamic> map) {
    return Durability(
      health: map['health'],
      lifetime: map['lifetime'],
      physicalResistance: DamageResistance.fromMap(map['physicalResistance']),
      energyResistance: DamageResistance.fromMap(map['energyResistance']),
      distortionResistance:
          DamageResistance.fromMap(map['distortionResistance']),
      thermalResistance: DamageResistance.fromMap(map['thermalResistance']),
      biochemicalResistance:
          DamageResistance.fromMap(map['biochemicalResistance']),
      stunResistance: DamageResistance.fromMap(map['stunResistance']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Durability.fromJson(String source) =>
      Durability.fromMap(json.decode(source));
}