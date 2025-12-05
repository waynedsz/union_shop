import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/reusable_content/cart_widgets/cart_state.dart';
import 'package:union_shop/reusable_content/footer.dart';
import 'package:union_shop/reusable_content/cart_widgets/cart_item_tile.dart';
import 'package:union_shop/reusable_content/cart_widgets/cart_bottom_bar.dart';
import 'package:union_shop/reusable_content/cart_widgets/empty_cart_view.dart';
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

    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = width < 500
        ? 16.0
        : width < 900
            ? 32.0
            : 48.0;

    return Scaffold(
      appBar: Header(
        title: 'Your Cart',
        onNavigateHome: () => navigateToHome(context),
        onSearchPressed: placeholderCallback,
        onAboutPressed: () => Navigator.pushNamed(context, '/about'),
        onLoginPressed: () => Navigator.pushNamed(context, '/login'),
        onCartPressed: () => Navigator.pushNamed(context, '/cart'),
        onPrintShackPressed: () => Navigator.pushNamed(context, '/print-shack'),
      ),
      body: SingleChildScrollView(
        padding:
            EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (items.isEmpty)
              const EmptyCartView()
            else
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final cartItem = items[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: CartItemTile(
                      cartItem: cartItem,
                      cartState: cartState,
                    ),
                  );
                },
              ),
            const SizedBox(height: 32),
            const Footer(),
          ],
        ),
      ),
      bottomNavigationBar: CartBottomBar(
        total: total,
        onCheckout: () {},
      ),
    );
  }
}
