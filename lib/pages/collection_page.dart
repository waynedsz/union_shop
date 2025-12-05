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
          return normalizeDate(b).compareTo(normalizeDate(a));
        case 'Oldest First':
          return normalizeDate(a).compareTo(normalizeDate(b));
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
        onAboutPressed: () => Navigator.pushNamed(context, '/about'),
        onLoginPressed: () => Navigator.pushNamed(context, '/login'),
        onCartPressed: () => Navigator.pushNamed(context, '/cart'),
        onPrintShackPressed: () => Navigator.pushNamed(context, '/print-shack'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;

          final horizontalPadding = width < 380
              ? 8.0
              : width < 650
                  ? 12.0
                  : width < 900
                      ? 16.0
                      : 24.0;

          final columns = width < 360 ? 1 : 2;

          return Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: const Text(
                  'Browse a curated selection of products.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: DropdownButtonFormField<String>(
                  value: _selectedSort,
                  decoration: InputDecoration(
                    labelText: 'Sort',
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
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
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding, vertical: 10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.70,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: ProductTile(
                          product: product,
                          onTap: () {
                            Navigator.pushNamed(context, '/product',
                                arguments: product);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Footer(),
            ],
          );
        },
      ),
    );
  }
}
