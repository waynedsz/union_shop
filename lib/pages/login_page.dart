import 'package:flutter/material.dart ';
import 'package:union_shop/reusable_content/footer.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Column(
        children: const [
          Expanded(
            child: Center(
              child: Text('Welcome to the Login Page!'),
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}
