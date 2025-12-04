import 'package:flutter/material.dart';

class NavigationController {
  static void goHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  static void goCollections(BuildContext context) {
    Navigator.pushNamed(context, '/collections');
  }

  static void goAbout(BuildContext context) {
    Navigator.pushNamed(context, '/about');
  }

  static void goSale(BuildContext context) {
    Navigator.pushNamed(context, '/sale');
  }

  static void goLogin(BuildContext context) {
    Navigator.pushNamed(context, '/login');
  }

  static void goCart(BuildContext context) {
    Navigator.pushNamed(context, '/cart');
  }
}
