import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/reusable_content/footer.dart';

void main() {
  testWidgets('Footer renders and contains text or links',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Footer(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Check Footer widget exists
    expect(find.byType(Footer), findsOneWidget);

    // Check some expected text exists (you can add your footer text if needed)
    expect(find.textContaining('©'), findsWidgets);

    // Check for any links/buttons if present (example)
    // Replace with your actual Footer link texts if needed
    // expect(find.text('About'), findsOneWidget);
    // expect(find.text('Contact'), findsOneWidget);
  });
}
