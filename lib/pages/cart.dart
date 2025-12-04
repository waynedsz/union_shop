import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/reusable_content/cart_state.dart';
import 'package:union_shop/reusable_content/footer.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartState = Provider.of<CartState>(context);
    final items = cartState.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: items.isEmpty
                ? const Center(
                    child: Text('Your cart is empty'),
                  )
                : ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final cartItem = items[index];
                      final product = cartItem.product;
                      return ListTile(
                        leading: Image.asset(
                          product.imagePath,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(product.name),
                        subtitle: Text(
                          '£${product.price.toStringAsFixed(2)} x ${cartItem.quantity}',
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_circle_outline),
                          onPressed: () {
                            cartState.removeFromCart(product);
                          },
                        ),
                      );
                    },
                  ),
          ),
          const Footer(),
        ],
      ),
    );
  }
}
