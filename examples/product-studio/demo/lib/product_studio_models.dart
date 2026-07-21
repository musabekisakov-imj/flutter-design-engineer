enum StudioPage { workspace, audit, system, adaptive, visualQa, release }

enum StudioViewState { populated, loading, empty, error }

enum FindingSeverity { high, medium }

class AuditFinding {
  const AuditFinding({
    required this.title,
    required this.location,
    required this.severity,
  });

  final String title;
  final String location;
  final FindingSeverity severity;
}

class ProductStudioFixture {
  const ProductStudioFixture({
    required this.project,
    required this.release,
    required this.readiness,
    required this.findings,
  });

  final String project;
  final String release;
  final int readiness;
  final List<AuditFinding> findings;
}

const productStudioFixture = ProductStudioFixture(
  project: 'Aurora',
  release: '1.8',
  readiness: 86,
  findings: [
    AuditFinding(
      title: 'Text contrast below AA',
      location: 'Checkout summary · 3 occurrences',
      severity: FindingSeverity.high,
    ),
    AuditFinding(
      title: 'Tap target is 38 × 38',
      location: 'Promo code disclosure',
      severity: FindingSeverity.medium,
    ),
    AuditFinding(
      title: 'Hierarchy shifts on tablet',
      location: 'Width 768–920 px',
      severity: FindingSeverity.medium,
    ),
  ],
);
