import 'package:demo/command_center_models.dart';
import 'package:demo/command_center_screen.dart';
import 'package:demo/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

Widget fixture(ShowcaseState state) => MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: buildDemoTheme(),
  home: CommandCenterShell(initialState: state, showStateControls: false),
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

  testWidgets('compact populated', (tester) async {
    tester.view.physicalSize = const Size(430, 1180);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(fixture(ShowcaseState.populated));
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(CommandCenterShell),
      matchesGoldenFile('../goldens/compact-command-center.png'),
    );
  }, tags: ['golden']);

  testWidgets('expanded populated', (tester) async {
    tester.view.physicalSize = const Size(1440, 960);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(fixture(ShowcaseState.populated));
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(CommandCenterShell),
      matchesGoldenFile('../goldens/expanded-command-center.png'),
    );
  }, tags: ['golden']);

  testWidgets('expanded error', (tester) async {
    tester.view.physicalSize = const Size(1440, 960);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(fixture(ShowcaseState.error));
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(CommandCenterShell),
      matchesGoldenFile('../goldens/error-command-center.png'),
    );
  }, tags: ['golden']);
}
