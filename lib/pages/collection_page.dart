import 'package:flutter/material.dart';

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
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          const Center(
            child: Text(
              'Collection Page',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 16),
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
          const SizedBox(height: 16),
          const Expanded(
            child: Center(
              child: Text('Welcome to the Collections Page!'),
            ),
          ),
        ],
      ),
    );
  }
}
