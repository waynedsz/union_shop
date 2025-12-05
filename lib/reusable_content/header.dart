import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/home_screen_widgets/navigation_controller.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({
    super.key,
    required this.title,
    required this.onNavigateHome,
    required this.onSearchPressed,
    required this.onAboutPressed,
    required this.onLoginPressed,
    required this.onCartPressed,
    this.onPrintShackPressed,
  });

  final String title;
  final VoidCallback onNavigateHome;
  final VoidCallback onSearchPressed;
  final VoidCallback onAboutPressed;
  final VoidCallback onLoginPressed;
  final VoidCallback onCartPressed;
  final VoidCallback? onPrintShackPressed;

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    final canGoBack = Navigator.canPop(context);
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 500;

    return Container(
      height: 100,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: const Color(0xFF4d2963),
            child: Row(
              children: [
                SizedBox(
                  width: 48,
                  child: canGoBack
                      ? IconButton(
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.maybePop(context),
                        )
                      : const SizedBox.shrink(),
                ),
                Expanded(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                const SizedBox(width: 48),
              ],
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
                      height: 24,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey[300],
                        width: 24,
                        height: 24,
                        child: const Center(
                          child: Icon(Icons.image_not_supported,
                              color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: isMobile
                        ? PopupMenuButton<String>(
                            icon: const Icon(Icons.menu, color: Colors.black87),
                            onSelected: (value) {
                              switch (value) {
                                case 'Home':
                                  onNavigateHome();
                                  break;
                                case 'Collections':
                                  NavigationController.goCollections(context);
                                  break;
                                case 'About':
                                  onAboutPressed();
                                  break;
                                case 'Sale':
                                  NavigationController.goSale(context);
                                  break;
                                case 'Print Shack':
                                  if (onPrintShackPressed != null)
                                    onPrintShackPressed!();
                                  break;
                              }
                            },
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                  value: 'Home', child: Text('Home')),
                              const PopupMenuItem(
                                  value: 'Collections',
                                  child: Text('Collections')),
                              const PopupMenuItem(
                                  value: 'About', child: Text('About')),
                              const PopupMenuItem(
                                  value: 'Sale', child: Text('Sale')),
                              if (onPrintShackPressed != null)
                                const PopupMenuItem(
                                    value: 'Print Shack',
                                    child: Text('Print Shack')),
                            ],
                          )
                        : Wrap(
                            spacing: 8,
                            runSpacing: 4,
                            alignment: WrapAlignment.start,
                            children: [
                              TextButton(
                                  onPressed: onNavigateHome,
                                  child: const Text('Home')),
                              TextButton(
                                  onPressed: () =>
                                      NavigationController.goCollections(
                                          context),
                                  child: const Text('Collections')),
                              TextButton(
                                  onPressed: onAboutPressed,
                                  child: const Text('About')),
                              TextButton(
                                  onPressed: () =>
                                      NavigationController.goSale(context),
                                  child: const Text('Sale')),
                              if (onPrintShackPressed != null)
                                TextButton(
                                    onPressed: onPrintShackPressed,
                                    child: const Text('Print Shack')),
                            ],
                          ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          icon: const Icon(Icons.search,
                              size: 18, color: Colors.grey),
                          padding: const EdgeInsets.all(8),
                          constraints:
                              const BoxConstraints(minWidth: 32, minHeight: 32),
                          onPressed: onSearchPressed),
                      IconButton(
                          icon: const Icon(Icons.person_outline,
                              size: 18, color: Colors.grey),
                          padding: const EdgeInsets.all(8),
                          constraints:
                              const BoxConstraints(minWidth: 32, minHeight: 32),
                          onPressed: onLoginPressed),
                      IconButton(
                          icon: const Icon(Icons.shopping_bag_outlined,
                              size: 18, color: Colors.grey),
                          padding: const EdgeInsets.all(8),
                          constraints:
                              const BoxConstraints(minWidth: 32, minHeight: 32),
                          onPressed: onCartPressed),
                    ],
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
