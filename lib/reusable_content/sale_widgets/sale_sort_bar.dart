import 'package:flutter/material.dart';

class SaleSortBar extends StatelessWidget {
  const SaleSortBar({
    super.key,
    required this.sortOption,
    required this.onSortChanged,
  });

  final String sortOption;
  final ValueChanged<String> onSortChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        children: [
          const Text(
            'Sort by:',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(width: 8),
          DropdownButton<String>(
            value: sortOption,
            onChanged: (value) {
              if (value == null) return;
              onSortChanged(value);
            },
            items: const [
              DropdownMenuItem(
                value: 'price_low_high',
                child: Text('Price: Low → High'),
              ),
              DropdownMenuItem(
                value: 'discount_high_low',
                child: Text('Discount: High → Low'),
              ),
              DropdownMenuItem(
                value: 'alpha_az',
                child: Text('Alphabetical: A → Z'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
