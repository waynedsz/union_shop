import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isSmall = width < 380;
    final horizontalPadding = isSmall ? 12.0 : 16.0;
    final verticalPadding = isSmall ? 20.0 : 28.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 1,
          color: Colors.black12,
        ),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          color: Colors.grey[100],
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Union Shop • University of Portsmouth',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: isSmall ? 14 : 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: isSmall ? 8 : 10),
              Text(
                'Email: shop@uniport.ac.uk',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: isSmall ? 12 : 13,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Phone: +44 23 9284 0000',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: isSmall ? 12 : 13,
                ),
              ),
              SizedBox(height: isSmall ? 12 : 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt_outlined,
                      size: isSmall ? 18 : 20, color: Colors.grey[700]),
                  const SizedBox(width: 16),
                  Icon(Icons.alternate_email,
                      size: isSmall ? 18 : 20, color: Colors.grey[700]),
                  const SizedBox(width: 16),
                  Icon(Icons.facebook_outlined,
                      size: isSmall ? 18 : 20, color: Colors.grey[700]),
                ],
              ),
              SizedBox(height: isSmall ? 12 : 16),
              Text(
                '© 2025 Union Shop — All rights reserved',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: isSmall ? 11 : 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
