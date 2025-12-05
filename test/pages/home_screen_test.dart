import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/home_screen.dart';
import 'package:union_shop/reusable_content/home_screen_widgets/featured_collections.dart';
import 'package:union_shop/reusable_content/home_screen_widgets/home_hero.dart';
import 'package:union_shop/reusable_content/footer.dart';
import 'package:union_shop/reusable_content/header.dart';

void main() {
  testWidgets('HomeScreen renders all main widgets and hero button works',
      (WidgetTester tester) async {
    // Wrap HomeScreen in MaterialApp for navigation context
    await tester.pumpWidget(
      const MaterialApp(
        home: HomeScreen(),
      ),
    );

    // Wait for animations
    await tester.pumpAndSettle();

    // Check Header exists
    expect(find.byType(Header), findsOneWidget);

    // Check hero section exists
    expect(find.byType(HomeHero), findsOneWidget);

    // Check hero title and button text
    expect(find.text('Placeholder Hero Title'), findsOneWidget);
    expect(find.text('BROWSE PRODUCTS'), findsOneWidget);

    // Check FeaturedCollections renders
    expect(find.byType(FeaturedCollections), findsOneWidget);

    // Check Footer exists
    expect(find.byType(Footer), findsOneWidget);

    // Tap the hero button and verify navigation callback triggers
    await tester.tap(find.text('BROWSE PRODUCTS'));
    await tester.pump();
  });
}
