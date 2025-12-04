import 'package:flutter/material.dart';
import 'package:union_shop/widgets/footer.dart';

class CollectionsPage extends StatefulWidget {
  const CollectionsPage({super.key});

  @override
  State<CollectionsPage> createState() => _CollectionsPageState();
}

class _CollectionsPageState extends State<CollectionsPage> {
  String _selectedSort = 'Featured';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collections'),
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
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
              Center(
                child: DropdownButton<String>(
                  value: _selectedSort,
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      _selectedSort = value;
                    });
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 'Featured',
                      child: Text('Sort collections: Featured'),
                    ),
                    DropdownMenuItem(
                      value: 'Price: Low to High',
                      child: Text('Sort collections: Price (Low to High)'),
                    ),
                    DropdownMenuItem(
                      value: 'Price: High to Low',
                      child: Text('Sort collections: Price (High to Low)'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Browse Our Collections",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  padding: const EdgeInsets.only(top: 8),
                  children: const [
                    _CollectionTile(label: 'Hoodies'),
                    _CollectionTile(label: 'T-Shirts'),
                    _CollectionTile(label: 'Accessories'),
                    _CollectionTile(label: 'New Arrivals'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CollectionTile extends StatelessWidget {
  final String label;

  const _CollectionTile({required this.label});

  void _openCollection(BuildContext context) {
    Navigator.pushNamed(context, '/collection');
  }

  String _imageForLabel() {
    switch (label) {
      case 'Hoodies':
        return 'assets/images/collections/hoodies.png';
      case 'T-Shirts':
        return 'assets/images/collections/tshirts.png';
      case 'Accessories':
        return 'assets/images/collections/accessories.png';
      case 'New Arrivals':
        return 'assets/images/collections/new_arrivals.png';
      default:
        return 'assets/images/collections/default.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openCollection(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                _imageForLabel(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              label,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
