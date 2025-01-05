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
  bool _isDescriptionExpanded = false;

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
      floatingActionButton: FutureBuilder<bool>(
        future: _isInWishlist,
        builder: (context, snapshot) {
          final isInWishlist = snapshot.data ?? false;
          return FloatingActionButton(
            onPressed: () => _toggleWishlist(widget.product),
            backgroundColor: isInWishlist ? Colors.red : Colors.grey,
            child: Icon(isInWishlist ? Icons.favorite : Icons.favorite_border),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isDescriptionExpanded = !_isDescriptionExpanded;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          _isDescriptionExpanded
                              ? widget.product.description
                              : widget.product.description.length > 100
                                  ? '${widget.product.description.substring(0, 100)}...'
                                  : widget.product.description,
                          style: const TextStyle(fontSize: 16),
                        ),
                        if (widget.product.description.length > 100)
                          Text(
                            _isDescriptionExpanded ? 'Read Less' : 'Read More',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  const Text(
                    'Specifications',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(10),
                  Table(
                    border: TableBorder.all(color: Colors.grey),
                    children: [
                      TableRow(children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Category'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.product.category),
                        ),
                      ]),
                      TableRow(children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Price'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('\$${widget.product.price}'),
                        ),
                      ]),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
