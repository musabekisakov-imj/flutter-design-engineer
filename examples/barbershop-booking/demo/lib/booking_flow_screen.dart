import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'booking_controller.dart';
import 'booking_fixtures.dart';
import 'booking_models.dart';
import 'booking_theme.dart';

class BookingFlowScreen extends StatefulWidget {
  const BookingFlowScreen({super.key, this.controller});

  final BookingController? controller;

  @override
  State<BookingFlowScreen> createState() => _BookingFlowScreenState();
}

class _BookingFlowScreenState extends State<BookingFlowScreen> {
  late final BookingController controller;
  late final bool ownsController;

  @override
  void initState() {
    super.initState();
    ownsController = widget.controller == null;
    controller = widget.controller ?? BookingController();
  }

  @override
  void dispose() {
    if (ownsController) controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        return Scaffold(
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final expanded = constraints.maxWidth >= 820;
                return Column(
                  children: [
                    _BookingHeader(controller: controller, expanded: expanded),
                    Expanded(
                      child: expanded
                          ? _ExpandedBookingLayout(controller: controller)
                          : _CompactBookingLayout(controller: controller),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class _BookingHeader extends StatelessWidget {
  const _BookingHeader({required this.controller, required this.expanded});

  final BookingController controller;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    final theme = context.bookingTheme;
    final index = controller.step.index + 1;
    return Semantics(
      container: true,
      label: 'Booking progress, step $index of ${BookingStep.values.length}',
      child: Column(
        children: [
          SizedBox(
            height: expanded ? 72 : 60,
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: expanded ? 32 : 14,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 48,
                    height: 48,
                    child:
                        controller.step.index > 0 &&
                            controller.step != BookingStep.confirmation
                        ? IconButton(
                            tooltip: 'Previous step',
                            onPressed: controller.goBack,
                            icon: const Icon(Icons.arrow_back_rounded),
                          )
                        : const SizedBox.shrink(),
                  ),
                  Expanded(
                    child: Text(
                      'NORTH & ROW',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        letterSpacing: 2.2,
                        fontSize: 11,
                        color: context.bookingTheme.ink,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 48,
                    height: 48,
                    child: IconButton(
                      tooltip: 'Close booking',
                      onPressed: () {},
                      icon: const Icon(Icons.close_rounded),
                    ),
                  ),
                ],
              ),
            ),
          ),
          LinearProgressIndicator(
            value: index / BookingStep.values.length,
            minHeight: 3,
            color: theme.accent,
            backgroundColor: theme.line,
          ),
        ],
      ),
    );
  }
}

class _CompactBookingLayout extends StatelessWidget {
  const _CompactBookingLayout({required this.controller});

  final BookingController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: SingleChildScrollView(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 124),
            child: _AnimatedStep(controller: controller),
          ),
        ),
        if (controller.step != BookingStep.confirmation)
          Align(
            alignment: Alignment.bottomCenter,
            child: _ActionBar(controller: controller),
          ),
      ],
    );
  }
}

class _ExpandedBookingLayout extends StatelessWidget {
  const _ExpandedBookingLayout({required this.controller});

  final BookingController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1180),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 7,
              child: SingleChildScrollView(
                padding: const EdgeInsetsDirectional.fromSTEB(48, 44, 48, 48),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 650),
                  child: _AnimatedStep(controller: controller),
                ),
              ),
            ),
            if (controller.step != BookingStep.confirmation)
              SizedBox(
                width: 340,
                child: ColoredBox(
                  color: context.bookingTheme.mutedSurface,
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Expanded(
                          child: _BookingSummary(controller: controller),
                        ),
                        _PrimaryAction(controller: controller),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedStep extends StatelessWidget {
  const _AnimatedStep({required this.controller});

  final BookingController controller;

  @override
  Widget build(BuildContext context) {
    final reduceMotion = MediaQuery.disableAnimationsOf(context);
    final child = KeyedSubtree(
      key: ValueKey(controller.step),
      child: switch (controller.step) {
        BookingStep.service => _ServiceStep(controller: controller),
        BookingStep.barber => _BarberStep(controller: controller),
        BookingStep.availability => _AvailabilityStep(controller: controller),
        BookingStep.review => _ReviewStep(controller: controller),
        BookingStep.confirmation => _ConfirmationStep(controller: controller),
      },
    );
    return AnimatedSwitcher(
      duration: reduceMotion
          ? Duration.zero
          : const Duration(milliseconds: 220),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: reduceMotion
            ? child
            : SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.025, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
      ),
      child: child,
    );
  }
}

class _StepHeading extends StatelessWidget {
  const _StepHeading({
    required this.label,
    required this.title,
    required this.body,
  });

  final String label;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Semantics(
      header: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: textTheme.labelLarge?.copyWith(
              color: context.bookingTheme.accent,
              fontSize: 11,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Text(title, style: textTheme.displaySmall),
          const SizedBox(height: 10),
          Text(body, style: textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _ServiceStep extends StatelessWidget {
  const _ServiceStep({required this.controller});

  final BookingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _StepHeading(
          label: 'Service',
          title: 'What brings you in?',
          body: 'Choose one service. You can change it before confirming.',
        ),
        const SizedBox(height: 28),
        for (final service in bookingServices) ...[
          _ServiceChoice(
            service: service,
            selected: controller.service?.id == service.id,
            onTap: () => controller.selectService(service),
          ),
          const SizedBox(height: 10),
        ],
      ],
    );
  }
}

class _ServiceChoice extends StatelessWidget {
  const _ServiceChoice({
    required this.service,
    required this.selected,
    required this.onTap,
  });

  final BookingService service;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = context.bookingTheme;
    return Semantics(
      button: true,
      selected: selected,
      label:
          '${service.name}, ${service.durationMinutes} minutes, €${service.price}',
      child: Material(
        color: selected ? theme.accentSoft : theme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: selected ? theme.accent : theme.line,
            width: selected ? 2 : 1,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 100),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                service.name,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                            if (selected)
                              Icon(
                                Icons.check_circle,
                                color: theme.accent,
                                size: 20,
                              ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(service.description),
                        const SizedBox(height: 6),
                        Text(
                          '${service.durationMinutes} min',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    '€${service.price}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BarberStep extends StatelessWidget {
  const _BarberStep({required this.controller});

  final BookingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _StepHeading(
          label: 'Barber',
          title: 'Who do you prefer?',
          body: 'Every option below can perform your selected service.',
        ),
        const SizedBox(height: 26),
        for (final barber in barbers) ...[
          _BarberChoice(
            barber: barber,
            selected: controller.barber?.id == barber.id,
            onTap: () => controller.selectBarber(barber),
          ),
          const SizedBox(height: 10),
        ],
      ],
    );
  }
}

class _BarberChoice extends StatelessWidget {
  const _BarberChoice({
    required this.barber,
    required this.selected,
    required this.onTap,
  });

  final Barber barber;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = context.bookingTheme;
    return Semantics(
      button: true,
      selected: selected,
      label:
          '${barber.name}, ${barber.specialties}, ${barber.availabilityHint}',
      child: Material(
        color: selected ? theme.accentSoft : theme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: selected ? theme.accent : theme.line,
            width: selected ? 2 : 1,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 104),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  if (barber.id == 'any')
                    Container(
                      width: 76,
                      height: 82,
                      decoration: BoxDecoration(
                        color: theme.mutedSurface,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.event_available_rounded,
                        size: 30,
                      ),
                    )
                  else
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox(
                        width: 76,
                        height: 82,
                        child: Image.asset(
                          'assets/images/barbers-triptych.png',
                          fit: BoxFit.cover,
                          alignment: Alignment(barber.portraitAlignment, 0),
                        ),
                      ),
                    ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          barber.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          barber.specialties,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          barber.availabilityHint,
                          style: TextStyle(
                            color: theme.accent,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (selected)
                    Icon(Icons.check_circle, color: theme.accent, size: 21),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AvailabilityStep extends StatelessWidget {
  const _AvailabilityStep({required this.controller});

  final BookingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _StepHeading(
          label: 'Date & time',
          title: 'Choose a time',
          body: "Times are shown in the shop's local time.",
        ),
        const SizedBox(height: 26),
        _DateRail(controller: controller),
        const SizedBox(height: 26),
        switch (controller.availabilityState) {
          AvailabilityState.loading => const _LoadingAvailability(),
          AvailabilityState.error => _AvailabilityError(controller: controller),
          AvailabilityState.empty => _EmptyAvailability(controller: controller),
          AvailabilityState.invalidated => Column(
            children: [
              _InlineNotice(
                icon: Icons.schedule_rounded,
                title: 'That time was just taken',
                body:
                    'Your service, barber and date are still selected. Choose a nearby opening.',
              ),
              const SizedBox(height: 18),
              _TimeSlots(controller: controller),
            ],
          ),
          AvailabilityState.ready => _TimeSlots(controller: controller),
        },
      ],
    );
  }
}

class _DateRail extends StatelessWidget {
  const _DateRail({required this.controller});

  final BookingController controller;

  @override
  Widget build(BuildContext context) {
    const weekday = ['MON', 'TUE', 'WED', 'THU', 'FRI'];
    return SizedBox(
      height: 72,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: bookingDays.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final day = bookingDays[index];
          final selected = controller.day?.date == day.date;
          return Semantics(
            button: true,
            selected: selected,
            label: '${weekday[index]}, July ${day.date.day}',
            child: SizedBox(
              width: 66,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  foregroundColor: selected
                      ? Colors.white
                      : context.bookingTheme.ink,
                  backgroundColor: selected ? context.bookingTheme.ink : null,
                  side: BorderSide(
                    color: selected
                        ? context.bookingTheme.ink
                        : context.bookingTheme.line,
                  ),
                ),
                onPressed: () => controller.selectDay(day),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      weekday[index],
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${day.date.day}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _TimeSlots extends StatelessWidget {
  const _TimeSlots({required this.controller});

  final BookingController controller;

  @override
  Widget build(BuildContext context) {
    final slots = controller.day?.slots ?? const <BookingSlot>[];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Available times', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: slots.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 120,
            mainAxisExtent: 50,
            mainAxisSpacing: 9,
            crossAxisSpacing: 9,
          ),
          itemBuilder: (context, index) {
            final slot = slots[index];
            final selected = controller.slot?.label == slot.label;
            return Semantics(
              button: true,
              enabled: slot.isAvailable,
              selected: selected,
              label: '${slot.label}${slot.isAvailable ? '' : ', unavailable'}',
              child: OutlinedButton(
                onPressed: slot.isAvailable
                    ? () => controller.selectSlot(slot)
                    : null,
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  foregroundColor: selected
                      ? context.bookingTheme.danger
                      : null,
                  backgroundColor: selected
                      ? context.bookingTheme.accentSoft
                      : null,
                  side: BorderSide(
                    color: selected
                        ? context.bookingTheme.accent
                        : context.bookingTheme.line,
                    width: selected ? 2 : 1,
                  ),
                ),
                child: Text(
                  slot.label,
                  style: TextStyle(
                    fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
                    decoration: slot.isAvailable
                        ? null
                        : TextDecoration.lineThrough,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _LoadingAvailability extends StatelessWidget {
  const _LoadingAvailability();

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Loading available times',
      child: Wrap(
        spacing: 9,
        runSpacing: 9,
        children: List.generate(
          6,
          (_) => Container(
            width: 105,
            height: 50,
            decoration: BoxDecoration(
              color: context.bookingTheme.mutedSurface,
              borderRadius: BorderRadius.circular(9),
            ),
          ),
        ),
      ),
    );
  }
}

class _AvailabilityError extends StatelessWidget {
  const _AvailabilityError({required this.controller});

  final BookingController controller;

  @override
  Widget build(BuildContext context) {
    return _StatePanel(
      icon: Icons.wifi_off_rounded,
      title: 'Times could not be loaded',
      body:
          'Your service and barber are still selected. Try availability again.',
      action: OutlinedButton.icon(
        onPressed: controller.retryAvailability,
        icon: const Icon(Icons.refresh_rounded),
        label: const Text('Try again'),
      ),
    );
  }
}

class _EmptyAvailability extends StatelessWidget {
  const _EmptyAvailability({required this.controller});

  final BookingController controller;

  @override
  Widget build(BuildContext context) {
    return _StatePanel(
      icon: Icons.event_busy_rounded,
      title: 'No times on Thursday',
      body: 'Friday has six openings. Your earlier choices will be kept.',
      action: OutlinedButton(
        onPressed: () => controller.selectDay(bookingDays[4]),
        child: const Text('See Friday times'),
      ),
    );
  }
}

class _StatePanel extends StatelessWidget {
  const _StatePanel({
    required this.icon,
    required this.title,
    required this.body,
    required this.action,
  });

  final IconData icon;
  final String title;
  final String body;
  final Widget action;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      liveRegion: true,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: context.bookingTheme.mutedSurface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 28),
            const SizedBox(height: 22),
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(body),
            const SizedBox(height: 18),
            action,
          ],
        ),
      ),
    );
  }
}

class _InlineNotice extends StatelessWidget {
  const _InlineNotice({
    required this.icon,
    required this.title,
    required this.body,
  });

  final IconData icon;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      liveRegion: true,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.bookingTheme.accentSoft,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: context.bookingTheme.accent),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: context.bookingTheme.danger),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 5),
                  Text(body),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReviewStep extends StatefulWidget {
  const _ReviewStep({required this.controller});

  final BookingController controller;

  @override
  State<_ReviewStep> createState() => _ReviewStepState();
}

class _ReviewStepState extends State<_ReviewStep> {
  late final TextEditingController nameController;
  late final TextEditingController phoneController;
  late final TextEditingController noteController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(
      text: widget.controller.customer.name,
    );
    phoneController = TextEditingController(
      text: widget.controller.customer.phone,
    );
    noteController = TextEditingController(
      text: widget.controller.customer.note,
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _StepHeading(
          label: 'Review',
          title: 'Check your visit',
          body: 'Confirm the booking and tell us how to reach you.',
        ),
        const SizedBox(height: 24),
        _ReviewSummary(controller: controller),
        const SizedBox(height: 24),
        TextField(
          key: const Key('customer-name'),
          controller: nameController,
          autofillHints: const [AutofillHints.name],
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: 'Your name',
            hintText: 'Alex Morgan',
            errorText: controller.errors.name,
          ),
          onChanged: (value) => controller.updateCustomer(name: value),
        ),
        const SizedBox(height: 14),
        TextField(
          key: const Key('customer-phone'),
          controller: phoneController,
          autofillHints: const [AutofillHints.telephoneNumber],
          keyboardType: TextInputType.phone,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9+ ()-]')),
          ],
          decoration: InputDecoration(
            labelText: 'Mobile number',
            hintText: '+31 6 1234 5678',
            errorText: controller.errors.phone,
          ),
          onChanged: (value) => controller.updateCustomer(phone: value),
        ),
        const SizedBox(height: 14),
        TextField(
          key: const Key('customer-note'),
          controller: noteController,
          minLines: 2,
          maxLines: 4,
          maxLength: 160,
          decoration: const InputDecoration(
            labelText: 'Note for your barber (optional)',
            alignLabelWithHint: true,
          ),
          onChanged: (value) => controller.updateCustomer(note: value),
        ),
        const SizedBox(height: 8),
        Text(
          'We use your mobile number only for this appointment and service updates.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class _ReviewSummary extends StatelessWidget {
  const _ReviewSummary({required this.controller});

  final BookingController controller;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.bookingTheme.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: context.bookingTheme.line),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _ReviewRow(
              label: 'Service',
              value: controller.service?.name ?? 'Not selected',
              onEdit: () => controller.goTo(BookingStep.service),
            ),
            _ReviewRow(
              label: 'Barber',
              value: controller.barber?.name ?? 'Not selected',
              onEdit: () => controller.goTo(BookingStep.barber),
            ),
            _ReviewRow(
              label: 'When',
              value: _dateTimeLabel(controller),
              onEdit: () => controller.goTo(BookingStep.availability),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReviewRow extends StatelessWidget {
  const _ReviewRow({
    required this.label,
    required this.value,
    required this.onEdit,
  });

  final String label;
  final String value;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final enlarged = MediaQuery.textScalerOf(context).scale(16) >= 24;
    if (enlarged) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 4),
            Text(value, style: Theme.of(context).textTheme.titleMedium),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(onPressed: onEdit, child: Text('Edit $label')),
            ),
          ],
        ),
      );
    }
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 54),
      child: Row(
        children: [
          SizedBox(
            width: 66,
            child: Text(label, style: Theme.of(context).textTheme.bodyMedium),
          ),
          Expanded(
            child: Text(value, style: Theme.of(context).textTheme.titleMedium),
          ),
          TextButton(onPressed: onEdit, child: Text('Edit $label')),
        ],
      ),
    );
  }
}

class _ConfirmationStep extends StatelessWidget {
  const _ConfirmationStep({required this.controller});

  final BookingController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 540),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Semantics(
                label: 'Booking confirmed',
                child: Container(
                  width: 76,
                  height: 76,
                  decoration: const BoxDecoration(
                    color: bookingSageSoft,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    size: 38,
                    color: bookingSage,
                  ),
                ),
              ),
              const SizedBox(height: 26),
              Text(
                'CONFIRMED',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: context.bookingTheme.sage,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Your chair is reserved.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 12),
              Text(
                'A confirmation has been sent to your mobile.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 28),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: context.bookingTheme.mutedSurface,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _dateTimeLabel(controller),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${controller.service?.name} with ${controller.barber?.name}',
                    ),
                    const SizedBox(height: 5),
                    const Text('North & Row, 18 Mercer Street'),
                    const SizedBox(height: 16),
                    SelectableText(
                      'Booking reference NR-2746',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              FilledButton(onPressed: () {}, child: const Text('View booking')),
              const SizedBox(height: 8),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.event_outlined),
                label: const Text('Add to calendar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionBar extends StatelessWidget {
  const _ActionBar({required this.controller});

  final BookingController controller;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.bookingTheme.surface.withValues(alpha: 0.97),
        border: Border(top: BorderSide(color: context.bookingTheme.line)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 14, 20, 16),
          child: _PrimaryAction(controller: controller),
        ),
      ),
    );
  }
}

class _PrimaryAction extends StatelessWidget {
  const _PrimaryAction({required this.controller});

  final BookingController controller;

  @override
  Widget build(BuildContext context) {
    if (controller.step == BookingStep.review) {
      return FilledButton(
        key: const Key('confirm-booking'),
        onPressed: controller.isSubmitting ? null : controller.submit,
        child: controller.isSubmitting
            ? const SizedBox.square(
                dimension: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Text('Confirm and reserve, €${controller.service?.price ?? 0}'),
      );
    }
    final label = switch (controller.step) {
      BookingStep.service => 'Choose a barber',
      BookingStep.barber => 'Choose a time',
      BookingStep.availability => 'Review booking',
      BookingStep.review => 'Confirm booking',
      BookingStep.confirmation => 'View booking',
    };
    return FilledButton(
      key: const Key('continue-booking'),
      onPressed: controller.canContinue ? controller.continueForward : null,
      child: Text(label),
    );
  }
}

class _BookingSummary extends StatelessWidget {
  const _BookingSummary({required this.controller});

  final BookingController controller;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      label: 'Current booking summary',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your booking',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 28),
          _SummaryRow(
            label: 'Service',
            value: controller.service?.name ?? 'Not selected',
          ),
          _SummaryRow(
            label: 'Barber',
            value: controller.barber?.name ?? 'Not selected',
          ),
          _SummaryRow(label: 'When', value: _dateTimeLabel(controller)),
          const Spacer(),
          Divider(color: context.bookingTheme.line),
          _SummaryRow(
            label: 'Total',
            value: '€${controller.service?.price ?? 0}',
            prominent: true,
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    this.prominent = false,
  });

  final String label;
  final String value;
  final bool prominent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 68,
            child: Text(label, style: Theme.of(context).textTheme.bodyMedium),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: prominent
                  ? Theme.of(context).textTheme.titleLarge
                  : Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}

String _dateTimeLabel(BookingController controller) {
  if (controller.day == null || controller.slot == null) return 'Not selected';
  const weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  final date = controller.day!.date;
  return '${weekdays[date.weekday - 1]} ${date.day} Jul, ${controller.slot!.label}';
}
