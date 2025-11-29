import 'package:flutter/material.dart';

class SaleCollection extends StatelessWidget {
  const SaleCollection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sale Collection'),
      ),
      body: const Center(
        child: Text('Welcome to the Sale Collection Page!'),
      ),
    );
  }
}
