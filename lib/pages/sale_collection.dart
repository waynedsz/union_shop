import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/footer.dart';
import 'package:union_shop/reusable_content/header.dart';
import 'package:union_shop/reusable_content/navigation_controller.dart';
import 'package:union_shop/reusable_content/product_widgets/product.dart';
import 'package:union_shop/reusable_content/product_widgets/product_data.dart';
import 'package:union_shop/reusable_content/product_widgets/product_tile.dart';
import 'package:union_shop/reusable_content/sale_sort_helper.dart';
import 'package:union_shop/reusable_content/sale_sort_bar.dart';
import 'package:union_shop/reusable_content/sale_grid.dart';

class SaleCollection extends StatefulWidget {
  const SaleCollection({Key? key}) : super(key: key);

  @override
  State<SaleCollection> createState() => _SaleCollectionState();
}

class _SaleCollectionState extends State<SaleCollection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

  late List<Product> saleProducts;
  String _sortOption = 'price_low_high';

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _fadeAnimation =
        CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut);
    _fadeController.forward();

    saleProducts = collectionProducts.values
        .expand((products) => products)
        .where((product) => product.isOnSale)
        .toList();
    _applySort();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  void _applySort() {
    setState(() {
      saleProducts = sortSaleProducts(saleProducts, _sortOption);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Sale',
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
          if (saleProducts.isNotEmpty)
            SaleSortBar(
              sortOption: _sortOption,
              onSortChanged: (newValue) {
                _sortOption = newValue;
                _applySort();
              },
            ),
          Expanded(
            child: saleProducts.isEmpty
                ? Center(
                    child: Text(
                      'No products are on sale right now.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SaleGrid(
                      saleProducts: saleProducts,
                      fadeAnimation: _fadeAnimation,
                    ),
                  ),
          ),
          const Footer(),
        ],
      ),
    );
  }
}
