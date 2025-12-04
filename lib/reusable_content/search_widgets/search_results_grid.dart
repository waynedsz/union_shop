import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/product_widgets/product.dart';
import 'package:union_shop/reusable_content/product_widgets/product_tile.dart';

class SearchResultsGrid extends StatelessWidget {
  const SearchResultsGrid({
    super.key,
    required this.products,
    required this.onProductTap,
  });

  final List<Product> products;
  final void Function(Product product) onProductTap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductTile(
          product: product,
          onTap: () => onProductTap(product),
        );
      },
    );
  }
}
