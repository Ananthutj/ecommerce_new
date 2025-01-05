part of 'product_wishlist_bloc.dart';

@immutable
sealed class ProductWishlistState {}

final class ProductWishlistLoading extends ProductWishlistState {}

final class AddProductSuccess extends ProductWishlistState{
  final Product product;
  AddProductSuccess({required this.product});
}

final class ProductWishListsFetched extends ProductWishlistState{
  final List<Product> products;
  ProductWishListsFetched({required this.products});
}

final class ProductWishlistError extends ProductWishlistState{
  final String message;
  ProductWishlistError({required this.message});
}