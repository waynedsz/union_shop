import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:union_shop/reusable_content/cart_widgets/cart_item.dart';
import 'package:union_shop/reusable_content/product_widgets/product.dart';

class CartState extends ChangeNotifier {
  final List<CartItem> items = [];

  CartState() {
    _loadCart();
  }

  // Add a single product
  void addToCart(Product product) {
    final index = items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      items[index] = CartItem(
        product: items[index].product,
        quantity: items[index].quantity + 1,
      );
    } else {
      items.add(CartItem(product: product, quantity: 1));
    }
    _saveCart();
    notifyListeners();
  }

  // Add multiple quantities
  void addMultiple(Product product, int qty) {
    final index = items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      items[index] = CartItem(
        product: product,
        quantity: items[index].quantity + qty,
      );
    } else {
      items.add(CartItem(product: product, quantity: qty));
    }
    _saveCart();
    notifyListeners();
  }

  // Remove one quantity of a product
  void removeFromCart(Product product) {
    final index = items.indexWhere((item) => item.product.id == product.id);
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
      _saveCart();
      notifyListeners();
    }
  }

  void clearCart() {
    items.clear();
    _saveCart();
    notifyListeners();
  }

  // --- Persistence ---
  Future<void> _saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> jsonItems = items.map((item) {
      final p = item.product;
      return {
        'product': {
          'id': p.id,
          'name': p.name,
          'price': p.price,
          'imagePath': p.imagePath,
          'discountPercent': p.discountPercent,
          'isOnSale': p.isOnSale,
          'description': p.description,
        },
        'quantity': item.quantity,
      };
    }).toList();
    await prefs.setString('cart_items', json.encode(jsonItems));
  }

  Future<void> _loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString('cart_items');
    if (data != null) {
      try {
        final List<dynamic> jsonItems = json.decode(data);
        items.clear();
        for (var itemJson in jsonItems) {
          final p = itemJson['product'];
          items.add(CartItem(
            product: Product(
              id: p['id'],
              name: p['name'],
              price: (p['price'] as num).toDouble(),
              imagePath: p['imagePath'],
              discountPercent: p['discountPercent'] != null
                  ? (p['discountPercent'] as num).toDouble()
                  : null,
              isOnSale: p['isOnSale'] ?? false,
              description: p['description'] ?? '',
            ),
            quantity: itemJson['quantity'] ?? 1,
          ));
        }
        notifyListeners();
      } catch (_) {
        items.clear();
      }
    }
  }
}
