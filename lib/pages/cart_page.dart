import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/reusable_content/cart_state.dart';
import 'package:union_shop/reusable_content/footer.dart';
import 'package:union_shop/reusable_content/cart_item_tile.dart';
import 'package:union_shop/reusable_content/cart_bottom_bar.dart';
import 'package:union_shop/reusable_content/empty_cart_view.dart';
import 'package:union_shop/reusable_content/header.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void placeholderCallback() {}

  @override
  Widget build(BuildContext context) {
    final cartState = Provider.of<CartState>(context);
    final items = cartState.items;
    final total = items.fold<double>(
      0,
      (sum, item) => sum + item.product.price * item.quantity,
    );

    return Scaffold(
      appBar: Header(
        onNavigateHome: () => navigateToHome(context),
        onSearchPressed: placeholderCallback,
        onAboutPressed: () {
          Navigator.pushNamed(context, '/about');
        },
        onLoginPressed: () {
          Navigator.pushNamed(context, '/login');
        },
        onCartPressed: () {
          // Already on cart; keep or no-op as you like.
          Navigator.pushNamed(context, '/cart');
        },
        onMenuPressed: () {
          Navigator.pushNamed(context, '/collections');
        },
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final height = constraints.maxHeight;
          const baseHeight = 800.0;
          final scale = (height / baseHeight).clamp(0.7, 1.2);
          final verticalOffset = 0.05 * scale;

          return Column(
            children: [
              Expanded(
                child: items.isEmpty
                    ? const EmptyCartView()
                    : ListView.builder(
                        padding: EdgeInsets.only(
                          bottom: 80.0 * scale,
                        ),
                        itemCount: items.length + 1,
                        itemBuilder: (context, index) {
                          if (index == items.length) {
                            return Padding(
                              padding: EdgeInsets.only(
                                top: 8.0 * scale,
                                bottom: 8.0 * scale,
                              ),
                              child: const Footer(),
                            );
                          }

                          final cartItem = items[index];
                          return AnimatedSwitcher(
                            duration: Duration(
                              milliseconds:
                                  (250 * scale).clamp(150, 350).toInt(),
                            ),
                            transitionBuilder: (child, animation) {
                              final offsetAnimation = Tween<Offset>(
                                begin: Offset(0, verticalOffset),
                                end: Offset.zero,
                              ).animate(animation);
                              return FadeTransition(
                                opacity: animation,
                                child: SlideTransition(
                                  position: offsetAnimation,
                                  child: child,
                                ),
                              );
                            },
                            child: CartItemTile(
                              key: ValueKey(cartItem.product),
                              cartItem: cartItem,
                              cartState: cartState,
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: CartBottomBar(
        total: total,
        onCheckout: () {},
      ),
    );
  }
}
