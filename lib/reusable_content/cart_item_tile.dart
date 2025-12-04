import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/cart_state.dart';
import 'package:union_shop/reusable_content/product.dart';
import 'package:union_shop/reusable_content/cart_item.dart';

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

    final size = MediaQuery.of(context).size;
    final shortestSide = size.shortestSide;
    final scale = (shortestSide / 400).clamp(0.8, 1.2);

    final outerHPad = 12.0 * scale;
    final outerVPad = 8.0 * scale;
    final cardRadius = 12.0 * scale;
    final cardElevation = 3.0 * scale;
    final innerPad = 12.0 * scale;
    final imageSize = 60.0 * scale;
    final imageRadius = 8.0 * scale;
    final gapAfterImage = 12.0 * scale;
    final gapNameToLine = 4.0 * scale;
    final gapBetweenLines = 2.0 * scale;
    final controlsGap = 8.0 * scale;
    final qtyHPad = 4.0 * scale;

    final nameFontSize = 16.0 * scale;
    final lineFontSize = 12.0 * scale;
    final unitPriceFontSize = 14.0 * scale;
    final qtyFontSize = 16.0 * scale;
    final iconSize = 24.0 * scale;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: outerHPad,
        vertical: outerVPad,
      ),
      child: Card(
        elevation: cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cardRadius),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: innerPad,
            vertical: innerPad,
          ),
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
                      style: TextStyle(
                        fontSize: nameFontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: gapNameToLine),
                    Text(
                      '£${product.price.toStringAsFixed(2)} x ${cartItem.quantity} = £${itemTotal.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: lineFontSize,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: gapBetweenLines),
                    Text(
                      '£${product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: unitPriceFontSize,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: controlsGap),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.remove_circle_outline,
                      size: iconSize,
                    ),
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      cartState.removeFromCart(product);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: qtyHPad,
                    ),
                    child: Text(
                      '${cartItem.quantity}',
                      style: TextStyle(fontSize: qtyFontSize),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add_circle_outline,
                      size: iconSize,
                    ),
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
