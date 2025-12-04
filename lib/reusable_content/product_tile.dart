import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductTile({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final hasDiscount =
        product.discountPercent != null && product.discountPercent! > 0;
    final originalPriceText = '£${product.price.toStringAsFixed(2)}';
    final discountedPrice = hasDiscount
        ? product.price * (1 - product.discountPercent! / 100)
        : product.price;
    final discountedPriceText = '£${discountedPrice.toStringAsFixed(2)}';

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/product',
          arguments: product,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    product.imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Icon(
                          Icons.image_not_supported,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
                if (product.isOnSale)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'SALE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            product.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          if (!hasDiscount)
            Text(
              originalPriceText,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  originalPriceText,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  discountedPriceText,
                  style: const TextStyle(
                    color: Colors.redAccent,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
