(function () {
  const allowedEvents = new Set([
    "install_copy",
    "verified_results_open",
    "benchmark_artifact_open",
    "github_open",
    "sponsor_open",
    "audience_path_select",
    "install_success_help_open",
  ]);
  const allowedKeys = new Set(["route", "placement", "audience"]);
  const allowedValues = new Set([
    "all", "single-skill", "claude", "codex", "gemini", "cursor",
    "hero", "header", "trust", "benchmark", "rubric", "installer", "skills", "final", "support", "footer",
    "developer", "tech-lead", "product-team", "ai-platform",
  ]);

  function sanitize(properties) {
    return Object.fromEntries(Object.entries(properties || {}).filter(([key, value]) => (
      allowedKeys.has(key) && allowedValues.has(value)
    )));
  }

  window.fdeAnalytics = Object.freeze({
    track(name, properties = {}) {
      if (!allowedEvents.has(name)) return false;
      try {
        if (typeof window.fdeAnalyticsProvider === "function") {
          window.fdeAnalyticsProvider(name, sanitize(properties));
        }
      } catch {
        // Measurement must never interrupt a user-facing action.
      }
      return true;
    },
  });
}());
