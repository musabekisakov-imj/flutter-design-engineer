import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:product_studio_demo/product_studio_app.dart';
import 'package:product_studio_demo/product_studio_models.dart';
import 'package:product_studio_demo/product_studio_theme.dart';

const phoneSize = Size(390, 844);

Widget fixture(
  StudioPage page, {
  StudioViewState state = StudioViewState.populated,
  TextDirection direction = TextDirection.ltr,
  double textScale = 1,
}) => MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: buildProductStudioTheme(),
  builder: (context, child) => Directionality(
    textDirection: direction,
    child: MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: TextScaler.linear(textScale),
        disableAnimations: true,
      ),
      child: child!,
    ),
  ),
  home: ProductStudioShell(
    initialPage: page,
    initialState: state,
    showFixtureControls: false,
  ),
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    final regular = FontLoader('Roboto')
      ..addFont(rootBundle.load('assets/fonts/Roboto-Regular.ttf'));
    final bold = FontLoader('Roboto')
      ..addFont(rootBundle.load('assets/fonts/Roboto-Bold.ttf'));
    await Future.wait([regular.load(), bold.load()]);
  });

  for (final page in StudioPage.values) {
    testWidgets('phone ${page.name}', (tester) async {
      tester.view.physicalSize = phoneSize;
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      await tester.pumpWidget(fixture(page));
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(ProductStudioShell),
        matchesGoldenFile('../goldens/phone-${page.name}.png'),
      );
    }, tags: ['golden']);
  }

  testWidgets('expanded workspace', (tester) async {
    tester.view.physicalSize = const Size(1024, 768);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(fixture(StudioPage.workspace));
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(ProductStudioShell),
      matchesGoldenFile('../goldens/tablet-workspace.png'),
    );
  }, tags: ['golden']);

  for (final state in [
    StudioViewState.loading,
    StudioViewState.empty,
    StudioViewState.error,
  ]) {
    testWidgets('phone ${state.name}', (tester) async {
      tester.view.physicalSize = phoneSize;
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      await tester.pumpWidget(fixture(StudioPage.workspace, state: state));
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(ProductStudioShell),
        matchesGoldenFile('../goldens/phone-${state.name}.png'),
      );
    }, tags: ['golden']);
  }

  testWidgets('audit supports RTL', (tester) async {
    tester.view.physicalSize = phoneSize;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      fixture(StudioPage.audit, direction: TextDirection.rtl),
    );
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(find.text('Text contrast below AA'), findsOneWidget);
  });

  testWidgets('release remains reachable at 200 percent text', (tester) async {
    tester.view.physicalSize = phoneSize;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(fixture(StudioPage.release, textScale: 2));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(find.text('Generate release report'), findsOneWidget);
  });
}
