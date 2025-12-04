import 'package:flutter/material.dart';

class CartBottomBar extends StatelessWidget {
  final double total;
  final VoidCallback onCheckout;

  const CartBottomBar({
    Key? key,
    required this.total,
    required this.onCheckout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final shortestSide = size.shortestSide;
    final scale = (shortestSide / 400).clamp(0.8, 1.2);

    final horizontalPadding = 16.0 * scale;
    final verticalPadding = (8.0 * scale).clamp(6.0, 10.0);
    final innerHorizontal = 12.0 * scale;
    final innerVertical = 10.0 * scale;
    final boxBlur = 4.0 * scale;
    final borderRadius = 12.0 * scale;
    final buttonRadius = 24.0 * scale;
    final buttonVertPadding = (14.0 * scale).clamp(10.0, 16.0);
    final gap = (8.0 * scale).clamp(6.0, 10.0);

    final totalLabelSize = 17.0 * scale;
    final totalValueSize = 20.0 * scale;
    final buttonTextSize = 16.0 * scale;

    return Container(
      padding: EdgeInsets.fromLTRB(
        horizontalPadding,
        verticalPadding,
        horizontalPadding,
        verticalPadding,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: boxBlur,
            offset: Offset(0, -2 * scale),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: innerHorizontal,
                vertical: innerVertical,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: totalLabelSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '£${total.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: totalValueSize,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: gap),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onCheckout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: EdgeInsets.symmetric(vertical: buttonVertPadding),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(buttonRadius),
                  ),
                ),
                child: Text(
                  'Checkout',
                  style: TextStyle(
                      fontSize: buttonTextSize,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
