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
          ],
        ),
      ),
    );
  }
}
