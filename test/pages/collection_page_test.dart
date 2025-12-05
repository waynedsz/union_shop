import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/collection_page.dart';
import 'package:union_shop/reusable_content/product_widgets/product.dart';

void main() {
  group('CollectionPage', () {
    testWidgets('renders with default collection name when no arguments',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CollectionPage(),
        ),
      );
      expect(find.text('Selected Collection'), findsOneWidget);
      expect(
          find.text('Browse a curated selection of products.'), findsOneWidget);
      expect(find.byType(DropdownButtonFormField<String>), findsOneWidget);
      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('renders with collection name from String argument',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          onGenerateRoute: (settings) {
            return MaterialPageRoute(
              builder: (context) => CollectionPage(),
              settings: RouteSettings(arguments: 'Test Collection'),
            );
          },
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Test Collection'), findsOneWidget);
    });

    testWidgets('renders with collection name from Map argument',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          onGenerateRoute: (settings) {
            return MaterialPageRoute(
              builder: (context) => CollectionPage(),
              settings: RouteSettings(
                  arguments: {'collectionName': 'Map Collection'}),
            );
          },
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Map Collection'), findsOneWidget);
    });

    testWidgets('sort dropdown changes sort order',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CollectionPage(),
        ),
      );
      await tester.pumpAndSettle();
      final dropdown = find.byType(DropdownButtonFormField<String>);
      expect(dropdown, findsOneWidget);

      await tester.tap(dropdown);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Price: High → Low').last);
      await tester.pumpAndSettle();

      expect(find.text('Price: High → Low'), findsOneWidget);
    });
  });
}
