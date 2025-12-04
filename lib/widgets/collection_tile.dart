import 'package:flutter/material.dart';

class CollectionTile extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const CollectionTile({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // ...existing image selection logic from _CollectionTile...
    String imageAsset;
    switch (label) {
      case 'Hoodies':
        imageAsset = 'assets/images/products/hoodie_1.png';
        break;
      case 'T-Shirts':
        imageAsset = 'assets/images/products/tshirt_1.png';
        break;
      case 'Accessories':
        imageAsset = 'assets/images/products/accessory_tote.png';
        break;
      case 'New Arrivals':
        imageAsset = 'assets/images/products/notebook.png';
        break;
      default:
        imageAsset = 'assets/images/products/hoodie_1.png';
    }

    // ...existing tile UI from _CollectionTile using imageAsset and label...
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          // image
          Image.asset(imageAsset),
          // label
          Text(label),
        ],
      ),
    );
  }
}
