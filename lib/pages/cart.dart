import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/footer.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: const [
          Expanded(
            child: Center(
              child: Text('Welcome to the Cart Page!'),
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}
