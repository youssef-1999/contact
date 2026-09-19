import 'package:contact_app/screens/Intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('IntroScreen renders', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: IntroScreen()));

    expect(find.byType(IntroScreen), findsOneWidget);
  });
}
