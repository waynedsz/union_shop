import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final String productName =
        args?['productName'] as String? ?? 'Placeholder Product Name';
    final String imagePath = args?['imagePath'] as String? ??
        'assets/images/placeholder_product.png';
    final String price = args?['price'] as String? ?? '£15.00';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Product details
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product image
                        Container(
                          height: 300,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[200],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Product name
                        Text(
                          productName,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Product price
                        Text(
                          price,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4d2963),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Product description
                        const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(height: 16),

                        Text(
                          '$productName is part of our premium range and features high-quality materials for everyday use.',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Footer at the bottom
          Container(
            width: double.infinity,
            color: Colors.grey[50],
            padding: const EdgeInsets.all(24),
            child: const Text(
              'Placeholder Footer',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
