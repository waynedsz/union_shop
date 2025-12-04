import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/product.dart';
import 'package:union_shop/reusable_content/product_tile.dart';

class SaleGrid extends StatelessWidget {
  const SaleGrid({
    super.key,
    required this.saleProducts,
    required this.fadeAnimation,
  });

  final List<Product> saleProducts;
  final Animation<double> fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 700 ? 3 : 2;
        return GridView.builder(
          itemCount: saleProducts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            final product = saleProducts[index];
            return FadeTransition(
              opacity: fadeAnimation,
              child: ProductTile(
                product: product,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/product',
                    arguments: product,
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
