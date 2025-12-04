import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.onNavigateHome,
    required this.onSearchPressed,
    required this.onAboutPressed,
    required this.onLoginPressed,
    required this.onCartPressed,
    required this.onMenuPressed,
  });

  final VoidCallback onNavigateHome;
  final VoidCallback onSearchPressed;
  final VoidCallback onAboutPressed;
  final VoidCallback onLoginPressed;
  final VoidCallback onCartPressed;
  final VoidCallback onMenuPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: const Color(0xFF4d2963),
            child: const Text(
              'Welcome to the Union Shop',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: onNavigateHome,
                    child: Image.network(
                      'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                      height: 18,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          width: 18,
                          height: 18,
                          child: const Center(
                            child: Icon(
                              Icons.image_not_supported,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: onNavigateHome,
                            child: const Text(
                              'Home',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: onCartPressed,
                            child: const Text(
                              'Collections',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: onAboutPressed,
                            child: const Text(
                              'About',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: onCartPressed,
                            child: const Text(
                              'Sale',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.search,
                            size: 18,
                            color: Colors.grey,
                          ),
                          padding: const EdgeInsets.all(8),
                          constraints: const BoxConstraints(
                            minWidth: 32,
                            minHeight: 32,
                          ),
                          onPressed: onSearchPressed,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.person_outline,
                            size: 18,
                            color: Colors.grey,
                          ),
                          padding: const EdgeInsets.all(8),
                          constraints: const BoxConstraints(
                            minWidth: 32,
                            minHeight: 32,
                          ),
                          onPressed: onLoginPressed,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.shopping_bag_outlined,
                            size: 18,
                            color: Colors.grey,
                          ),
                          padding: const EdgeInsets.all(8),
                          constraints: const BoxConstraints(
                            minWidth: 32,
                            minHeight: 32,
                          ),
                          onPressed: onCartPressed,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.menu,
                            size: 18,
                            color: Colors.grey,
                          ),
                          padding: const EdgeInsets.all(8),
                          constraints: const BoxConstraints(
                            minWidth: 32,
                            minHeight: 32,
                          ),
                          onPressed: onMenuPressed,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.shopping_cart,
                            size: 18,
                            color: Colors.grey,
                          ),
                          padding: const EdgeInsets.all(8),
                          constraints: const BoxConstraints(
                            minWidth: 32,
                            minHeight: 32,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/cart');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
