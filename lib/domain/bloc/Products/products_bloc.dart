import 'package:bloc/bloc.dart';
import 'package:ecommerce_new/data/models/product.dart';
import 'package:ecommerce_new/data/repositories/product_repo.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository productRepository;
  ProductsBloc(this.productRepository) : super(ProductsLoading()) {
    on<FetchProducts>(manageFetchProducts);
  }
  Future<void> manageFetchProducts(FetchProducts event, Emitter<ProductsState> emit) async {
    try {
      emit(ProductsLoading());
      final products = await productRepository.fetchProducts();
      emit(ProductsFetched(products: products));
    } catch (e) {
      emit(ProductsError(message: e.toString()));
    }
  }
}
