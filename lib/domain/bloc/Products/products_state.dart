part of 'products_bloc.dart';

@immutable
sealed class ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsFetched extends ProductsState {
  final List<Product> products;
  ProductsFetched({required this.products});
}

final class ProductsError extends ProductsState {
  final String message;
  ProductsError({required this.message});
}

