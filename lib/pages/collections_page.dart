import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/footer.dart';
import 'package:union_shop/reusable_content/collection_widgets/collection_tile.dart';
import 'package:union_shop/reusable_content/product_widgets/product_data.dart';
import 'package:union_shop/reusable_content/header.dart';
import 'package:union_shop/reusable_content/home_screen_widgets/navigation_controller.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  int _calculateColumns(double width) {
    if (width < 360) return 1;
    if (width < 700) return 2;
    if (width < 1100) return 3;
    return 4;
  }

  double _calculateAspectRatio(double width, int columns) {
    final tileWidth = width / columns;
    final tileHeight = tileWidth * 1.15;
    return tileWidth / tileHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Collections',
        onNavigateHome: () => navigateToHome(context),
        onSearchPressed: () => Navigator.pushNamed(context, '/search'),
        onAboutPressed: () => Navigator.pushNamed(context, '/about'),
        onLoginPressed: () => Navigator.pushNamed(context, '/login'),
        onCartPressed: () => Navigator.pushNamed(context, '/cart'),
        onPrintShackPressed: () => Navigator.pushNamed(context, '/print-shack'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final columns = _calculateColumns(width);
          final aspectRatio = _calculateAspectRatio(width, columns);

          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        "Browse Our Collections",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Explore curated groups of products to quickly find styles and items that fit what you're looking for.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 20),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: columns,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: aspectRatio,
                        ),
                        itemCount: collectionProducts.keys.length,
                        itemBuilder: (context, index) {
                          final label = collectionProducts.keys.toList()[index];
                          return CollectionTile(
                            label: label,
                            onTap: () => _open(context, label),
                          );
                        },
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
                const Footer(),
              ],
            ),
          );
        },
      ),
    );
  }

  void _open(BuildContext context, String label) {
    Navigator.pushNamed(
      context,
      '/collection',
      arguments: {
        'label': label,
        'products': collectionProducts[label],
      },
    );
  }
}
