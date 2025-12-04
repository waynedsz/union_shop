import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text('Start typing to search'),
            ),
          ),
        ],
      ),
    );
  }
}
