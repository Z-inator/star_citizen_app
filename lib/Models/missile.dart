import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

part 'missile.g.dart';

@JsonSerializable()
class Missile {
  final String name;
  final String manufacturere;
  final String trackingSignal;
  final String type;
  final double size;
  final double clusterCount;
  final double damageTotal;
  final double dmgBiochemical;
  final double dmgDistortion;
  final double dmgEnergy;
  final double dmPhysical;
  final double dmgStun;
  final double dmgThermal;
  final double trackingSignalMin;
  final double trackingDistanceMax;
  final double lockTime;
  final double lockingAngle;
  final double lockRangeMin;
  final double lockRangeMax;
  final double ignitTime;
  final double speed;
  final double explosionRadiusMin;
  final double explosionRadiusMax;
  final double health;
  final double basePrice;

  Missile({
    required this.name,
    required this.manufacturere,
    required this.trackingSignal,
    required this.type,
    required this.size,
    required this.clusterCount,
    required this.damageTotal,
    required this.dmgBiochemical,
    required this.dmgDistortion,
    required this.dmgEnergy,
    required this.dmPhysical,
    required this.dmgStun,
    required this.dmgThermal,
    required this.trackingSignalMin,
    required this.trackingDistanceMax,
    required this.lockTime,
    required this.lockingAngle,
    required this.lockRangeMin,
    required this.lockRangeMax,
    required this.ignitTime,
    required this.speed,
    required this.explosionRadiusMin,
    required this.explosionRadiusMax,
    required this.health,
    required this.basePrice,
  });

  

  Missile copyWith({
    String? name,
    String? manufacturere,
    String? trackingSignal,
    String? type,
    double? size,
    double? clusterCount,
    double? damageTotal,
    double? dmgBiochemical,
    double? dmgDistortion,
    double? dmgEnergy,
    double? dmPhysical,
    double? dmgStun,
    double? dmgThermal,
    double? trackingSignalMin,
    double? trackingDistanceMax,
    double? lockTime,
    double? lockingAngle,
    double? lockRangeMin,
    double? lockRangeMax,
    double? ignitTime,
    double? speed,
    double? explosionRadiusMin,
    double? explosionRadiusMax,
    double? health,
    double? basePrice,
  }) {
    return Missile(
      name: name ?? this.name,
      manufacturere: manufacturere ?? this.manufacturere,
      trackingSignal: trackingSignal ?? this.trackingSignal,
      type: type ?? this.type,
      size: size ?? this.size,
      clusterCount: clusterCount ?? this.clusterCount,
      damageTotal: damageTotal ?? this.damageTotal,
      dmgBiochemical: dmgBiochemical ?? this.dmgBiochemical,
      dmgDistortion: dmgDistortion ?? this.dmgDistortion,
      dmgEnergy: dmgEnergy ?? this.dmgEnergy,
      dmPhysical: dmPhysical ?? this.dmPhysical,
      dmgStun: dmgStun ?? this.dmgStun,
      dmgThermal: dmgThermal ?? this.dmgThermal,
      trackingSignalMin: trackingSignalMin ?? this.trackingSignalMin,
      trackingDistanceMax: trackingDistanceMax ?? this.trackingDistanceMax,
      lockTime: lockTime ?? this.lockTime,
      lockingAngle: lockingAngle ?? this.lockingAngle,
      lockRangeMin: lockRangeMin ?? this.lockRangeMin,
      lockRangeMax: lockRangeMax ?? this.lockRangeMax,
      ignitTime: ignitTime ?? this.ignitTime,
      speed: speed ?? this.speed,
      explosionRadiusMin: explosionRadiusMin ?? this.explosionRadiusMin,
      explosionRadiusMax: explosionRadiusMax ?? this.explosionRadiusMax,
      health: health ?? this.health,
      basePrice: basePrice ?? this.basePrice,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'manufacturere': manufacturere,
      'trackingSignal': trackingSignal,
      'type': type,
      'size': size,
      'clusterCount': clusterCount,
      'damageTotal': damageTotal,
      'dmgBiochemical': dmgBiochemical,
      'dmgDistortion': dmgDistortion,
      'dmgEnergy': dmgEnergy,
      'dmPhysical': dmPhysical,
      'dmgStun': dmgStun,
      'dmgThermal': dmgThermal,
      'trackingSignalMin': trackingSignalMin,
      'trackingDistanceMax': trackingDistanceMax,
      'lockTime': lockTime,
      'lockingAngle': lockingAngle,
      'lockRangeMin': lockRangeMin,
      'lockRangeMax': lockRangeMax,
      'ignitTime': ignitTime,
      'speed': speed,
      'explosionRadiusMin': explosionRadiusMin,
      'explosionRadiusMax': explosionRadiusMax,
      'health': health,
      'basePrice': basePrice,
    };
  }

  factory Missile.fromMap(Map<String, dynamic> map) {
    return Missile(
      name: map['name'],
      manufacturere: map['manufacturere'],
      trackingSignal: map['trackingSignal'],
      type: map['type'],
      size: map['size'],
      clusterCount: map['clusterCount'],
      damageTotal: map['damageTotal'],
      dmgBiochemical: map['dmgBiochemical'],
      dmgDistortion: map['dmgDistortion'],
      dmgEnergy: map['dmgEnergy'],
      dmPhysical: map['dmPhysical'],
      dmgStun: map['dmgStun'],
      dmgThermal: map['dmgThermal'],
      trackingSignalMin: map['trackingSignalMin'],
      trackingDistanceMax: map['trackingDistanceMax'],
      lockTime: map['lockTime'],
      lockingAngle: map['lockingAngle'],
      lockRangeMin: map['lockRangeMin'],
      lockRangeMax: map['lockRangeMax'],
      ignitTime: map['ignitTime'],
      speed: map['speed'],
      explosionRadiusMin: map['explosionRadiusMin'],
      explosionRadiusMax: map['explosionRadiusMax'],
      health: map['health'],
      basePrice: map['basePrice'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Missile.fromJson(String source) => Missile.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Name(name: $name, manufacturere: $manufacturere, trackingSignal: $trackingSignal, type: $type, size: $size, clusterCount: $clusterCount, damageTotal: $damageTotal, dmgBiochemical: $dmgBiochemical, dmgDistortion: $dmgDistortion, dmgEnergy: $dmgEnergy, dmPhysical: $dmPhysical, dmgStun: $dmgStun, dmgThermal: $dmgThermal, trackingSignalMin: $trackingSignalMin, trackingDistanceMax: $trackingDistanceMax, lockTime: $lockTime, lockingAngle: $lockingAngle, lockRangeMin: $lockRangeMin, lockRangeMax: $lockRangeMax, ignitTime: $ignitTime, speed: $speed, explosionRadiusMin: $explosionRadiusMin, explosionRadiusMax: $explosionRadiusMax, health: $health, basePrice: $basePrice)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Missile &&
      other.name == name &&
      other.manufacturere == manufacturere &&
      other.trackingSignal == trackingSignal &&
      other.type == type &&
      other.size == size &&
      other.clusterCount == clusterCount &&
      other.damageTotal == damageTotal &&
      other.dmgBiochemical == dmgBiochemical &&
      other.dmgDistortion == dmgDistortion &&
      other.dmgEnergy == dmgEnergy &&
      other.dmPhysical == dmPhysical &&
      other.dmgStun == dmgStun &&
      other.dmgThermal == dmgThermal &&
      other.trackingSignalMin == trackingSignalMin &&
      other.trackingDistanceMax == trackingDistanceMax &&
      other.lockTime == lockTime &&
      other.lockingAngle == lockingAngle &&
      other.lockRangeMin == lockRangeMin &&
      other.lockRangeMax == lockRangeMax &&
      other.ignitTime == ignitTime &&
      other.speed == speed &&
      other.explosionRadiusMin == explosionRadiusMin &&
      other.explosionRadiusMax == explosionRadiusMax &&
      other.health == health &&
      other.basePrice == basePrice;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      manufacturere.hashCode ^
      trackingSignal.hashCode ^
      type.hashCode ^
      size.hashCode ^
      clusterCount.hashCode ^
      damageTotal.hashCode ^
      dmgBiochemical.hashCode ^
      dmgDistortion.hashCode ^
      dmgEnergy.hashCode ^
      dmPhysical.hashCode ^
      dmgStun.hashCode ^
      dmgThermal.hashCode ^
      trackingSignalMin.hashCode ^
      trackingDistanceMax.hashCode ^
      lockTime.hashCode ^
      lockingAngle.hashCode ^
      lockRangeMin.hashCode ^
      lockRangeMax.hashCode ^
      ignitTime.hashCode ^
      speed.hashCode ^
      explosionRadiusMin.hashCode ^
      explosionRadiusMax.hashCode ^
      health.hashCode ^
      basePrice.hashCode;
  }
}
