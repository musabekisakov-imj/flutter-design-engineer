# Technical Specification: Portable Visual Regression Adapter Contract (`VisRegAdapter`)

As an Advanced AI Technical Bounty Hunter specializing in robust open-source architecture, I propose defining a standardized, vendor-agnostic contract for integrating screenshot capture and comparison tools into a continuous integration (CI) pipeline. This contract ensures that the core testing framework remains decoupled from any specific library or service provider (e.g., Applitools, Percy, custom image diffing libraries).

This document outlines the required components of the `VisRegAdapter` interface, focusing on deterministic inputs and standardized artifact handling.

---

## 📋 VisRegAdapter Contract Definition

The purpose of this contract is to define a three-stage process: **Capture**, **Compare**, and **Report**. Any compliant tool must implement these stages while strictly adhering to the defined data formats and policies.

### I. Deterministic Inputs Specification (Required)

To ensure repeatability, the testing environment and content must be explicitly locked down before capture occurs. The system must guarantee that non-deterministic elements do not influence the output artifact.

| Parameter | Type | Description | Enforcement Mechanism |
| :--- | :--- | :--- | :--- |
| **Seed Hash** | String/SHA256 | A hash generated from all inputs: application build version, environment configuration (`ci_vars`), specific layout parameters (viewport dimensions), and test data payload. This locks the entire state for comparison. | Mandatory check at start of capture phase. If the Seed changes, the baseline must be invalidated or updated manually. |
| **Input Data Artifact** | Payload/File Path | Any dynamic data used during testing (e.g., user names, lists). This artifact must also contribute to the `Seed Hash`. | Must be hashed and passed alongside the test case. |
| **Viewport Constraints** | Object `{width: int, height: int}` | Explicit dimensions defining the rendering area, preventing frame or window resizing discrepancies. | The adapter must set these constraints programmatically before capture. |
| **Baseline Manifest Path** | File Path | Pointer to the required baseline image manifest (the "golden source" of images). | Required for comparison phase; ensures the correct reference point is used. |

### II. Artifact Metadata Specification (Required)

Every generated artifact—both the captured screenshot and the resulting diff report—must be enriched with standardized metadata to allow post-mortem debugging, auditing, and automated state management.

| Field | Data Type | Description | Purpose |
| :--- | :--- | :--- | :--- |
| `artifact_uuid` | UUID | A unique identifier for this specific capture instance. | Traceability across logs and databases. |
| `capture_timestamp` | ISO 8601 String | Time of the capture execution, including timezone offset. | Debugging time-dependent failures (e.g., network latency). |
| `diff_tool_version` | SemVer String | The exact version of the comparison algorithm used. | Critical for diagnosing drift in comparison logic itself. |
| `seed_hash` | SHA256 String | The cryptographic hash of all deterministic inputs (`Seed Hash`). | Verifies that the baseline image was compared against the *intended* state. |
| `diff_report_path` | File Path | Location of the generated difference file (e.g., PNG overlay, JSON report). | Input for automated gate evaluation. |

### III. Diff Inspection Gate and Threshold Policy

This defines the logic point where a comparison result is evaluated as a pass or fail.

#### A. Configurable Threshold Policies

The adapter must accept configurable policies rather than relying on fixed pixel counts.

1.  **Pixel Tolerance Policy (`PTP`):** Allows for minor differences due to anti-aliasing, sub-pixel rendering variation, or environmental noise (e.g., slightly differing timestamps/dates).
    *   *Input:* `tolerance_percent: float` (e.g., 0.5%)
    *   *Logic:* A differential area is acceptable if the total count of dissimilar pixels does not exceed $N$ percent of the image area, where $N \le \text{Tolerance Percentage}$.

2.  **Structural Similarity Index Policy (`SSIM`):** Preferred for visual regressions, as it measures perceived change rather than raw pixel difference.
    *   *Input:* `min_ssim: float` (e.g., 0.98)
    *   *Logic:* The calculated SSIM between the baseline and current capture must be $\ge \text{Min SSIM}$.

#### B. Diff Inspection Gate Logic

The gate is a strict boolean decision point following comparison. **A failure occurs if *both* of the following conditions are met:**

1.  The difference exceeds the defined `Threshold Policy` (e.g., $PTP$ fails AND $SSIM < \text{Min SSIM}$).
2.  The detected differential area is not whitelisted or explicitly ignored in the test configuration.

### IV. Failure Reporting Contract

Upon failure, the adapter must generate a comprehensive report object/file containing sufficient information for immediate diagnosis without requiring manual re-runs.

| Field | Type | Required Upon Failure? | Description |
| :--- | :--- | :--- | :--- |
| `is_failed` | Boolean | Yes | Must be `True`. |
| `reason_code` | String (Enum) | Yes | Specific failure code: e.g., `THRESHOLD_EXCEEDED`, `LAYOUT_MISMATCH`, `MISSING_BASELINE`. |
| `diff_heatmap_path` | File Path | Yes | A visual representation (e.g., PNG overlay) highlighting the exact regions of discrepancy. |
| `failure_details` | JSON Object | Yes | Includes: `{ pixel_count_diff: int, area_percentage: float, ssim_score: float }`. |
| `actionable_advice` | String | No (Recommended) | Suggested remediation steps for the developer or CI engineer. |

---

## 🧪 Evaluation Case Example (`TestCase-WidgetA-Desktop`)

**Goal:** Capture and validate a dashboard widget component across various state changes.

**Input Scenario:**
*   **Component:** User Profile Widget A
*   **Build Version:** `v2.10.4`
*   **Environment Vars:** `{ theme: 'dark', locale: 'en-US' }`
*   **Viewport Constraints:** $\{width: 1280, height: 960\}$
*   **Test Data Payload:** User ID `user_xyz` (Used in the widget body).

**Workflow Execution Steps:**

1.  **Preparation & Hashing:** The system calculates `Seed Hash` based on `{v2.10.4} + \{dark, en-US\} + 1280x960 + user_xyz`.
2.  **Baseline Retrieval:** Loads baseline manifest for this specific `Seed Hash`.
3.  **Capture (Current):** Renders the widget under the defined constraints and captures `current_screenshot.png`.
4.  **Comparison:** The adapter runs the comparison algorithm, generating a differential image (`diff_overlay.png`) and computing metrics: $SSIM = 0.96$, $\text{PixelDiff}=150$.
5.  **Gate Evaluation:**
    *   Policy Applied: Use SSIM Policy ($\text{Min SSIM} \ge 0.98$).
    *   Evaluation: Since $0.96 < 0.98$, the gate immediately fails comparison.
6.  **Failure Report Generation:** The adapter generates a standardized failure report containing:
    *   `is_failed`: `True`
    *   `reason_code`: `STRUCTURAL_SIMILARITY_FAILURE`
    *   `diff_heatmap_path`: `/tmp/widget_a_fail.png` (Highlighting the missing content area).
    *   `failure_details`: `{ pixel_count_diff: 150, area_percentage: 0.012, ssim_score: 0.96 }`

This standardized contract ensures that regardless of whether the underlying diff engine is a proprietary SaaS service or an open-source library like Pillow/OpenCV wrapper, the interface for input, comparison logic, and output remains consistent and auditable.