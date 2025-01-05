import 'package:ecommerce_new/data/models/product.g.dart';

class WishlistService {
  final List<Product> _wishlist = [];

  Future<void> addProductToWishlist(Product product) async {
    _wishlist.add(product);
  }

  Future<List<Product>> fetchWishlist() async {
    return _wishlist;
  }
}
