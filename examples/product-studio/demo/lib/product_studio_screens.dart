import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'product_studio_models.dart';
import 'product_studio_theme.dart';
import 'product_studio_widgets.dart';

class StudioPageContent extends StatelessWidget {
  const StudioPageContent({
    super.key,
    required this.page,
    required this.viewState,
    required this.expanded,
  });

  final StudioPage page;
  final StudioViewState viewState;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    if (viewState != StudioViewState.populated) {
      return _StateContent(state: viewState);
    }

    final child = switch (page) {
      StudioPage.workspace => WorkspaceScreen(expanded: expanded),
      StudioPage.audit => const AuditScreen(),
      StudioPage.system => const DesignSystemScreen(),
      StudioPage.adaptive => const AdaptivePreviewScreen(),
      StudioPage.visualQa => const VisualQaScreen(),
      StudioPage.release => const ReleaseScreen(),
    };

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        expanded ? 40 : 18,
        24,
        expanded ? 40 : 18,
        26,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1040),
          child: child,
        ),
      ),
    );
  }
}

class WorkspaceScreen extends StatelessWidget {
  const WorkspaceScreen({super.key, required this.expanded});

  final bool expanded;

  @override
  Widget build(BuildContext context) {
    final header = const StudioHeader(
      eyebrow: 'Product Studio / Aurora',
      title: 'Build better.\nShip cleaner.',
      trailing: StudioPill('Release 1.8'),
    );
    final primary = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ReadinessCard(value: productStudioFixture.readiness),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: StudioCard(
                color: studioLime,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    StudioEyebrow('Next action'),
                    SizedBox(height: 22),
                    Text(
                      'Fix checkout\ncontrast',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: StudioCard(
                color: studioSoft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    StudioEyebrow('Adaptive'),
                    SizedBox(height: 22),
                    Text(
                      '3 breakpoints\nverified',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );

    if (!expanded) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [header, const SizedBox(height: 26), primary],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        header,
        const SizedBox(height: 32),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 6, child: primary),
            const SizedBox(width: 20),
            const Expanded(flex: 4, child: _ExpandedWorkspaceSummary()),
          ],
        ),
      ],
    );
  }
}

class _ExpandedWorkspaceSummary extends StatelessWidget {
  const _ExpandedWorkspaceSummary();

  @override
  Widget build(BuildContext context) => StudioCard(
    border: true,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        StudioEyebrow('Today'),
        SizedBox(height: 14),
        Text(
          'Quality queue',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 18),
        CheckRow('Design tokens synchronized'),
        Divider(height: 1),
        CheckRow('Phone and tablet rendered'),
        Divider(height: 1),
        CheckRow('Semantics regression passed'),
      ],
    ),
  );
}

class AuditScreen extends StatelessWidget {
  const AuditScreen({super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const StudioHeader(
        eyebrow: 'Aurora / Checkout',
        title: 'Three fixes will\nmove the needle.',
        trailing: StudioPill('12 findings'),
      ),
      const SizedBox(height: 26),
      const StudioCard(
        color: studioLime,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                StudioEyebrow('AI recommendation'),
                Spacer(),
                StudioPill('+8 pts'),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Clarify the payment hierarchy',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 7),
            Text(
              'The primary action competes with two secondary controls.',
              style: TextStyle(fontSize: 13, color: studioMuted),
            ),
          ],
        ),
      ),
      const SizedBox(height: 12),
      StudioCard(
        border: true,
        child: Column(
          children: productStudioFixture.findings.indexed
              .map(
                (entry) => Column(
                  children: [
                    FindingRow(index: entry.$1, finding: entry.$2),
                    if (entry.$1 < productStudioFixture.findings.length - 1)
                      const Divider(height: 1),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    ],
  );
}

class DesignSystemScreen extends StatelessWidget {
  const DesignSystemScreen({super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const StudioHeader(
        eyebrow: 'Foundations / Semantic',
        title: 'One system.\nEvery surface.',
        trailing: StudioPill('v1.8'),
      ),
      const SizedBox(height: 26),
      StudioCard(
        color: studioInk,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                StudioEyebrow('Core palette', color: Color(0xFFB9C0C8)),
                Spacer(),
                StudioEyebrow('6 tokens', color: Color(0xFFB9C0C8)),
              ],
            ),
            const SizedBox(height: 18),
            Wrap(
              spacing: 9,
              runSpacing: 9,
              children:
                  const [
                        studioPaper,
                        studioSurface,
                        studioBlue,
                        studioLime,
                        studioCoral,
                        studioMuted,
                      ]
                      .map(
                        (color) => Container(
                          width: 39,
                          height: 39,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.white24),
                          ),
                        ),
                      )
                      .toList(),
            ),
            const SizedBox(height: 14),
            const Text(
              'Contrast-aware semantic roles',
              style: TextStyle(color: Color(0xFFB9C0C8), fontSize: 13),
            ),
          ],
        ),
      ),
      const SizedBox(height: 12),
      StudioCard(
        border: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Row(
              children: [
                StudioEyebrow('Components'),
                Spacer(),
                StudioPill('24 synced'),
              ],
            ),
            SizedBox(height: 15),
            _ComponentSample(
              label: 'Primary button',
              trailing: 'Open',
              color: studioInk,
              foreground: Colors.white,
            ),
            SizedBox(height: 9),
            _ComponentSample(
              label: 'Recommendation card',
              trailing: 'AI',
              color: studioLime,
            ),
            SizedBox(height: 9),
            _ComponentSample(
              label: 'List item',
              trailing: 'View',
              color: studioSurface,
              outlined: true,
            ),
          ],
        ),
      ),
    ],
  );
}

class _ComponentSample extends StatelessWidget {
  const _ComponentSample({
    required this.label,
    required this.trailing,
    required this.color,
    this.foreground = studioInk,
    this.outlined = false,
  });
  final String label;
  final String trailing;
  final Color color;
  final Color foreground;
  final bool outlined;

  @override
  Widget build(BuildContext context) => Container(
    height: 48,
    padding: const EdgeInsets.symmetric(horizontal: 14),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(13),
      border: outlined ? Border.all(color: studioDivider) : null,
    ),
    child: Row(
      children: [
        Text(
          label,
          style: TextStyle(
            color: foreground,
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        Text(
          trailing,
          style: TextStyle(color: foreground, fontWeight: FontWeight.w800),
        ),
      ],
    ),
  );
}

class AdaptivePreviewScreen extends StatelessWidget {
  const AdaptivePreviewScreen({super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const StudioHeader(
        eyebrow: 'Preview / Checkout',
        title: 'Responsive means\nintentional.',
        trailing: StudioPill('2 devices'),
      ),
      const SizedBox(height: 26),
      const StudioCard(
        color: studioSoft,
        child: SizedBox(height: 220, child: _DeviceComparison()),
      ),
      const SizedBox(height: 12),
      const StudioCard(
        border: true,
        child: Column(
          children: [
            CheckRow('Compact navigation preserved'),
            Divider(height: 1),
            CheckRow('Content order remains logical'),
            Divider(height: 1),
            CheckRow('No clipped text at 200%'),
          ],
        ),
      ),
    ],
  );
}

class _DeviceComparison extends StatelessWidget {
  const _DeviceComparison();

  @override
  Widget build(BuildContext context) => Semantics(
    label: 'Phone and tablet previews show adaptive checkout composition.',
    child: ExcludeSemantics(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          _DeviceFrame(width: 90, height: 180, tablet: false),
          SizedBox(width: 13),
          _DeviceFrame(width: 150, height: 180, tablet: true),
        ],
      ),
    ),
  );
}

class _DeviceFrame extends StatelessWidget {
  const _DeviceFrame({
    required this.width,
    required this.height,
    required this.tablet,
  });
  final double width;
  final double height;
  final bool tablet;

  @override
  Widget build(BuildContext context) => Container(
    width: width,
    height: height,
    padding: const EdgeInsets.all(9),
    decoration: BoxDecoration(
      color: studioPaper,
      border: Border.all(color: studioInk, width: 4),
      borderRadius: BorderRadius.circular(tablet ? 16 : 21),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width * .42,
          height: 8,
          decoration: BoxDecoration(
            color: studioInk,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 9),
        if (tablet)
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: studioBlue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: studioLime,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          )
        else ...[
          Container(
            height: 55,
            decoration: BoxDecoration(
              color: studioBlue,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 7),
          Container(
            height: 9,
            decoration: BoxDecoration(
              color: studioInk,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            width: width * .55,
            height: 9,
            decoration: BoxDecoration(
              color: studioDivider,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ],
    ),
  );
}

class VisualQaScreen extends StatelessWidget {
  const VisualQaScreen({super.key, this.accepted = false});
  final bool accepted;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      StudioHeader(
        eyebrow: 'Golden / Phone 390',
        title: 'See exactly\nwhat changed.',
        trailing: StudioPill(
          accepted ? 'Accepted' : '2 diffs',
          critical: !accepted,
        ),
      ),
      const SizedBox(height: 26),
      StudioCard(
        color: studioSoft,
        padding: EdgeInsets.zero,
        child: _DiffPreview(accepted: accepted),
      ),
      const SizedBox(height: 12),
      StudioCard(
        color: accepted ? studioSoft : studioLime,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                StudioEyebrow(accepted ? 'Accepted change' : 'Detected change'),
                const Spacer(),
                const StudioPill('8 px'),
              ],
            ),
            const SizedBox(height: 14),
            const Text(
              'Card padding increased',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 5),
            Text(
              accepted
                  ? 'Reviewed by product design · token space.300'
                  : 'Likely intentional · token space.300',
              style: const TextStyle(color: studioMuted, fontSize: 13),
            ),
          ],
        ),
      ),
      const SizedBox(height: 12),
      StudioCard(
        border: true,
        child: Row(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StudioEyebrow('Review status'),
                SizedBox(height: 5),
                Text(
                  '1 approved · 1 open',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const Spacer(),
            Text(
              accepted ? 'OK' : 'Open',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    ],
  );
}

class _DiffPreview extends StatelessWidget {
  const _DiffPreview({required this.accepted});
  final bool accepted;

  @override
  Widget build(BuildContext context) => Semantics(
    label: accepted
        ? 'Accepted screenshot difference: card padding increased by 8 pixels.'
        : 'Screenshot difference requiring review: card padding increased by 8 pixels.',
    child: ExcludeSemantics(
      child: SizedBox(
        height: 205,
        child: Row(
          children: [
            Expanded(
              child: _DiffSide(
                label: 'Baseline',
                dark: false,
                accepted: accepted,
              ),
            ),
            Expanded(
              child: _DiffSide(
                label: 'Current',
                dark: true,
                accepted: accepted,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class _DiffSide extends StatelessWidget {
  const _DiffSide({
    required this.label,
    required this.dark,
    required this.accepted,
  });
  final String label;
  final bool dark;
  final bool accepted;

  @override
  Widget build(BuildContext context) => Container(
    color: dark ? studioInk : studioSoft,
    padding: const EdgeInsets.all(14),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StudioEyebrow(
          label,
          color: dark ? const Color(0xFFB9C0C8) : studioMuted,
        ),
        const SizedBox(height: 14),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: dark ? studioBlue : const Color(0xFFCDD3DC),
              borderRadius: BorderRadius.circular(15),
              border: dark && !accepted
                  ? Border.all(color: studioCoral, width: 3)
                  : null,
            ),
            child: dark && !accepted
                ? const Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: StudioPill('Diff', critical: true),
                    ),
                  )
                : null,
          ),
        ),
      ],
    ),
  );
}

class ReleaseScreen extends StatelessWidget {
  const ReleaseScreen({super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const StudioHeader(
        eyebrow: 'Final quality gate',
        title: 'Ready when\nthe product is.',
        trailing: StudioPill('Release 1.8'),
      ),
      const SizedBox(height: 26),
      const StudioCard(color: studioInk, child: _ReleaseScore()),
      const SizedBox(height: 12),
      const Row(
        children: [
          Expanded(
            child: StudioCard(
              border: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StudioEyebrow('Accessibility'),
                  SizedBox(height: 18),
                  Text(
                    'AA verified',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: StudioCard(
              border: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StudioEyebrow('Visual QA'),
                  SizedBox(height: 18),
                  Text(
                    '24/24 passed',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 12),
      StudioAction(onPressed: () {}, label: 'Generate release report'),
    ],
  );
}

class _ReleaseScore extends StatelessWidget {
  const _ReleaseScore();

  @override
  Widget build(BuildContext context) => Semantics(
    label:
        'Release readiness 92 percent. Excellent readiness. All critical checks resolved.',
    child: ExcludeSemantics(
      child: Column(
        children: [
          SizedBox(
            width: 154,
            height: 154,
            child: CustomPaint(
              painter: const _ScorePainter(value: .92),
              child: const Center(
                child: Text(
                  '92',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -2,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'Excellent readiness',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'All critical checks resolved',
            style: TextStyle(color: Color(0xFFB9C0C8), fontSize: 13),
          ),
        ],
      ),
    ),
  );
}

class _ScorePainter extends CustomPainter {
  const _ScorePainter({required this.value});
  final double value;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round;
    paint.color = const Color(0xFF343C45);
    canvas.drawArc(rect.deflate(9), -math.pi / 2, math.pi * 2, false, paint);
    paint.color = studioLime;
    canvas.drawArc(
      rect.deflate(9),
      -math.pi / 2,
      math.pi * 2 * value,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _ScorePainter oldDelegate) =>
      oldDelegate.value != value;
}

class _StateContent extends StatelessWidget {
  const _StateContent({required this.state});
  final StudioViewState state;

  @override
  Widget build(BuildContext context) {
    final (title, body, glyph) = switch (state) {
      StudioViewState.loading => (
        'Checking Aurora',
        'Refreshing audit, adaptive, and visual QA results.',
        '···',
      ),
      StudioViewState.empty => (
        'Start with an audit',
        'Connect a Flutter project to create its first quality baseline.',
        '+',
      ),
      StudioViewState.error => (
        'Visual QA is unavailable',
        'Your audit and design-system results are safe. Retry only this check.',
        '!',
      ),
      StudioViewState.populated => throw StateError(
        'Populated state is rendered separately.',
      ),
    };
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 470),
          child: StudioCard(
            color: state == StudioViewState.error
                ? const Color(0xFFFFE4DF)
                : studioSurface,
            border: true,
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: state == StudioViewState.error
                        ? studioCoral
                        : studioBlue,
                    borderRadius: BorderRadius.circular(19),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    glyph,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 10),
                Text(body, textAlign: TextAlign.center),
                if (state == StudioViewState.error) ...[
                  const SizedBox(height: 20),
                  StudioAction(onPressed: () {}, label: 'Retry visual QA'),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
