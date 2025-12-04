import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/footer.dart';
import 'package:union_shop/reusable_content/product_data.dart';
import 'package:union_shop/reusable_content/product_tile.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({Key? key}) : super(key: key);

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  String _selectedSort = 'Sort A-Z';

  @override
  Widget build(BuildContext context) {
    final collectionName =
        (ModalRoute.of(context)?.settings.arguments as String?) ??
            'Selected Collection';
    final products = List<Map<String, String>>.from(
      collectionProducts[collectionName] ?? [],
    );

    products.sort((a, b) {
      final nameA = (a['name'] ?? '').toLowerCase();
      final nameB = (b['name'] ?? '').toLowerCase();
      final cmp = nameA.compareTo(nameB);
      if (_selectedSort == 'Sort Z-A') {
        return -cmp;
      }
      return cmp;
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Collections'),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            const SizedBox(height: 24),
            Center(
              child: Text(
                collectionName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                'Browse a curated selection of products from this collection.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 24),
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
                  setState(() {
                    _selectedSort = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  final name = product['name'] ?? '';
                  final imagePath = product['image'] ?? '';
                  final price = product['price'] ?? '';
                  return ProductTile(
                    name: name,
                    imagePath: imagePath,
                    price: price,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/product', // ProductPage route
                        arguments: {
                          'productName': name,
                          'imagePath': imagePath,
                          'price': price,
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
