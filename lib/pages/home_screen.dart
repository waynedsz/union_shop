import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/header.dart';
import 'package:union_shop/reusable_content/navigation_controller.dart';
import 'package:union_shop/reusable_content/product_data.dart';
import 'package:union_shop/reusable_content/product_card.dart';
import 'package:union_shop/reusable_content/product.dart';
import 'package:union_shop/reusable_content/featured_collections.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnimation =
        CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut);
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final showcaseProducts = collectionProducts.values
        .map((products) => products.isNotEmpty ? products.first : null)
        .where((p) => p != null)
        .cast<Product>()
        .toList();

    return Scaffold(
      appBar: Header(
        title: 'Home',
        onNavigateHome: () => NavigationController.goHome(context),
        onSearchPressed: () {
          Navigator.pushNamed(context, '/search');
        },
        onAboutPressed: () => NavigationController.goAbout(context),
        onLoginPressed: () => NavigationController.goLogin(context),
        onCartPressed: () => NavigationController.goCart(context),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: HomeHero(
                title: 'Placeholder Hero Title',
                subtitle: 'This is placeholder text for the hero section.',
                buttonText: 'BROWSE PRODUCTS',
                imageUrl:
                    'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
                onButtonPressed: () {
                  Navigator.pushNamed(context, '/collections');
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: HomeProductShowcase(products: showcaseProducts),
            ),
          ),
          SliverToBoxAdapter(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: const FeaturedCollections(),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(24),
              width: double.infinity,
              color: Colors.grey[50],
              child: const Text(
                'Placeholder Footer',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeHero extends StatelessWidget {
  const HomeHero({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.imageUrl,
    required this.onButtonPressed,
  });

  final String title;
  final String subtitle;
  final String buttonText;
  final String imageUrl;
  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Colors.black54,
              ),
            ),
          ),
          Positioned(
            left: 24,
            right: 24,
            top: 80,
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: onButtonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4d2963),
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    buttonText,
                    style: const TextStyle(letterSpacing: 1),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeProductShowcase extends StatelessWidget {
  const HomeProductShowcase({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          const Text(
            'PRODUCTS SECTION',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 48),
          LayoutBuilder(
            builder: (context, constraints) {
              final maxWidth = constraints.maxWidth;
              int crossAxisCount;
              if (maxWidth >= 900) {
                crossAxisCount = 3;
              } else if (maxWidth >= 600) {
                crossAxisCount = 2;
              } else {
                crossAxisCount = 1;
              }

              return GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 24,
                mainAxisSpacing: 48,
                children: products
                    .map(
                      (product) => ProductCard(
                        title: product.name,
                        price: '£${product.price.toStringAsFixed(2)}',
                        imageUrl: product.imagePath,
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
