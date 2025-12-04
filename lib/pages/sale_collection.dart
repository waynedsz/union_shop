import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/footer.dart';
import 'package:union_shop/reusable_content/header.dart';
import 'package:union_shop/reusable_content/navigation_controller.dart';
import 'package:union_shop/reusable_content/product.dart';
import 'package:union_shop/reusable_content/product_data.dart';

class SaleCollection extends StatelessWidget {
  const SaleCollection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Product> saleProducts = collectionProducts.values
        .expand((products) => products)
        .where((product) => product.isOnSale)
        .toList();

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
          Expanded(
            child: Center(
              child: saleProducts.isEmpty
                  ? Text(
                      'No products are on sale right now.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  : Text(
                      'Sale',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
            ),
          ),
          const Footer(),
        ],
      ),
    );
  }
}
