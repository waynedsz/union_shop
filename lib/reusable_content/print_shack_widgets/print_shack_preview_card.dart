import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/print_shack_widgets/print_shack_section_card.dart';

class PrintShackPreviewCard extends StatelessWidget {
  final String product;
  final String message;
  final String size;
  final String color;

  const PrintShackPreviewCard({
    super.key,
    required this.product,
    required this.message,
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return PrintShackSectionCard(
      title: 'Preview',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product: $product', style: const TextStyle(fontSize: 16)),
          Text('Message: $message', style: const TextStyle(fontSize: 16)),
          Text('Size: $size', style: const TextStyle(fontSize: 16)),
          Text('Color: $color', style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
