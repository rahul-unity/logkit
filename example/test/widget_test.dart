// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter_test/flutter_test.dart';
import 'package:example/main.dart';

void main() {
  testWidgets('Verify log button is present and tappable',
      (WidgetTester tester) async {
    // Load the widget
    await tester.pumpWidget(const MyApp());

    // Find the button
    final buttonFinder = find.text("Generate Random Log");

    // Verify button exists
    expect(buttonFinder, findsOneWidget);

    // Tap the button
    await tester.tap(buttonFinder);
    await tester.pump(); // Rebuild UI after tap

    // Success if no errors occur
  });
}
