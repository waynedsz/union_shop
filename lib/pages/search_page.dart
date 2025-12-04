import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/product_data.dart';
import 'package:union_shop/reusable_content/product_tile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  late final List<Product> allProducts = allProductsList;
  List<Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onQueryChanged);
  }

  void _onQueryChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredProducts = [];
      } else {
        filteredProducts = allProducts
            .where(
              (product) => product.name.toLowerCase().contains(query),
            )
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_onQueryChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = _searchController.text.trim();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: filteredProducts.isEmpty
                ? Center(
                    child: Text(
                      query.isEmpty
                          ? 'Start typing to search'
                          : 'No products match your search',
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: GridView.builder(
                      itemCount: filteredProducts.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (context, index) {
                        final product = filteredProducts[index];
                        return ProductTile(
                          product: product,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/product',
                              arguments: product,
                            );
                          },
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
