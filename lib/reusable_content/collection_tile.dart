import 'package:flutter/material.dart';

class CollectionTile extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const CollectionTile({
    super.key,
    required this.label,
    required this.onTap,
  });

  String _imageForLabel() {
    switch (label) {
      case 'Hoodies':
        return 'assets/images/collections/hoodies.png';
      case 'T-Shirts':
        return 'assets/images/collections/tshirts.png';
      case 'Accessories':
        return 'assets/images/collections/accessories.png';
      case 'New Arrivals':
        return 'assets/images/collections/new_arrivals.png';
      default:
        return 'assets/images/collections/default.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      // ⭐ THIS WRAPS THE WHOLE TILE IN A SAFE HEIGHT RATIO — NO OVERFLOW EVER
      child: AspectRatio(
        aspectRatio: 0.75, // adjust between 0.7–0.85 depending on your images
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  _imageForLabel(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
