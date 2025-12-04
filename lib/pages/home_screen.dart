import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/header.dart';
import 'package:union_shop/reusable_content/navigation_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeHero(
              title: 'Placeholder Hero Title',
              subtitle: 'This is placeholder text for the hero section.',
              buttonText: 'BROWSE PRODUCTS',
              imageUrl:
                  'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
              onButtonPressed: () {
                Navigator.pushNamed(context, '/collections');
              },
            ),
            HomeProductShowcase(
              products: const [
                ProductCard(
                  title: 'Placeholder Product 1',
                  price: '£10.00',
                  imageUrl:
                      'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                ),
                ProductCard(
                  title: 'Placeholder Product 2',
                  price: '£15.00',
                  imageUrl:
                      'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                ),
                ProductCard(
                  title: 'Placeholder Product 3',
                  price: '£20.00',
                  imageUrl:
                      'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                ),
                ProductCard(
                  title: 'Placeholder Product 4',
                  price: '£25.00',
                  imageUrl:
                      'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(24),
              width: double.infinity,
              color: Colors.grey[50],
              child: const Text(
                'Placeholder Footer',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ],
        ),
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

  final List<ProductCard> products;

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
              final crossAxisCount = constraints.maxWidth > 600 ? 2 : 1;
              return GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 24,
                mainAxisSpacing: 48,
                children: products,
              );
            },
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/product'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) {
                return Container(
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.image_not_supported,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 4),
          Text(title, maxLines: 2),
          const SizedBox(height: 4),
          Text(
            price,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
