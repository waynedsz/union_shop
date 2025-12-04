import 'package:flutter/material.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/data/product_data.dart';

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
                  return _ProductTile(
                    name: product['name'] ?? '',
                    imagePath: product['image'] ?? '',
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

class _ProductTile extends StatelessWidget {
  final String name;
  final String imagePath;

  const _ProductTile({
    required this.name,
    required this.imagePath,
  });

  void _openProduct(BuildContext context) {
    final routeName = '/product/${name.toLowerCase().replaceAll(' ', '-')}';
    Navigator.pushNamed(
      context,
      routeName,
      arguments: {'productName': name},
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openProduct(context),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (imagePath.isNotEmpty) ...[
              Expanded(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
            ] else ...[
              const Spacer(),
            ],
            Center(
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
