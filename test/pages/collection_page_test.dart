import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/collection_page.dart';
import 'package:union_shop/reusable_content/header.dart';
import 'package:union_shop/reusable_content/footer.dart';
import 'package:union_shop/reusable_content/product_widgets/product_tile.dart';

void main() {
  testWidgets(
      'CollectionPage renders grid, dropdown, footer, product tap works',
      (WidgetTester tester) async {
    // Provide a mock argument for the collection
    final mockArgs = 'Test Collection';

    await tester.pumpWidget(
      MaterialApp(
        home: CollectionPage(),
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (_) => const CollectionPage(),
          settings: settings,
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Header exists
    expect(find.byType(Header), findsOneWidget);

    // Dropdown exists
    expect(find.byType(DropdownButtonFormField<String>), findsOneWidget);

    // Change dropdown value
    await tester.tap(find.byType(DropdownButtonFormField<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Sort Z-A').last);
    await tester.pumpAndSettle();

    // ProductTile grid exists
    expect(find.byType(ProductTile), findsWidgets);

    // Tap first product
    final firstProduct = find.byType(ProductTile).first;
    await tester.tap(firstProduct);
    await tester.pump();

    // Footer exists
    expect(find.byType(Footer), findsOneWidget);
  });
}
