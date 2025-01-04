import 'package:ecommerce_new/data/models/product.dart';
import 'package:ecommerce_new/domain/bloc/Products/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Product> allProducts = [];
  List<Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  void _fetchProducts() {
    context.read<ProductsBloc>().add(FetchProducts());
  }

  void _filterProducts(String name) {
    setState(() {
      filteredProducts = allProducts
          .where((product) =>
              product.name.toLowerCase().contains(name.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Center(
          child: TextFormField(
            onChanged: _filterProducts,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5),
                borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              contentPadding: EdgeInsets.only(top: 12),
              hintText: 'Search products...',
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
      body: BlocListener<ProductsBloc, ProductsState>(
        listener: (context, state) {
          if (state is ProductsFetched) {
            setState(() {
              allProducts = state.products;
              filteredProducts = state.products;
            });
          }
        },
        child: filteredProducts.isEmpty
            ? const Center(child: Text('No products available.'))
            : GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      MediaQuery.of(context).size.width > 600 ? 3 : 2,
                  childAspectRatio: 1,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 4.5,
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.network(
                              product.images[0],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                const Gap(5),
                                Text(
                                  '\$${product.price}',
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
