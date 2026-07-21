import 'package:editorial_booking/booking_controller.dart';
import 'package:editorial_booking/booking_fixtures.dart';
import 'package:editorial_booking/booking_flow_screen.dart';
import 'package:editorial_booking/booking_models.dart';
import 'package:editorial_booking/booking_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget fixture(BookingController controller) => MaterialApp(
  theme: buildBookingTheme(),
  home: BookingFlowScreen(controller: controller),
);

BookingController readyController({BookingStep step = BookingStep.review}) {
  final controller = BookingController(submitDelay: Duration.zero);
  controller.selectService(bookingServices.first);
  controller.selectBarber(barbers[1]);
  controller.selectDay(bookingDays[2]);
  controller.selectSlot(bookingDays[2].slots[4]);
  controller.goTo(step);
  return controller;
}

void main() {
  testWidgets('customer can move from service to barber', (tester) async {
    final controller = BookingController();
    await tester.pumpWidget(fixture(controller));

    final continueButton = find.byKey(const Key('continue-booking'));
    expect(tester.widget<FilledButton>(continueButton).onPressed, isNull);

    await tester.tap(find.text('Signature cut'));
    await tester.pump();
    expect(tester.widget<FilledButton>(continueButton).onPressed, isNotNull);

    await tester.tap(continueButton);
    await tester.pumpAndSettle();
    expect(find.text('Who do you prefer?'), findsOneWidget);
  });

  testWidgets('review validates details then confirms once', (tester) async {
    final controller = readyController();
    await tester.pumpWidget(fixture(controller));

    await tester.tap(find.byKey(const Key('confirm-booking')));
    await tester.pump();
    expect(find.text('Enter your full name'), findsOneWidget);
    expect(find.text('Enter a valid mobile number'), findsOneWidget);

    await tester.enterText(
      find.byKey(const Key('customer-name')),
      'Alex Morgan',
    );
    await tester.enterText(
      find.byKey(const Key('customer-phone')),
      '+31 6 1234 5678',
    );
    await tester.tap(find.byKey(const Key('confirm-booking')));
    await tester.pumpAndSettle();

    expect(find.text('Your chair is reserved.'), findsOneWidget);
    expect(controller.submissionCount, 1);
  });

  testWidgets('expanded layout shows persistent summary', (tester) async {
    tester.view.physicalSize = const Size(1100, 850);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    final controller = readyController(step: BookingStep.availability);
    await tester.pumpWidget(fixture(controller));
    await tester.pumpAndSettle();

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Semantics &&
            widget.properties.label == 'Current booking summary',
      ),
      findsOneWidget,
    );
    expect(find.text('Your booking'), findsOneWidget);
    expect(find.text('€42'), findsOneWidget);
  });

  testWidgets('error retry preserves service and barber', (tester) async {
    final controller = readyController(step: BookingStep.availability)
      ..showAvailabilityError();
    await tester.pumpWidget(fixture(controller));

    expect(find.text('Times could not be loaded'), findsOneWidget);
    await tester.tap(find.text('Try again'));
    await tester.pump();

    expect(find.text('Available times'), findsOneWidget);
    expect(controller.service, bookingServices.first);
    expect(controller.barber, barbers[1]);
  });
}
