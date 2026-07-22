import 'package:flutter/material.dart';

import 'product_studio_models.dart';
import 'product_studio_theme.dart';

class StudioEyebrow extends StatelessWidget {
  const StudioEyebrow(this.text, {super.key, this.color});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) => Text(
    text.toUpperCase(),
    style: TextStyle(
      color: color ?? studioMuted,
      fontSize: 11,
      height: 1.2,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.1,
    ),
  );
}

class StudioHeader extends StatelessWidget {
  const StudioHeader({
    super.key,
    required this.eyebrow,
    required this.title,
    this.trailing,
  });

  final String eyebrow;
  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(children: [const StudioMark(), const Spacer(), ?trailing]),
      const SizedBox(height: 24),
      StudioEyebrow(eyebrow),
      const SizedBox(height: 8),
      Text(title, style: Theme.of(context).textTheme.displaySmall),
    ],
  );
}

class StudioMark extends StatelessWidget {
  const StudioMark({super.key});

  @override
  Widget build(BuildContext context) => Semantics(
    label: 'Flutter Product Studio',
    child: ExcludeSemantics(
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(11)),
        clipBehavior: Clip.antiAlias,
        child: const CustomPaint(painter: StudioMarkPainter()),
      ),
    ),
  );
}

class StudioMarkPainter extends CustomPainter {
  const StudioMarkPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final scaleX = size.width / 64;
    final scaleY = size.height / 64;
    canvas.save();
    canvas.scale(scaleX, scaleY);

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(2, 2, 60, 60),
        const Radius.circular(16),
      ),
      Paint()..color = studioInk,
    );

    final upperPlane = Path()
      ..moveTo(16, 18)
      ..lineTo(43, 18)
      ..lineTo(36, 26)
      ..lineTo(16, 26)
      ..close();
    canvas.drawPath(upperPlane, Paint()..color = studioBlue);

    final lowerPlane = Path()
      ..moveTo(16, 31)
      ..lineTo(32, 31)
      ..lineTo(45, 44)
      ..lineTo(29, 44)
      ..close();
    canvas.drawPath(lowerPlane, Paint()..color = const Color(0xFF54C5F8));

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(43, 28, 7, 7),
        const Radius.circular(1.5),
      ),
      Paint()..color = studioLime,
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant StudioMarkPainter oldDelegate) => false;
}

class StudioPill extends StatelessWidget {
  const StudioPill(this.text, {super.key, this.critical = false});

  final String text;
  final bool critical;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
    decoration: BoxDecoration(
      color: critical ? const Color(0xFFFFE4DF) : studioSoft,
      borderRadius: BorderRadius.circular(99),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: critical ? const Color(0xFF922B1E) : studioInk,
        fontSize: 11,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}

class StudioCard extends StatelessWidget {
  const StudioCard({
    super.key,
    required this.child,
    this.color = studioSurface,
    this.padding = const EdgeInsets.all(18),
    this.border = false,
  });

  final Widget child;
  final Color color;
  final EdgeInsetsGeometry padding;
  final bool border;

  @override
  Widget build(BuildContext context) => Container(
    padding: padding,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20),
      border: border ? Border.all(color: studioDivider) : null,
    ),
    child: child,
  );
}

class ReadinessCard extends StatelessWidget {
  const ReadinessCard({super.key, required this.value});

  final int value;

  @override
  Widget build(BuildContext context) => Semantics(
    label: 'Release readiness $value percent. 12 checks passed, 3 need review.',
    child: ExcludeSemantics(
      child: StudioCard(
        color: studioInk,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                StudioEyebrow('Release readiness', color: Color(0xFFB9C0C8)),
                Spacer(),
                StudioEyebrow('Live', color: Color(0xFFB9C0C8)),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              '$value%',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 48,
                height: 1,
                letterSpacing: -2,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 18),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(value: value / 100, minHeight: 7),
            ),
            const SizedBox(height: 10),
            const Text(
              '12 checks passed · 3 need review',
              style: TextStyle(color: Color(0xFFB9C0C8), fontSize: 13),
            ),
          ],
        ),
      ),
    ),
  );
}

class FindingRow extends StatelessWidget {
  const FindingRow({super.key, required this.index, required this.finding});

  final int index;
  final AuditFinding finding;

  @override
  Widget build(BuildContext context) {
    final high = finding.severity == FindingSeverity.high;
    return Semantics(
      label:
          '${finding.title}. ${finding.location}. ${high ? 'High' : 'Medium'} severity.',
      child: ExcludeSemantics(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${index + 1}'.padLeft(2, '0'),
                style: const TextStyle(
                  color: studioMuted,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      finding.title,
                      style: const TextStyle(
                        color: studioInk,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      finding.location,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              StudioPill(high ? 'High' : 'Medium', critical: high),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckRow extends StatelessWidget {
  const CheckRow(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) => Semantics(
    label: '$label, verified',
    child: ExcludeSemantics(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 11),
        child: Row(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: studioLime,
                borderRadius: BorderRadius.circular(9),
              ),
              alignment: Alignment.center,
              child: const Text(
                'OK',
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class StudioAction extends StatelessWidget {
  const StudioAction({super.key, required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    label: label,
    child: Material(
      color: studioBlue,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(14),
        child: SizedBox(
          height: 52,
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                color: studioInk,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class StudioNavigation extends StatelessWidget {
  const StudioNavigation({
    super.key,
    required this.page,
    required this.expanded,
    required this.onSelected,
  });

  final StudioPage page;
  final bool expanded;
  final ValueChanged<StudioPage> onSelected;

  static const destinations = [
    (StudioPage.workspace, 'Home', 'H'),
    (StudioPage.audit, 'Audit', 'A'),
    (StudioPage.system, 'System', 'S'),
    (StudioPage.visualQa, 'QA', 'Q'),
  ];

  @override
  Widget build(BuildContext context) {
    if (expanded) {
      return Container(
        width: 104,
        color: studioInk,
        padding: const EdgeInsets.fromLTRB(12, 22, 12, 18),
        child: Column(
          children: [
            const StudioMark(),
            const SizedBox(height: 42),
            ...destinations.map(
              (item) => _NavButton(
                label: item.$2,
                glyph: item.$3,
                selected:
                    page == item.$1 ||
                    (page == StudioPage.release &&
                        item.$1 == StudioPage.workspace),
                onPressed: () => onSelected(item.$1),
              ),
            ),
            const Spacer(),
            const Text(
              '1.8',
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
          ],
        ),
      );
    }

    return SafeArea(
      top: false,
      child: Container(
        height: 68,
        margin: const EdgeInsets.fromLTRB(14, 0, 14, 12),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: studioInk,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: destinations
              .map(
                (item) => _NavButton(
                  label: item.$2,
                  glyph: item.$3,
                  selected:
                      page == item.$1 ||
                      (page == StudioPage.release &&
                          item.$1 == StudioPage.workspace),
                  onPressed: () => onSelected(item.$1),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.label,
    required this.glyph,
    required this.selected,
    required this.onPressed,
  });

  final String label;
  final String glyph;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Semantics(
    selected: selected,
    button: true,
    label: label,
    child: Tooltip(
      message: label,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 54,
          height: 48,
          decoration: BoxDecoration(
            color: selected ? studioBlue : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Text(
            glyph,
            style: TextStyle(
              color: selected ? studioInk : Colors.white70,
              fontSize: 13,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    ),
  );
}
