import 'package:flutter/material.dart';
import 'package:union_shop/widgets/footer.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({Key? key}) : super(key: key);

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  String _selectedSort = 'Sort A-Z';

  @override
  Widget build(BuildContext context) {
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
            const Center(
              child: Text(
                'Selected Collection',
                textAlign: TextAlign.center,
                style: TextStyle(
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
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                padding: const EdgeInsets.all(16),
                children: const [
                  _ProductTile(name: 'Product 1'),
                  _ProductTile(name: 'Product 2'),
                  _ProductTile(name: 'Product 3'),
                  _ProductTile(name: 'Product 4'),
                ],
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

  const _ProductTile({required this.name});

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
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
