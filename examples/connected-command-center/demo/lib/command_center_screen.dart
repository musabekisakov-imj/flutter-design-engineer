import 'package:flutter/material.dart';

import 'command_center_models.dart';
import 'theme.dart';

class CommandCenterShell extends StatefulWidget {
  const CommandCenterShell({
    super.key,
    this.initialState = ShowcaseState.populated,
    this.showStateControls = true,
  });

  final ShowcaseState initialState;
  final bool showStateControls;

  @override
  State<CommandCenterShell> createState() => _CommandCenterShellState();
}

class _CommandCenterShellState extends State<CommandCenterShell> {
  late ShowcaseState state = widget.initialState;

  @override
  Widget build(BuildContext context) {
    final reduceMotion = MediaQuery.disableAnimationsOf(context);
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final expanded = constraints.maxWidth >= 900;
            return Row(
              children: [
                if (expanded) const _NavigationRail(),
                Expanded(
                  child: ColoredBox(
                    color: canvas,
                    child: Column(
                      children: [
                        _TopBar(
                          state: state,
                          showStateControls: widget.showStateControls,
                          onStateChanged: (value) =>
                              setState(() => state = value),
                        ),
                        Expanded(
                          child: AnimatedSwitcher(
                            duration: reduceMotion
                                ? Duration.zero
                                : const Duration(milliseconds: 220),
                            layoutBuilder: (currentChild, previousChildren) =>
                                Stack(
                                  alignment: Alignment.topCenter,
                                  fit: StackFit.expand,
                                  children: [
                                    ...previousChildren,
                                    ?currentChild,
                                  ],
                                ),
                            child: _StateContent(
                              key: ValueKey(state),
                              state: state,
                              expanded: expanded,
                            ),
                          ),
                        ),
                        if (!expanded) const _BottomNavigation(),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({
    required this.state,
    required this.showStateControls,
    required this.onStateChanged,
  });

  final ShowcaseState state;
  final bool showStateControls;
  final ValueChanged<ShowcaseState> onStateChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
        color: surface,
        border: Border(bottom: BorderSide(color: outline)),
      ),
      child: Row(
        children: [
          const _Mark(),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'FLUTTER DESIGN ENGINEER · CONNECTED FIXTURE',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: muted,
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.05,
              ),
            ),
          ),
          if (showStateControls)
            PopupMenuButton<ShowcaseState>(
              tooltip: 'Change demo state',
              initialValue: state,
              onSelected: onStateChanged,
              itemBuilder: (context) => ShowcaseState.values
                  .map(
                    (value) =>
                        PopupMenuItem(value: value, child: Text(value.name)),
                  )
                  .toList(),
              child: _Pill(
                icon: Icons.layers_outlined,
                label: state.name.toUpperCase(),
              ),
            ),
        ],
      ),
    );
  }
}

class _StateContent extends StatelessWidget {
  const _StateContent({super.key, required this.state, required this.expanded});

  final ShowcaseState state;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return switch (state) {
      ShowcaseState.populated => _Dashboard(expanded: expanded),
      ShowcaseState.loading => const _LoadingState(),
      ShowcaseState.error => const _ErrorState(),
      ShowcaseState.empty => const _EmptyState(),
    };
  }
}

class _Dashboard extends StatelessWidget {
  const _Dashboard({required this.expanded});

  final bool expanded;

  @override
  Widget build(BuildContext context) {
    final data = commandCenterFixture;
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        expanded ? 42 : 18,
        expanded ? 34 : 24,
        expanded ? 42 : 18,
        32,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1220),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Hero(expanded: expanded),
              SizedBox(height: expanded ? 28 : 20),
              if (expanded)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Column(
                        children: [
                          _ProjectCard(project: data.project),
                          const SizedBox(height: 18),
                          _AiBriefCard(items: data.brief),
                        ],
                      ),
                    ),
                    const SizedBox(width: 18),
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          _FinanceCard(finance: data.finance),
                          const SizedBox(height: 18),
                          _TravelCard(travel: data.travel),
                        ],
                      ),
                    ),
                  ],
                )
              else ...[
                _ProjectCard(project: data.project),
                const SizedBox(height: 14),
                _AiBriefCard(items: data.brief),
                const SizedBox(height: 14),
                _FinanceCard(finance: data.finance),
                const SizedBox(height: 14),
                _TravelCard(travel: data.travel),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _Hero extends StatelessWidget {
  const _Hero({required this.expanded});

  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'TUESDAY · 21 JULY',
                style: TextStyle(
                  color: coral,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.25,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                expanded ? 'Good morning, Musabek.' : 'Your day, connected.',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 8),
              const Text('One clear view across work, money, and movement.'),
            ],
          ),
        ),
        if (expanded)
          FilledButton.icon(
            onPressed: () {},
            style: FilledButton.styleFrom(minimumSize: const Size(120, 48)),
            icon: const Icon(Icons.auto_awesome, size: 18),
            label: const Text('Ask AI'),
          ),
      ],
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.project});

  final ProjectPulse project;

  @override
  Widget build(BuildContext context) {
    return _Panel(
      color: ink,
      foreground: Colors.white,
      eyebrow: 'PROJECT PULSE',
      trailing: _Pill(
        icon: Icons.check_circle_outline,
        label: '${project.openTasks} OPEN',
        dark: true,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            project.milestone,
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 24),
          Semantics(
            label: 'Project progress 72 percent',
            excludeSemantics: true,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: project.progress,
                minHeight: 9,
                backgroundColor: Colors.white24,
                color: coral,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Design system', style: TextStyle(color: Colors.white70)),
              Text(
                '72%',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AiBriefCard extends StatelessWidget {
  const _AiBriefCard({required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return _Panel(
      color: blue,
      foreground: Colors.white,
      eyebrow: 'AI BRIEF · 3 ACTIONS',
      trailing: const Icon(Icons.auto_awesome, color: Colors.white),
      child: Column(
        children: items.indexed
            .map(
              (entry) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Text(
                      '0${entry.$1 + 1}',
                      style: const TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        entry.$2,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_outward,
                      color: Colors.white,
                      size: 18,
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _FinanceCard extends StatelessWidget {
  const _FinanceCard({required this.finance});

  final FinancePulse finance;

  @override
  Widget build(BuildContext context) {
    return _Panel(
      color: amber,
      eyebrow: 'FINANCE · MONTHLY',
      trailing: const Icon(Icons.north_east, color: ink),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            finance.cashFlow,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const Text('Net project cash flow'),
          const SizedBox(height: 20),
          LinearProgressIndicator(
            value: finance.budgetUsed,
            minHeight: 7,
            color: ink,
            backgroundColor: Colors.white54,
            semanticsLabel: 'Budget used 64 percent',
          ),
          const SizedBox(height: 10),
          Text('64% budget used · Review ${finance.nextReview}'),
        ],
      ),
    );
  }
}

class _TravelCard extends StatelessWidget {
  const _TravelCard({required this.travel});

  final TravelPulse travel;

  @override
  Widget build(BuildContext context) {
    return _Panel(
      color: green,
      eyebrow: 'NEXT TRIP',
      trailing: const Icon(Icons.flight_takeoff, color: ink),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            travel.destination,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Text(travel.dates),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Text(
                  '${travel.completedSteps} of ${travel.totalSteps} itinerary steps ready',
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              IconButton(
                onPressed: () {},
                tooltip: 'Continue Tokyo itinerary',
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Panel extends StatelessWidget {
  const _Panel({
    required this.color,
    required this.eyebrow,
    required this.child,
    this.trailing,
    this.foreground = ink,
  });

  final Color color;
  final Color foreground;
  final String eyebrow;
  final Widget? trailing;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: foreground.withValues(alpha: .14)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    eyebrow,
                    style: TextStyle(
                      color: foreground.withValues(alpha: .74),
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.15,
                    ),
                  ),
                ),
                ?trailing,
              ],
            ),
            const SizedBox(height: 18),
            child,
          ],
        ),
      ),
    );
  }
}

class _LoadingState extends StatelessWidget {
  const _LoadingState();

  @override
  Widget build(BuildContext context) {
    return const _CenteredState(
      icon: Icons.hourglass_top,
      title: 'Building your brief',
      body: 'Connecting workspace, finance, and travel signals.',
      busy: true,
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState();

  @override
  Widget build(BuildContext context) {
    return _CenteredState(
      icon: Icons.sync_problem,
      title: 'Two sources need attention',
      body: 'Your workspace is safe. Retry to refresh the connected brief.',
      action: FilledButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.refresh),
        label: const Text('Retry connection'),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return _CenteredState(
      icon: Icons.grid_view_rounded,
      title: 'Make this space yours',
      body: 'Connect a project to create your first cross-domain brief.',
      action: FilledButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text('Connect project'),
      ),
    );
  }
}

class _CenteredState extends StatelessWidget {
  const _CenteredState({
    required this.icon,
    required this.title,
    required this.body,
    this.action,
    this.busy = false,
  });

  final IconData icon;
  final String title;
  final String body;
  final Widget? action;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 460),
          child: Semantics(
            liveRegion: true,
            child: Column(
              children: [
                Container(
                  width: 76,
                  height: 76,
                  decoration: const BoxDecoration(
                    color: surface,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, size: 34, color: coral),
                ),
                const SizedBox(height: 22),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 10),
                Text(body, textAlign: TextAlign.center),
                if (busy) ...[
                  const SizedBox(height: 24),
                  const LinearProgressIndicator(
                    semanticsLabel: 'Loading connected brief',
                  ),
                ],
                if (action != null) ...[const SizedBox(height: 24), action!],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavigationRail extends StatelessWidget {
  const _NavigationRail();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      color: ink,
      child: const Column(
        children: [
          SizedBox(height: 22),
          _Mark(inverted: true),
          SizedBox(height: 38),
          _NavIcon(Icons.dashboard_rounded, 'Overview', selected: true),
          _NavIcon(Icons.work_outline, 'Workspace'),
          _NavIcon(Icons.account_balance_wallet_outlined, 'Finance'),
          _NavIcon(Icons.flight_outlined, 'Travel'),
          Spacer(),
          _NavIcon(Icons.settings_outlined, 'Settings'),
          SizedBox(height: 18),
        ],
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation();

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: surface,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavIcon(Icons.dashboard_rounded, 'Overview', selected: true),
              _NavIcon(Icons.work_outline, 'Work'),
              _NavIcon(Icons.account_balance_wallet_outlined, 'Finance'),
              _NavIcon(Icons.flight_outlined, 'Travel'),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  const _NavIcon(this.icon, this.label, {this.selected = false});

  final IconData icon;
  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final horizontal = MediaQuery.sizeOf(context).width < 900;
    return Semantics(
      selected: selected,
      button: true,
      label: label,
      excludeSemantics: true,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal ? 10 : 0,
          vertical: 10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: selected ? coral : (horizontal ? muted : Colors.white60),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: selected ? coral : (horizontal ? muted : Colors.white60),
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Mark extends StatelessWidget {
  const _Mark({this.inverted = false});

  final bool inverted;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: inverted ? coral : ink,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(Icons.bolt, color: inverted ? ink : surface, size: 20),
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.icon, required this.label, this.dark = false});

  final IconData icon;
  final String label;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: dark ? Colors.white12 : canvas,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: dark ? Colors.white24 : outline),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: dark ? Colors.white : ink),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: dark ? Colors.white : ink,
              fontSize: 10,
              fontWeight: FontWeight.w800,
              letterSpacing: .7,
            ),
          ),
        ],
      ),
    );
  }
}
