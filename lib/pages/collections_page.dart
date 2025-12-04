import 'package:flutter/material.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/collection_tile.dart';

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
                  children: [
                    CollectionTile(
                      label: 'Hoodies',
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/collection',
                          arguments: 'Hoodies',
                        );
                      },
                    ),
                    CollectionTile(
                      label: 'T-Shirts',
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/collection',
                          arguments: 'T-Shirts',
                        );
                      },
                    ),
                    CollectionTile(
                      label: 'Accessories',
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/collection',
                          arguments: 'Accessories',
                        );
                      },
                    ),
                    CollectionTile(
                      label: 'New Arrivals',
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/collection',
                          arguments: 'New Arrivals',
                        );
                      },
                    ),
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
