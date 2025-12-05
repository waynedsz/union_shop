import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/product_widgets/product_data.dart';

class FeaturedCollections extends StatelessWidget {
  const FeaturedCollections({super.key});

  @override
  Widget build(BuildContext context) {
    final labels = collectionProducts.keys.take(2).toList();
    final width = MediaQuery.of(context).size.width;
    final tileWidth = width < 380 ? 150.0 : 180.0;
    final tileHeight = width < 380 ? 120.0 : 130.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Featured Collections',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: tileHeight + 50,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: labels.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final label = labels[index];
              final products = collectionProducts[label] ?? [];
              final first = products.isNotEmpty ? products.first : null;

              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/collection',
                    arguments: {
                      'label': label,
                      'products': products,
                    },
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: tileWidth,
                      height: tileHeight,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: first == null
                          ? Container(color: Colors.grey[300])
                          : Image.network(
                              first.imagePath,
                              fit: BoxFit.cover,
                            ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: tileWidth,
                      child: Text(
                        label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
