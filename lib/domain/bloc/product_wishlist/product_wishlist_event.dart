part of 'product_wishlist_bloc.dart';

@immutable
sealed class ProductWishlistEvent {}

final class AddProductToWishList extends ProductWishlistEvent{
  final Product product;
  AddProductToWishList({required this.product});
}

final class FetchWishListProducts extends ProductWishlistEvent{
  final bool isFavorite;
  FetchWishListProducts({required this.isFavorite});
}