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
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final imgHeight = w * 0.85;
        final fontSize = (w * 0.08).clamp(12, 18).toDouble();

        return GestureDetector(
          onTap: onTap,
          child: Column(
            children: [
              Container(
                height: imgHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  _imageForLabel(),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
