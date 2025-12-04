import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/footer.dart';
import 'package:union_shop/reusable_content/product_data.dart';
import 'package:union_shop/reusable_content/product_tile.dart';
import 'package:union_shop/reusable_content/product.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({Key? key}) : super(key: key);

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  String _selectedSort = 'Sort A-Z';

  @override
  Widget build(BuildContext context) {
    final Object? rawArgs = ModalRoute.of(context)?.settings.arguments;

    String collectionName;

    if (rawArgs is String) {
      collectionName = rawArgs;
    } else if (rawArgs is Map) {
      final Object? value = rawArgs['collectionName'] ?? rawArgs['label'];
      collectionName = value is String ? value : 'Selected Collection';
    } else {
      collectionName = 'Selected Collection';
    }

    final List<Product> products =
        List<Product>.from(collectionProducts[collectionName] ?? []);

    products.sort((a, b) {
      final cmp = a.name.toLowerCase().compareTo(b.name.toLowerCase());
      return _selectedSort == 'Sort Z-A' ? -cmp : cmp;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(collectionName),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height -
                (Scaffold.of(context).appBarMaxHeight ?? kToolbarHeight),
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 12),
                  const Text(
                    'Browse a curated selection of products.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const SizedBox(height: 20),
                  DropdownButton<String>(
                    value: _selectedSort,
                    items: const [
                      DropdownMenuItem(
                          value: 'Sort A-Z', child: Text('Sort A-Z')),
                      DropdownMenuItem(
                          value: 'Sort Z-A', child: Text('Sort Z-A')),
                    ],
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() => _selectedSort = value);
                    },
                  ),
                  const SizedBox(height: 20),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 16,
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
                  const SizedBox(height: 20),
                  const Footer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
