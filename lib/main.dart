import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:union_shop/reusable_content/cart_state.dart';
import 'package:union_shop/pages/home_screen.dart';
import 'package:union_shop/pages/about_page.dart';
import 'package:union_shop/pages/collections_page.dart';
import 'package:union_shop/pages/collection_page.dart';
import 'package:union_shop/pages/sale_collection.dart';
import 'package:union_shop/pages/login_page.dart';
import 'package:union_shop/pages/cart_page.dart';
import 'package:union_shop/pages/product_page.dart';
import 'package:union_shop/reusable_content/product.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartState(),
      child: const UnionShopApp(),
    ),
  );
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/about': (context) => const AboutPage(),
        '/collections': (context) => const CollectionsPage(),
        '/collection': (context) => const CollectionPage(),
        '/sale-collection': (context) => const SaleCollection(),
        '/login': (context) => const LoginPage(),
        '/cart': (context) => const Cart(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/product') {
          final product = settings.arguments as Product;
          return MaterialPageRoute(
            builder: (_) => ProductPage(product: product),
          );
        }
        return null;
      },
    );
  }
}
