import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/collections_page.dart';
import 'package:union_shop/reusable_content/header.dart';
import 'package:union_shop/reusable_content/footer.dart';
import 'package:union_shop/reusable_content/collection_widgets/collection_tile.dart';

void main() {
  testWidgets('CollectionsPage renders grid and footer, tile tap works',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionsPage(),
      ),
    );

    // Allow any animations to settle
    await tester.pumpAndSettle();

    // Header exists
    expect(find.byType(Header), findsOneWidget);

    // Footer exists
    expect(find.byType(Footer), findsOneWidget);

    // CollectionTile grid exists
    expect(find.byType(CollectionTile), findsWidgets);

    // Tap first collection tile
    final firstTile = find.byType(CollectionTile).first;
    await tester.tap(firstTile);
    await tester.pump();

    // We cannot check actual Navigator push without a mock,
    // but tapping should not throw errors
  });
}
