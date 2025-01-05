import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 1)
class Specification {
  @HiveField(0)
  final String color;
  @HiveField(1)
  final String batteryLife;
  @HiveField(2)
  final String connectivity;
  @HiveField(3)
  final String screen;
  @HiveField(4)
  final String camera;
  @HiveField(5)
  final String battery;
  @HiveField(6)
  final String processor;
  @HiveField(7)
  final String ram;
  @HiveField(8)
  final String storage;

  Specification({
    required this.color,
    required this.batteryLife,
    required this.connectivity,
    required this.screen,
    required this.camera,
    required this.battery,
    required this.processor,
    required this.ram,
    required this.storage,
  });

  factory Specification.fromJson(Map<String, dynamic> json) {
    return Specification(
      color: json['color'] ?? '', 
      batteryLife: json['batteryLife'] ?? '', 
      connectivity: json['connectivity'] ?? '', 
      screen: json['screen'] ?? '', 
      camera: json['camera'] ?? '', 
      battery: json['battery'] ?? '', 
      processor: json['processor'] ?? '', 
      ram: json['ram'] ?? '', 
      storage: json['storage'] ?? '',
    );
  }
}




// class Specification {
//   final String color;
//   final String batteryLife;
//   final String connectivity;
//   final String screen;
//   final String camera;
//   final String battery;
//   final String processor;
//   final String ram;
//   final String storage;

//   Specification({
//     required this.color,
//     required this.batteryLife,
//     required this.connectivity,
//     required this.screen,
//     required this.camera,
//     required this.battery,
//     required this.processor,
//     required this.ram,
//     required this.storage,
//   });

//   factory Specification.fromJson(Map<String, dynamic> json) {
//     return Specification(
//       color: json['color'] ?? '', 
//       batteryLife: json['batteryLife'] ?? '', 
//       connectivity: json['connectivity'] ?? '', 
//       screen: json['screen'] ?? '', 
//       camera: json['camera'] ?? '', 
//       battery: json['battery'] ?? '', 
//       processor: json['processor'] ?? '', 
//       ram: json['ram'] ?? '', 
//       storage: json['storage'] ?? '',
//     );
//   }
// }
