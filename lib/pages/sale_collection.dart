import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/footer.dart';
import 'package:union_shop/reusable_content/header.dart';
import 'package:union_shop/reusable_content/navigation_controller.dart';
import 'package:union_shop/reusable_content/product.dart';
import 'package:union_shop/reusable_content/product_data.dart';
import 'package:union_shop/reusable_content/product_tile.dart';

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
            child: saleProducts.isEmpty
                ? Center(
                    child: Text(
                      'No products are on sale right now.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final crossAxisCount =
                            constraints.maxWidth > 700 ? 3 : 2;
                        return GridView.builder(
                          itemCount: saleProducts.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 0.7,
                          ),
                          itemBuilder: (context, index) {
                            final product = saleProducts[index];
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
                        );
                      },
                    ),
                  ),
          ),
          const Footer(),
        ],
      ),
    );
  }
}
