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

    final width = MediaQuery.of(context).size.width;

    // Dynamic horizontal padding
    final outerHPad = width < 500
        ? 16.0
        : width < 900
            ? 32.0
            : 48.0;
    final outerVPad = 8.0;
    final cardRadius = 12.0;
    final cardElevation = 3.0;
    final innerPad = 12.0;
    final imageSize = 60.0;
    final imageRadius = 8.0;
    final gapAfterImage = 12.0;
    final gapNameToLine = 4.0;
    final gapBetweenLines = 2.0;
    final controlsGap = 8.0;
    final qtyHPad = 4.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: outerHPad, vertical: outerVPad),
      child: Card(
        elevation: cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cardRadius),
        ),
        child: Padding(
          padding: EdgeInsets.all(innerPad),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: product.name,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(imageRadius),
                  child: Image.asset(
                    product.imagePath,
                    width: imageSize,
                    height: imageSize,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: gapAfterImage),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: gapNameToLine),
                    Text(
                      '£${product.price.toStringAsFixed(2)} x ${cartItem.quantity} = £${itemTotal.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: gapBetweenLines),
                    Text(
                      '£${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(width: controlsGap),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      cartState.removeFromCart(product);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: qtyHPad),
                    child: Text('${cartItem.quantity}'),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      cartState.addToCart(product);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
