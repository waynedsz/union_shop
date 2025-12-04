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
      final Object? possible = rawArgs['collectionName'] ?? rawArgs['label'];
      collectionName = (possible is String) ? possible : 'Selected Collection';
    } else {
      collectionName = 'Selected Collection';
    }

    final products = List<Map<String, String>>.from(
      collectionProducts[collectionName] ?? [],
    );

    products.sort((a, b) {
      final nameA = (a['name'] ?? '').toLowerCase();
      final nameB = (b['name'] ?? '').toLowerCase();
      final cmp = nameA.compareTo(nameB);
      if (_selectedSort == 'Sort Z-A') return -cmp;
      return cmp;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(collectionName),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            const Text(
              'Browse a curated selection of products from this collection.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: DropdownButton<String>(
                value: _selectedSort,
                items: const [
                  DropdownMenuItem(
                    value: 'Sort A-Z',
                    child: Text('Sort A-Z'),
                  ),
                  DropdownMenuItem(
                    value: 'Sort Z-A',
                    child: Text('Sort Z-A'),
                  ),
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
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  final name = product['name'] ?? '';
                  final imagePath = product['image'] ?? '';
                  final price = product['price'] ?? '';

                  final productObj = Product(
                    name: name,
                    imagePath: imagePath,
                    price: double.tryParse(price.replaceAll('£', '')) ?? 0.0,
                    description: product['description'] ??
                        'Product is part of our premium range and features high-quality materials for everyday use.',
                  );

                  return ProductTile(
                    product: productObj,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/product',
                        arguments: {
                          'productName': productObj.name,
                          'imagePath': productObj.imagePath,
                          'price': productObj.price.toString(),
                        },
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
