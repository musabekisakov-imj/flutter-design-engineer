import 'package:demo/booking_screen.dart';
import 'package:demo/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders the refined flow and switches to before', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1280, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      MaterialApp(theme: buildDemoTheme(), home: const BookingDemoShell()),
    );

    expect(find.text('Your time, considered.'), findsOneWidget);
    expect(find.text('Classic haircut · Ethan Cole'), findsOneWidget);
    expect(find.text('11:00 AM'), findsWidgets);

    await tester.tap(find.text('Before'));
    await tester.pumpAndSettle();

    expect(find.text('Book Your Perfect Look'), findsOneWidget);
    expect(find.text('Your time, considered.'), findsNothing);
  });
}
