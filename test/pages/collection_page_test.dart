import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:union_shop/pages/collection_page.dart';
import 'package:union_shop/reusable_content/header.dart';
import 'package:union_shop/reusable_content/footer.dart';
import 'package:union_shop/reusable_content/product_widgets/product.dart';
import 'package:union_shop/reusable_content/product_widgets/product_tile.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/reusable_content/product_widgets/product_data.dart';
import 'package:union_shop/reusable_content/cart_widgets/cart_state.dart';

void main() {
  // Wrap tests in mockNetworkImagesFor to prevent network exceptions
  testWidgets(
      'CollectionPage renders grid, dropdown, footer, product tap works',
      (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      // Add mock products to collectionProducts for testing
      collectionProducts['Test Collection'] = [
        Product(
          name: 'Mock Product 1',
          price: 10.0,
          imagePath: 'https://example.com/test1.png',
          description: 'Description 1',
          discountPercent: null,
          isOnSale: false,
          category: 'Category 1',
        ),
        Product(
          name: 'Mock Product 2',
          price: 20.0,
          imagePath: 'https://example.com/test2.png',
          description: 'Description 2',
          discountPercent: 10,
          isOnSale: true,
          category: 'Category 1',
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: CollectionPage(),
          onGenerateRoute: (settings) {
            // For navigation triggered by tapping a product
            return MaterialPageRoute(
              builder: (_) => const CollectionPage(),
              settings: settings,
            );
          },
        ),
      );

      await tester.pumpAndSettle();

      // Header exists
      expect(find.byType(Header), findsOneWidget);

      // Dropdown exists
      expect(find.byType(DropdownButtonFormField<String>), findsOneWidget);

      // Tap dropdown and select 'Sort Z-A'
      await tester.tap(find.byType(DropdownButtonFormField<String>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Sort Z-A').last);
      await tester.pumpAndSettle();

      // ProductTile grid exists
      expect(find.byType(ProductTile), findsWidgets);
      expect(find.text('Mock Product 1'), findsOneWidget);
      expect(find.text('Mock Product 2'), findsOneWidget);

      // Tap the first product
      final firstProduct = find.byType(ProductTile).first;
      await tester.tap(firstProduct);
      await tester.pumpAndSettle();

      // Footer exists
      expect(find.byType(Footer), findsOneWidget);
    });
  });
}
