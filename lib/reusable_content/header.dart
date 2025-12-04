import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/navigation_controller.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({
    super.key,
    required this.onNavigateHome,
    required this.onSearchPressed,
    required this.onAboutPressed,
    required this.onLoginPressed,
    required this.onCartPressed,
  });

  final VoidCallback onNavigateHome;
  final VoidCallback onSearchPressed;
  final VoidCallback onAboutPressed;
  final VoidCallback onLoginPressed;
  final VoidCallback onCartPressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.canPop(context);

    return AppBar(
      backgroundColor: const Color(0xFF4d2963),
      elevation: 0,
      leading: canPop
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            )
          : GestureDetector(
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
      title: canPop
          ? null
          : const Text(
              'Welcome to the Union Shop',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
      actions: [
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
    );
  }
}
