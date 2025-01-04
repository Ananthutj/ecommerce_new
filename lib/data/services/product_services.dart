import 'dart:convert';
import 'package:flutter/services.dart';

class ProductServices {
  Future<Map<String, dynamic>> fetchProductData() async {
    try {
      final response = await rootBundle.loadString('assets/products.json');
      return json.decode(response);
    } catch (e) {
      throw Exception("Error in fetching products: $e");
    }
  }
}
