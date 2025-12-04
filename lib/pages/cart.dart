import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/reusable_content/cart_state.dart';
import 'package:union_shop/reusable_content/footer.dart';
import 'package:union_shop/reusable_content/cart_item_tile.dart';
import 'package:union_shop/reusable_content/cart_bottom_bar.dart';
import 'package:union_shop/reusable_content/empty_cart_view.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartState = Provider.of<CartState>(context);
    final items = cartState.items;
    final total = items.fold<double>(
      0,
      (sum, item) => sum + item.product.price * item.quantity,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        actions: [
          if (items.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () {
                cartState.clearCart();
              },
            ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: items.isEmpty
                ? const EmptyCartView()
                : ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final cartItem = items[index];
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        transitionBuilder: (child, animation) {
                          final offsetAnimation = Tween<Offset>(
                            begin: const Offset(0, 0.05),
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
          const Footer(),
        ],
      ),
      bottomNavigationBar: CartBottomBar(
        total: total,
        onCheckout: () {},
      ),
    );
  }
}
