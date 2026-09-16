# Response to Referees — Round 2 Fix Pass

**Manuscript:** "Corridor, Not Factory" · **Journal:** JIE · **Date:** 2026-09-16
**Branch:** `fix/corridor-jie-r2-revision`
**Basis:** `quality_reports/peer_review_corridor_JIE/editorial_decision_r2.md`

This note maps each round-2 required/expected item to the specific change made. Line numbers refer to the manuscript as of this branch's HEAD.

## Required (R2-1 through R2-7)

| # | Item | Change |
|---|---|---|
| R2-1 (N1) | `exposed_only` DiD control pool contained the surge basket; N/clusters misreported | `scripts/R/kz_passthrough/06_eventstudy_did.R`: new `p_resid` (26 treated + 20-line purged civilian control, N=368/46 clusters), used for all `exposed_only` regressions and the wild-cluster bootstrap. Re-run. **Result reverses, not just corrects**: γ = 1.94, wcb p = 0.035 (was γ = −0.15, p = 0.87 on the contaminated sample). Table 2, Table C.1, abstract, intro all updated to report the corrected finding: the residual set is independently significant on the outbound flow, at roughly a fifth of the shared lines' magnitude — partial, smaller-scale corroboration, not a null. |
| R2-2 (N2) | Manuscript claims a components-sector search was run; `06_mechanism_tests.R` said the opposite | `scripts/R/kz_valueadd/06_mechanism_tests.R`: comment corrected to describe the WebSearch-based search actually performed (documented in corridor.tex §7/§9) rather than asserting none was run. Re-run; output regenerated. |
| R2-3 (NEW-1) | Abstract asserts market-access gate independently sufficient; §3 says otherwise | Abstract rewritten: irreversibility/institutions each independently sufficient; market access "only jointly with a small transformation margin, not by itself" — matches §3 exactly. |
| R2-4 (NEW-2) | Limitations mis-signs the Türkiye/Georgia null as "consistent with" the framework | Limitations paragraph rewritten to match §9's correct framing: the Kazakhstan search is consistent with the framework; the Türkiye/Georgia search is a weak-instrument null that fails to find the predicted differential, "not supportive... not consistent with it." |
| R2-5 (C1 cascade) | 4 locations still asserted "sufficient on its own" | Fixed at: Intro (~l.148), §7/"Which gate binds?" (~l.959, rewritten paragraph), §11 policy (~l.1231). All now carry the joint-margin qualifier. |
| R2-6 (C2) | §7 asserted the circular/loosely-relevant evidence as established fact | §7 paragraph rewritten to inherit §3's "suggestive, not dispositive" framing explicitly, and to state the alternative (no comparative advantage) survives if the margin comparison doesn't hold. |
| R2-7 (C8) | "Rules out capital-market institutions" survived at 6+ locations | Softened to "is inconsistent with" at 7 locations: Intro (~l.150), Contribution §1 (~l.179), §3 (~l.365), §7 (~l.973 "the institutional gate"), §9 (~l.1035), §9 Discussion (~l.1347), Limitations (~l.1394). |

## Expected (R2-8 through R2-12)

| # | Item | Change |
|---|---|---|
| R2-8 (C1) | Star survives on Table 2's surge-basket row | Removed. |
| R2-9 (C3) | "Tenfold" unqualified; no Table 1 row | 3.5× selection-free ratio attached at abstract + intro (2 locations); new Table 1 row with year-by-year priority-list levels. |
| R2-10 (C7-1) | BNS wholesale-margin anchor mischaracterized | Reviewed: manuscript body (§6.2, Appendix D) and `08b_kz_bns_io.R`'s own printed output already correctly hedge this as an upper bound including retail, not a wholesale-only estimate. No change needed — the issue was specific to how the response letter characterized it, not the manuscript text itself. |
| R2-11 (C4) | Entry-hysteresis and upgrading-foil literature still missing | Added and WebSearch-verified: Roberts–Tybout (1997, AER 87(4):545–64), Das–Roberts–Tybout (2007, Econometrica 75(3):837–73) in §3 where $I$/$\Omega$ are introduced; Atkin–Khandelwal–Osman (2017, QJE 132(2):551–615), Verhoogen (2008, QJE 123(2):489–530) in §9 as upgrading foils where a demand shock did induce investment because trade could not substitute for transformation. |
| R2-12 (N3) | Kyrgyz break-year mismatch (2019 vs. claimed 2022) | Table E.1 gets a new "largest jump" column (Armenia/Türkiye: 2022; Kyrgyz Republic/Georgia: 2019) with an explanatory note; the "same 2022 break" claim rescoped to Armenia/Türkiye at all 4 in-text locations (intro, §5 reform-confound, §5.3, §9 Discussion), with Kyrgyz Republic/Georgia now described as "elevated from 2022 on noisier series." |

## Not addressed this round (by design, per the editorial decision)

- Referee A's C3 residual ask (a fully mechanical, ex-ante-coded 5-episode test across the reference class) — the editor's synthesis places this outside the R&R scope; the existing bounded WebSearch proxies (already executed in round 1) satisfy the referee's own stated fallback.
- N4 (document the B=814 cyclic-shift sample size) and N5 (a raw-output typo unrelated to any manuscript claim) — TASTE items, deferred.

## Verification status

All numeric claims above were checked against regenerated `_outputs/*.txt` files (`rq1_estimates.txt`, `mechanism_tests.txt`) before being written into the manuscript. **LaTeX compilation was not run in this session** — Tectonic is not installed on this machine; table structure (column counts, brace balance) was checked manually in every edited block. A full compile pass is recommended before this revision is presented as submission-ready.
