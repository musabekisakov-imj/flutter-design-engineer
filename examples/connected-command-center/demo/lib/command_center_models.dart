enum ShowcaseState { populated, loading, error, empty }

class ProjectPulse {
  const ProjectPulse({
    required this.name,
    required this.milestone,
    required this.progress,
    required this.openTasks,
  });

  final String name;
  final String milestone;
  final double progress;
  final int openTasks;
}

class FinancePulse {
  const FinancePulse({
    required this.cashFlow,
    required this.budgetUsed,
    required this.nextReview,
  });

  final String cashFlow;
  final double budgetUsed;
  final String nextReview;
}

class TravelPulse {
  const TravelPulse({
    required this.destination,
    required this.dates,
    required this.completedSteps,
    required this.totalSteps,
  });

  final String destination;
  final String dates;
  final int completedSteps;
  final int totalSteps;
}

class CommandCenterData {
  const CommandCenterData({
    required this.project,
    required this.finance,
    required this.travel,
    required this.brief,
  });

  final ProjectPulse project;
  final FinancePulse finance;
  final TravelPulse travel;
  final List<String> brief;
}

const commandCenterFixture = CommandCenterData(
  project: ProjectPulse(
    name: 'Flutter Design Engineer',
    milestone: 'Ship v0.2 · Connected showcase',
    progress: .72,
    openTasks: 8,
  ),
  finance: FinancePulse(
    cashFlow: r'+$12.4k',
    budgetUsed: .64,
    nextReview: 'Friday · 14:00',
  ),
  travel: TravelPulse(
    destination: 'Tokyo',
    dates: 'Sep 18–24 · 6 days',
    completedSteps: 4,
    totalSteps: 6,
  ),
  brief: [
    'Review two visual QA findings',
    'Approve the contributor budget',
    'Confirm the Tokyo rail pass',
  ],
);
