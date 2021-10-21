import 'dart:convert';

class Distortion {
  final double decayRate;
  final double maximum;
  final double overloadRatio;
  final double recoveryRatio;
  final double recoveryTime;
  Distortion({
    required this.decayRate,
    required this.maximum,
    required this.overloadRatio,
    required this.recoveryRatio,
    required this.recoveryTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'decayRate': decayRate,
      'maximum': maximum,
      'overloadRatio': overloadRatio,
      'recoveryRatio': recoveryRatio,
      'recoveryTime': recoveryTime,
    };
  }

  factory Distortion.fromMap(Map<String, dynamic> map) {
    return Distortion(
      decayRate: map['decayRate'],
      maximum: map['maximum'],
      overloadRatio: map['overloadRatio'],
      recoveryRatio: map['recoveryRatio'],
      recoveryTime: map['recoveryTime'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Distortion.fromJson(String source) => Distortion.fromMap(json.decode(source));
}
