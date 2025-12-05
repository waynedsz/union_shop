import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/header.dart';
import 'package:union_shop/reusable_content/footer.dart';
import 'package:union_shop/reusable_content/home_screen_widgets/navigation_controller.dart';

class PrintShackPage extends StatelessWidget {
  const PrintShackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Print Shack',
        onNavigateHome: () => NavigationController.goHome(context),
        onSearchPressed: () => NavigationController.goSearch(context),
        onAboutPressed: () => NavigationController.goAbout(context),
        onLoginPressed: () => NavigationController.goLogin(context),
        onCartPressed: () => NavigationController.goCart(context),
        onPrintShackPressed: () => NavigationController.goPrintShack(context),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Print Shack — Customisation Coming Soon',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ),
          const Footer(),
        ],
      ),
    );
  }
}
