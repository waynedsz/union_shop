import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/product.dart';
import 'package:union_shop/reusable_content/product_card.dart';

class HomeProductShowcase extends StatelessWidget {
  const HomeProductShowcase({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          const Text(
            'PRODUCTS SECTION',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 48),
          LayoutBuilder(
            builder: (context, constraints) {
              final maxWidth = constraints.maxWidth;
              int crossAxisCount;
              if (maxWidth >= 900) {
                crossAxisCount = 3;
              } else if (maxWidth >= 600) {
                crossAxisCount = 2;
              } else {
                crossAxisCount = 1;
              }

              return GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 24,
                mainAxisSpacing: 48,
                children: products
                    .map(
                      (product) => ProductCard(
                        title: product.name,
                        price: '£${product.price.toStringAsFixed(2)}',
                        imageUrl: product.imagePath,
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
