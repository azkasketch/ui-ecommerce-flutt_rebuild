import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ui_ecommerce_rebuild/main.dart';

void main() {
  testWidgets('shows the Vanta Market login screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Good to see you.'), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
  });
}
