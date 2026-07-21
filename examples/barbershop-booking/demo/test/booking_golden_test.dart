import 'package:editorial_booking/booking_controller.dart';
import 'package:editorial_booking/booking_fixtures.dart';
import 'package:editorial_booking/booking_flow_screen.dart';
import 'package:editorial_booking/booking_models.dart';
import 'package:editorial_booking/booking_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

Widget goldenFixture(BookingController controller, {double textScale = 1}) {
  return MediaQuery(
    data: MediaQueryData(
      textScaler: TextScaler.linear(textScale),
      disableAnimations: true,
    ),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildBookingTheme(),
      home: BookingFlowScreen(controller: controller),
    ),
  );
}

BookingController goldenController(BookingStep step) {
  final controller = BookingController();
  controller.selectService(bookingServices.first);
  controller.selectBarber(barbers[1]);
  controller.selectDay(bookingDays[2]);
  controller.selectSlot(bookingDays[2].slots[4]);
  controller.updateCustomer(name: 'Alex Morgan', phone: '+31 6 1234 5678');
  controller.goTo(step);
  return controller;
}

Future<void> setPhone(WidgetTester tester) async {
  tester.view.physicalSize = const Size(430, 1000);
  tester.view.devicePixelRatio = 1;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    final sans = FontLoader('DemoRoboto')
      ..addFont(rootBundle.load('assets/fonts/Roboto-Regular.ttf'));
    final display = FontLoader('BookingDisplay')
      ..addFont(rootBundle.load('assets/fonts/CormorantGaramond-Regular.ttf'));
    final icons = FontLoader('MaterialIcons')
      ..addFont(rootBundle.load('assets/fonts/MaterialIcons-Regular.otf'));
    await Future.wait([sans.load(), display.load(), icons.load()]);
  });

  testWidgets('phone service', (tester) async {
    await setPhone(tester);
    addTearDown(tester.view.reset);
    final controller = BookingController()
      ..selectService(bookingServices.first);
    await tester.pumpWidget(goldenFixture(controller));
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(BookingFlowScreen),
      matchesGoldenFile('../goldens/phone-service.png'),
    );
  }, tags: ['golden']);

  testWidgets('phone availability', (tester) async {
    await setPhone(tester);
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      goldenFixture(goldenController(BookingStep.availability)),
    );
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(BookingFlowScreen),
      matchesGoldenFile('../goldens/phone-availability.png'),
    );
  }, tags: ['golden']);

  testWidgets('phone barber', (tester) async {
    await setPhone(tester);
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      goldenFixture(goldenController(BookingStep.barber)),
    );
    await tester.runAsync(
      () => precacheImage(
        const AssetImage('assets/images/barbers-triptych.png'),
        tester.element(find.byType(BookingFlowScreen)),
      ),
    );
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(BookingFlowScreen),
      matchesGoldenFile('../goldens/phone-barber.png'),
    );
  }, tags: ['golden']);

  testWidgets('phone availability error', (tester) async {
    await setPhone(tester);
    addTearDown(tester.view.reset);
    final controller = goldenController(BookingStep.availability)
      ..showAvailabilityError();
    await tester.pumpWidget(goldenFixture(controller));
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(BookingFlowScreen),
      matchesGoldenFile('../goldens/phone-availability-error.png'),
    );
  }, tags: ['golden']);

  testWidgets('phone review', (tester) async {
    await setPhone(tester);
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      goldenFixture(goldenController(BookingStep.review)),
    );
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(BookingFlowScreen),
      matchesGoldenFile('../goldens/phone-review.png'),
    );
  }, tags: ['golden']);

  testWidgets('phone confirmation', (tester) async {
    await setPhone(tester);
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      goldenFixture(goldenController(BookingStep.confirmation)),
    );
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(BookingFlowScreen),
      matchesGoldenFile('../goldens/phone-confirmation.png'),
    );
  }, tags: ['golden']);

  testWidgets('tablet availability', (tester) async {
    tester.view.physicalSize = const Size(1180, 820);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      goldenFixture(goldenController(BookingStep.availability)),
    );
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(BookingFlowScreen),
      matchesGoldenFile('../goldens/tablet-availability.png'),
    );
  }, tags: ['golden']);

  testWidgets('phone review at 200 percent text', (tester) async {
    tester.view.physicalSize = const Size(430, 1180);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      goldenFixture(goldenController(BookingStep.review), textScale: 2),
    );
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(BookingFlowScreen),
      matchesGoldenFile('../goldens/phone-review-text-200.png'),
    );
  }, tags: ['golden']);
}
