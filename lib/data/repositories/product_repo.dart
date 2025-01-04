
import 'package:ecommerce_new/data/models/product.dart';
import 'package:ecommerce_new/data/services/product_services.dart';

class ProductRepository {
  final ProductServices productService = ProductServices();

  Future<List<Product>> fetchProducts() async {
    try {
      final data = await productService.fetchProductData();
      final List<Product> products = (data['products'] as List)
          .map((item) => Product.fromJson(item))
          .toList();
      return products;
    } catch (e) {
      throw Exception("Error in fetching products: $e");
    }
  }
}