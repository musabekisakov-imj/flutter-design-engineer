import 'package:flutter/material.dart';

import 'product_studio_models.dart';
import 'product_studio_screens.dart';
import 'product_studio_theme.dart';
import 'product_studio_widgets.dart';

class ProductStudioApp extends StatelessWidget {
  const ProductStudioApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Product Studio',
    theme: buildProductStudioTheme(),
    home: const ProductStudioShell(),
  );
}

class ProductStudioShell extends StatefulWidget {
  const ProductStudioShell({
    super.key,
    this.initialPage = StudioPage.workspace,
    this.initialState = StudioViewState.populated,
    this.showFixtureControls = true,
  });

  final StudioPage initialPage;
  final StudioViewState initialState;
  final bool showFixtureControls;

  @override
  State<ProductStudioShell> createState() => _ProductStudioShellState();
}

class _ProductStudioShellState extends State<ProductStudioShell> {
  late StudioPage page = widget.initialPage;
  late StudioViewState viewState = widget.initialState;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final expanded = constraints.maxWidth >= 720;
          final content = StudioPageContent(
            key: ValueKey((page, viewState, expanded)),
            page: page,
            viewState: viewState,
            expanded: expanded,
          );

          if (expanded) {
            return Row(
              children: [
                StudioNavigation(
                  page: page,
                  expanded: true,
                  onSelected: _selectPage,
                ),
                Expanded(
                  child: Column(
                    children: [
                      if (widget.showFixtureControls)
                        _FixtureControls(
                          page: page,
                          state: viewState,
                          onPageChanged: _selectPage,
                          onStateChanged: (value) =>
                              setState(() => viewState = value),
                        ),
                      Expanded(child: _AnimatedContent(child: content)),
                    ],
                  ),
                ),
              ],
            );
          }

          return Column(
            children: [
              if (widget.showFixtureControls)
                _FixtureControls(
                  page: page,
                  state: viewState,
                  onPageChanged: _selectPage,
                  onStateChanged: (value) => setState(() => viewState = value),
                ),
              Expanded(child: _AnimatedContent(child: content)),
              StudioNavigation(
                page: page,
                expanded: false,
                onSelected: _selectPage,
              ),
            ],
          );
        },
      ),
    ),
  );

  void _selectPage(StudioPage value) => setState(() {
    page = value;
    viewState = StudioViewState.populated;
  });
}

class _AnimatedContent extends StatelessWidget {
  const _AnimatedContent({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) => AnimatedSwitcher(
    duration: MediaQuery.disableAnimationsOf(context)
        ? Duration.zero
        : const Duration(milliseconds: 180),
    child: child,
  );
}

class _FixtureControls extends StatelessWidget {
  const _FixtureControls({
    required this.page,
    required this.state,
    required this.onPageChanged,
    required this.onStateChanged,
  });

  final StudioPage page;
  final StudioViewState state;
  final ValueChanged<StudioPage> onPageChanged;
  final ValueChanged<StudioViewState> onStateChanged;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: const BoxDecoration(
      color: studioSurface,
      border: Border(bottom: BorderSide(color: studioDivider)),
    ),
    child: Row(
      children: [
        const Expanded(
          child: Text(
            'DETERMINISTIC PRODUCT STUDIO FIXTURE',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: studioMuted,
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: .8,
            ),
          ),
        ),
        PopupMenuButton<StudioPage>(
          tooltip: 'Change screen',
          initialValue: page,
          onSelected: onPageChanged,
          itemBuilder: (context) => StudioPage.values
              .map(
                (value) => PopupMenuItem(value: value, child: Text(value.name)),
              )
              .toList(),
          child: StudioPill(page.name),
        ),
        const SizedBox(width: 8),
        PopupMenuButton<StudioViewState>(
          tooltip: 'Change fixture state',
          initialValue: state,
          onSelected: onStateChanged,
          itemBuilder: (context) => StudioViewState.values
              .map(
                (value) => PopupMenuItem(value: value, child: Text(value.name)),
              )
              .toList(),
          child: StudioPill(state.name),
        ),
      ],
    ),
  );
}
