# Note to the Data Editor — replication deposit

**Manuscript:** "Corridor, Not Factory: Trade Reorientation and the Missing Investment Response
in Kazakhstan, 2022–2025"
**Author:** Zhanbolat Kakishev, Nazarbayev University · zhanbolat.kakishev@nu.edu.kz
**Journal:** *Journal of International Economics* · **Manuscript ID:** `[FILL]`
**openICPSR project:** `[FILL — assigned at deposit]`
**Date:** `[FILL — upload date]`

---

Dear Data Editor,

This note accompanies the replication package for the manuscript above, prepared to the
[Data and Code Availability Standard](https://datacodestandard.org/). It summarises what the
package contains, what reproduces without restricted data, and how the one proprietary input
is handled.

## 1. What the package does

The deposit regenerates every table, figure, and load-bearing numeric claim in the manuscript.
It is **R only** (R 4.5.3); there is no Stata, Python, or MATLAB. Two pipelines run in order
from a single master script each:

1. `code/kz_passthrough/00_run_all.R` — the trade-shock measurement, the difference-in-differences
   and structural-break batteries, and the value-capture calibration. Produces **Tables 1 and 2,
   Figures 1–3, and Appendix Tables B.1–E.1**, plus the Section 5–6 and 8–10 in-text numbers.
   This pipeline uses **only public data** (UN Comtrade, World Bank WDI, OECD ICIO, Kazakhstan
   Bureau of National Statistics).
2. `code/kz_valueadd/00_run_all.R` — the investment-response analysis. Produces **Table 3,
   Table 5, Figures 4–5**, and the Section 7 results and minimum-detectable-effect. This pipeline
   requires the licensed deal extract (see §3).

Table 4 (moderators) is a hand-assembled qualitative table; its supporting figures come from
the public pipeline.

Environment is pinned in `renv.lock` (repo root) and two `sessionInfo.txt` files. Restore with
`R -e 'renv::restore()'`. All stochastic steps set a seed (`set.seed(20260831)` in
`06_eventstudy_did.R` and `12_did_robustness.R`; `set.seed(1)` in `kz_valueadd/08_power_null.R`);
every other step is deterministic. Approximate analysis-only runtime is 12–18 minutes
single-core, under 4 GB RAM, no cluster; the live API pulls add 15–30 minutes.

## 2. Reproducibility check already run

`quality_reports/reproducibility_audit_corridor.md` records a claim-by-claim audit of the
manuscript numbers against the regenerated outputs: **0 FAIL**. One row is EXPLAINED (a
deliberate rounding convention, documented in the audit) and three rows are UNMATCHED — all of
them external published-report figures (the QIC/AIFC/IFC state-fund aggregates) or bibliographic
items, itemised in the audit. `DCAS_checklist.md` maps each of the twelve DCAS requirements to
the file that satisfies it; every row is PASS.

## 3. The one restricted input: firm-transaction data

The investment-response analysis uses a consolidated, de-duplicated universe of merger,
acquisition, private-equity, and venture transactions with a Kazakhstan-domiciled target or
issuer, 2015–2025 (N ≈ 493), assembled from **S&P Capital IQ, PitchBook, and Preqin**. All
three subscription agreements prohibit redistribution, so the extract itself is **not** in the
deposit. What is provided instead:

- `data/raw/access-restricted-data.md` — the complete query specification for each of the three
  platforms (geography, date range, deal types, status), the de-duplication rule, and the
  sector crosswalk, so a subscriber can reconstruct the identical extract.
- `data/analysis/deal_source_reconcile.csv` — the deal **counts** by source and period that
  underlie Table 3 (aggregates only; no transaction-level rows).
- `data/analysis/deal_ids.csv` `[FILL — see below]` — the native per-source deal identifiers
  for all ≈493 records (identifiers only, no deal-level fields), so a subscriber can confirm
  they have reconstructed the same set. **I am confirming with the three vendors that
  publishing bare identifiers is permitted.** If any vendor objects, this file will be withheld
  from the public deposit and supplied on request to a verified licence holder or to your
  office directly.

Everything else in the deposit is public. The OECD ICIO matrix (`2019_SML.csv`) is free to
download for research but its terms do not permit redistribution, so it too is a pointer, not a
file.

**For your verification of the restricted portion**, I can (a) provide the extract directly to
your office under a use-restricted arrangement, (b) run `code/kz_valueadd/00_run_all.R` under
your observation and share the console logs and output files, or (c) provide a signed statement
that the deposited code, run against a correctly reconstructed extract, produces the reported
Table 3, Table 5, and Section 7 numbers. Please tell me which you prefer.

## 4. Known items still to complete

None blocks the deposit; all are flagged in `DCAS_checklist.md` and `DEPOSIT.md`:

1. My ORCID iD and the article DOI (added once assigned).
2. The measured wall-clock runtime, replacing the current estimate, from a clean-machine run.
3. Vendor sign-off on publishing the bare deal identifiers (§3).

## 5. Cross-references in the deposit

| Item | File |
|---|---|
| Standard replication README (AEA template) | `README.md` |
| DCAS compliance checklist (12 items, all PASS) | `DCAS_checklist.md` |
| openICPSR metadata record | `DEPOSIT.md` |
| Reproducibility audit (0 FAIL) | `quality_reports/reproducibility_audit_corridor.md` |
| Restricted-data reconstruction note | `data/raw/access-restricted-data.md` |
| Computational requirements | `output/computational_requirements.md` |
| Code + data license | `LICENSE.md` |

I am glad to make any changes the replication check requires. Thank you for your time.

Sincerely,
Zhanbolat Kakishev
