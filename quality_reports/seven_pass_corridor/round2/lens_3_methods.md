# Lens 3 — Methods / Identification, ROUND 2

**Manuscript:** `Manuscript/corridor.tex`
**Code grounded against:** `scripts/R/kz_passthrough/{05,06,06m,07,08,10}*.R` + `_outputs/`,
`scripts/R/kz_valueadd/{06,07,08}*.R` + `_outputs/`
**Round-1 score:** 3/10 (5 CRITICALs) → **Round-2 score: 5/10 — REVISE-MAJOR**
(Agent had no Write tool; report saved by the orchestrator from its inline delivery.)

## Verdict

Real machinery was added and some round-1 CRITICALs are genuinely closed. But the revision
has a recurring signature: **the round-1 issue was answered with a procedure that does not
test what it is claimed to test** (RI, the placebo, the freight netting, the Figure 3
relabel). Two round-2 CRITICALs are worse than anything in round 1 because they are arithmetic
and evidentiary, not framing. Nothing is fatal to the *paper*; the 5–9% headline and three
sentences must change; the qualitative conclusion probably survives (an honest recomputation
likely makes value capture *smaller*).

## Credit — round-1 issues genuinely resolved

- **C3 (power) — fully resolved, best fix in the round.** `08_power_null.R` produces a real
  MDE by simulation, both windows, Welch + exact Poisson CIs. §6 numbers match `power_null.txt`.
- **Round-1 M2 (I-O step does no work) — cleanly resolved.** §5.2 now says outright v̄^TT≈v̄^M.
- **C1, partially.** Full 2×4 spec grid in Table 2; surge basket primary; null mirror-gap DiD
  reported and disavowed (round-1 M8 closed); PPML + WCB added; §4.2 discloses the
  unfavourable annual W+China supF = 4.12.
- **C5, mostly.** §7's three-reason demotion of the durable/transitory comparison is specific.
- **Round-1 M5/M7 closed.** Identifying-assumptions paragraph added; §2 names Qandy Qantar,
  secondary-sanctions exposure, the nationalisation wave.
- **§8 collinearity disclosure is honest** and matches the NaN cell in `crosscountry.txt`.
- **The wild bootstrap is implemented correctly** (restricted-null residuals, Rademacher at
  the HS6 cluster level, t-stat comparison, B=1999).

## CRITICAL (5)

- **CR-1 — the randomisation-inference benchmark does not test the selection problem it is
  offered for.** `06:88` draws uniformly random baskets of 29 from 75; the surge basket is the
  extreme tail of the same moment the DiD estimates, so p₂=0.009 is near-tautological. The
  correct null is baskets chosen by the *same rule* under H₀. Compounding: (b) the rule is a
  post/pre *ratio* with the pre-period in the denominator (`06:28–30`) → selects
  transitorily-low-pre lines → mechanical upward reversion the FE absorb the *level* of and
  the 3-coefficient pre-trend test (F=0.96/0.37) cannot see; (c) the inbound criterion is
  near non-binding (China ≈ ⅔ of mirWC and grew economy-wide), so the operative screen is
  `expRU_ratio ≥ 2` — selection directly on the headline outcome. *Change my mind:* re-run RI
  as a selection-rule permutation (permute break date / labels, re-apply the ≥2× rule, collect
  the γ distribution); report how many of the 29 lines the inbound criterion actually binds on.
- **CR-2 — §5.2's "34% → 12%" freight netting mixes a censored numerator with an uncensored
  base.** `07:29` censors the margin at zero cell-by-cell (Σretained $180.07m / ΣexpRU
  $524.28m → 0.343); `08:39` deducts freight on the *uncensored* matched-inbound base
  (Σmatched_in ≈ $779m). Consistently computed, the aggregate matched-cell margin is
  (524.28−779.4)/524.28 = **−48.7%**. Separately, `08:34` defines freight lo/mid/hi =
  0.10/0.15/0.20 but uses only mid; propagated, the "upper bound" is 19.4% / 12.0% / 4.6% —
  at 0.20 it falls *below* the stated 6% lower bound and the band inverts. Both bounds are
  unsourced hardcodes (15% freight: code comment only; "6–14% national-accounts convention":
  code comment `08:9–10`, no citation in text/code/bib). The abstract's **5–9%** and
  **$23–45m** inherit this; honestly propagated ≈ **3.6–15%** / **$17–73m**. *Change my mind:*
  show Σmatched_in ≈ 0.66·ΣexpRU, or recompute on one consistent base and print the freight
  sensitivity grid with sources.
- **CR-3 — §8's Armenia/Kyrgyz "deal data show one [null]" claim has no evidentiary basis
  anywhere in the package**, and the cross-country evidence that *does* exist runs the other
  way. `07_crosscountry.R` pulls WDI macro only; Appendix A specifies every deal extract as
  Kazakhstan-only geography. `crosscountry.txt`: ARM d_gfcf **+3.3 pp** of GDP, d_fdi +0.9 pp
  post-2022 (KGZ d_fdi +0.5) — Armenia's investment rate *rose*. *Change my mind:* point me at
  an ARM/KGZ deal extract; otherwise delete "the deal data show one" and address ARM +3.3 pp.
- **CR-4 — Figure 3's "fix" replaced a false claim with a different false claim.**
  `06m:45–47` fits 30 event-time dummies + intercept on 31 monthly aggregate obs (mrel
  −15..+15, all present) → exactly saturated, **zero residual df**. New caption says "bands
  are correspondingly wide"; they are **zero-width**, and the shipped PNG's own subtitle still
  reads "95% CI". The correct HS6-level DiD event study already exists
  (`06:39`; `rq1_estimates.txt:38–47`; `rq1_fig_eventstudy.png`; pre-coefs 0.021 / −0.098 /
  0.334 with SEs 0.29 / 0.15 / 0.24) and is not shown. *Change my mind:* none — swap
  `fig:es` to `rq1_fig_eventstudy.png` and report the HS6-level event-study coefficients.
- **CR-5 — "results are similar dropping 2022" is an unrun robustness check.** No
  year-exclusion, alternative TREAT, or donut spec exists in any script/output. The sentence
  also cites a monthly reference period (2022m2) as the no-anticipation basis for the *annual*
  DiD (TREAT = 2022-01-01, reference year 2021). *Change my mind:* run it and put it in Table 2.

## MAJOR (14)

- **M-1** — the placebo is a different design, not a placebo; selecting on the top quartile of
  pre-2022 `mirWC` and regressing `mirWC` on it is regression to the mean, so γ=−0.95 is
  mechanical. The pair (ratio → +2.44***; level → −0.95***) shows the panel returns a signed
  significant DiD for whichever moment the rule keys on. Undisclosed: 5 of 25 civilian lines
  are themselves surge lines and sit inside the placebo sample; Table 2's caption N=600 is
  wrong for this row (N=200). Fix: pre-2022-size-decile × year FE, or a size-matched control.
- **M-2** — three significance-star errors in Table 2, all overstating: surge/expRU p=0.013
  marked `**` (→ `*`); surge/mirWC p=0.051 marked `*` (→ unstarred; prose "p=0.05" rounds a
  non-sig p down); placebo p=0.00103 marked `***` (→ `**`). Implies the table was hand-keyed.
- **M-3** — §5.1 (median FOB/FOB wedge 1.59, +59%) and §5.2 (value-weighted matched-cell:
  $779m in vs $524m out, −49%) give incompatible answers for the same margin, unreconciled.
- **M-4** — "no large mark-up … on any basis" (§5.1) is contradicted by the paper's own tier
  medians: 3.83 (tier 2, $150.8m gross) and 3.94 (tier 4A, $67.4m) — 42% of matched-cell
  outbound flow at ~4× markups; overall p75 = 4.40. Only the median is reported.
- **M-5** — "no systematic weight gain" asserted 4× (incl. abstract) with **no statistic
  anywhere**; `wt_ratio` is computed at `07:25` and never enters any output.
- **M-6** — Figure 4's shipped PNG is mislabelled: plots `uv_wedge = expRU/mirWC` (FOB/FOB)
  but titled "KZ re-export price / KZ import price", x-axis "uv_expRU / uv_impW", subtitle
  "Mass near 1 = corridor pass-through" — all the CIF variant; `07:68–75` labels not updated
  after the Path-B wedge switch.
- **M-7** — the 2015 zero is imputed (`08_power_null.R:12–16` concedes the bucket table starts
  2016). On 2016–21: pre-mean 8.5/yr (not 7.3), post/pre RR 0.88 (not 1.03), 2023–25/pre RR
  **1.06** (not 1.24). Never disclosed; counts are hardcoded not read from `deals_classified.rds`.
- **M-8** — overdispersion (pre var/mean ≈ 2.9) makes the exact-Poisson RR CI [0.63, 1.65]
  too narrow; the Welch bound in the same file → ~1.87×. Report a negative-binomial CI.
- **M-9** — §5's denominator (incremental Western inbound, flow-through 0.54) is inconsistent
  with §4's West+China basket; on the selection basis incremental inbound ≈ $3.2bn and
  flow-through ≈ 0.15. Only the flow-through-maximising basis is reported. Baseline windows
  also drift (selection 2019–21; incremental 2018–21).
- **M-10** — the "two within-country comparisons" are not independent (Test D and Test F both
  rest on: money went to vehicles/machinery, not components). Abstract + §1 state Test F
  without §7's three disqualifiers; §6 says the auto capacity "predates … the reorientation".
  Shipped `mechanism_tests.txt` / `MECHANISM_SYNTHESIS.md` still assert the strong Test F
  conclusion §7 demoted.
- **M-11** — neighbour series truncated at 2023. ARM 8.8→70.9→93.4→**42.2→12.8**; KGZ
  7.4→12.4→30.3→**11.6→12.0** — both revert to baseline by 2025 while Kazakhstan's does not
  (128/145/119/133). Supports §7's transitory argument; undercuts §8's "share Kazakhstan's
  value on every moderator". Neither stated.
- **M-12** — mis-stated inference concern: HS6 clustering *is* the BDM fix for within-HS6
  serial correlation; the real threat from a single common date is cross-sectional dependence
  in the year shocks (Donald–Lang). No multiple-testing adjustment across ~20 reported tests
  with headline p = 0.013 and 0.051.
- **M-13** — annual supF tests on 8 observations, mean-only model, no HAC, reported to 4 s.f.
  (`p < 10⁻⁴`; `rq1_robustness.txt` has a literal `p = 1`). Report annual breaks descriptively
  without p-values, or rely on the monthly tests.
- **M-14** — §3 misstates the selection rule: code post window is `tt < 2024-06-01` (2022–2024
  on the annual panel, not "2022–2023"); ratios shrunk by +$10,000 both sides (not a raw
  doubling); "modest levels" floors are $200k inbound / $100k outbound. None stated.

## MINOR (3)

- **MIN-1** (taste) — the §2 mediation paragraph's "interpretive device, not a model we
  estimate" label is adequate; keep it, but trim the last two sentences ("Kazakhstan is the
  polar case: h=1…"), which assert a sign for the indirect path nothing estimates.
- **MIN-2** — `power_null.txt` header says "n years = 7" while listing 7 counts for 2015–2021
  (label bug; manuscript is correct).
- **MIN-3** — Table 2 caption N=600 for the whole table but the placebo row is N=200.

## Framing note for the synthesizer

The single most efficient revision move is to **generate every table and every reported number
programmatically from `_outputs/`**. Four round-2 findings (M-2 star errors, M-6 stale figure
labels, M-14 misstated selection window, CR-5 unrun robustness check) are all the manuscript
text having drifted from the code during the Path B rebuild.

```
scorecard:
  lens: "3. Methods"
  round: 2
  round1_score: 3
  critical: 5
  major: 14
  minor: 3
  score_out_of_10: 5
  verdict: REVISE-MAJOR
  headline_numbers_that_must_move:
    - "abstract 5-9% and $23-45m (CR-2) -> ~3.6-15% / ~$17-73m if freight sensitivity is propagated"
    - "§6 'rate ratio 1.24' for 2023-25 (M-7) -> 1.06 on the 2016-21 window"
    - "Table 2 stars on surge/expRU (** -> *) and surge/mirWC (* -> none) (M-2)"
  priority_order: [CR-3, CR-2, CR-4, CR-1, CR-5, M-2, M-1, M-7, M-5, M-10, M-6, M-4, M-3, M-9, M-11, M-12, M-13, M-14, M-8]
```
