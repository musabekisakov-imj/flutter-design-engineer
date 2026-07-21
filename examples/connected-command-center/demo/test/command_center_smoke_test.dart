import 'package:demo/command_center_models.dart';
import 'package:demo/command_center_screen.dart';
import 'package:demo/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget fixture({ShowcaseState state = ShowcaseState.populated}) => MaterialApp(
  theme: buildDemoTheme(),
  home: CommandCenterShell(key: ValueKey(state), initialState: state),
);

void main() {
  testWidgets('connects workspace, finance, and travel in expanded layout', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1280, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(fixture());

    expect(find.text('Flutter Design Engineer'), findsOneWidget);
    expect(find.text(r'+$12.4k'), findsOneWidget);
    expect(find.text('Tokyo'), findsOneWidget);
    expect(find.text('AI BRIEF · 3 ACTIONS'), findsOneWidget);
  });

  testWidgets('exposes recoverable and empty states', (tester) async {
    await tester.pumpWidget(fixture(state: ShowcaseState.error));
    expect(find.text('Retry connection'), findsOneWidget);

    await tester.pumpWidget(fixture(state: ShowcaseState.empty));
    await tester.pumpAndSettle();
    expect(find.text('Connect project'), findsOneWidget);
  });

  testWidgets('keeps compact navigation and semantics', (tester) async {
    final semantics = tester.ensureSemantics();
    tester.view.physicalSize = const Size(430, 1100);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(fixture());

    expect(find.text('Your day, connected.'), findsOneWidget);
    expect(find.bySemanticsLabel('Travel'), findsOneWidget);
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Semantics &&
            widget.properties.label == 'Project progress 72 percent',
      ),
      findsOneWidget,
    );
    semantics.dispose();
  });
}
