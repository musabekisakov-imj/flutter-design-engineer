import 'package:flutter/material.dart';

import 'booking_models.dart';
import 'theme.dart';

enum DemoMode { before, after }

class BookingDemoShell extends StatefulWidget {
  const BookingDemoShell({super.key, this.initialMode = DemoMode.after});

  final DemoMode initialMode;

  @override
  State<BookingDemoShell> createState() => _BookingDemoShellState();
}

class _BookingDemoShellState extends State<BookingDemoShell> {
  late DemoMode mode = widget.initialMode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _DemoToolbar(
              mode: mode,
              onChanged: (value) => setState(() => mode = value),
            ),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 220),
                child: mode == DemoMode.before
                    ? const BeforeBookingScreen(key: ValueKey('before'))
                    : const AfterBookingScreen(key: ValueKey('after')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DemoToolbar extends StatelessWidget {
  const _DemoToolbar({required this.mode, required this.onChanged});

  final DemoMode mode;
  final ValueChanged<DemoMode> onChanged;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: ink,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            const Expanded(
              child: Text(
                'FLUTTER DESIGN ENGINEER · LIVE FIXTURE',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 11,
                  letterSpacing: 1.1,
                ),
              ),
            ),
            SegmentedButton<DemoMode>(
              segments: const [
                ButtonSegment(value: DemoMode.before, label: Text('Before')),
                ButtonSegment(value: DemoMode.after, label: Text('After')),
              ],
              selected: {mode},
              onSelectionChanged: (value) => onChanged(value.first),
              style: ButtonStyle(
                visualDensity: VisualDensity.compact,
                foregroundColor: WidgetStateProperty.resolveWith(
                  (states) => states.contains(WidgetState.selected)
                      ? ink
                      : Colors.white,
                ),
                backgroundColor: WidgetStateProperty.resolveWith(
                  (states) => states.contains(WidgetState.selected)
                      ? surface
                      : Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BeforeBookingScreen extends StatelessWidget {
  const BeforeBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF7559E8), Color(0xFF4B96F3)],
                ),
                borderRadius: BorderRadius.circular(28),
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 18),
                ],
              ),
              child: const Column(
                children: [
                  Icon(Icons.auto_awesome, color: Colors.white, size: 34),
                  SizedBox(height: 10),
                  Text(
                    'Book Your Perfect Look',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Seamless grooming, elevated for you',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _GenericCard(
              title: 'Choose service',
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: services
                    .map((service) => Chip(label: Text(service.name)))
                    .toList(),
              ),
            ),
            const SizedBox(height: 12),
            const _GenericCard(
              title: 'Select professional',
              child: Row(
                children: [
                  CircleAvatar(child: Icon(Icons.person)),
                  SizedBox(width: 10),
                  Expanded(child: Text('Any available barber')),
                  Icon(Icons.chevron_right),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const _GenericCard(
              title: 'Date & time',
              child: Wrap(
                spacing: 6,
                runSpacing: 6,
                alignment: WrapAlignment.center,
                children: [
                  Chip(label: Text('Today')),
                  Chip(label: Text('Tomorrow')),
                  Chip(label: Text('Pick date')),
                ],
              ),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: null,
              icon: const Icon(Icons.lock),
              label: const Text('Continue booking'),
            ),
          ],
        ),
      ),
    );
  }
}

class _GenericCard extends StatelessWidget {
  const _GenericCard({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 14),
            child,
          ],
        ),
      ),
    );
  }
}

class AfterBookingScreen extends StatelessWidget {
  const AfterBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final expanded = constraints.maxWidth >= 860;
        final selection = const _SelectionPanel();
        final schedule = const _SchedulePanel();

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: expanded ? 48 : 20,
            vertical: expanded ? 38 : 24,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1180),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'BOOK AN APPOINTMENT',
                    style: TextStyle(
                      color: coral,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.4,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    expanded ? 'Your time, considered.' : 'Choose your visit.',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Select a service, a barber, and a time that fits. We will hold your slot for five minutes.',
                  ),
                  SizedBox(height: expanded ? 36 : 26),
                  if (expanded)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: selection),
                        SizedBox(width: 44),
                        Expanded(child: schedule),
                      ],
                    )
                  else ...[
                    selection,
                    const SizedBox(height: 30),
                    schedule,
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SelectionPanel extends StatelessWidget {
  const _SelectionPanel();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionTitle(number: '01', title: 'Service'),
        const SizedBox(height: 12),
        ...services.indexed.map(
          (entry) => _ChoiceRow(
            selected: entry.$1 == 0,
            title: entry.$2.name,
            subtitle: entry.$2.duration,
            trailing: entry.$2.price,
          ),
        ),
        const SizedBox(height: 28),
        const _SectionTitle(number: '02', title: 'Barber'),
        const SizedBox(height: 12),
        ...barbers.indexed.map(
          (entry) => _BarberRow(barber: entry.$2, selected: entry.$1 == 0),
        ),
      ],
    );
  }
}

class _SchedulePanel extends StatelessWidget {
  const _SchedulePanel();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionTitle(number: '03', title: 'Date & time'),
        const SizedBox(height: 14),
        const Row(
          children: [
            _DateTile(day: 'MON', date: '26'),
            _DateTile(day: 'TUE', date: '27'),
            _DateTile(day: 'WED', date: '28', selected: true),
            _DateTile(day: 'THU', date: '29'),
            _DateTile(day: 'FRI', date: '30'),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          'Available Wednesday',
          style: TextStyle(fontWeight: FontWeight.w700, color: ink),
        ),
        const SizedBox(height: 10),
        GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 2.3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: times
              .map(
                (time) => _TimeTile(time: time, selected: time == '11:00 AM'),
              )
              .toList(),
        ),
        const SizedBox(height: 22),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: surface,
            border: Border.all(color: outline),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Row(
            children: [
              Icon(Icons.content_cut, color: coral),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Classic haircut · Ethan Cole',
                      style: TextStyle(fontWeight: FontWeight.w700, color: ink),
                    ),
                    Text(
                      'Wed, May 28 · 11:00 AM',
                      style: TextStyle(color: muted),
                    ),
                  ],
                ),
              ),
              Text(
                r'$35',
                style: TextStyle(fontWeight: FontWeight.w800, color: ink),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        FilledButton(
          onPressed: () {},
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Continue'),
              SizedBox(width: 12),
              Icon(Icons.arrow_forward, size: 18),
            ],
          ),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.number, required this.title});
  final String number;
  final String title;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Text(
        number,
        style: const TextStyle(color: coral, fontWeight: FontWeight.w800),
      ),
      const SizedBox(width: 10),
      Text(title, style: Theme.of(context).textTheme.headlineMedium),
    ],
  );
}

class _ChoiceRow extends StatelessWidget {
  const _ChoiceRow({
    required this.selected,
    required this.title,
    required this.subtitle,
    required this.trailing,
  });
  final bool selected;
  final String title;
  final String subtitle;
  final String trailing;

  @override
  Widget build(BuildContext context) => Semantics(
    selected: selected,
    button: true,
    child: Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: selected ? surface : Colors.transparent,
        border: Border.all(color: selected ? coral : outline),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            selected ? Icons.radio_button_checked : Icons.radio_button_off,
            color: selected ? coral : muted,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: ink,
                  ),
                ),
                Text(subtitle, style: const TextStyle(color: muted)),
              ],
            ),
          ),
          Text(
            trailing,
            style: const TextStyle(fontWeight: FontWeight.w800, color: ink),
          ),
        ],
      ),
    ),
  );
}

class _BarberRow extends StatelessWidget {
  const _BarberRow({required this.barber, required this.selected});
  final BarberOption barber;
  final bool selected;

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(bottom: 8),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: selected ? coral : outline,
          width: selected ? 2 : 1,
        ),
      ),
    ),
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: selected ? ink : outline,
          foregroundColor: selected ? Colors.white : ink,
          child: Text(barber.initials),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                barber.name,
                style: const TextStyle(fontWeight: FontWeight.w700, color: ink),
              ),
              Text(barber.detail, style: const TextStyle(color: muted)),
            ],
          ),
        ),
        Icon(
          selected ? Icons.check_circle : Icons.circle_outlined,
          color: selected ? coral : muted,
        ),
      ],
    ),
  );
}

class _DateTile extends StatelessWidget {
  const _DateTile({
    required this.day,
    required this.date,
    this.selected = false,
  });
  final String day;
  final String date;
  final bool selected;

  @override
  Widget build(BuildContext context) => Expanded(
    child: Container(
      margin: const EdgeInsets.only(right: 6),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: selected ? ink : surface,
        border: Border.all(color: selected ? ink : outline),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            day,
            style: TextStyle(
              fontSize: 10,
              color: selected ? Colors.white70 : muted,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            date,
            style: TextStyle(
              fontSize: 18,
              color: selected ? Colors.white : ink,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    ),
  );
}

class _TimeTile extends StatelessWidget {
  const _TimeTile({required this.time, required this.selected});
  final String time;
  final bool selected;

  @override
  Widget build(BuildContext context) => Material(
    color: selected ? ink : surface,
    shape: RoundedRectangleBorder(
      side: BorderSide(color: selected ? ink : outline),
      borderRadius: BorderRadius.circular(10),
    ),
    child: InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(10),
      child: Center(
        child: Text(
          time,
          style: TextStyle(
            color: selected ? Colors.white : ink,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
  );
}
