import 'package:editorial_booking/booking_controller.dart';
import 'package:editorial_booking/booking_fixtures.dart';
import 'package:editorial_booking/booking_flow_screen.dart';
import 'package:editorial_booking/booking_models.dart';
import 'package:editorial_booking/booking_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget accessibleFixture(
  BookingController controller, {
  double textScale = 1,
  TextDirection direction = TextDirection.ltr,
  bool disableAnimations = false,
}) {
  return MediaQuery(
    data: MediaQueryData(
      textScaler: TextScaler.linear(textScale),
      disableAnimations: disableAnimations,
    ),
    child: Directionality(
      textDirection: direction,
      child: MaterialApp(
        theme: buildBookingTheme(),
        home: BookingFlowScreen(controller: controller),
      ),
    ),
  );
}

BookingController selectedController(BookingStep step) {
  final controller = BookingController();
  controller.selectService(bookingServices.first);
  controller.selectBarber(barbers[1]);
  controller.selectDay(bookingDays[2]);
  controller.selectSlot(bookingDays[2].slots[4]);
  controller.goTo(step);
  return controller;
}

void main() {
  testWidgets('selection exposes state and progress semantics', (tester) async {
    final semantics = tester.ensureSemantics();
    final controller = BookingController()
      ..selectService(bookingServices.first);
    await tester.pumpWidget(accessibleFixture(controller));

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Semantics &&
            widget.properties.label == 'Booking progress, step 1 of 5',
      ),
      findsOneWidget,
    );
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Semantics &&
            widget.properties.label == 'Signature cut, 45 minutes, €42',
      ),
      findsOneWidget,
    );
    semantics.dispose();
  });

  testWidgets('review remains reachable at 200 percent text', (tester) async {
    tester.view.physicalSize = const Size(430, 1180);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    final controller = selectedController(BookingStep.review);

    await tester.pumpWidget(accessibleFixture(controller, textScale: 2));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('customer-name')), findsOneWidget);
    expect(find.byKey(const Key('confirm-booking')), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('RTL and reduced motion preserve the core task', (tester) async {
    final controller = selectedController(BookingStep.availability);
    await tester.pumpWidget(
      accessibleFixture(
        controller,
        direction: TextDirection.rtl,
        disableAnimations: true,
      ),
    );
    controller.goTo(BookingStep.review);
    await tester.pump();

    expect(find.text('Check your visit'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
