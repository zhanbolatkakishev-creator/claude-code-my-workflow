(Saved by the orchestrating session; the referee agent had no Write tool and returned this text.)

# Methods Referee Report

**Calibrated to:** European Economic Review (EER), special issue "Global Trade Fragmentation and Regional Trade Alliances"
**Disposition:** MEASUREMENT
**Paper type:** Descriptive. It is a quantitative case study with reduced-form parts (structural breaks, HS6 difference-in-differences, a Poisson rate test) and an organising three-gate framework that it does not estimate.
**Critical peeve:** The sample must be documented end to end, from raw data to the analysis sample.
**Constructive peeve:** Robustness checks should each be motivated by a specific threat.
**Date:** 2026-10-05

Calibrated to: EER, Disposition: MEASUREMENT, Paper type: Descriptive.

**How I applied the weights.** The EER methods-referee adjustments are written for a reduced-form rubric. To apply them to a descriptive paper I did three things. I mapped "Identification" (+3) onto the descriptive "Analysis" dimension, which here means identifying and making inferences about the trade shock. I raised Replication from 5 to 8. I added External validity at 15 and Mechanism / framework discrimination at 25. The raw weights then sum to 146, so I rescaled them to 100 and rounded (one point went to framework discrimination, which the profile stresses).

**Basis of the review.** I read the whole extracted manuscript, including Appendices A–F, Tables 1–5, B.1, C.1, D.1, E.1 and the footnotes. I could not run code and did not look at the replication package. Every arithmetic check below uses the rounded figures printed in the manuscript. In Section 3, equation (1) and the definition of V_T are partly garbled in the extraction: brace labels such as "PV of production margin" and "option value of waiting" run into the text, and a parenthesis is unbalanced. I have not judged the equations on their typography. (Orchestrator note: this is an artefact of the plain-text extraction of native Word equations, not of the Word file.)

---

## Executive verdict

**Score:** 59 / 100
**Recommendation:** Major revision
**Headline:** The method mostly does what the paper now claims, and the claims are modest and honestly bounded. Two things are missing:
- **Sample documentation.** The raw-to-analysis construction of the two load-bearing samples is not documented to the standard the conclusions need. These are the deal universe behind the investment null and the mirror-based inbound flow behind the flow-through and value-capture figures.
- **The investment measure.** Deal counts are a weak and poorly targeted stand-in for "investment response".

Both problems can be fixed. Neither is fatal as things stand. Separating the three gates is fragile in a way the paper itself admits, and that weakness is probably built into a single-country design.

---

## Pre-scoring sanity checks

| Check | PASS/FAIL | Evidence |
|---|---|---|
| **Descriptive: construct validity of the shock measure** | PASS | Exports to Russia in a fixed HS6 basket, with a break dated by Bai–Perron (§5.2) and a selection-free comparator (priority list, Table 1). The magnitude of the shock is measured transparently. |
| **Descriptive: construct validity of the investment measure** | PARTIAL | The outcome is M&A/PE/VC deal counts in a broad "manufacturing + transport + distribution" aggregate (§7). That counts transactions, not capacity. The paper admits this (Limitations, fourth point). See Concern 2. |
| **Descriptive: construction transparency (deal universe)** | **FAIL** | Appendix A gives the query parameters and the de-duplication rule. The manuscript does not report: raw counts per extract, the number of records removed by de-duplication, the crosswalk, the list of ISIC divisions in the 82-deal subset, or the rule for the greenfield/ownership-transfer flag. Section 4 says "N ≈ 500" and Table 3 says 493, and the paper does not reconcile them. The per-source columns of Table 3 sum exactly to the de-duplicated totals (Concern 1). |
| **Descriptive: construction transparency (surge basket)** | PASS, with gaps | The rule, thresholds, floors, $10k offset and windows are all stated (§4, App. B). Counts are given for each leg (55 outbound, 41 inbound, 29 both). Missing: a full selection funnel, the rule used to choose the 25 civilian controls, and how China's preliminary 2024 data enter the rule. |
| **Descriptive: construction transparency (mirror inbound)** | PARTIAL | The reporter set is listed (§4). China's 2025 gap is shown in Table 1. How the gap is handled in the DiD panel, the monthly figures and the break tests is not documented, and the source for 2024 outbound is unclear. Footnote 2 contains an arithmetic inconsistency (Concern 3). |
| **Descriptive: validation** | PARTIAL | Positives: the BNS input–output cross-check, the neighbour series, the priority-list comparator, and the permutation tests. Negative: the "cross-database" validation of deal counts appears to be a partition of a single pooled series, not three independent checks (Concern 1). |
| **Reduced-form part: sign** | PASS | γ > 0 on the outbound and inbound legs, as expected. |
| **Reduced-form part: magnitude** | PASS | asinh γ = 2.44 implies about 11×, which matches the level rise in Table 1. PPML gives 3.5× and the paper flags the gap between the two (§5.3, citing Chen–Roth). |
| **Reduced-form part: dynamics / pre-trends** | PASS, with caveat | Joint pre-trend p = 0.78 (outbound) and 0.42 (inbound). But 2019–2021 lies inside the selection window, so the flat pre-trend partly follows from how the basket was chosen. The 2018 coefficient, which is outside the window, is 0.19 (s.e. 0.90). That is reassuring but has low power. |
| **Reduced-form part: clustering** | PASS, with caveat | Clustered by HS6, the unit of assignment. Wild-cluster bootstrap and randomisation inference are added. The paper itself flags the cross-sectional dependence from a single common treatment date. |
| **Reduced-form part: sample** | PASS for the trade panel, FAIL for the deal panel | N = 600, 368 and 200 are reported and reconcile with Table B.1. |

**There is one FAIL, so the composite is capped at 70.** The composite would sit below the cap anyway.

---

## Dimension scores

| # | Dimension | Weight | Score | Weighted |
|---|---|---|---|---|
| 1 | Construct validity (shock, value capture, investment outcome) | 20 | 62 | 12.4 |
| 2 | Construction (sample documentation from raw data to analysis) | 17 | 55 | 9.4 |
| 3 | Validation (external checks, benchmarking, cross-source) | 17 | 65 | 11.1 |
| 4 | Analysis / identification of the shock (inference, permutation, DiD) | 12 | 68 | 8.2 |
| 5 | Replication (restricted-data handling, deposit) | 6 | 72 | 4.3 |
| 6 | External validity / generalisation | 10 | 60 | 6.0 |
| 7 | Mechanism / framework discrimination | 18 | 45 | 8.1 |
| | **Composite** | **100** | | **59.4 → 59** |

---

## Assessment of the critical-peeve targets (raw data to analysis sample)

**(1) Deal universe: three extracts → about 500 → 493 → crosswalk → greenfield flag → 82 deals.**
- **What is documented:** the query parameters for each database (App. A), the de-duplication key (target name, announced date ±30 days, deal type), the target taxonomy (ISIC rev. 4 divisions), and the final N values (493 overall; 82 in the subset, 53 pre and 29 post, Table 3).
- **What is missing from the manuscript:**
  - raw record counts per extract;
  - how many records the de-duplication removed, and from which pairs of sources;
  - the crosswalk itself, or at least the ISIC divisions that make up "manufacturing of tradeable goods, transport and logistics, and wholesale distribution";
  - the rule behind the greenfield vs ownership-transfer flag (deal-type field, or manual coding? who coded it, and was it checked?);
  - how pending and withdrawn deals, "recorded separately", are treated;
  - the source of the "earliest year of reasonably complete coverage" for each database (said to be pinned in the replication package).
- **Section 4 vs Table 3:** "N ≈ 500" and 493 should be one number, and the paper should explain what the "≈" means.
- **The per-source columns add up exactly to the pooled totals.** This is the most consequential finding in this part of the report; see Concern 1.

**(2) Surge basket: 75 → 29.**
- **Well documented.** I could reconcile Table B.1 with the HS2 jackknife in Table C.1: HS85 has 13 lines, HS84 7, HS90 4, HS61 2, and HS39, HS40 and HS96 one each, which makes 29. Of these, 24 are priority-list lines and 5 are civilian lines. The tier counts (4+5+16+9+11+5) add to 50.
- **Missing:**
  - **A funnel table:** 75 → passes the outbound ≥2× rule (55) → passes the inbound ≥2× rule (41) → passes both (n?) → passes the $0.1m/$0.2m floors (29). Without it the reader cannot tell whether the floors bind.
  - **Offset sensitivity:** how the basket changes when the $10k offset is $0, $1k or $50k.
  - **The control-selection rule:** how the 25 "clearly civilian" lines were chosen.
  - **China 2024:** China's 2024 inbound figure, which §5.1 calls "large and preliminary", sits inside the 2022–2024 selection window. The paper should report how many of the 29 lines depend on it, i.e. which lines fail the inbound rule if China 2024 is dropped or replaced by China 2023.

**(3) Mirror-data construction of the inbound flow.** The reporter set is clear: EU27, UK, US, Japan, Korea, Switzerland, Norway, plus China. The handling of the gaps is not documented beyond Table 1 (see Concern 3).

**(4) The $479m increment and the 6–14% band.**
- **The increment can be reproduced.** From Table 1, outbound 2022–2025 sums to 525, less 4 × 11 = 44, which gives about 481 (≈ $479m allowing for rounding).
- **The pre-trend alternative ($521m) also reproduces.** A linear trend fitted to 17, 12, 7, 8 and truncated at zero gives about 3, 0, 0, 0 for 2022–2025, so the increment is about 522.
- **Table D.1 checks out cell by cell.** Each cell equals m × 0.787 / 0.764.
- **The under-recording range of 13–21% also checks out.** For a true margin of 0.25 against a recorded margin of 0.06–0.14, the implied under-recording is 12.8–20.2%.
- **The derivation of the 6–14% band is not given in a form anyone could repeat** (Concern 4).

---

## Major concerns

### Concern 1: The deal-universe construction is not documented end to end, and the "cross-database" check appears to be a partition, not a replication

**Dimension:** 2 (Construction), 3 (Validation)
**Severity:** MAJOR (addressable)

**Description.** Table 3 gives per-year rates by source over a 7-year pre window and a 4-year post window. Turning the rates back into counts gives:
- **All deals:**
  - Capital IQ: 24.0 × 7 ≈ 168 pre and 23.2 × 4 ≈ 93 post.
  - PitchBook: 14.6 × 7 ≈ 102 pre and 24.2 × 4 ≈ 97 post.
  - Preqin: 3.7 × 7 ≈ 26 pre and 1.8 × 4 ≈ 7 post.
  - Total: about **493**, the same as the "consolidated non-duplicate universe".
- **Manufacturing / transport / distribution:**
  - Pre: 36 + 14 + 3 = **53**.
  - Post: 21 + 6 + 2 = **29**.
  - Both match the subset totals exactly.

So the three source columns add up to the de-duplicated totals. That leaves two possibilities. One is that the three databases do not overlap at all for Kazakhstan, which is implausible for Capital IQ and PitchBook M&A, and would mean de-duplication removed nothing even though §4 says "N ≈ 500 after de-duplication". The other, more likely, is that each de-duplicated deal was assigned to one "source" column. In that case §1 ("cross-checking the deal counts across databases") and §7 ("The result holds across the three databases… none shows more than a flat rate") overstate the check. The columns would be a breakdown of one pooled series, and they would not show the null holding independently in each database. Separately, the subset is defined through a crosswalk and a greenfield flag that are not described in the paper. The claim that "greenfield and new-capacity transactions average under two per year and never exceed four" depends entirely on that undocumented flag.

**Why this matters.** The investment null is one of the paper's three main results. Under EER's replication standard, data the journal cannot redistribute have to be documented well enough that a licence holder could rebuild them from the paper and its appendix, not only from a script.

**What would change my mind:**
- An Appendix A funnel table: raw records per extract → after the date/type/status filters → overlap matrix (Capital IQ∩PitchBook, Capital IQ∩Preqin, PitchBook∩Preqin, all three) → 493 → after the crosswalk, by ISIC division → 82, split by greenfield/ownership transfer and pre/post.
- Table 3 rebuilt on each database's **raw, un-deduplicated** records within the subset, so that each column is a genuinely independent replication. Alternatively, rename the columns as a source attribution and drop the "cross-check" wording.
- The greenfield-flag coding rule, plus a double-coded subsample with an agreement rate, or a statement that the flag comes from a native deal-type field.

### Concern 2: The investment outcome is a weak and badly targeted measure of "investment response"

**Dimension:** 1 (Construct validity), 4 (Analysis)
**Severity:** MAJOR (addressable)

**Description.**
- **(a) Transactions vs capacity.** The outcome counts transactions (M&A, PE, VC). Capacity built from retained earnings, by foreign greenfield entrants or with bank finance never shows up. The paper concedes this in the Limitations.
- **(b) Too broad an aggregate.** "Manufacturing of tradeable goods + transport and logistics + wholesale distribution" is wide. It includes steel (Qarmet) and probably food and other manufacturing, so a response in ISIC 26–28 or in warehousing could be drowned out.
- **(c) The coding rule does not match the basket.** The positive-response rule in §7 covers deals tagged to "a surge-basket HS6 or … its parent electrical-machinery, components or instrument-manufacturing class". But 5 of the 29 surge lines are civilian consumer goods: 392490 (plastic household articles), 401110 (tyres), 610910 and 611020 (knitwear), and 961900 (sanitary articles). Their parent classes (ISIC 13–14, 22) are where Kazakhstan has a non-trivial domestic base, and the coding rule leaves them out.
- **(d) Coverage drift and dispersion.** All-deal counts rise sharply in PitchBook (14.6 → 24.2 per year) while the sector count stays flat. Normalising by all deals, my arithmetic from Table 3 puts the sector's share at about 53/296 = 17.9% before and 29/197 = 14.7% after. That sharpens the null, but the paper does not report it. The Poisson rate ratio (0.96, CI 0.59–1.53) assumes equidispersion, yet annual counts include 1 (2015) and 3 (2022).
- **(e) The power statements disagree.** §7 says 80% power "against an increase of roughly 80% or more" and later that the test "rules out a step-up of about a doubling or more". The realised 95% CI already rules out a rate ratio above 1.53. The 2023–2025 rate ratio of 1.14 compares against the pre-period that includes 2015, the year the paper calls a coverage artefact. Against the 2016–2021 baseline (8.7 per year) it is about 1.00.

**Why this matters.** The EER profile asks that "a null needs a power statement". At present the power statement is about a noisy, over-aggregated proxy, and the null is also over-determined by confounders the paper names (January 2022 unrest, compliance exposure, nationalisations).

**What would change my mind:**
- Supplement or replace the deal-count test with an official capacity measure. Kazakhstan's statistics bureau publishes investment in fixed capital and industrial output by economic activity. Use ISIC 26, 27, 28, 46 and 52, plus the divisions matching the five civilian surge lines (13–14, 22). Run the pre/post (or exposed-vs-unexposed-division) comparison on those series, with a power statement in tenge or USD of fixed investment.
- In the deal data, report:
  - a difference-in-differences of exposed against all other sectors, or the sector share of all deals, with a negative-binomial or year-block-bootstrap CI;
  - ISIC 26–28 and 49–52 separately;
  - one reconciled minimum detectable effect.

### Concern 3: The mirror-based inbound flow has undocumented gap handling, and one flow-through ratio does not reproduce from Table 1

**Dimension:** 2 (Construction), 1 (Construct validity)
**Severity:** MAJOR (addressable)

**Description.**
- **(a) China's missing 2025 data.** Table 1 shows 2025 "West + China" as the Western component only. The manuscript does not say how China 2025 is handled in:
  - the HS6 × year DiD panel for the inbound outcomes (dropped, zero, or Western-only?);
  - the monthly blue series in Figure 1 and the monthly inbound break test.

  If 2025 cells are Western-only in the panel, the 2025 inbound coefficient is measured on a different basis from earlier years.
- **(b) China's preliminary 2024 data.** It sits inside both the selection window and the incremental West + China inflow. China's inbound roughly doubles from 2023 to 2024: about $1,941m against $929m, by subtracting Western from total in Table 1.
- **(c) Kazakhstan's 2024 monthly gap.** The monthly series runs 2019m1–2024m2 plus 2025. The paper does not say whether the break tests treat 2024m2 → 2025m1 as adjacent, how Newey–West lags are set across the gap, or which source supplies 2024 *outbound* in Table 1. §4 says the gap "is covered by the annual data and by mirror flows". To my knowledge Russia has not reported detailed trade to Comtrade since 2022, so it is unclear what mirror covers the outbound leg.
- **(d) Footnote 2 does not reproduce.** It says the West + China flow-through (≈0.15, "one-sixth") is computed on 2022–2024 only. From Table 1:
  - The 2022–2024 inbound increment is 4,570 − 3 × 443.5 ≈ 3,240.
  - The 2022–2024 outbound increment is 392 − 33 = 359.
  - The ratio is ≈ **0.11**, not 0.15.
  - 0.15 comes out only if the four-year outbound increment ($479m) is divided by the three-year inbound increment, or by using the mixed 2022–2025 basis that the footnote says it avoids.
- **(e) Kazakhstan-reported imports.** They are used as a DiD outcome (Table 2) and in the "mirror-gap" outcome (γ = 0.54), even though §4 calls them "incomplete for 2020–2022", which is the reference period.
- **(f) Reporter coverage.** The inbound reporter set leaves out transit-relevant origins such as Hong Kong, Taiwan, Malaysia, Türkiye and the UAE. The flow-through ratios are therefore relative to a partial inbound measure.

**Why this matters.** The flow-through ratios, and the claim that the Western gap is not hidden re-export (§6.1), rest on this construction.

**What would change my mind:**
- A short data appendix with one row per gap:
  - China 2024 (preliminary): how it is treated, and results with it excluded;
  - China 2025 (missing): how it is treated, and results with it excluded;
  - Kazakhstan's 2024 monthly gap: how it is treated, and results with it excluded;
  - the 2024 outbound source.
- The inbound DiD and break tests rerun on Western-only inbound for 2018–2025 and on West + China for 2018–2023.
- Footnote 2 recomputed on matching windows.
- The KZ-reported-imports column dropped, or restricted to years with complete reporting.

### Concern 4: The value-capture headline is honest calibration, but the band's derivation and the comparator are not pinned down

**Dimension:** 1 (Construct validity), 3 (Validation)
**Severity:** MAJOR (addressable). The qualitative conclusion is likely to survive.

**Description.**
- **(a) The band cannot be rebuilt from the text.** §6.2 says a ~6% c.i.f./f.o.b. factor plus "a wholesale distributive margin of a few points" gives 6–14%. But the 6% lower end is the freight wedge alone, which implies a zero wholesale margin. No source is given for the "few points".
- **(b) Residency of the freight wedge.** Counting the c.i.f./f.o.b. wedge as *Kazakh* retained value assumes Kazakh residents earn the inbound freight and insurance. For Western and Chinese goods arriving in a landlocked country, much of that freight is earned by foreign carriers and transit countries. If it is, the floor of m falls.
- **(c) The "produced dollar" benchmark.** It is v̄_M = 0.76, the manufacturing average. The relevant counterfactual is component-reliant electronics assembly, which the paper itself puts at 0.69 (Table 5) and describes as kit assembly with heavy imported inputs (§3, citing Gopinath–Neiman). The sensitivity check at v̄_M = 0.40 helps. A direct value-added share for an assembly plant of perhaps 0.2–0.3 would narrow the ratio a good deal (at m = 0.10, 0.079/0.25 ≈ 0.32).
- **(d) The $479m depends on how the basket is defined.** It is computed on a basket selected on the outcome. Running the same calculation on the selection-free priority-list row of Table 1 gives about 1,015 − 4 × 72.7 ≈ $724m (my arithmetic). The paper does not say which basket the retained-value figure, the 0.2–0.3% of GDP and the customs-duty figures should be read against.
- **(e) Two fiscal and macro figures are not constructed in the text:**
  - "$0.6bn a year with the inbound and onward legs combined" does not match any combination of increments I could rebuild. It looks closer to gross post-2022 Western-inbound plus outbound levels.
  - The duty base ("4–8% on the share formally cleared") is not specified.

**Why this matters.** The abstract's "5–11 cents per rerouted dollar, against three-quarters" is the paper's quantitative headline.

**What would change my mind:**
- A short derivation table:
  - freight component (source; share earned by residents);
  - wholesale component (source, e.g. the gross-margin ratio of the wholesale-of-electronics division from structural business statistics, or the ICIO wholesale sector's value-added/output);
  - resulting m.
- A version of the headline that counts only resident-earned components.
- A Table D.1 row using an assembly-technology comparator instead of v̄_M.
- The retained-value figure reported for the surge basket, the 1.5× basket and the priority list.
- An explicit formula for the duty and GDP-share figures.

### Concern 5: The threat-motivated DiD battery is good, but two of its key pieces are built in ways that can mislead

**Dimension:** 4 (Analysis)
**Severity:** MAJOR in design, but it does not threaten the headline, because the paper rightly does not rely on γ.

**Description.**
- **(a) Basket-size mismatch in the rule-matched permutation.** Under the null, the rule selects about 5 lines (max 12, Table C.1). The permuted γ is therefore estimated on a far more extreme selection (the top ~5 of 75) than the observed basket (29 of 75). A null built from the most extreme 5 lines will mechanically have a larger mean (2.79) than a 29-line basket would. The comparison is not like-for-like, and it may *understate* the evidence. The manuscript also does not say how draws are handled when the rule selects zero lines.
- **(b) Contaminated control pools:**
  - **Surge-basket DiD.** It uses the full 75-line panel, so its controls include the 26 non-surge priority-list lines. Row 3 of Table 2 shows those lines are themselves treated (γ = 1.94). That attenuates γ in rows 1–2.
  - **Placebo.** The six largest civilian lines are fake-treated against the remaining 19 civilian lines (N = 200). Those 19 include the 5 civilian surge lines, which surged on both legs by construction. The placebo's −0.95 may therefore be partly mechanical. That undercuts the paper's reading of it (tenge depreciation, a heterogeneous control pool).
  - **Placebo outcome.** Table 2 puts the placebo in the inbound column, while Table C.1 says "the outcome throughout is … exports to Russia".
- **(c) The donut row duplicates another row.** "Donut (drop 2022, treatment year = 2023)" is the same estimate as "Drop 2022 entirely" (2.71, s.e. 1.05, p = 0.012). Once 2022 is dropped, the post sets are identical. It should not be counted as a second check.
- **(d) The held-out year is unused.** 2025 is outside the selection window (2019–2021 vs 2022–2024), so it is a natural out-of-sample test against regression to the mean. The paper mentions 2025 persistence only descriptively.

**What would change my mind:**
- A **rank-matched permutation**. In each draw, select the 29 lines with the highest min(inbound ratio, outbound ratio) that meet the floors, then compute γ. Report the null and the zero-selection handling.
- The surge-basket DiD and the placebo rerun against the purged 20-line civilian control.
- The donut row removed, or replaced by a genuine anticipation test (reference year 2020, with the 2021 coefficient reported).
- A 2025-only coefficient compared with its own permutation null.

### Concern 6: The framework is not discriminated, and the one sharp alternative (no comparative advantage) remains open

**Dimension:** 7 (Mechanism / framework discrimination)
**Severity:** MAJOR. Partly inherent to the design; the paper is candid about it.

**Description.** The paper does not separate the gates; Sections 3, 8 and 12 concede this.
- **The only result stated without heavy hedging is that the market-access gate is "open".** But that holds by definition for a customs-union member, so it is not an empirical finding.
- **The rejection of the institutional gate rests on one comparison.** That comparison is QIC's named investments, and the paper itself notes that QIC's mandate and compliance exposure cloud it.
- **The irreversibility comparison is confounded.** The auto-vs-re-export comparison moves several gates at once.
- **The cross-country search is uninformative.** The Türkiye/Georgia public-record search is described as uninformative.
- **The 2026 manufacturing expansion is explained after the fact.** The framework accounts for it post hoc rather than predicting it.

So the null is equally consistent with Kazakhstan lacking a comparative advantage in electronics, which §3 says openly. The design does contain a discriminating variation that goes unused. The 5 civilian surge lines face the same open market-access gate and the same shock, but sit in sectors with a domestic base.

**What would change my mind:**
- Test for a production or investment response in the civilian surge lines' sectors (BNS output and fixed investment for ISIC 13–14 and 22) against the electronics lines.
  - A response there would point to µP/comparative advantage as what distinguishes the cases, rather than the gate.
  - No response there too would strengthen the market-access/irreversibility reading.
- Alternatively, cut the decomposition back to the organising device it is said to be, and remove "binding-constraint" language that the evidence cannot carry.

---

## Constructive-peeve assessment: is each robustness check aimed at a named threat?

| Check | Threat it targets | Verdict |
|---|---|---|
| Rule-matched permutation (Table 2 C, C.1) | Selection on the outcome | Right threat and an exemplary motivation. Fix the basket-size mismatch (Concern 5a). |
| Trend-preserving cyclic shift | Pre-existing trends and autocorrelation driving selection | Well aimed. It gives a tighter null (mean 1.64, p = 0.29), which supports the "existence, not magnitude" reading. |
| PPML (Panel B) | Zero mass in asinh (23% of pre-period cells are zero) | Well aimed. The paper reports the size disagreement honestly. |
| Newey–West sup-F | Persistent series inflating sup-F | Well aimed, with one gap: §5.2 reports HAC (561 → 326) and then says "the sup-F is computed without a HAC correction". The leftover sentence should go. Report the HAC critical value for the inbound 15.5. |
| Wild-cluster bootstrap | Few clusters (46 in the residual design) | Well aimed. The paper is right to use it for the reported star in row 3. |
| Leave-one-HS2-out jackknife | Concentration in one chapter | Well aimed and candidly reported. Dropping HS85 removes significance (γ = 1.36, p = 0.21). |
| Purged-control residual DiD | Overlap contamination between the priority list and the surge basket | The best-designed check in the paper. Apply the same purge to rows 1–2 and the placebo (Concern 5b). |
| Size-decile × year FE | Heterogeneous trends by size (motivated by the placebo) | Well aimed. |
| Selection thresholds 1.5×–3× | Arbitrary choice of cut-off | Well aimed. Monotone in the expected direction. |
| Donut / drop 2022 | Anticipation / unrest year | These are one check, not two (Concern 5c), and neither tests anticipation. |
| Table D.1 margin sweep | Calibrated, not estimated, margin | Exemplary transparency. Every cell reproduces. Add a comparator sweep (Concern 4c). |
| BNS input–output cross-check | Choice of input–output table | Well aimed. |
| 2018 out-of-window event coefficient | Selection-induced flat pre-trend | Well aimed, but low power (s.e. 0.90). Say so. |

Overall the battery is targeted rather than theatrical, which is unusual and creditable. The fixes above make it internally consistent.

---

## Minor suggestions

1. **Data description vs Figure 2.** §4 says the monthly data are used "for break timing and the event study", but Figure 2 is annual. Align the two.
2. **Stars and randomisation inference in Table 2.** The note says "no stars are reported in row 1", but Panel B (the surge basket) carries stars. The note also tells readers to judge the KZ-imports column against "Panel C's randomisation-inference null for that basket", but Panel C reports randomisation inference only for exports to Russia.
3. **11.6× does not reproduce from Table 1's rounded entries.** I get 131.25 / 11.0 ≈ 11.9×, while the $479m figure implies a baseline of about $11.5m. Report unrounded values.
4. **Ambiguous Table 1 label.** "Priority list, overlapping (50 HS6)" does not say which flow it measures or what "overlapping" means.
5. **Table E.1.** The note says sup-F "does not itself date the break". The argmax of a sup-F does date a break; I think the intended point is that the reported "jump yr" is a different diagnostic. Breaks on 8 annual observations with trimming rely on asymptotic critical values that are unreliable at T = 8. Report small-sample or simulated p-values. The Kyrgyz "jump" in 2019 and Georgia's p = 0.075 do not support "elevated from 2022" as written in §1. §9 ("Georgia barely participates") is the more accurate wording, and §1 should match it.
6. **§6.1, the $41m of onward exports to other destinations.** Give its construction (which destinations, which years, which baseline).
7. **Deal values.** They are discussed ("reported deal value rises") but not tabulated. Report value totals together with the share of deals that have a disclosed value.
8. **Table 5's combined score.** The weights are not given, and the full ranking is only "in the replication output". At minimum, state the formula.
9. **§12 sources.** The paragraph on the 2026 manufacturing expansion leans on a newspaper summary of BNS data and a government policy review. Cite the primary BNS tables directly.
10. **Monthly outbound path in §8.** The 2023-H1 vs 2023-H2 decline should be read against the 2024 gap. The text already notes this; Figure 1 should mark the gap visibly rather than omitting 2024 silently.
11. **The mediation restatement in §3.** It adds no testable content. Consider cutting it, given the paper already concedes the gates are not identified.

---

## Positive observations

- **The paper bounds its own claims with unusual candour.** It refuses to read γ as an identified magnitude, reports a placebo that goes the "wrong" way, calls the margin a calibration, and admits the Türkiye/Georgia search is uninformative. That is the right stance for a descriptive case study, and a measurement referee welcomes it.
- **Sections 6.2 and Appendix D are a model of transparent calibration.** Because the input–output step is nearly the identity, the headline is a one-for-one function of m. The paper says so and gives a full sweep table, and I could verify every cell.
- **The surge-basket rule is stated precisely and reconciles internally.** Table B.1 matches the jackknife in Table C.1 exactly.
- **The neighbour series use the basket selected on Kazakhstan's data.** For the other countries this makes them a quasi-out-of-sample check on the shock.
- **Restricted data are handled sensibly in principle.** The paper gives query specifications, native deal identifiers and a deposit DOI. Concern 1 asks only for the funnel that would make this complete.

---

## Summary for the editor

**Main methods problems.** The two main problems are documentation and measurement, not identification:
- the undocumented deal-universe funnel, including the per-source columns that add up exactly to the pooled totals;
- the mirror-gap handling, plus one flow-through ratio that does not reproduce;
- a deal-count investment proxy that is too broad, and that misses five of the basket's own lines.

**What is fixable within a revision:**
- with public data: official fixed-investment and output series by activity, a rank-matched permutation, and purged-control reruns;
- by documentation: the deal funnel, the gap table, and the margin derivation.

**What the design can probably never deliver:** discriminating between the three gates. The authors should either use the within-basket civilian-line variation or reduce the framework to the organising role they already claim for it.

**Fatal concerns:** none in the current version.
**Recommendation:** Major revision, composite score 59/100.
