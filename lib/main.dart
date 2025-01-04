import 'package:ecommerce_new/data/repositories/product_repo.dart';
import 'package:ecommerce_new/domain/bloc/Products/products_bloc.dart';
import 'package:ecommerce_new/presentation/Home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const Ecommerce());
}

class Ecommerce extends StatelessWidget {
  const Ecommerce({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductRepository productRepository = ProductRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> ProductsBloc(productRepository))
      ],
      child: MaterialApp(
        title: 'ecommerce',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:const Homepage(),
      ),
    );
  }
}
