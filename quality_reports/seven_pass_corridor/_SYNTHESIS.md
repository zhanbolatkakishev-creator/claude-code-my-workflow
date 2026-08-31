# Seven-Pass Review: "Corridor, Not Factory"

**Date:** 2026-08-28
**Path:** `Manuscript/corridor.tex` (20 pp; compiles clean; reproducibility audit = PASS)
**Lens reports:** `quality_reports/seven_pass_corridor/lens_1..7_*.md`

## Executive verdict

**Overall state: REVISE-MAJOR.**

The paper has a real spine — a Kazakhstan-specific measurement of the post-2022 trade
reorientation, a value-capture estimate, a documented absence of an investment response, and a
clean reproducibility pipeline. The Armenia/Kyrgyz parallel, the multi-database deal
reconciliation design, and the "corridor, not factory" framing are genuine contributions.

But the **causal/inferential apparatus does not currently support the claims the abstract and
§1 make**, and the pattern is systematic: across §4.3, §5.1, §5.2 and §7 the specification the
paper reports is the one that supports the claim, while a specification the same script
computed that does *not* support the claim is absent from the manuscript. Every one of these
is in the shipped `_outputs/` and will be found by any referee who opens the replication
package. The methods lens scored this 3/10; the robustness lens 4/10. This is fixable, but the
revision is substantial and several headline numbers will move.

**Hallucination gate:** the synthesis introduces no CRITICAL that a lens did not raise. The
five methods CRITICALs were independently re-verified against the output files before this
report was written (see "Verification" below) — they are grounded, not lens hallucination.

## Cross-lens CRITICAL issues

| # | Lens(es) | Issue | Recommendation |
|---|---|---|---|
| **C1** | L3-2, L5-1 | **The headline DiD is run on the wrong basket.** §4.3 reports γ = 2.88 (exports to Russia) and 2.94 (imports from the West) with "treated = priority-list codes" — but §3 says priority-list membership is used "only as a robustness check." The paper's actual object, the data-driven **surge basket**, has an **insignificant** DiD: expRU γ = 1.48 (p = 0.12), mirror-inbound γ = 1.27 (p = 0.17); only KZ-reported imports (`impW`, the series §3 disavows as incomplete) is significant (γ = 1.55, p = 0.015). The surge-basket DiD appears nowhere in the manuscript. | Report the full 2 (basket) × 4 (outcome) DiD grid. Make the surge-basket DiD primary. If it is insignificant on the mirror series, say so plainly and let the descriptive magnitudes + the structural breaks + the Armenia/Kyrgyz parallel carry §4 — the causal language ("a difference-in-differences coefficient of 2.94") must then come down. Reconcile §3 and §4.3. |
| **C2** | L3-1, L5-5 | **The confound defense is compromised.** The "civilian placebo basket" has every surging civilian line deleted (`10_robustness.R:19`, `surge == FALSE` filter), so it cannot fail by construction — and it still does: control-basket break tests are supF 16.0 (p = 0.001) inbound and supF 34.6 (p < 0.001) outbound (`rq1_robustness.txt`). §4.3 reports only "sup-F = 16" and §1 calls it "nothing." The placebo *DiD* (−0.28, p = 0.34) is genuinely clean — that part stands. | Rebuild the placebo on the full 25-line civilian basket. Report both inbound and outbound supF *with p-values*. Disclose that the control-basket breaks are themselves significant and argue why the surge-basket break is still distinguishable (magnitude, timing, co-movement). Drop "shows nothing." |
| **C3** | L3-3 | **The central null has no power analysis and flips with the window.** "7.3 vs 7.5 deals/year, before vs after" rests on ~7 and ~4 annual counts with within-period SD ≈ 3.5 (one pre-period year has zero). No MDE, no CI on the difference — the design could not reject a doubling. Excluding the shock year 2022 gives **9.0/yr (2023–25) vs 7.3/yr**. | Add an MDE / CI on the pre–post difference. Report the 2023–25 window beside 2022–25. Frame the result as "no *detectable* surge, and the design's floor is a response of size X," not "no response." |
| **C4** | L3-4 | **Figure 3 is not an event study.** `06m_monthly_profile.R` saturates 31 monthly aggregate observations with 30 event-time dummies + intercept → zero residual df; the plotted "95% confidence intervals" are zero-width. No control group, so "flat pre-trend" is a de-meaned raw series (pre-period coefficients span ±0.85). | Rebuild as a real DiD event study at HS6 × month against the control basket with clustered SEs, or relabel the figure as a normalised time-series plot and delete the confidence-interval claim from the caption. |
| **C5** | L3-5 | **Test F is contradicted by the paper's own data.** In the deal data, automotive deals *fell* post-2022 (6 in 2015–21 → 3 in 2022–25); electronics was flat (1 → 1) (`mechanism_tests.txt`). The "durable shock drew real capacity" claim rests entirely on press-announced SKD plants — a different evidence source than the electronics arm — and §6 states the auto capacity "predates and is largely independent of the reorientation." The comparison also moves ρ, sunk cost, market-access (EAEU local-content) and destination market at once. | Run a symmetric announcement search for electronics/components, or run both arms on the deal databases. Argue explicitly why I, h and destination market do not confound the ρ contrast. If neither is possible, demote Test F to an illustration and stop calling §7 an "identification." |
| **C6** | L2-1 (C), L1-1, L4-2 | **The "five commercial databases" claim is not yet true.** Abstract, §1, contribution (iii), §6 and Table 2 present a five-database deal analysis and "divergence across deal databases" as a delivered method contribution; FactSet and Dealroom are marked "pending" / "[To run.]" and are not audited. The 7–8/yr rate, "weakest year," and zero-surge-basket claims rest on three sources. | Either run the FactSet + Dealroom extracts before circulating and complete Table 2, or rewrite every mention to "three databases, two more in progress" and move contribution (iii) to future work. Do not describe a cross-database reconciliation the table does not show. |

## MAJOR issues (second-round)

| # | Lens(es) | Issue |
|---|---|---|
| M1 | L2-2, L3-16, L6-4 | **Framework over-sold.** §1 calls the three-gate model a synthesis that "unifies" Dixit–Pindyck and Khanna–Palepu with a "novel" market-access gate; eq. (2) is an asserted multiplicative product, not derived from eq. (1). The mediation / moderated-mediation claim is *asserted and untestable in-sample* — M (HS6 × month) and Y (country × year, ~10 obs) never enter one regression; with R = f × h × g multiplicative and R ≈ 0 observed, the null carries no information about which gate binds, which is exactly what §7 claims to establish. "Complete mediation" is also misused (under h = 1 the direct path is *absent*, not offset). Fix: demote to "an organizing decomposition"; drop "unifies / novel framework / identify"; label the mediation paragraph as a theoretical restatement with no empirical counterpart. |
| M2 | L3-10, L5-3 | **The ~8% value-capture headline is the assumed trade margin, not an estimate.** v_TT = 0.787 and v_M = 0.764 are near-identical, so 8% / 76% ≈ m × 1.03 — the Leontief step cancels. `07_unit_value_wedge.R` *estimates* the retained margin at 21.5%; `08_io_propagation.R` reads it and discards it for a hardcoded 6/10/14% band. At m = 0.215 the answer is ~17%, outside the reported 5–11%. §10's "not estimated line by line" is false, and m > 0 contradicts §5.1's "no positive markup" reading of the wedge. Fix: report the estimated margin, widen the headline range, argue the truncation bias in text, and stop advertising the I-O step as contribution (iii). |
| M3 | L3-11 | **57% of the inbound surge is unaccounted for** ($1,309m in, $562m out; flow-through 0.43) and never discussed. Domestic absorption, unrecorded onward flow, and mirror over-reporting have opposite implications for the headline; none is bounded. Three flow bases ($562m / $618m / $716m) are used interchangeably. |
| M4 | L3-9, L5-2 | **The unit-value wedge is not identified as "transformation."** CIF (imports) vs FOB (exports) pushes the ratio below one mechanically for a landlocked economy — unmentioned. The civilian control basket has a *lower* median wedge (0.57) than the surge basket (0.74), so a sub-unity wedge is not a property of the reorientation. No DiD on the wedge is ever run. The annual run of the same script gives slope 0.184 (p = 0.50); only the significant monthly run (0.27, p = 0.004) is reported. The promised under-invoicing "bound" (§10) does not exist anywhere in the code. |
| M5 | L4-6, L3-6, L3-14 | **No regression table anywhere.** Every DiD, placebo, event study and pass-through slope lives in a prose sentence with no N, SE, FE rows, clustering statement or stars. No identifying assumption (parallel trends, no anticipation, SUTVA) is stated in the text. Inference is unadjusted for the data-driven basket, the single common treatment date (Bertrand–Duflo–Mullainathan), or multiple testing (8 DiDs run, 2 reported). A methods referee will require a full specification table + an identification subsection. |
| M6 | L3-8, L6-17, L4 | **Structural-break reporting is selective and self-contradictory.** Bai–Perron returns mirW breaks at 2021-07, 2022-06 and 2023-08; only 2022-06 is reported and the 2021-07 pre-treatment break (a gradual-liberalisation signature) is suppressed. §4.2 says the break "does not coincide with … the June-2022 referendum" while the inbound break date it just cited *is* 2022m6 = June 2022. supF uses a mean-only model with no HAC on a persistent series, so "424 against critical values in the low tens" and the 16-vs-143 ratio are not interpretable as break strength. Annual break tests run on 8 observations. |
| M7 | L3-13, L5-4 | **The only named confound is the one that runs against the finding.** "New Kazakhstan" is addressed; three confounds that would *generate* the investment null are unnamed: January 2022 Qandy Qantar (state of emergency in the first post-period month); secondary-sanctions / compliance risk deterring exactly the foreign acquirers who would answer the shock; and the 2022–25 nationalisation programme (read only as "ownership-transfer" evidence, not as a greenfield deterrent). |
| M8 | L3-2, L3-15 | **The mirror-gap DiD — the spec most directly testing onward movement — is null and unreported** (0.74, p = 0.71 surge; 1.82, p = 0.39 priority; break supF 5.34, p = 0.16). Either report it and interpret the null, or stop leaning on mirror data as evidence of rerouting. |
| M9 | L3-18 | **`asinh` on a panel of structural zeros.** Every empty HS6 × period cell is filled with zero, then estimated in `asinh`; under Chen–Roth the coefficient is not scale-invariant and has no percent interpretation, yet §4.2 converts it to "log points." No PPML alternative is shown. |
| M10 | L4-1 | **"EU + China" inbound label vs a mirror definition that excludes China.** The headline inbound series is labelled "EU + China" in the abstract, §3, §4.1 and Table 1, but §4's mirror definition lists EU-27 + UK + US + JP + KR + CH + NO with **no China** — first-order for a China–Russia land bridge. Resolve which it is. |
| M11 | L4-3, L4-4, L4-5 | **Tables/figures don't stand alone.** Table 3 places "$m (fund)" next to total private deal value with no note that the bases differ (invalidates the column comparison). Table 4 caption says "index" and §9 describes a four-input composite, but the table shows only raw components and no index column. Figure 1 caption gives no y-axis unit though the paper uses both levels and `asinh`. Tables 1, 4 and the moderators table have no notes at all. |
| M12 | L7-1, L3-21 | **Four load-bearing citations sit in the `.bib` uncited** (Fisman–Wei 2004 for under-invoicing, Koopman–Wang–Wei 2014 and Johnson–Noguera 2012 for value-added trade, Arvis et al. 2010 for transit) — under `plainnat` they are silently dropped from References. No econometrics method is cited anywhere (Bai–Perron, Andrews supF, Chen–Roth, BDM). |
| M13 | L1-2, L2-7 | **Abstract is ~370 words** (three 50–60-word sentences) and carries the full framework + both within-country tests + external validity. The roadmap is a nine-clause single sentence. Cut the abstract to ~200 words; state the question in sentence 1 and the contribution explicitly. |
| M14 | L6-1, L6-2, L6-5 | **Prose regression in the newest sections.** §2, §8 and §10 have a dozen 50–95-word sentences, em-dash pairs that split subject from verb, and a dangling participle in the abstract ("propagating … the domestic value added … is about 8%"). §3–§6 are fine; the fix is localized. |

## MINOR polish

- "Three observations follow" in §2 precedes four emphasized items (L6-3).
- "First host-economy incidence analysis" — soften to "to our knowledge, the first systematic" (L2-3).
- "identical" for deal counts that are 5.1 vs 5.2 (L6-10); "essentially unchanged."
- "Five reorientation intermediaries" but only three are ever named (L5, L6-13).
- Value-chain deal bucket described four different ways with the same counts (L4, L6-14).
- Denominator drift $562m / $618m / $716m needs one reconciliation sentence (L3-20, L4).
- BrE/AmE mix ("industrialize" vs "nationalisation"); "value addition" vs "value added" (L6-11).
- Notation $R$ used before it is defined at eq. (2) (L6-16).
- EAEU / USMCA / "China-plus-one" / sup-$F$ / Bai–Perron / `asinh` unexpanded or uncited on first use (L6-9).
- Reference period −1 = 2022m2 (invasion month); annual `TREAT = 2022-01-01` codes January 2022 as post (L3-19).
- Add a DOI to `johnson2012accounting`; consider a one-line nod to Egorov et al. (CEPR DP 20601, 2025) and the Global Sanctions Data Base (L7-3, L7-4).
- Past/present tense mixing within §4.3 (L6-22).

## Data-availability gate (raised this session, tracked in README + reproducibility audit)

The **state investment corporation (QIC/Baiterek) project register** — which underpins Table 3
and the §7 "captive capital abstained" identification claim — is **not yet public** (expected
~Sep 2026). §3 wording has been changed from "is public" to point at the fund's published
register with the replication package pinning the release date. Hard gate before circulation:
(1) register published, (2) published fields verified to contain project / sector / region /
financing year / cost, (3) replication package pins the release and the extracted fields.

## Per-lens scorecard

| Lens | Critical | Major | Minor | Score/10 |
|---|---|---|---|---|
| 1. Abstract | 0 | 2 | 6 | 6 |
| 2. Intro | 1 | 4 | 4 | 6 |
| 3. Methods | 5 | 13 | 4 | 3 |
| 4. Results | 0 | 6 | 4 | 5 |
| 5. Robustness | 1 | 3 | 4 | 4 |
| 6. Prose | 0 | 5 | 17 | 6 |
| 7. Citations | 0 | 1 | 3 | 7 |
| **Overall** | **7** (6 after dedup) | **34** | **42** | **~4** |

## Verification (post-judge hallucination gate)

Before writing this synthesis the six cross-lens CRITICALs were re-checked against the shipped
outputs, not just accepted from the methods lens:

- **C1** — `rq1_estimates.txt`: surge-basket DiD expRU 1.484 (p = 0.1201), mirW 1.267 (p = 0.1744), impW 1.549 (p = 0.0152); "exposed" (priority-list) DiD expRU 2.875 (p = 2.3e-4), impW 2.940 (p = 4.6e-7). §4.3 text says "treated = the priority-list codes." **Confirmed.**
- **C2** — `rq1_robustness.txt`: placebo control-basket supF mirW 16.02 (p = 0.001), expRU 34.63 (p ≈ 0); placebo DiD −0.282 (p = 0.341). **Confirmed.**
- **C3** — `valueadd_findings.txt` §(3): value-add-relevant deals 2016–21 = 6,15,10,8,6,6; 2022–25 = 3,12,9,6; "51 deals … 7.3/yr" vs "30 … 7.5/yr". 2023–25 = 27/3 = 9.0/yr. **Confirmed.**
- **C4** — `06m_monthly_profile.R:36-38` saturates the monthly aggregate with `i(mrel, ref=-1)`; caption claims "95% confidence intervals." **Confirmed from code + caption.**
- **C5** — `mechanism_tests.txt`: "auto deals 2015-21: 6 | 2022-25: 3", "electronics/precision 2015-21: 1 | 2022-25: 1"; durable-arm evidence labelled "Public record (triangulation)." **Confirmed.**
- **C6** — `corridor.tex` §3 / Table 2 / Appendix A / §10 all mark FactSet + Dealroom "[To run.]" / pending. **Confirmed.**

## Revision plan (recommended order)

1. **C1 + M8 + M5** — Rebuild §4.3 around the surge-basket DiD. Add a full specification table (all baskets × outcomes, with N/SE/FE/clustering), an identification subsection, and selection-aware inference (randomisation over placebo baskets drawn by the same selection rule; wild cluster bootstrap). Report the mirror-gap null. Bring the causal language into line with what survives.
2. **C2 + M6 + M7** — Rebuild the placebo on the unpurged civilian basket; report all supF with p-values and all Bai–Perron breaks with CIs; delete/rewrite the referendum sentence; add Qandy Qantar, secondary-sanctions exposure and the nationalisation programme to §2 and show the null survives them (e.g. domestic-only dealmaking is equally flat).
3. **C3** — Power/MDE for the deal-count null; report the 2023–25 window; reframe "no response" as "no detectable response, floor = X."
4. **C5** — Fix or demote Test F (symmetric evidence sourcing; hold the other moderators fixed). Address the sanctions-compliance alternative for Test D or drop "not a financing story."
5. **C4 + M11** — Rebuild Figure 3 as a real event study or relabel it; give every table complete notes, a consistent base for Table 3's two dollar columns, and an actual index column for Table 4.
6. **M2 + M3 + M4** — Report the estimated 21.5% margin and widen the value-capture range; reconcile it with §5.1; decompose the missing 57% of the inbound flow; address CIF/FOB and the control-basket wedge; deliver the under-invoicing bound or drop the promise.
7. **C6** — Run FactSet + Dealroom and complete Table 2, or downgrade the "five databases" language and contribution (iii) throughout.
8. **M1 + M14** — Demote the framework from "unifying novel theory" to "organizing decomposition"; relabel the mediation paragraph; split the long sentences in §2/§8/§10; fix the abstract dangling participle.
9. **M9 + M10 + M12 + M13** — PPML robustness for the `asinh` panel; resolve the "EU + China" label; wire in or remove the four orphan citations and cite the econometric methods; cut the abstract to ~200 words.
10. **Minors** — the polish list above.

## Contradictions between lenses

- **L2 vs L3/L6 on the framework.** L2 wants the contribution framing *strengthened*; L3 and L6 want the framework claims *dialed back*. Resolved, not contradictory: lead §1 with the empirical contribution (host-economy incidence + value capture + the investment null), which is defensible; demote the three-gate model to an organizing decomposition. Both moves point the same way — the empirical result leads, the theory supports.
- **L3 credit vs C6.** L3 calls the multi-database reconciliation "a genuine methodological contribution"; C6 says the table doesn't show it yet. Resolved: the *design* is a real contribution; it becomes real in the paper when the two extracts are run.

## Token-budget report

Seven-pass review: 7 forked reviewers (parallel) + synthesis with a verification pass against
the output files. Approx subagent tokens: ~815k across the seven lenses (Lens 3 alone ~130k;
its depth is the reason the run is worth the cost here). Runtime ~13 min wall-clock.

Cheaper next time: `/review-paper` (single-pass) for iterative work; `/review-paper --peer
<journal>` for a journal-calibrated editor + two referees once these CRITICALs are closed.
