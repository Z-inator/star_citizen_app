class Ship {
  final String name;
  final String description;
  final String career;
  final String role;
  final int shipSize;
  final double cargo;
  final int crew;
  final int weaponCrew;
  final int operationsCrew;
  final double mass;
  final bool isSpaceship;
  final String manufacturer;
  final Map<String, double> hullHP;
  // final String dimensions;
  final double speed;
  final double afterburnerSpeed;
  // final String movement;
  final double hydrogenCapacity;
  final Map<String, double> thrustCapacity;
  final Map<String, double> fuelUsage;
  final double qtFuelCapacity;
  final double qtFuelRange;
  final Map<String, double> portToPortRange;
  final List<Map<String, dynamic>> weapons;
  final List<Map<String, dynamic>> mannedTurrets;
  final List<Map<String, dynamic>> remoteTurrets;
  final List<Map<String, dynamic>> missiles;
  // final String buyLocation;
  // final String cost;

  Ship({
    required this.thrustCapacity,
    required this.fuelUsage,
    required this.qtFuelRange,
    required this.portToPortRange,
    required this.missiles,
    required this.weapons,
    required this.mannedTurrets,
    required this.remoteTurrets,
    required this.cargo,
    required this.crew,
    required this.weaponCrew,
    required this.operationsCrew,
    required this.isSpaceship,
    required this.manufacturer,
    // required this.cost,
    required this.name,
    required this.description,
    required this.role,
    required this.career,
    required this.shipSize,
    required this.mass,
    required this.hullHP,
    // required this.dimensions,
    required this.speed,
    required this.afterburnerSpeed,
    // required this.movement,
    required this.hydrogenCapacity,
    required this.qtFuelCapacity,
    // required this.buyLocation
  });

  factory Ship.fromJson(Map<String, dynamic> json) {
    return Ship(
        name: json['Name'],
        description: json['Description'],
        role: json['Role'],
        career: json['Career'],
        shipSize: json['Size'],
        hullHP: json[''],
        // dimensions: json[''],
        mass: json[''],
        speed: json[''],
        afterburnerSpeed: json[''],
        // movement: json[''],
        hydrogenCapacity: json[''],
        qtFuelCapacity: json[''],
        // buyLocation: json[''],
        cargo: json[''],
        // cost: '',
        crew: json[''],
        isSpaceship: json[''],
        mannedTurrets: json[''],
        manufacturer: json[''],
        operationsCrew: json[''],
        remoteTurrets: json[''],
        weaponCrew: json[''],
        weapons: json[''],
        fuelUsage: json[''],
        missiles: json[''],
        portToPortRange: json[''],
        qtFuelRange: json[''],
        thrustCapacity: json['']);
  }

  Map<String, dynamic> toJson(Ship ship) {
    return {
      'role': ship.role,
      'career': ship.career,
      'shipSize': ship.shipSize,
      'hullHP': ship.hullHP,
      // 'dimensions': ship.dimensions,
      'mass': ship.mass,
      'speed': ship.speed,
      'afterburnerSpeed': ship.afterburnerSpeed,
      // 'movement': ship.movement,
      'hydrogenCapacity': ship.hydrogenCapacity,
      'qtFuelCapacity': ship.qtFuelCapacity,
      // 'buyLocation': ship.buyLocation
    };
  }
}
