// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:untitled10/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('VKI Hesaplama Uygulama Testi', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(VKIHesaplamaApp());

    // Find the widgets we need to interact with and enter values.
    final kiloField = find.byType(TextField).first;
    final boyField = find.byType(TextField).at(1);
    final hesaplaButton = find.byType(ElevatedButton);

    // Enter test values for kilo and boy.
    await tester.enterText(kiloField, '70');
    await tester.enterText(boyField, '175');

    // Tap the hesapla button.
    await tester.tap(hesaplaButton);

    // Wait for the results to appear and check the output.
    await tester.pumpAndSettle();
    expect(find.text('VKI Sonucu: 22.86'), findsOneWidget);
    expect(find.text('Durumu: Normal'), findsOneWidget);
  });
}
