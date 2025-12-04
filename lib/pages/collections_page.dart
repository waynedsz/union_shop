import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/footer.dart';
import 'package:union_shop/reusable_content/collection_tile.dart';

class CollectionsPage extends StatefulWidget {
  const CollectionsPage({super.key});

  @override
  State<CollectionsPage> createState() => _CollectionsPageState();
}

class _CollectionsPageState extends State<CollectionsPage> {
  void _open(BuildContext context, String label) {
    Navigator.pushNamed(
      context,
      '/collection',
      arguments: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collections'),
        automaticallyImplyLeading: true,
      ),

      // ⭐ FIX: LayoutBuilder + ConstrainedBox removes ALL pixel overflow
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Collection Items",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "Explore curated groups of products to quickly find styles and items that fit what you're looking for.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Browse Our Collections",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ⭐ Grid stays scroll-free but expands correctly
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      children: [
                        CollectionTile(
                          label: 'Hoodies',
                          onTap: () => _open(context, 'Hoodies'),
                        ),
                        CollectionTile(
                          label: 'T-Shirts',
                          onTap: () => _open(context, 'T-Shirts'),
                        ),
                        CollectionTile(
                          label: 'Accessories',
                          onTap: () => _open(context, 'Accessories'),
                        ),
                        CollectionTile(
                          label: 'New Arrivals',
                          onTap: () => _open(context, 'New Arrivals'),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    const Footer(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
