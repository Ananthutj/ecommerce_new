import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_new/data/models/product.g.dart';
import 'package:ecommerce_new/utils/add_to_wishlist.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:gap/gap.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late Future<bool> _isInWishlist;

  @override
  void initState() {
    super.initState();
    _isInWishlist = WishlistUtils.isInWishlist(widget.product);
  }

  Future<void> _toggleWishlist(Product product) async {
    await WishlistUtils.toggleWishlist(product);
    setState(() {
      _isInWishlist = WishlistUtils.isInWishlist(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              Share.share(
                'Check out this product: ${widget.product.name} for \$${widget.product.price}!',
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const Gap(10),
          Hero(
            tag: widget.product.id,
            child: CarouselSlider.builder(
              itemCount: widget.product.images.length,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height / 3,
                autoPlay: true,
                enlargeCenterPage: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayCurve: Curves.easeInOut,
                viewportFraction: 1.0,
                pageSnapping: true,
              ),
              itemBuilder: (context, index, realIndex) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    widget.product.images[index],
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                );
              },
            ),
          ),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(10),
                Text(
                  '\$${widget.product.price}',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                  ),
                ),
                const Gap(20),
                FutureBuilder<bool>(
                  future: _isInWishlist,
                  builder: (context, snapshot) {
                    final isInWishlist = snapshot.data ?? false;
                    return ElevatedButton.icon(
                      onPressed: () => _toggleWishlist(widget.product),
                      icon: Icon(isInWishlist ? Icons.favorite : Icons.favorite_border),
                      label: Text(isInWishlist ? "Remove from Wishlist" : "Add to Wishlist"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isInWishlist ? Colors.red : null,
                      ),
                    );
                  },
                ),
                const Gap(20),
                Text(
                  widget.product.description,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
