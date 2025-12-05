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
    final width = MediaQuery.of(context).size.width;

    // Dynamic horizontal padding
    final horizontalPadding = width < 500
        ? 16.0
        : width < 900
            ? 32.0
            : 48.0;
    final verticalPadding = 8.0;
    final innerHorizontal = 12.0;
    final innerVertical = 10.0;
    final boxBlur = 4.0;
    final borderRadius = 12.0;
    final buttonRadius = 24.0;
    final buttonVertPadding = 14.0;
    final gap = 8.0;

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
            offset: const Offset(0, -2),
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
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '£${total.toStringAsFixed(2)}',
                    style: const TextStyle(
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
                child: const Text(
                  'Checkout',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
