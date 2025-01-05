import 'package:ecommerce_new/data/models/product.g.dart';
import 'package:ecommerce_new/domain/bloc/Products/products_bloc.dart';
import 'package:ecommerce_new/presentation/Home/product_page.dart';
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
  String? selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    context.read<ProductsBloc>().add(FetchProducts());
  }

  void _sortByDecrease() {
    setState(() {
      filteredProducts.sort((a, b) => b.price.compareTo(a.price));
    });
  }

  void _sortByIncrease(){
    setState(() {
      filteredProducts.sort((a,b)=>a.price.compareTo(b.price));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 7,
        title: Center(
          child: TextFormField(
            onChanged: (name) => setState(() {
              filteredProducts = allProducts
                  .where((product) =>
                      product.name.toLowerCase().contains(name.toLowerCase()))
                  .toList();
            }),
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              contentPadding: EdgeInsets.only(top: 12),
              hintText: 'Search products...',
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: _sortByDecrease,
            child: const Card(
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Text('Sort'),
                    Gap(3),
                    Icon(Icons.arrow_downward),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: _sortByIncrease,
            child: const Card(
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Text('Sort'),
                    Gap(3),
                    Icon(Icons.arrow_upward),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _fetchProducts,
        child: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return Center(
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Loading...",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Gap(10),
                        CircularProgressIndicator(),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is ProductsFetched) {
              allProducts = state.products;
              filteredProducts = state.products;

              return filteredProducts.isEmpty
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
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetailsPage(product: product)));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 4.5,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                          ),
                        );
                      },
                    );
            } else if (state is ProductsError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Failed to load products.',
                      style: TextStyle(fontSize: 16),
                    ),
                    const Gap(10),
                    ElevatedButton(
                      onPressed: _fetchProducts,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text('Something went wrong.'),
              );
            }
          },
        ),
      ),
    );
  }
}
