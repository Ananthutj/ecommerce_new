import 'package:ecommerce_new/data/models/product.g.dart';
import 'package:ecommerce_new/domain/bloc/product_wishlist/product_wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {

  @override
  void initState() {
    super.initState();
    context.read<ProductWishlistBloc>().add(FetchWishListProducts(isFavorite: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<ProductWishlistBloc, ProductWishlistState>(
      builder: (context, state) {
        if (state is ProductWishListsFetched) {
          List<Product> products = state.products.toSet().toList();
          print(products.toList());
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context,index){
              final product = products[index];
              return Card(
                child: ListTile(
                  title: Text(product.name),
                ),
              );
            },
          );
        } else if (state is ProductWishlistLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductWishlistError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(
            child: Text("Something went wrong..."),
          );
        }
      },
    ));
  }
}
