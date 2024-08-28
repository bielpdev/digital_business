import 'package:digital_business/src/card_model.dart';
import 'package:digital_business/src/widget_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Deve retornar um windget', (WidgetTester) async {
    var model = CardModel;
    await WidgetTester.pumpWidget(
        const MaterialApp(home: Scaffold(body: TwitterWidget())));

    final buttonFinder = find.byType(ElevatedButton);
    expect(buttonFinder, findsOneWidget);
    await WidgetTester.pump();
  });
  testWidgets('Deve retornar um windget 2', (WidgetTester) async {
    await WidgetTester.pumpWidget(
        const MaterialApp(home: Scaffold(body: TwitterWidget())));

    final buttonFinder = find.byType(ElevatedButton);
    expect(buttonFinder, findsNothing);
    await WidgetTester.pump();
  });
}
