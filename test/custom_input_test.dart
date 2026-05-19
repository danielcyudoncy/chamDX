import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:chamdx/widgets/custom_input.dart';

void main() {
  Widget buildTestableWidget(Widget child) {
    return MaterialApp(
      home: Scaffold(
        body: child,
      ),
    );
  }

  group('CustomInput Widget Tests', () {
    testWidgets('displays normal input text field without toggle icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          const CustomInput(
            label: 'Username',
            hint: 'Enter username',
          ),
        ),
      );

      // Verify label and hint
      expect(find.text('Username'), findsOneWidget);
      expect(find.text('Enter username'), findsOneWidget);

      // Verify no visibility icon
      expect(find.byIcon(Icons.visibility), findsNothing);
      expect(find.byIcon(Icons.visibility_off), findsNothing);

      // Verify it is not obscured
      final TextField textField = tester.widget(find.byType(TextField));
      expect(textField.obscureText, isFalse);
    });

    testWidgets('displays password field and toggles obscureText', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          const CustomInput(
            label: 'Password',
            hint: '••••••••',
            isPassword: true,
          ),
        ),
      );

      // Verify label
      expect(find.text('Password'), findsOneWidget);

      // Initially obscureText should be true
      TextField textField = tester.widget(find.byType(TextField));
      expect(textField.obscureText, isTrue);

      // Verify off icon is present initially
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
      expect(find.byIcon(Icons.visibility), findsNothing);

      // Tap on toggle icon
      await tester.tap(find.byType(IconButton));
      await tester.pump();

      // Verify obscureText is now false
      textField = tester.widget(find.byType(TextField));
      expect(textField.obscureText, isFalse);

      // Verify on icon is present now
      expect(find.byIcon(Icons.visibility), findsOneWidget);
      expect(find.byIcon(Icons.visibility_off), findsNothing);

      // Tap again to toggle back
      await tester.tap(find.byType(IconButton));
      await tester.pump();

      // Verify obscureText is true again
      textField = tester.widget(find.byType(TextField));
      expect(textField.obscureText, isTrue);
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
      expect(find.byIcon(Icons.visibility), findsNothing);
    });
  });
}
