import 'package:flutter/material.dart';

class PrintShackBanner extends StatelessWidget {
  const PrintShackBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 160,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          image: const DecorationImage(
            image: AssetImage('assets/images/print_banner.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
