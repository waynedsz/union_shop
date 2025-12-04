import 'package:flutter/material.dart';

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final shortestSide = size.shortestSide;
    final scale = (shortestSide / 400).clamp(0.8, 1.2);

    final horizontalPadding = 32.0 * scale;
    final iconSize = 72.0 * scale;
    final gapTitle = 16.0 * scale;
    final gapSubtitle = 8.0 * scale;
    final gapButton = 24.0 * scale;
    final buttonVertPadding = 14.0 * scale;
    final buttonRadius = 24.0 * scale;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.shopping_bag_outlined,
              size: iconSize,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
            ),
            SizedBox(height: gapTitle),
            Text(
              'Your cart is empty',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: gapSubtitle),
            Text(
              'Browse our collections and add items you love.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.color
                        ?.withOpacity(0.6),
                  ),
            ),
            SizedBox(height: gapButton),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: buttonVertPadding,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(buttonRadius),
                  ),
                ),
                child: const Text('Back to collections'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
