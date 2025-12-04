import 'package:flutter/foundation.dart';
import 'package:union_shop/reusable_content/cart_widgets/cart_item.dart';
import 'package:union_shop/reusable_content/product_widgets/product.dart';

class CartState extends ChangeNotifier {
  final List<CartItem> items = [];

  void addToCart(Product product) {
    final index = items.indexWhere((item) => item.product == product);
    if (index != -1) {
      items[index] = CartItem(
        product: items[index].product,
        quantity: items[index].quantity + 1,
      );
    } else {
      items.add(CartItem(product: product, quantity: 1));
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    final index = items.indexWhere((item) => item.product == product);
    if (index != -1) {
      final existing = items[index];
      if (existing.quantity > 1) {
        items[index] = CartItem(
          product: existing.product,
          quantity: existing.quantity - 1,
        );
      } else {
        items.removeAt(index);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    items.clear();
    notifyListeners();
  }
}
