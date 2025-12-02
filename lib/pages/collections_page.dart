import 'package:flutter/material.dart';
import 'package:union_shop/widgets/header.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Header(
                onNavigateHome: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                },
                onSearchPressed: () {},
                onAboutPressed: () {
                  Navigator.pushNamed(context, '/about');
                },
                onLoginPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                onCartPressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
                onMenuPressed: () {
                  Navigator.pushNamed(context, '/collections');
                },
              ),
              const SizedBox(height: 32),
              const Text(
                "Collections",
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
                      child: Text('Sort by: Featured'),
                    ),
                    DropdownMenuItem(
                      value: 'Price: Low to High',
                      child: Text('Sort by: Price (Low to High)'),
                    ),
                    DropdownMenuItem(
                      value: 'Price: High to Low',
                      child: Text('Sort by: Price (High to Low)'),
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openCollection(context),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
