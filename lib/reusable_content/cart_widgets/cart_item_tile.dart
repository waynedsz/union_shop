import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/cart_widgets/cart_state.dart';
import 'package:union_shop/reusable_content/cart_widgets/cart_item.dart';

class CartItemTile extends StatelessWidget {
  final CartItem cartItem;
  final CartState cartState;

  const CartItemTile({
    Key? key,
    required this.cartItem,
    required this.cartState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = cartItem.product;
    final itemTotal = product.price * cartItem.quantity;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Hero(
              tag: product.name,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  product.imagePath,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4),
                  Text(
                    '£${product.price.toStringAsFixed(2)} x ${cartItem.quantity} = £${itemTotal.toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () => cartState.removeFromCart(product),
                ),
                Text('${cartItem.quantity}'),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () => cartState.addToCart(product),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
