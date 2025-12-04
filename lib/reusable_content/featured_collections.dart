import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/product_data.dart';

class FeaturedCollections extends StatelessWidget {
  const FeaturedCollections({super.key});

  void _openCollection(BuildContext context, String label) {
    Navigator.pushNamed(
      context,
      '/collection',
      arguments: {
        'label': label,
        'products': collectionProducts[label],
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final labels = collectionProducts.keys.toList();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Featured Collections',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 48,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: labels.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final label = labels[index];
                return GestureDetector(
                  onTap: () => _openCollection(context, label),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        label,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
