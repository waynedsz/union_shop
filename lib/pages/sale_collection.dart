import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/footer.dart';
import 'package:union_shop/reusable_content/header.dart';
import 'package:union_shop/reusable_content/navigation_controller.dart';

class SaleCollection extends StatelessWidget {
  const SaleCollection({Key? key}) : super(key: key);

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
          Expanded(
            child: Center(
              child: Text(
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
