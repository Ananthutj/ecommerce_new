import 'package:hive_flutter/hive_flutter.dart';
import 'package:ecommerce_new/data/models/product.g.dart';

class WishlistUtils {
  static const String wishlistBoxName = 'wishlist';

  Future<void> cacheProduct(Product product) async {
    var box = await Hive.openBox<Product>('products');
    await box.put(product.id, product);
  }

  static Future<bool> isInWishlist(Product product) async {
    var box = await Hive.openBox<Product>(wishlistBoxName);
    return box.values.any((element) => element.id == product.id);
  }

  static Future<void> addToWishlist(Product product) async {
    var box = await Hive.openBox<Product>(wishlistBoxName);
    await box.add(product);
  }

  static Future<void> removeFromWishlist(Product product) async {
    var box = await Hive.openBox<Product>(wishlistBoxName);
    final keyToRemove = box.keys.firstWhere(
        (key) => box.get(key)!.id == product.id,
        orElse: () => null);
    if (keyToRemove != null) {
      await box.delete(keyToRemove);
    }
  }

  static Future<void> toggleWishlist(Product product) async {
    if (await isInWishlist(product)) {
      await removeFromWishlist(product);
    } else {
      await addToWishlist(product);
    }
  }
}
