
import 'package:ecommerce_new/data/models/product.g.dart';
import 'package:ecommerce_new/data/repositories/product_repo.dart';
import 'package:ecommerce_new/domain/bloc/Products/products_bloc.dart';
import 'package:ecommerce_new/domain/bloc/product_wishlist/product_wishlist_bloc.dart';
import 'package:ecommerce_new/utils/bottom_navigation.dart';
import 'package:ecommerce_new/utils/product_adapter.dart';
import 'package:ecommerce_new/utils/specification_adapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(SpecificationAdapter());
  await Hive.openBox<Product>('wishlist');
  runApp(const Ecommerce());
}

class Ecommerce extends StatelessWidget {
  const Ecommerce({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductRepository productRepository = ProductRepository();
     final Box<Product> wishlistBox = Hive.box<Product>('wishlist');
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductsBloc(productRepository)),
        BlocProvider(create: (context)=> ProductWishlistBloc(wishlistBox: wishlistBox))
      ],
      child: MaterialApp(
        title: 'ecommerce',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const BottomNavBarPage(),
      ),
    );
  }
}
