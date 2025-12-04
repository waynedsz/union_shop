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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                _imageForLabel(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
