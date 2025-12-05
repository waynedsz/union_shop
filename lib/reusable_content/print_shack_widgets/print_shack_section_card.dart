import 'package:flutter/material.dart';

class PrintShackSectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const PrintShackSectionCard({
    super.key,
    required this.title,
    required this.child,
  });

  IconData _iconForTitle(String text) {
    if (text.contains('product')) return Icons.shopping_bag_outlined;
    if (text.contains('message')) return Icons.edit_outlined;
    if (text.contains('size')) return Icons.straighten;
    if (text.contains('colour') || text.contains('color'))
      return Icons.color_lens_outlined;
    if (text.contains('Preview')) return Icons.visibility_outlined;
    return Icons.circle_outlined;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                _iconForTitle(title),
                size: 20,
                color: Colors.black87,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}
