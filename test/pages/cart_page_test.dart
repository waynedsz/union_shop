import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/pages/cart_page.dart';
import 'package:union_shop/reusable_content/cart_widgets/cart_state.dart';
import 'package:union_shop/reusable_content/product_widgets/product.dart';
import 'package:union_shop/reusable_content/cart_widgets/cart_item_tile.dart';
import 'package:union_shop/reusable_content/cart_widgets/empty_cart_view.dart';
import 'package:union_shop/reusable_content/header.dart';
import 'package:union_shop/reusable_content/footer.dart';

void main() {
  testWidgets('CartPage shows empty cart and footer', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => CartState(),
        child: const MaterialApp(home: CartPage()),
      ),
    );

    await tester.pumpAndSettle();

    // Header exists
    expect(find.byType(Header), findsOneWidget);

    // EmptyCartView shows
    expect(find.byType(EmptyCartView), findsOneWidget);

    // Footer shows
    expect(find.byType(Footer), findsOneWidget);
  });

  testWidgets('CartPage shows items and bottom bar total', (WidgetTester tester) async {
    final cartState = CartState();

    // Add mock product
    final product = Product(
      name: 'Test Product',
      price: 10.0,
      imagePath: 'assets/images/test.png',
      description: 'Test description',
      discountPercent: null,
      isOnSale: false,
      category: 'Test Category',
    );

    cartState.addToCart(product);

    await tester.pumpWidget(
      ChangeNotifierProvider<CartState>.value(
        value: cartState,
        child: const MaterialApp(home: CartPage()),
      ),
    );

    await tester.pumpAndSettle();

    // CartItemTile exists
    expect(find.byType(CartItemTile), findsOneWidget);

    // Bottom bar shows correct total
    final totalText = find.text('£10.00');
    expect(totalText, findsOneWidget);

    // Tap increment and decrement buttons
    final increment = find.byIcon(Icons.add_circle_outline);
    final decrement = find.byIcon(Icons.remove_circle_outline);
    expect(increment, findsOneWidget);
    expect(decrement, findsOneWidget);