import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/reusable_content/header.dart';

void main() {
  testWidgets('Header renders title, logo, and buttons on desktop',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: Header(
            title: 'Test Header',
            onNavigateHome: () {},
            onSearchPressed: () {},
            onAboutPressed: () {},
            onLoginPressed: () {},
            onCartPressed: () {},
          ),
        ),
      ),
    );

    // Check header title
    expect(find.text('Test Header'), findsOneWidget);

    // Check logo exists
    expect(find.byType(Image), findsOneWidget);

    // Check navigation icons
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.person_outline), findsOneWidget);
    expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);

    // On desktop width, menu button should not appear
    expect(find.byIcon(Icons.menu), findsNothing);
  });

  testWidgets('Header shows menu button on mobile',
      (WidgetTester tester) async {
    // Mobile screen width
    const size = Size(400, 800);

    await tester.binding.setSurfaceSize(size);

    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: const MediaQueryData(size: size),
          child: Scaffold(
            body: Header(
              title: 'Test Header',
              onNavigateHome: () {},
              onSearchPressed: () {},
              onAboutPressed: () {},
              onLoginPressed: () {},
              onCartPressed: () {},
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Menu button should exist on mobile
    expect(find.byIcon(Icons.menu), findsOneWidget);

    // Navigation icons still exist
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.person_outline), findsOneWidget);
    expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);

    // Reset surface size after test
    await tester.binding.setSurfaceSize(null);
  });
}
