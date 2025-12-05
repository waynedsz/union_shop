import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/pages/product_page.dart';
import 'package:union_shop/reusable_content/product_widgets/product.dart';
import 'package:union_shop/reusable_content/cart_widgets/cart_state.dart';
import 'package:union_shop/reusable_content/header.dart';

void main() {
  testWidgets('ProductPage renders product details and interactions work',
      (WidgetTester tester) async {
    // Mock product
    final product = Product(
      id: 'p1',
      name: 'Test Product',
      price: 10.0,
      imagePath: 'assets/images/test.png',
      description: 'Test description',
      discountPercent: null,
      isOnSale: false,
    );

    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => CartState(),
        child: MaterialApp(
          home: ProductPage(product: product),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Header exists
    expect(find.byType(Header), findsOneWidget);

    // Product name, price, description
    expect(find.text('Test Product'), findsWidgets);
    expect(find.text('£10.00'), findsWidgets);
    expect(find.text('Test description'), findsOneWidget);

    // Quantity buttons
    final increment = find.byIcon(Icons.add);
    final decrement = find.byIcon(Icons.remove);
    expect(increment, findsOneWidget);
    expect(decrement, findsOneWidget);

    // Tap increment
    await tester.tap(increment);
    await tester.pump();
    expect(find.text('2'), findsOneWidget);

    // Tap decrement
    await tester.tap(decrement);
    await tester.pump();
    expect(find.text('1'), findsOneWidget);

    // Add to Cart button exists and tap
    final addButton = find.text('Add to Cart');
    expect(addButton, findsOneWidget);
    await tester.tap(addButton);
    await tester.pump();
  });
}
