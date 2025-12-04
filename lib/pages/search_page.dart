import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/product_widgets/product_data.dart';
import 'package:union_shop/reusable_content/product_widgets/product_tile.dart';
import 'package:union_shop/reusable_content/product_widgets/product.dart';
import 'package:union_shop/reusable_content/header.dart';
import 'package:union_shop/reusable_content/home_screen_widgets/navigation_controller.dart';
import 'package:union_shop/reusable_content/search_widgets/search_empty_state.dart';
import 'package:union_shop/reusable_content/search_widgets/search_results_grid.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late final List<Product> allProducts = allProductsList;
  List<Product> filteredProducts = [];

  late final AnimationController _resultsController;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;

  String _selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    _resultsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _fadeAnimation =
        CurvedAnimation(parent: _resultsController, curve: Curves.easeInOut);
    _scaleAnimation =
        CurvedAnimation(parent: _resultsController, curve: Curves.easeOut);
    _searchController.addListener(_onQueryChanged);
  }

  void _applyFilters() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      Iterable<Product> products = allProducts;

      if (query.isNotEmpty) {
        products = products.where(
          (product) => product.name.toLowerCase().contains(query),
        );
      }

      if (_selectedCategory != 'All') {
        products = products.where((product) {
          final tag = _selectedCategory.toLowerCase();
          return product.tags?.map((t) => t.toLowerCase()).contains(tag) ??
              false;
        });
      }

      filteredProducts = products.toList();

      if (filteredProducts.isEmpty ||
          query.isEmpty && _selectedCategory == 'All') {
        _resultsController.reset();
      } else {
        _resultsController
          ..reset()
          ..forward();
      }
    });
  }

  void _onQueryChanged() {
    _applyFilters();
  }

  void _clearSearch() {
    _searchController.clear();
    _applyFilters();
  }

  @override
  void dispose() {
    _searchController.removeListener(_onQueryChanged);
    _searchController.dispose();
    _resultsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = _searchController.text.trim();

    return Scaffold(
      appBar: Header(
        title: 'Search',
        onNavigateHome: () => NavigationController.goHome(context),
        onSearchPressed: () {
          Navigator.pushNamed(context, '/search');
        },
        onAboutPressed: () => NavigationController.goAbout(context),
        onLoginPressed: () => NavigationController.goLogin(context),
        onCartPressed: () => NavigationController.goCart(context),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Search',
                      border: const OutlineInputBorder(),
                      suffixIcon: query.isEmpty
                          ? null
                          : IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: _clearSearch,
                            ),
                    ),
                    onSubmitted: (_) => _applyFilters(),
                  ),
                ),
                const SizedBox(width: 12),
                DropdownButton<String>(
                  value: _selectedCategory,
                  onChanged: (value) {
                    if (value == null) return;
                    _selectedCategory = value;
                    _applyFilters();
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 'All',
                      child: Text('All'),
                    ),
                    DropdownMenuItem(
                      value: 'Hoodies',
                      child: Text('Hoodies'),
                    ),
                    DropdownMenuItem(
                      value: 'T-Shirts',
                      child: Text('T-Shirts'),
                    ),
                    DropdownMenuItem(
                      value: 'Accessories',
                      child: Text('Accessories'),
                    ),
                    DropdownMenuItem(
                      value: 'New Arrivals',
                      child: Text('New Arrivals'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: filteredProducts.isEmpty
                ? SearchEmptyState(
                    title: query.isEmpty && (_selectedCategory == 'All')
                        ? 'Start typing to search'
                        : 'No products match your filters',
                    subtitle: query.isEmpty && (_selectedCategory == 'All')
                        ? 'Find products by name, e.g. "hoodie" or "mug".'
                        : 'Try a different keyword or category.',
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: ScaleTransition(
                        scale: _scaleAnimation,
                        child: SearchResultsGrid(
                          products: filteredProducts,
                          onProductTap: (product) {
                            Navigator.pushNamed(
                              context,
                              '/product',
                              arguments: product,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
