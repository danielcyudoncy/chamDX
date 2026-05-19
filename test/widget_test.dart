// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:chamdx/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ChamDXApp());
    expect(find.byType(MaterialApp), findsOneWidget);
    // Pump for 2 seconds to complete the splash screen timer and prevent pending timer failure
    await tester.pumpAndSettle(const Duration(seconds: 2));
  });
}
