import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/product_widgets/product_data.dart';
import 'package:union_shop/reusable_content/product_widgets/product_tile.dart';
import 'package:union_shop/reusable_content/product_widgets/product.dart';
import 'package:union_shop/reusable_content/header.dart';
import 'package:union_shop/reusable_content/home_screen_widgets/navigation_controller.dart';
import 'package:union_shop/reusable_content/search_widgets/search_empty_state.dart';

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

  void _onQueryChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredProducts = [];
        _resultsController.reset();
      } else {
        filteredProducts = allProducts
            .where(
              (product) => product.name.toLowerCase().contains(query),
            )
            .toList();
        _resultsController
          ..reset()
          ..forward();
      }
    });
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {
      filteredProducts = [];
      _resultsController.reset();
    });
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
          // already on search; you may no-op or still push
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
              onSubmitted: (_) => _onQueryChanged(),
            ),
          ),
          Expanded(
            child: filteredProducts.isEmpty
                ? SearchEmptyState(
                    title: query.isEmpty
                        ? 'Start typing to search'
                        : 'No products match your search',
                    subtitle: query.isEmpty
                        ? 'Find products by name, e.g. "hoodie" or "mug".'
                        : 'Try a different keyword or check back later.',
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: ScaleTransition(
                        scale: _scaleAnimation,
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
                  ),
          ),
        ],
      ),
    );
  }
}
