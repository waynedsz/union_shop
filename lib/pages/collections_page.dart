import 'package:flutter/material.dart';

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
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Collections",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            DropdownButton<String>(
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
            const SizedBox(height: 16),
            const Text(
              "Collections Page",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                padding: const EdgeInsets.all(16),
                children: const [
                  _CollectionTile(label: 'Hoodies'),
                  _CollectionTile(label: 'T-Shirts'),
                  _CollectionTile(label: 'Accessories'),
                  _CollectionTile(label: 'New Arrivals'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// simple placeholder tile widget
class _CollectionTile extends StatelessWidget {
  final String label;

  const _CollectionTile({required this.label});

  void _openCollection(BuildContext context) {
    final routeName = '/collection/${label.toLowerCase().replaceAll(' ', '-')}';
    Navigator.pushNamed(
      context,
      routeName,
      arguments: {'collection': label},
    );
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
