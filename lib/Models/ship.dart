class Ship {
  final String name;
  final String description;
  final String role;
  final String career;
  final String shipSize;
  final String cargo;
  final String crew;
  final String weaponCrew;
  final String operationsCrew;
  final String mass;
  final bool isSpaceship;
  final String manufacturer;
  final String hullHP;
  final String dimensions;
  final String speed;
  final String afterburnerSpeed;
  final String movement;
  final String hydrogenCapacity;
  final String qtFuelCapacity;
  final String buyLocation;
  final String cost;

  Ship(
      {required this.cargo,
      required this.crew,
      required this.weaponCrew,
      required this.operationsCrew,
      required this.isSpaceship,
      required this.manufacturer,
      required this.cost,
      required this.name,
      required this.description,
      required this.role,
      required this.career,
      required this.shipSize,
      required this.mass,
      required this.hullHP,
      required this.dimensions,
      required this.speed,
      required this.afterburnerSpeed,
      required this.movement,
      required this.hydrogenCapacity,
      required this.qtFuelCapacity,
      required this.buyLocation});

  factory Ship.fromJson(Map<String, dynamic> json) {
    return Ship(
        name: json['Name'],
        description: json['Description'],
        role: json['Role'],
        career: json['Career'],
        shipSize: json['Size'],
        hullHP: json[''],
        dimensions: json[''],
        mass: json[''],
        speed: json[''],
        afterburnerSpeed: json[''],
        movement: json[''],
        hydrogenCapacity: json[''],
        qtFuelCapacity: json[''],
        buyLocation: json['']);
  }

  Map<String, dynamic> toJson(Ship ship) {
    return {
      'role': ship.role,
      'career': ship.career,
      'shipSize': ship.shipSize,
      'hullHP': ship.hullHP,
      'dimensions': ship.dimensions,
      'mass': ship.mass,
      'speed': ship.speed,
      'afterburnerSpeed': ship.afterburnerSpeed,
      'movement': ship.movement,
      'hydrogenCapacity': ship.hydrogenCapacity,
      'qtFuelCapacity': ship.qtFuelCapacity,
      'buyLocation': ship.buyLocation
    };
  }
}
