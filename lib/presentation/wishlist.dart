import 'package:ecommerce_new/data/models/product.g.dart';
import 'package:ecommerce_new/domain/bloc/product_wishlist/product_wishlist_bloc.dart';
import 'package:ecommerce_new/utils/add_to_wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  late Future<bool> isInWishlist;

  @override
  void initState() {
    super.initState();
    context
        .read<ProductWishlistBloc>()
        .add(FetchWishListProducts(isFavorite: true));
  }

  void removeFromWishlist(Product product) async {
    await WishlistUtils.removeFromWishlist(product);
    // ignore: use_build_context_synchronously
    context
        .read<ProductWishlistBloc>()
        .add(FetchWishListProducts(isFavorite: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist"),
      ),
      body: BlocBuilder<ProductWishlistBloc, ProductWishlistState>(
        builder: (context, state) {
          if (state is ProductWishListsFetched) {
            List<Product> products = state.products.toSet().toList();
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  isInWishlist = WishlistUtils.isInWishlist(product);
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Image.network(
                        product.images.isNotEmpty ? product.images[0] : '',
                        width: 50,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      title: Text(product.name),
                      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.favorite, color: Colors.red),
                        onPressed: () async {
                          removeFromWishlist(product);
                        },
                      ),
                    ),
                  );
                },
              ),
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
      ),
    );
  }
}
