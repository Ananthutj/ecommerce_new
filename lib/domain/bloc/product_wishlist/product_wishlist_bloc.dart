import 'package:bloc/bloc.dart';
import 'package:ecommerce_new/data/models/product.g.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'product_wishlist_event.dart';
part 'product_wishlist_state.dart';

class ProductWishlistBloc
    extends Bloc<ProductWishlistEvent, ProductWishlistState> {
  final Box<Product> wishlistBox;

  ProductWishlistBloc({required this.wishlistBox})
      : super(ProductWishlistLoading()) {

    on<FetchWishListProducts>((event, emit) async {
      try {
        emit(ProductWishlistLoading());
        final products = wishlistBox.values.toList();
        emit(ProductWishListsFetched(products:products));
      } catch (e) {
        emit(ProductWishlistError(message: e.toString()));
      }
    });

    on<AddProductToWishList>((event, emit) async {
      try {
        wishlistBox.add(event.product);
        add(FetchWishListProducts(isFavorite: true));
      } catch (e) {
        emit(ProductWishlistError(message: e.toString()));
      }
    });
  }
}
