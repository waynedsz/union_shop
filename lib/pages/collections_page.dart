import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/footer.dart';
import 'package:union_shop/reusable_content/collection_widgets/collection_tile.dart';
import 'package:union_shop/reusable_content/product_widgets/product_data.dart';
import 'package:union_shop/reusable_content/header.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
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

          final horizontalPadding = width < 500
              ? 16.0
              : width < 900
                  ? 32.0
                  : 48.0;

          final columns = width < 380
              ? 1
              : width < 650
                  ? 2
                  : width < 1000
                      ? 3
                      : 4;

          final maxGridWidth = width < 600 ? width : 1000.0;

          return SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxGridWidth),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 24),
                      const Text(
                        "Browse Our Collections",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Explore curated groups of products to quickly find styles and items that fit what you're looking for.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 28),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: collectionProducts.keys.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: columns,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.95,
                        ),
                        itemBuilder: (context, index) {
                          final label = collectionProducts.keys.toList()[index];
                          return CollectionTile(
                            label: label,
                            onTap: () => _open(context, label),
                          );
                        },
                      ),
                      const SizedBox(height: 32),
                      const Footer(),
                    ],
                  ),
                ),
              ),
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
      arguments: {'label': label, 'products': collectionProducts[label]},
    );
  }
}
