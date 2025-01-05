import 'package:hive_flutter/hive_flutter.dart';

import 'specification.g.dart';

@HiveType(typeId: 0)
class Product {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final double price;
  @HiveField(3)
  final List<String> images;
  @HiveField(4)
  final String description;
  @HiveField(5)
  final bool isFavorite;
  @HiveField(6)
  final String category;
  @HiveField(7)
  final Specification specs;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.images,
    required this.description,
    required this.isFavorite,
    required this.category,
    required this.specs,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      images: List<String>.from(json['images']),
      description: json['description'],
      isFavorite: json['isFavorite'] ?? false,
      category: json['category'],
      specs: Specification.fromJson(json['specs']),
    );
  }

  Product copyWith({
    String? id,
    String? name,
    double? price,
    List<String>? images,
    String? description,
    bool? isFavorite,
    String? category,
    Specification? specs,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      images: images ?? this.images,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
      category: category ?? this.category,
      specs: specs ?? this.specs,
    );
  }
}



// import 'package:ecommerce_new/data/models/specification.dart';

// class Product {
//   final String id;
//   final String name;
//   final double price;
//   final List<String> images;
//   final String description;
//   final bool isFavorite;
//   final String category;
//   final Specification specs;

//   Product({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.images,
//     required this.description,
//     required this.isFavorite,
//     required this.category,
//     required this.specs,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'],
//       name: json['name'],
//       price: json['price'],
//       images: List<String>.from(json['images']),
//       description: json['description'],
//       isFavorite: json['isFavorite'] ?? false,
//       category: json['category'],
//       specs: Specification.fromJson(json['specs']),
//     );
//   }

//   Product copyWith({
//     String? id,
//     String? name,
//     double? price,
//     List<String>? images,
//     String? description,
//     bool? isFavorite,
//     String? category,
//     Specification? specs,
//   }) {
//     return Product(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       price: price ?? this.price,
//       images: images ?? this.images,
//       description: description ?? this.description,
//       isFavorite: isFavorite ?? this.isFavorite,
//       category: category ?? this.category,
//       specs: specs ?? this.specs,
//     );
//   }
// }
