import 'package:ecommerce_new/data/models/product.g.dart';
import 'package:ecommerce_new/data/services/wishlist_services.dart';


class WishlistRepository {
  final WishlistService _wishlistService = WishlistService();

  Future<void> addProductToWishlist(Product product) async {
    _wishlistService.addProductToWishlist(product);
  }

  Future<List<Product>> fetchWishlist() async {
    return _wishlistService.fetchWishlist();
  }
}
