import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/product_widgets/product.dart';

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
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final h = constraints.maxHeight;

        final imageHeight = h * 0.67;
        final nameSize = w < 150 ? 12.0 : 14.0;
        final priceSize = w < 150 ? 12.0 : 14.0;

        final hasDiscount =
            product.discountPercent != null && product.discountPercent! > 0;

        final originalPriceText = '£${product.price.toStringAsFixed(2)}';

        final discountedPrice = hasDiscount
            ? product.price * (1 - product.discountPercent! / 100)
            : product.price;

        final discountedPriceText = '£${discountedPrice.toStringAsFixed(2)}';

        return GestureDetector(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: imageHeight,
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
                        top: 6,
                        left: 6,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'SALE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: w < 150 ? 8 : 10,
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
                style: TextStyle(
                  fontSize: nameSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              if (!hasDiscount)
                Text(
                  originalPriceText,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: priceSize,
                  ),
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      originalPriceText,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: priceSize - 1,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      discountedPriceText,
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: priceSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}
