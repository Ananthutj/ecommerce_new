class Product {
  final String id;
  final String name;
  final double price;
  final List<String> images;
  final String description;
  final bool isFavorite;
  final String category;
  final Map<String, String> specs;

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
      isFavorite: json['isFavorite'],
      category: json['category'],
      specs: Map<String, String>.from(json['specs']),
    );
  }
}
