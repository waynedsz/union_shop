import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/footer.dart';
import 'package:union_shop/reusable_content/header.dart';
import 'package:union_shop/reusable_content/product_widgets/product_data.dart';
import 'package:union_shop/reusable_content/product_widgets/product_tile.dart';
import 'package:union_shop/reusable_content/product_widgets/product.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({Key? key}) : super(key: key);

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  String _selectedSort = 'Sort A-Z';

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void placeholderCallback() {}

  @override
  Widget build(BuildContext context) {
    final rawArgs = ModalRoute.of(context)?.settings.arguments;

    String collectionName;
    if (rawArgs is String) {
      collectionName = rawArgs;
    } else if (rawArgs is Map) {
      final value = rawArgs['collectionName'] ?? rawArgs['label'];
      collectionName = value is String ? value : 'Selected Collection';
    } else {
      collectionName = 'Selected Collection';
    }

    final List<Product> products =
        List<Product>.from(collectionProducts[collectionName] ?? []);

    products.sort((a, b) {
      DateTime normalizeDate(Product p) => p.safeCreatedAt;

      switch (_selectedSort) {
        case 'Sort Z-A':
          return b.name.toLowerCase().compareTo(a.name.toLowerCase());
        case 'Price: Low → High':
          return a.price.compareTo(b.price);
        case 'Price: High → Low':
          return b.price.compareTo(a.price);
        case 'Newest First':
          final aDate = normalizeDate(a);
          final bDate = normalizeDate(b);
          return bDate.compareTo(aDate);
        case 'Oldest First':
          final aDate = normalizeDate(a);
          final bDate = normalizeDate(b);
          return aDate.compareTo(bDate);
        case 'Sort A-Z':
        default:
          return a.name.toLowerCase().compareTo(b.name.toLowerCase());
      }
    });

    return Scaffold(
      appBar: Header(
        title: collectionName,
        onNavigateHome: () => navigateToHome(context),
        onSearchPressed: placeholderCallback,
        onAboutPressed: () {
          Navigator.pushNamed(context, '/about');
        },
        onLoginPressed: () {
          Navigator.pushNamed(context, '/login');
        },
        onCartPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        onPrintShackPressed: () => Navigator.pushNamed(context, '/print-shack'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final columns = width < 360 ? 1 : 2;

          return Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  const Text(
                    'Browse a curated selection of products.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: DropdownButton<String>(
                      value: _selectedSort,
                      items: const [
                        DropdownMenuItem(
                            value: 'Sort A-Z', child: Text('Sort A-Z')),
                        DropdownMenuItem(
                            value: 'Sort Z-A', child: Text('Sort Z-A')),
                        DropdownMenuItem(
                            value: 'Price: Low → High',
                            child: Text('Price: Low → High')),
                        DropdownMenuItem(
                            value: 'Price: High → Low',
                            child: Text('Price: High → Low')),
                        DropdownMenuItem(
                            value: 'Newest First', child: Text('Newest First')),
                        DropdownMenuItem(
                            value: 'Oldest First', child: Text('Oldest First')),
                      ],
                      onChanged: (value) {
                        if (value == null) return;
                        setState(() => _selectedSort = value);
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columns,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.70,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return ProductTile(
                          product: product,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/product',
                              arguments: product,
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const Footer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
