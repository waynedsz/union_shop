import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/pages/cart_page.dart';
import 'package:union_shop/reusable_content/cart_widgets/cart_state.dart';
import 'package:union_shop/reusable_content/product_widgets/product.dart';
import 'package:union_shop/reusable_content/cart_widgets/cart_item_tile.dart';

class TestProduct extends Product {
  TestProduct({
    required String name,
    required double price,
  }) : super(
          name: name,
          price: price,
          imagePath: '', // empty so it won't load
          description: 'Test description',
          discountPercent: null,
          isOnSale: false,
          category: 'Test',
        );
}

void main() {
  testWidgets('CartPage shows empty cart correctly', (tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => CartState(),
        child: MaterialApp(home: CartPage()),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(CartItemTile), findsNothing);
    expect(find.text('Your cart is empty'), findsOneWidget);
  });
}
