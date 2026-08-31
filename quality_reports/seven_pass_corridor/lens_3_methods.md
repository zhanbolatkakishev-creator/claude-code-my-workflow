# Lens 3 — Methods and Identification

**Manuscript:** `Manuscript/corridor.tex` — "Corridor, Not Factory"
**Reviewer role:** methodology referee, JCE / EER tier
**Grounding:** `scripts/R/kz_passthrough/`, `scripts/R/kz_valueadd/` (read, not run);
`quality_reports/reproducibility_audit_corridor.md` (PASS).
**Score: 3/10 — 5 CRITICAL, 13 MAJOR, 4 MINOR.**
(Agent had no Write tool; report persisted by the orchestrator from its inline delivery.)

## Summary judgement

The reproducibility audit PASS is orthogonal to whether the design identifies anything. The
descriptive core is real and interesting; the inferential apparatus has five blocking defects.
Recurring pattern across §4.3, §5.1, §5.2, §7: **the reported specification is the one
supporting the claim, and a specification the same script computed that does not support the
claim is not reported.** No intent alleged — run-order explains most of it — but a referee
will find it, because the outputs ship in the replication package.

## CRITICAL

- **L3-1** — Placebo / control-basket tests for the "New Kazakhstan" confound run on a civilian
  basket with every surging civilian line deleted (`10_robustness.R:19`,
  `ctrl <- p[exposed==FALSE & surge==FALSE]`). The placebo cannot fail by construction — and
  still does: supF 16.02 (p=0.001) inbound, 34.63 (p<0.0005) outbound (`rq1_robustness.txt:2-3`).
  Paper reports only the smaller and calls it "nothing". Like-for-like outbound is 34.6 vs
  60.2, not "16 against 143".
- **L3-2** — Headline DiD (γ=2.88/2.94) uses the **priority-list** treatment, which §3 says is
  "only … a robustness check". The **surge-basket** DiD is insignificant and unreported:
  expRU 1.484 (p=0.120), mirW 1.267 (p=0.174) (`rq1_estimates.txt:8-22`). Inbound headline is
  on `impW_usd` (KZ's own imports, §3 calls incomplete); mirror version 1.93 (p=0.005), 34%
  smaller.
- **L3-3** — Central deal-count null is 7 pre + 4 post annual counts, within-period SD ≈ 3.5
  (6,15,10,8,6,6 pre; 3,12,9,6 post). No power calc / MDE / CI on the difference. Excluding
  shock year 2022 → 9.0/yr (2023–25) vs 7.3/yr, a 23% increase.
- **L3-4** — Figure 3 "event study … 95% confidence intervals" is a saturated regression:
  31 monthly aggregate obs vs 30 dummies + intercept, zero residual df
  (`06m_monthly_profile.R:36-38`). Plotted intervals are zero-width. No control group, so
  "flat pre-trend" describes a de-meaned raw series; pre-period coefficients span ±0.85.
- **L3-5** — Test F compares press-announced plants (auto arm) against database deal counts
  (electronics arm). On a common source: auto deals 6 (2015–21) → 3 (2022–25); electronics 1
  and 1 (`mechanism_tests.txt:43,55`). §6 itself says the auto capacity "predates and is
  largely independent of the reorientation". Also varies ρ, I, market access and destination
  market at once.

## MAJOR (13)

- **L3-6** — No identifying assumption stated anywhere (no "parallel trends", "no
  anticipation", "SUTVA" in the text). Control basket = beer, coffee, T-shirts, footwear,
  furniture, toys, shampoo, tyres, refrigerators vs treated = ICs, machine tools,
  oscilloscopes, aircraft parts. Annual event study matching the reported DiD has a
  significant pre-treatment coefficient (t_rel −4 = 0.784, p=0.024, `rq1_estimates.txt:70`),
  unreported. Reference period −1 = 2022m2 (invasion month); annual spec codes Jan 2022
  (incl. Qandy Qantar) as post.
- **L3-7** — SUTVA violated by the paper's own numbers: 6 of 31 surge lines are control-basket
  codes carrying $167.4m of the $561.8m post-2022 gross flow (30%). The DiD control group is
  treated. HS 870899 (vehicle parts) is in the control basket while §7 makes vehicles the
  treated arm of Test F.
- **L3-8** — Bai–Perron finds multiple breaks; one reported. mirW at 2021-07, 2022-06, 2023-08;
  expRU at 2020-01, 2022-04 (`rq1_monthly.txt:4-5`). The 2021-07 pre-treatment break (gradual
  liberalisation signature) is suppressed. Inbound break IS 2022m6 = the referendum month,
  which §4.2's sentence explicitly denies. supF uses a mean-only model, no HAC, persistent
  series → magnitude ratios uninterpretable. Annual tests use 8 observations. No break-date CIs.
- **L3-9** — Unit-value wedge not identified as transformation. CIF (imports) vs FOB (exports)
  mechanically pushes the ratio below one for a landlocked economy — unmentioned. Control
  basket has a *lower* median wedge (0.570) than surge (0.742) (`rq2a_unit_value_wedge.txt:22`).
  No DiD on the wedge. 0.27 slope is textbook attenuation; regressor built from KZ's
  "incomplete" import reports. Annual run of the same script: slope 0.184, SE 0.267, p=0.497
  (`rq2a_unit_value_wedge.txt:26`) — only the significant monthly run reported.
- **L3-10** — ~8% headline is not robust and the I-O step does no work: v_TT=0.787, v_M=0.764
  near-identical, so 8%/76% = m × 1.03 and the result *is* the assumed m=0.10.
  `07_unit_value_wedge.R` estimates the retained margin at 21.5% (`rq2a_unit_value_wedge.txt:8`);
  `08_io_propagation.R:19` reads it and discards it for a hardcoded 6/10/14% band (line 38). At
  m=0.215 → 17%, outside the reported 5–11%. §10's "not estimated line by line" is false. m>0
  contradicts §5.1's "no positive margin" reading.
- **L3-11** — 57% of the inbound surge unaccounted for: $1,309m in, $562m out, flow-through
  0.43. Domestic absorption / unrecorded onward flow / mirror over-reporting have opposite
  implications, none bounded. Three flow bases ($562m / $618m / $716m) used interchangeably.
- **L3-12** — Test D does not support "not finance". QIC/Baiterek is unconstrained in
  financing but allocates under statutory programmes, not as an optimiser; and a state vehicle
  is the actor *most* exposed to secondary-sanctions/reputational risk from financing
  restricted-goods rerouting — an unraised alternative. Measurement is a Russian-language
  keyword regex over ~50 project names (`06_mechanism_tests.R:32-35`); no HS6-to-deal linkage
  anywhere though the text implies product-level matching.
- **L3-13** — The only named confound is the one running *against* the finding. Unnamed:
  Jan 2022 Qandy Qantar (state of emergency in the first post month); secondary-sanctions
  exposure deterring the foreign acquirers who would answer the shock; the 2022–25
  nationalisation programme read only as "ownership transfer" evidence, not as a greenfield
  deterrent.
- **L3-14** — Inference unadjusted for the data-driven basket, the single common treatment
  date, multiple testing. CRVE invalid when the treated set is a function of the post-period
  outcome. BDM serial correlation applies regardless of 75 HS6 clusters. 8 DiDs run, 2
  reported, no correction, no specification grid.
- **L3-15** — Mirror-gap DiD (the spec most directly testing rerouting) is null and
  unreported: 0.736 (p=0.713) surge, 1.818 (p=0.389) priority; break supF 5.34, p=0.155
  (`rq1_estimates.txt:24-28,62-66,84`).
- **L3-16** — Mediation / moderated-mediation asserted and untestable in-sample: no a/b path,
  no indirect effect; M (HS6×month) and Y (country×year, ~10 obs) never in one regression.
  R = f×h×g multiplicative and R≈0 observed → the null carries no information about which gate
  binds, which is exactly what §7 claims. "Complete mediation" misused (under h=1 the direct
  path is absent, not offset).
- **L3-17** — Contrary macro evidence dismissed as "noisy" while supporting narrative asserted
  without data: `crosscountry.txt` shows Vietnam investment −0.8pp, FDI/GDP −0.5pp; Mexico
  FDI/GDP −0.4pp; Kazakhstan +1.0pp, Armenia +3.3pp. Intermediary group does not underperform
  the durable group on any of the three aggregates.
- **L3-18** — asinh on a panel where every empty cell is a structural zero
  (`05_panel_build.R:54`). Under Chen–Roth γ=2.88 has no percent interpretation, yet §4.2
  converts to "log points". No PPML alternative.

## MINOR (4)

- **L3-19** — Reference-period contamination (month −1 = 2022m2; annual TREAT = 2022-01-01).
- **L3-20** — Denominator drift $562m / $618m / $716m.
- **L3-21** — No econometric methodology cited (Bai–Perron, Andrews, Chen–Roth, BDM, any DiD
  ref); Koopman–Wang–Wei, Johnson–Noguera, Fisman–Wei in `.bib`, uncited. [Cross-lens L7-1.]
- **L3-22** — Test C infers ρ ex post from the realised decline.

## Credit where due

Frozen-basket design for the monthly analysis is the right instinct. §8's admission that
persistence and financial depth are perfectly collinear is honest. The multi-database deal
reconciliation (Table 2) is a genuine contribution. The reproducibility pipeline is unusually
clean — every number traced to an output file in seconds, which is what made this review
possible.

```
scorecard:
  lens: "3. Methods"
  critical: 5
  major: 13
  minor: 4
  score_out_of_10: 3
```
