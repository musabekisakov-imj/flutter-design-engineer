import 'package:demo/booking_screen.dart';
import 'package:demo/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

Widget fixture(DemoMode mode) => MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: buildDemoTheme(),
  home: BookingDemoShell(initialMode: mode),
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    final textLoader = FontLoader('DemoRoboto')
      ..addFont(rootBundle.load('assets/fonts/Roboto-Regular.ttf'));
    final iconLoader = FontLoader('MaterialIcons')
      ..addFont(rootBundle.load('assets/fonts/MaterialIcons-Regular.otf'));
    await Future.wait([textLoader.load(), iconLoader.load()]);
  });

  testWidgets('compact before', (tester) async {
    tester.view.physicalSize = const Size(430, 932);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(fixture(DemoMode.before));
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(BookingDemoShell),
      matchesGoldenFile('../goldens/compact-before.png'),
    );
  });

  testWidgets('compact after', (tester) async {
    tester.view.physicalSize = const Size(430, 1100);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(fixture(DemoMode.after));
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(BookingDemoShell),
      matchesGoldenFile('../goldens/compact-after.png'),
    );
  });

  testWidgets('expanded after', (tester) async {
    tester.view.physicalSize = const Size(1280, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(fixture(DemoMode.after));
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(BookingDemoShell),
      matchesGoldenFile('../goldens/expanded-after.png'),
    );
  });
}
