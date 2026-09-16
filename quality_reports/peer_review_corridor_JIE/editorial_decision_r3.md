# Editorial Decision — Round 3 (Final)

**Journal:** Journal of International Economics (JIE)
**Manuscript:** "Corridor, Not Factory: Trade Reorientation and the Missing Investment Response in Kazakhstan, 2022–2025"
**File:** `Manuscript/corridor.tex`
**Round-2 decision:** Major Revision (7 required + 5 expected items) — `editorial_decision_r2.md`
**Date:** 2026-09-16

---

## Decision

**Minor Revision, converting to Accept once the editorial punch list below is applied.** This is the final round under this pipeline's round cap (`--r3`, no round 4). Both referees independently re-verified every claimed fix against the manuscript source and the underlying R code — not the response letter — and both converge on the same conclusion from different directions: the two conditions that blocked round 2 are genuinely discharged, the theory self-contradiction is gone, and what remains is a short list of editorial corrections, none of which changes a conclusion.

## Score summary

| | R1 | R2 | **R3** | R3 recommendation |
|---|---|---|---|---|
| Referee A (domain, THEORY) | 58 | 65 | **73** | Minor Revision — no remaining conditions |
| Referee B (methods, CREDIBILITY) | 64 | 70 | **79** | **Accept**, subject to editorial corrections — no further round needed |

Trajectory: both referees' scores rose in every round, and — notably — both referees used this round to correct one of their *own* prior positions against their self-interest as critics: the domain referee found no new theoretical defects and conceded C3 without pressing it further; the methods referee re-examined their own round-2 BNS-margin complaint (C7) and concluded it was "accurate about the response letter and inaccurate about the manuscript," recording the correction against themselves.

## Why this closes the loop

**The two round-2 conditions (N1, N2) are resolved, not just addressed.** This is the headline. Referee B traced `06_eventstudy_did.R`'s `p_resid` construction line by line, confirmed the clean sample (26 treated + 20 purged civilian control, N=368/46 clusters, zero contamination from the 29-line surge basket), and cross-checked every reported number against the regenerated `_outputs/*.txt` — all exact. The fix **reversed the finding**: what was reported as a null in round 1 (γ=−0.15, p=0.87, on a contaminated sample) is now a significant, smaller-magnitude positive effect (γ=1.94, wild-cluster bootstrap p=0.035, on the corrected sample). Both referees independently flagged the same thing as the most creditable feature of this round: the manuscript did not use this reversal to overclaim. It kept the cautious "partial, smaller-scale corroboration, not a fully independent replication" framing throughout, and reported the non-confirming inbound leg (γ=1.12, p=0.238, not significant) in the same breath as the significant outbound result.

**The theory cascade is complete, not selective.** Referee A named four specific locations in round 2 where the disavowed "sufficient on its own" claim survived after Section 3 was fixed; all four verify as fixed in round 3, and the rewrite additionally re-derives Section 7's conclusion under the weaker premise rather than merely restating it. The abstract-vs-Section-3 contradiction (NEW-1) and the Limitations sign-inversion on the Türkiye/Georgia result (NEW-2) are both resolved — the latter, per Referee A, "fixed in the harder direction, against the author's interest."

**Both referees independently checked for regressions and found none.** Referee A confirmed no stale trace of the withdrawn null survives anywhere the corrected number now appears (abstract, intro, Table 2, Table C.1, Limitations). Referee B text-searched for "N=208," "26 clusters," "-0.15," and "indistinguishable from zero" and found zero hits.

## What's left: an editorial punch list, not a fourth round

Both referees are explicit that nothing below is a condition of their recommendation.

| # | Item | Referee | Fix |
|---|---|---|---|
| 1 | Residual-arm DiD (γ=1.94) has no pre-trend test or event-study figure on its own headline outcome (`expRU_usd`) — only the inbound leg is shown | B (M2) | Add `mk(p_resid, "expRU_usd", "exposed_only")$es` and its pre-trend Wald test to `06_eventstudy_did.R`; regenerate |
| 2 | "Roughly a fifth of the shared lines' scale" (intro, Limitations) is asserted with no supporting estimate — the 24 shared lines' own coefficient is never computed | B (M1) | Delete the specific fraction; replace with "at a smaller magnitude" (referee's own recommended fix) |
| 3 | One "same 2022 break... same timing" claim in §9/moderators was missed by the N3 rescoping sweep | B (M4) | Apply the same "elevated from 2022 on a noisier series" qualifier used at the other 4 locations |
| 4 | Table 1's new priority-list row is indented as if it were an "of which" subset of the surge basket; it isn't (82 > 17 in 2018) | B (M5) | Un-indent and relabel as "Priority list (50 HS6), overlapping comparator" |
| 5 | Table 2's three DiD rows use different control pools (rows 1-2: full panel; row 3: purged); one star survives on the KZ-imports column without its randomisation-inference defense visible in Panel C | B (M3) | One clause in the table note; either print the 3 remaining RI rows in Panel C or drop the star |
| 6 | "A symmetric announcement search" (§7, l.~1030) denies its own symmetry two sentences later | B (N2 residual) | Change "symmetric" to "parallel"; optionally add a short appendix note on both search protocols |
| 7 | LaTeX has not been compiled this entire revision cycle (no distribution on this machine) | Both | Compile before submission — table structure was checked manually and both referees judge compile risk low, but this is not a substitute for an actual compile pass |

None of these seven items is disputed, all are mechanical, and Referee B explicitly frames item 1 as "the only one I would ask the editor to confirm in the proof file" rather than a re-review condition.

## Recommendation

Apply the seven items above (five are one-line or one-word edits; item 1 is a small R addition + re-run; item 7 is compilation, not authoring) and consider the manuscript ready for submission. **No further simulated referee round is warranted** — both referees have said so explicitly, and the round cap (`--r3`) forecloses a fourth round under this pipeline in any case.

---

*Prepared by the editor agent (synthesizing `referee_domain_r3.md` and `referee_methods_r3.md`) per `/review-paper --peer JIE --r3`.*
