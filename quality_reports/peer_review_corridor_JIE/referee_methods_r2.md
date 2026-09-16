# Methods Referee Report — Round 2 (R&R)

**Calibrated to:** Journal of International Economics (JIE)
**Disposition:** CREDIBILITY
**Paper type:** Reduced-form (DiD + structural breaks + a value-capture calibration)
**Critical peeve:** One falsifiable sentence per identifying claim; no aggregating partial arguments into an identification strategy
**Constructive peeve:** Robustness must be tied to a named threat, not coverage theatre
**Manuscript:** `C:\Users\zh.kakishev\my-project2\Manuscript\corridor.tex` (46 pp., was 42)
**Round-1 report:** `quality_reports/peer_review_corridor_JIE/referee_methods.md` (64/100, Major Revision)
**Date:** 2026-09-16

---

## Executive verdict

**Score:** **70 / 100** (weighted composite 72.3, capped at 70 by one failed sanity check — see below)
**Round-1 score:** 64
**Recommendation:** **Minor Revision**, conditional on two verification items (N1, N2)
**Headline:** This is a serious, verifiable revision — two concerns are cleanly resolved, six moved materially, and the author withdrew the paper's second-most-prominent claim when the test I asked for came back against it. But the single regression that carries that withdrawal is estimated on a control pool containing the treated lines, and is reported in the manuscript with a sample size (N = 208, 26 clusters) that exists nowhere in the code.

### Verification note

I cross-checked every claimed number against the `_outputs/` files rather than the author's description. **Eight of ten claimed numbers reproduce exactly**, including some the author had no incentive to get right.

| Manuscript claim | Output file | Verdict |
|---|---|---|
| Residual-set γ = −0.15, bootstrap p = 0.87 | `rq1_estimates.txt:97,138` (−0.1506, s.e. 0.9415; p_wcb = 0.870) | ✓ exact |
| Residual-set inbound −0.49, p = 0.67 | `rq1_estimates.txt:103,139` (−0.4939; p_wcb = 0.669) | ✓ exact |
| Level ratios 11.6× / 3.5× / 2.4× | `rq1_estimates.txt:168–170` | ✓ exact |
| HAC sup-F 561 → 326, CI unchanged | `rq1_monthly.txt:9–10` (561.1 → 325.6; both [2022-04, 2022-06]) | ✓ exact |
| Western-inbound CI widens to 2022m3 under HAC | `rq1_monthly.txt:7–8` | ✓ exact |
| W+China increment restricted to 2022–24 | `rq2b_io_propagation.txt:5–6` ($3,239m; both bases give 0.15) | ✓ exact |
| 2018 event-study coefficient 0.19 (0.90), p = 0.835 | `rq1_estimates.txt:149` | ✓ exact |
| Cyclic-shift γ null: mean 1.64, s.d. 1.20, p = 0.29 | `rq1_did_robustness.txt:64–65` | ✓ exact |
| "48% wholesale-trade-margin anchor" | `rq2b_bns_io_check.txt:62` (48.4%) — number correct, **but it is not a wholesale-only anchor** | ✗ mischaracterised in the response letter |
| "Symmetric announcement search for components" (§7) | `06_mechanism_tests.R:60–61` and `mechanism_tests.txt:55–56` state *"no symmetric announcement search was run for components"* | ✗ **manuscript contradicts the repo** |

A second, unprompted confirmation that the HAC work is real rather than cosmetic: the correction *did* bind where it should. `rq1_monthly.txt:7–8` shows the Western-inbound CI widening from [2022-04, 2022-06] to [2022-03, 2022-06] under Newey–West, while the outbound CI does not move. A silently-ignored `vcov.` argument would have left both unchanged. The author passed a test they did not know I would run.

---

## Pre-scoring sanity checks (updated)

| Check | R1 | R2 | Evidence |
|---|---|---|---|
| Sign check | PASS | PASS | Unchanged. |
| **Magnitude check** | **FAIL** | **PARTIAL** | Two of three round-1 defects cured. Units of $y$ now stated (`corridor.tex:541–542`); the asinh-vs-PPML magnitude gap is reconciled in text. The third defect — a starred coefficient the paper declares non-identified — is disclosed but the star itself survives at `:634`. Disclosure without removal is PARTIAL, not PASS. |
| Dynamics check | PARTIAL | **PASS** | The 2018 coefficient is now reported: 0.19, s.e. 0.90, p = 0.835 (verified `rq1_estimates.txt:149`). No mean-reversion artefact materialises. |
| Clustering check | PASS | PASS (new caveat) | Clustering level unchanged and correct, but the reported cluster count for the new residual row is wrong — see N1. |
| **Sample check** | PASS (exemplary) | **FAIL** | The 75-line construction remains exemplary (Appendix B unchanged). But the manuscript states the residual row has "N = 208 (26 lines)" and "26 clusters." No 26-line regression exists in the repository: `06_eventstudy_did.R:57–64` and `wcb_tv()` at `:70` pass the **full 75-line panel** for all three treatment arms. N = 600, 75 clusters (corroborated by the pre-trend Wald test's "3 and 74 DoF," `rq1_estimates.txt:143`). |

**One FAIL is recorded. Per protocol, the composite is capped at 70.** The uncapped weighted composite is **72.3**. The cap is worth 2.3 points and is removable by re-running one regression on the correct sample and correcting three numbers in a table note. I apply it because the row in question is now cited in the abstract.

The author subset the sample correctly for the *placebo* row (`10_robustness.R`, `rq1_robustness.txt:10–12`), which is why I read the residual-row sample as an oversight rather than a design choice.

---

## C1–C8: Resolved / Partial / Not addressed

| # | Round-1 concern | Verdict | One-line basis |
|---|---|---|---|
| C1 | Main-text DiD stars a coefficient the paper declares non-identified | **Partial** | Framing fixed in four places; the star at `:634` and the 16-row Appendix C apparatus survive |
| C2 | "External corroboration" shares 24 of 29 lines | **Partial** | The test was run and the claim withdrawn — but on a contaminated control pool and a misreported sample (N1) |
| C3 | "Roughly tenfold" computed on a basket selected for large ratios | **Partial** | Selection-free ratios computed and verified; abstract, intro §1 and §5.1 all still say "tenfold"/"order of magnitude" unqualified; no Table 1 row added |
| C4 | Break-date CI has no HAC correction | **Resolved** | `06m_monthly_profile.R:31–53`; `rq1_monthly.txt:5–10`; reported in abstract, §5.2 and Appendix E |
| C5 | West+China increment mixes bases | **Resolved** | `08_io_propagation.R:26–39`; `rq2b_io_propagation.txt:5–6`; both bases printed, mixed one labelled "do not use" |
| C6 | Auto-vs-components pairs a searched against an unsearched sample | **Partial — contradicted by the repository** | Manuscript `:991–998` asserts a search; `06_mechanism_tests.R:60–61` and its output say none was run (N2) |
| C7 | Value-capture headline leads with a chosen parameter | **Partial** | (3) done well; (2) half-done; **(1) not addressed** — the "anchor" is not a wholesale-only margin |
| C8 | Abstract says "rules out"; body says "illustrative" | **Partial** | Abstract softened exactly as offered; "rules out" survives six times in the body |

### C1 — Partial

Table 2's note now reads: *"Stars are reported for completeness but should be read against Panel C."* The abstract, §5.1, and the Limitations paragraph all now say the DiD is not read as an identified magnitude. But γ = 2.44 still carries a star at `:634`; Appendix C still carries 16 surge-basket rows; the Holm-adjusted p and wild-bootstrap p remain in the table note. Four paragraphs of correct disclosure do not undo one glyph. **What would change my mind:** delete the star from the surge-basket row of Panel A, or move the row to Appendix C.

### C2 — Partial (the test was run; the regression is not the one described)

**Credit:** the test was genuinely run and tagged to this concern (`06_eventstudy_did.R:33–36`), and the result came back against the author's prior claim — the author withdrew the claim rather than burying it, across the abstract, intro, Table 2, Table C.1, and Limitations. That is exactly the conduct asked for.

**The defect:** the regression producing γ = −0.15 is not a DiD of the 26 residual lines against a clean control. `06_eventstudy_did.R:57–64` loops the treatment indicator over the **full 75-line panel** without subsetting, so the control group for `exposed_only` includes all 29 surge-basket lines — the most heavily treated units in the sample (which rose 11.6×). This mechanically pushes γ toward zero/negative. The residual set's own level rise is 2.4× (not zero). The comparative statement (priority-list coefficient is carried by the shared lines) survives; the absolute reading ("indistinguishable from zero," `:109–111`) does not follow from this specification. Compounding this: the manuscript reports "N = 208 (26 lines)" and "26 clusters," neither producible from the repository — actual N = 600, 75 clusters.

**What would change my mind:** re-estimate on a clean sample — 26 treated lines against the uncontaminated civilian control set (already constructed in `10_robustness.R`), excluding the surge basket entirely — and report the correct N/clusters, with the 2.4× level ratio stated alongside.

### C3 — Partial

Selection-free ratios (11.6×/3.5×/2.4×) are computed and verified, and the intro states the 3.5× comparison. But the abstract and §5.1 still say "roughly tenfold" / "an order of magnitude" unqualified, forty lines from the caveat; no Table 1 row was added. **What would change my mind:** attach the selection-free number to "tenfold" the first two times it appears, and add a priority-list row to Table 1.

### C4 — **Resolved.** HAC break test implemented and verified (`rq1_monthly.txt`): outbound CI unchanged, Western-inbound CI widens by one month — a differential response that is evidence the correction is real, not cosmetic. Annual neighbour HAC attempted and honestly reported as not numerically stable at n=8.

### C5 — **Resolved.** West+China increment now correctly restricted to 2022–2024; both bases printed; the correction is small (ratio 0.15 either way) and its immateriality is disclosed rather than concealed.

### C6 — Partial, and contradicted by the repository (see N2). The manuscript claims a symmetric search was run; `06_mechanism_tests.R` and its output state the opposite. No search protocol exists for either this search or the parallel Türkiye/Georgia one. The coverage-stability check on the sector subset by source/year (round-1 sub-ask) is also not addressed.

### C7 — Partial. The 0.34 estimate is now engaged quantitatively and carried into Table D.1 as a labelled anchor — full credit. The unconditional threshold statement appears in the abstract and §5.2, but both still *lead* with "5–11 cents"/"8%"/"$23–53m" in bold. The claimed "wholesale-margin-only anchor" (48%) is arithmetically the pre-existing 49% ceiling minus the already-known 1% transport component, not a new estimate, and the direction is adverse (48% is far above the 6–14% band). The ask — compute m from BNS ISIC 46 wholesale gross output over basic-price value of goods distributed — was not attempted, though the needed data (`out["46"]`) is already loaded in `08b_kz_bns_io.R`.

### C8 — Partial. The abstract was softened exactly as offered. But "rules out capital-market institutions / the institutional gate as the binding constraint" survives six times in the body (Introduction, Contribution, §3, §7 ×2, §9 Discussion, Limitations), including in the same paragraph as the "illustrative, not a controlled test" disclaimer. The claim relocated rather than resolved.

---

## NEW concerns introduced by the revision

### N1 (MAJOR) — The residual-set DiD is estimated against a control pool containing the treated lines, and its reported sample does not exist

See C2. Two components: (1) specification — `exposed_only` is run on the full 75-line panel, so its control group contains all 29 surge-basket lines; (2) reporting — "N = 208 (26 lines)" and "26 clusters" appear three times in the manuscript and match no script; actual N = 600, 75 clusters. This is now load-bearing in the abstract, intro, Table 2, Table C.1, and Limitations. **Not fatal** — the residual set's own 2.4× level rise supports the qualitative conclusion independently of the flawed regression — but it must be re-run on a clean sample before the claim is fully earned.

### N2 (MAJOR) — Manuscript and replication package contradict each other on whether the components search was performed

`corridor.tex:991–998` asserts a symmetric announcement search; `06_mechanism_tests.R:60–61` and `mechanism_tests.txt:55–56` assert none was run. No protocol file exists for this search or the parallel Türkiye/Georgia one. Under this project's cross-artifact protocol, a manuscript claim the code output directly denies is a reproducibility failure, not a wording issue.

### N3 (MINOR–MAJOR) — The Kyrgyz break is dated 2019 in the author's own output, not 2022

The abstract now leans more weight on "a neighbour comparison." But `rq1_robustness.txt:36–37` shows the Kyrgyz Republic's and Georgia's largest jump at 2019, not 2022 (only Armenia and Türkiye date theirs to 2022). The manuscript still says "Armenia and the Kyrgyz Republic show the same 2022 break" in four places. The Kyrgyz *level* series does rise in 2022, so the claim is defensible on levels, but the break test cited for it dates the jump three years earlier and the paper does not say so — this matters more now that identification weight has shifted onto this comparison.

### N4 (MINOR) — Cyclic-shift γ null uses B=814 (vs 1800 for the free permutation), unexplained retention rule. Note: this check came out *against* the referee's own round-1 prediction (narrower, not wider, than the free-permutation null) and was reported honestly rather than suppressed — flagged as a positive alongside the minor documentation gap.

### N5 (MINOR) — `rq1_did_robustness.txt:20` has a stray malformed line ("55 would still qualify," out of 29) — a formatting bug in `12_did_robustness.R`, not a paper claim (the manuscript's own number is correct).

---

## Dimension scores

| # | Dimension | Weight | R1 | R2 | Weighted | Δ |
|---|---|---|---|---|---|---|
| 1 | Identification | 35% | 55 | 68 | 23.80 | +13 |
| 2 | Estimation | 17% | 58 | 70 | 11.90 | +12 |
| 3 | Inference | 13% | 65 | 72 | 9.36 | +7 |
| 4 | Measurement / calibration transparency | 15% | 62 | 70 | 10.50 | +8 |
| 5 | Robustness | 12% | 84 | 86 | 10.32 | +2 |
| 6 | Replication readiness | 8% | 82 | 80 | 6.40 | −2 |
| | **Weighted composite** | 100% | 63.5 | | **72.3** | +8.8 |
| | **After Sample-check cap** | | 64 | | **70** | +6 |

Replication readiness is the only dimension to fall, for one reason: `mechanism_tests.txt` now contradicts the manuscript. Everything else about replication readiness improved, including a practice worth standardising — every revision-driven code block is commented with the referee concern it answers (e.g. `06_eventstudy_did.R:35` "JIE round-1 review, Referee B Concern 2"), which is what made this verification possible in under an hour.

---

## Recommendation

**Minor Revision**, conditional on two verification items:

1. Re-estimate the residual-set DiD on a control pool excluding the surge basket; correct the reported N and cluster count; report the 2.4% level ratio alongside.
2. Reconcile the components-search claim with `06_mechanism_tests.R` — commit a protocol and update the script, or withdraw the word "search."

Ordinary editorial items (not conditions): delete the star from Table 2's surge-basket row (C1); attach the selection-free ratio to "tenfold" in the abstract/intro and add a priority-list row to Table 1 (C3); compute m from BNS ISIC 46 (C7-1); replace "rules out" with "is inconsistent with" at the six body locations (C8); report the break-test jump year per neighbour in Table E.1 (N3).

---

## Summary for the editor

This revision does the thing that matters most: it ran the decisive test, the test came back against the author, and the author withdrew the claim from every location it appeared rather than reframing it — verified independently against `_outputs/`, not taken on the response letter's word. Two concerns (C4, C5) are cleanly resolved in code. The consistent pattern in the six Partial items: where the fix was a computation, it was done and done honestly; where the fix was framing, the disclosure was added but the original wording survives beside it (the DiD star, "roughly tenfold," "rules out"). Two new problems are mine to flag: the residual-set regression carrying the paper's central withdrawal is estimated against a control pool containing the treated surge-basket lines and is reported with a fabricated sample size, and the manuscript's new "symmetric announcement search" is directly contradicted by the script that supposedly ran it. Neither is fatal — the residual set's own 2.4% level rise (vs. the surge basket's 11.6%) supports the paper's reading independently of the flawed regression — but both must be fixed before the claim is fully earned. **64 → 70 (72 uncapped), Minor Revision**, conditional on the two items above.
