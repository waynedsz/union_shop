import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/footer.dart';
import 'package:union_shop/reusable_content/product.dart';
import 'package:union_shop/reusable_content/product_detail.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void placeholderCallbackForButtons() {}

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final Product? product = args?['product'] as Product?;

    final Product safeProduct = product ??
        Product(
          name: 'Product',
          price: 0.0,
          description:
              'Product is part of our premium range and features high-quality materials for everyday use.',
          imagePath: 'assets/images/placeholder.png',
        );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductDetail(
                    product: safeProduct,
                    onAddToCart: () {},
                  ),
                ],
              ),
            ),
          ),
          const Footer(),
        ],
      ),
    );
  }
}
