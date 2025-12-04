import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/footer.dart';

class SaleCollection extends StatelessWidget {
  const SaleCollection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sale Collection'),
      ),
      body: Column(
        children: const [
          Expanded(
            child: Center(
              child: Text('Welcome to the Sale Collection Page!'),
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}
