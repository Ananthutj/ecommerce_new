part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent {}

final class FetchProducts extends ProductsEvent{
  final String? name;
  FetchProducts({this.name});
}