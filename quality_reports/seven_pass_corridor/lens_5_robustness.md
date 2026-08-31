# Lens 5 — Robustness and Threat Pre-emption

**Manuscript:** `Manuscript/corridor.tex` — "Corridor, Not Factory" (KZ trade reorientation, 2022–2025)
**Reviewer stance:** hostile referee, R&R gatekeeper
**Grounding:** `scripts/R/kz_passthrough/{03,06,07,08,10}_*.R` and `_outputs/{rq1_estimates,rq1_monthly,rq1_robustness,rq2a_unit_value_wedge*,rq2b_io_propagation}.txt`; `scripts/R/kz_valueadd/{06_mechanism_tests,07_crosscountry}.R` and outputs. Code was read, not run.

---

## 1. The top 5 objections a hostile referee raises, and whether the paper pre-empts them

| # | Objection | Pre-empted? | Verdict |
|---|-----------|-------------|---------|
| 1 | **The "surge basket" is selected on the outcome.** It is defined as the 31 HS6 lines where *both* the inflow and the outflow at least doubled after 2022 (§4; `06_eventstudy_did.R` L24). A break at 2022 is then mechanically guaranteed — you chose the lines that broke. | Partially. The paper's stated defence is that the EU/US/UK/JP Common High Priority list (CHPL) is a *pre-specified* set used "only as a robustness check" (§4). **But that defence is inverted in the execution** — see §2 below. | **NOT adequately pre-empted. This is the hole.** |
| 2 | **Tokayev "New Kazakhstan" reform confound.** June-2022 referendum, Nov-2022 election, an outward-oriented liberalisation running concurrently with the trade shock. | Mostly, and well. Narrative in §2; discontinuity is at 2022q2 not at political-calendar dates (§5.2); civilian placebo; and the Armenia/Kyrgyz parallel (`10_robustness.R`; supF 49 and 66, cleanly reported in §5.3) is genuinely convincing — neither neighbour had such a reform. | **Pre-empted by the parallel-country design.** The DiD that would net out an economy-wide reform effect does *not* carry it (§2). |
| 3 | **Under-invoicing on the outbound leg drives the unit-value wedge**, and is observationally equivalent to "no transformation." | Acknowledged twice (§6.1, §10) — never bounded. No number in text or in `07_unit_value_wedge.R`. | **NOT pre-empted.** Assertion, not calculation. |
| 4 | **The ~8% value-capture figure is an artefact of I-O choices** — OECD ICIO's known-high domestic-content shares for Kazakhstan, a single 2019 vintage, and a trade-margin *rate* (6–14%) taken from a national-accounts convention rather than estimated. | Weakly. A one-way sensitivity on the manufacturing multiplier only (`v^M = 0.40` → "one to five", §6.2); disclosed in §10. No ADB MRIO vs OECD ICIO, no KZ BNS, no sensitivity on the 6–14% margin rate — which is the binding lever. | **Weakly pre-empted.** |
| 5 | **The investment null is a measurement/power problem** — commercial deal DBs miss greenfield, Chinese-SOE capex, and brownfield expansions; n≈500 over 11 years is thin. | Reasonably. Five-database triangulation, the QIC public record, and the Capital-IQ "5.1 vs 5.2 identical" cut (§7, Table 3). | **Pre-empted** as well as this data class allows, though "absent from deal data" is asked to bear more weight than it can (Table 3 FactSet/Dealroom columns are still "pending"). |

---

## 2. CRITICAL: the headline DiD is run on the basket the paper calls "robustness only," and the actual basket's DiD is insignificant and unreported

§4: "*membership [of the priority list], which we use only as a robustness check*."
§5.3: "*with treated the priority-list codes and controls the civilian basket … gives γ = 2.88 (p = 2×10⁻⁴) for exports to Russia and 2.94 (p = 5×10⁻⁷) for imports from the West.*"

Those two numbers are the **CHPL priority-list** DiD, not the surge-basket DiD. From `rq1_estimates.txt`:

```
######## exposed (dual-use list — robustness) ########
  impW_usd  DiD  TR:post   2.939762   p = 4.56e-07      <- paper's "2.94, p = 5e-7"
  expRU_usd DiD  TR:post   2.875112   p = 2.32e-04      <- paper's "2.88, p = 2e-4"

######## surge (data-driven surge basket) ########      <- the paper's actual object of study
  impW_usd  DiD  TR:post   1.54892    p = 0.015
  expRU_usd DiD  TR:post   1.483905   p = 0.120         <- NOT SIGNIFICANT
  mirW_usd  DiD  TR:post   1.26727    p = 0.174         <- NOT SIGNIFICANT
```

So:

1. The paper **inverts its own stated design**: the pre-specified CHPL list, declared a "robustness check," is the *only* DiD reported, and its numbers are presented as the main result.
2. The **data-driven surge basket** — the object of §5.1, §5.2, §6, §7 and the abstract's "31 product lines" — has **no DiD reported anywhere in the manuscript**, and per the code its DiD on **exports to Russia is p = 0.12** and on imports (mirror) is p = 0.17.
3. The reader is therefore never shown that the paper's central "reorientation" claim, run through the design that controls for common year shocks via the civilian basket, is not statistically significant on the outbound leg.

The break tests (monthly supF 424 / 329, `rq1_monthly.txt`) and the magnitudes (Table 1) do support "a reorientation happened." But the **DiD is the paper's stated answer to the reform confound** (§5.3, "Three checks address the reform confound"), and on the real basket it does not deliver. Substituting the CHPL DiD while labelling CHPL "robustness only," and omitting the surge-basket DiD entirely, is a misrepresentation a code-checking referee will catch on the first pass.

**change_my_mind:** Report the surge-basket DiD in the main text with its actual p-values; show the CHPL DiD *alongside* it as the pre-specified robustness lens (which is what §4 says it is); and if the outbound surge-basket DiD stays at p ≈ 0.12, either (a) re-anchor the causal claim on the Armenia/Kyrgyz parallel + break tests and soften the DiD language, or (b) show the DiD is significant under a leave-one-out / alternative asinh-scaling / poisson specification. If a surge-basket DiD significant at conventional levels on *both* legs already exists, put it in the paper and this finding drops to MINOR (labelling fix only).

---

## 3. Are the robustness checks motivated or just listed? Convincing or theatrical?

**Motivated, mostly.** Each check in §5.3 is tied to a named threat: placebo DiD + civilian-basket break → "not a general liberalisation"; Armenia/Kyrgyz parallel → "not a KZ-specific reform"; direction asymmetry (in from sanctioners, out to Russia) → "not a generic trade-opening." `10_robustness.R` header states the logic explicitly. This is not a scattershot list.

**But the aim is slightly off the real weak point.** The sharpest threat is objection #1 (outcome-based basket selection) and its consequence for the DiD (§2 above). The robustness battery mostly attacks the *reform* confound, which the parallel-country design already handles well, while the *specification-search* threat — the one that actually degrades the headline estimate — is answered by a check that is mislabelled and whose adverse result is not shown. So: convincing against the confound it targets, silent on the threat that matters most.

**One genuinely strong piece:** the Armenia/Kyrgyz parallel is well-motivated, cleanly executed, and correctly reported (all four sub-numbers per country match `rq1_robustness.txt` to rounding). This is the load-bearing robustness result and it holds.

---

## 4. MAJOR: the CHPL "robustness lens" — reported, but with the wrong sign of usefulness

The lens question: *is the CHPL check actually reported with numbers?* Yes — γ = 2.88 / 2.94 (§5.3). But it is reported **as the main estimate**, not as a lens *on* the main estimate. A pre-specified-basket robustness check is only informative if the main result is the data-driven one and the pre-specified one *corroborates* it. Here the data-driven DiD is weak, the pre-specified DiD is strong, and the paper shows only the latter. That is the opposite of a robustness check — it is a specification swap in the direction of significance, presented without the comparison that would reveal it.

**change_my_mind:** A two-column table — surge basket | CHPL list — for each outcome (impW, expRU, mirW), with break-test supF underneath, would convert this from a red flag into a legitimate "result is not driven by basket definition" paragraph *if* the surge-basket column clears significance. Absent that table, the reader cannot tell which basket the "2.88" belongs to without reading the R output.

---

## 5. MAJOR: under-invoicing is asserted to be "bounded" but never bounded

§6.1: "*consistent with … under-invoicing on the outbound leg*."
§10: "*under-invoicing on the outbound leg, which biases the retained margin downward and which we can only bound*."

There is no bound. Not in §6, not in §10, not in `07_unit_value_wedge.R` (which computes `uv_wedge`, `retained_usd`, and the log-log slope, and stops). The word "bound" implies a calculation that was not done.

Why this is MAJOR and not MINOR: under-invoicing of KZ→RU exports (to cut Russian import VAT/duty, for capital flight, or as part of the opacity that makes this trade attractive in the first place) produces **exactly** the wedge < 1 and slope < 1 that the paper reads as "no transformation" (§6.1, §7: "the unit-value evidence confirms that no transformation occurs"). The two are observationally equivalent. The framework's observation (ii) — μ_P ≤ μ_T, "Kazakhstan cannot charge more for a transformed good than it pays for the input" — is stated to be "a direct measurement" (§3, §6.1) of a structural parameter, but if the measurement is contaminated by misreporting it measures the misreporting.

The 8% headline itself is insulated (it uses the 6–14% national-accounts margin rate, not the wedge — `08_io_propagation.R` L38/43). But the wedge is doing real rhetorical and identification work in §3 and §7, and a referee will not accept "we can only bound it" with no bound attached.

**change_my_mind:** A real bound. E.g.: compare KZ→RU unit values in the surge basket to KZ→RU unit values for the *same HS6* to a non-sanctions third market, or to Armenia/Kyrgyz→RU unit values, or to pre-2022 KZ→RU unit values; the gap that opens post-2022 relative to a clean benchmark is an estimate of the misreporting wedge. If that exercise shows the wedge is not explained by under-invoicing, say so with the number. If it can't be done with available data, say *that* explicitly and drop the word "bound."

---

## 6. MAJOR: no multiplier-source robustness; the sensitivity that is reported is the least informative one

§6.2 reports one sensitivity: "*even at v̄^M = 0.40 the ratio is about one to five.*" `08_io_propagation.R` confirms this is a one-way move on the manufacturing multiplier, holding everything else at the OECD ICIO 2019 values (v^TT = 0.79, v^M = 0.76).

Not tested:
- **ADB MRIO vs OECD ICIO vs KZ BNS 68-product I-O.** The code comment (`08_io_propagation.R` L8, `08a_get_io.R`) names all three as candidate sources; only OECD ICIO 2019 is used. §10 concedes "the OECD ICIO's relatively high domestic-content shares for Kazakhstan" — i.e. the paper knows this vintage/source flatters the retained-VA figure and does not check an alternative.
- **The 6–14% margin rate.** This is the widest band in the calculation and is a convention, not an estimate. The headline moves from ~5% to ~11% across it (`rq2b_io_propagation.txt`). No sensitivity on it beyond stating the range.
- **The trade-margin convention** (CIF/FOB, whether freight accrues to KZ-resident carriers) is not varied.

The paper flags the KZ BNS I-O as "a future check" (§10). Given that the entire "corridor, not factory" thesis is a claim about the *size* of a multiplier-propagated number, the absence of *any* cross-source multiplier robustness is a hole, not a footnote. "Not sensitive to the multiplier" (§6.2) is asserted on the strength of one downward perturbation of one parameter.

**change_my_mind:** Re-run `08_io_propagation.R` with ADB MRIO (2022) Kazakhstan and report the headline % and ratio side by side with OECD ICIO. If the "roughly one to ten" survives both, the sentence in §6.2 becomes defensible. Add a two-way grid over (margin rate 6–14%) × (I-O source) so the reader sees the full envelope.

---

## 7. MINOR/MAJOR: "a civilian placebo basket shows nothing" is not true

§5.1: "*a civilian placebo basket shows nothing.*"
§5.3: "*the civilian basket's own structural break is sup-F = 16 against 143 for the surge basket.*"

`rq1_robustness.txt`:
```
mirW_usd   : supF = 16.02  p = 0.001
expRU_usd  : supF = 34.63  p = 0.000
```

Both placebo breaks are **statistically significant** (p = 0.001 and p < 0.001). The correct statement is "much smaller than the surge basket," which is true and adequate. "Shows nothing" overclaims, and §5.3 quotes only the smaller of the two placebo supF values (16, the mirror leg) and silently drops the larger one (34.6, the exports-to-Russia leg). A referee who opens the R output sees a significant placebo break the text told them did not exist.

**change_my_mind:** Replace "shows nothing" with the actual comparison (supF 16 / 35 for the civilian basket vs 143 / 60 for the surge basket, annual), and report both placebo legs. This is a one-sentence fix; it is MAJOR only because the current wording is falsifiable against the authors' own file.

---

## 8. MINOR: multiple Bai–Perron breaks detected; only the convenient one is reported

`rq1_monthly.txt`:
```
mirW  : Bai-Perron break = 2021-07, 2022-06, 2023-08
expRU : Bai-Perron break = 2020-01, 2022-04
```

§5.2 reports only "2022m4" (exports to Russia) and "2022m6" (inbound). The **2020m1 break in exports to Russia predates the shock** and is not addressed; the 2021m7 and 2023m8 breaks in the inbound series are not mentioned. The COVID-2020 window is never discussed as such anywhere in the manuscript. A referee will ask what the other breaks are and why the pre-treatment 2020m1 break does not threaten the flat-pre-trend claim (§5.2: "flat for the fifteen pre-treatment months" — the monthly window starts 2019m1, so a 2020m1 break sits inside the pre-period).

**change_my_mind:** State all detected break dates and explain the non-2022 ones (2020m1 = COVID trade collapse and rebound; 2023m8 = enforcement tightening, which the paper actually wants). One paragraph.

---

## 9. MINOR: §8 leans on a cross-country contrast it concedes it cannot show

§8 "What we cannot show here" is admirably candid: the five intermediaries are all financially shallow, the two gates are collinear, macro aggregates "are too noisy to isolate a response of this size." Good.

But §8 "Contrast cases" and §10 then assert: "*Both invested in capacity despite financial markets that are not uniformly deep. This is the pattern the framework predicts.*" `07_crosscountry.R` output shows the supporting 2×2 is **degenerate** — the intermediary × high-financial-depth cell is empty (`NaN`), so there is no 2×2, only a 2×1 — and the durable-group deltas it rests on are weak and mixed (d_gfcf +2.6 / −0.3; d_mva +1.1 / +0.5; d_fdi −1.2 / −0.3, `crosscountry.txt`). The Vietnam/Mexico claim is a narrative reading of USMCA rules-of-origin, not something the code establishes. Having disclaimed the design, the paper should not describe its output as confirmation.

**change_my_mind:** Drop "This is the pattern the framework predicts" or downgrade to "consistent with, though we cannot test this cleanly." Do not present the contrast cases as evidence when §8 has already explained why they are not.

---

## 10. MINOR: TEST F (the second "within-country test" in the abstract) has almost no systematic support

The abstract: "*Two within-country tests identify the irreversibility gate as the binding one*" — one is captive capital (Table 4, solid, numbers check out: 34+13+2+1 = 50 QIC projects). The other is "a durable shock, the same institutions, a different outcome" (§7).

`mechanism_tests.txt` TEST F:
```
auto deals 2015-21: 6   |   2022-25: 3      (FEWER after the shock)
electronics/precision deals 2015-21: 1 | 2022-25: 1   (the 1 post-2022 = Tokyo Rope Almaty,
                                                        the acknowledged steel-wire-rope misclassification)
```

In the paper's own deal dataset the "durable shock drew real capacity" claim is **3 auto deals, down from 6**. The evidence for the durable-shock investment response is entirely the "public record triangulation" — Changan/Haval/Chery, KIA, Škoda, the Almaty multimedia plant — i.e. press releases, not the systematic data the rest of the paper relies on. That is a thin second leg for a claim the abstract elevates to co-equal identification.

**change_my_mind:** Either bring the auto-plant capacity into the dataset on the same footing as the M&A deals (announced/committed capex, dated) so TEST F rests on measured investment, or reframe §7 so the durable-vs-transitory contrast is explicitly qualitative and the identification weight sits on the captive-capital test.

---

## The one check whose absence would sink this at R&R

**A reported difference-in-differences on the actual data-driven surge basket, with the civilian control group, showing the reorientation effect is (a) statistically significant on both the inbound and outbound legs and (b) separable from the Tokayev reform.**

The paper reports the CHPL-list DiD instead — the basket it explicitly calls "a robustness check" — and the code shows the surge-basket outbound DiD is p = 0.12 and the inbound (mirror) DiD is p = 0.17. A methods-literate referee who runs `06_eventstudy_did.R` finds this in ten minutes, and it reframes the whole paper from "clean causal case" to "suggestive break plus a strong parallel-country analogy." The Armenia/Kyrgyz parallel and the monthly break tests can probably carry a revised, more modest causal claim — but only if the paper stops presenting the CHPL numbers as the surge-basket result.

---

```
findings:
  - id: L5-1
    severity: CRITICAL
    location: "§5.3 (and §4)"
    issue: "The headline DiD (γ = 2.88 for exports to Russia, 2.94 for imports) is run on the pre-specified CHPL priority list, which §4 calls 'a robustness check' only; the data-driven surge basket — the paper's actual object of analysis — has no DiD reported anywhere, and per rq1_estimates.txt its DiD is p = 0.12 (exports to Russia) and p = 0.17 (inbound mirror), i.e. not significant. The paper substitutes the robustness-lens estimate for the main estimate and omits the main estimate's adverse result."
    evidence: "§4: 'membership of which we use only as a robustness check.' §5.3: 'with treated the priority-list codes … gives γ = 2.88 (p = 2×10⁻⁴) for exports to Russia and 2.94 (p = 5×10⁻⁷) for imports from the West.' rq1_estimates.txt 'surge (data-driven surge basket)': expRU_usd DiD 1.483905 p = 0.120; mirW_usd DiD 1.26727 p = 0.174. 'exposed (dual-use list — robustness)': impW 2.939762 p = 4.6e-7; expRU 2.875112 p = 2.3e-4."
    change_my_mind: "Report the surge-basket DiD in the main text with its true p-values and show the CHPL DiD beside it as the pre-specified lens. If the surge-basket outbound DiD stays insignificant, re-anchor the causal claim on the Armenia/Kyrgyz parallel plus the monthly break tests and soften the DiD language accordingly — or demonstrate significance under a leave-one-out / Poisson / alternative-scaling specification. If a significant surge-basket DiD on both legs already exists, put it in the paper."
  - id: L5-2
    severity: MAJOR
    location: "§6.1, §10"
    issue: "Under-invoicing on the outbound leg is invoked twice as an alternative explanation for the sub-1 unit-value wedge and is said to be something 'we can only bound' — but no bound is computed, in the text or in 07_unit_value_wedge.R. Under-invoicing is observationally equivalent to the 'no domestic transformation' reading the paper needs from the wedge (§3 obs. ii, §7)."
    evidence: "§10: 'under-invoicing on the outbound leg, which biases the retained margin downward and which we can only bound.' §6.1: 'consistent with … under-invoicing on the outbound leg; it is inconsistent with the goods being transformed or marked up.' 07_unit_value_wedge.R computes uv_wedge, retained_usd and the log-log slope and no misreporting bound."
    change_my_mind: "Produce an actual bound: post-2022 KZ→RU surge-basket unit values benchmarked against the same HS6 to a clean third market, or against Armenia/Kyrgyz→RU, or against pre-2022 KZ→RU. Report the implied misreporting wedge as a number; if under-invoicing cannot account for the observed wedge, state that with the figure. If it cannot be estimated on available data, say so and stop using the word 'bound'."
  - id: L5-3
    severity: MAJOR
    location: "§6.2, §10"
    issue: "No cross-source or cross-vintage robustness on the value-added multiplier. The only sensitivity reported is a one-way downward move on the manufacturing multiplier (v^M = 0.40). The trade-margin rate band (6–14%), which drives the headline from ~5% to ~11%, is a national-accounts convention and is not itself varied; ADB MRIO / OECD ICIO / KZ BNS alternatives are named in the code but not run. The paper concedes OECD ICIO overstates KZ domestic content and does not check an alternative."
    evidence: "§6.2: 'The conclusion is not sensitive to the multiplier: even at v̄^M = 0.40 the ratio is about one to five.' §10: 'a single input–output vintage (2019) and the OECD ICIO's relatively high domestic-content shares for Kazakhstan.' 08_io_propagation.R L8 names 'OECD ICIO / ADB MRIO / KZ BNS'; only io_path = OECD ICIO 2019 is used. rq2b_io_propagation.txt: VA_per_usd_rerouted ranges 0.047–0.110 across the margin band."
    change_my_mind: "Re-run 08_io_propagation.R with ADB MRIO (2022) Kazakhstan and report the headline % and corridor-vs-factory ratio side by side with OECD ICIO; add a two-way grid over margin rate (6–14%) × I-O source so the reader sees the full envelope. If 'roughly one to ten' survives, §6.2's claim becomes defensible."
  - id: L5-4
    severity: MAJOR
    location: "§2, §5.3"
    issue: "The Tokayev 'New Kazakhstan' reform confound is answered by narrative plus the parallel-country design, but the one empirical design that nets out an economy-wide reform effect — the DiD with a civilian control basket — is (on the actual surge basket) statistically insignificant on both trade legs, and the manuscript does not disclose this. The reform-confound rebuttal therefore rests entirely on Armenia/Kyrgyz plus a discontinuity-timing argument, which should be stated as such."
    evidence: "§5.3: 'Three checks address the reform confound: a placebo difference-in-differences within the civilian basket … and the direction is asymmetric.' The headline DiD in the same paragraph is the CHPL list (see L5-1); surge-basket DiD is p = 0.12 / 0.17 (rq1_estimates.txt)."
    change_my_mind: "Either (a) show a significant surge-basket DiD with civilian controls (resolving L5-1), which directly nets out a general reform effect, or (b) state plainly that the reform confound is addressed by the parallel-country design and the narrow-product discontinuity, not by the DiD, and adjust the strength of the causal language in the abstract and §1."
  - id: L5-5
    severity: MINOR
    location: "§5.1, §5.3"
    issue: "'A civilian placebo basket shows nothing' is contradicted by the authors' own output: the civilian basket has statistically significant structural breaks (supF 16.02, p = 0.001 on the mirror leg; supF 34.63, p < 0.001 on the exports-to-Russia leg). §5.3 quotes only the smaller supF (16) and omits the larger (34.6)."
    evidence: "§5.1: 'a civilian placebo basket shows nothing.' §5.3: 'the civilian basket's own structural break is sup-F = 16 against 143 for the surge basket.' rq1_robustness.txt: 'mirW_usd : supF = 16.02 p = 0.001 / expRU_usd : supF = 34.63 p = 0.000'."
    change_my_mind: "Replace 'shows nothing' with the actual magnitude comparison and report both placebo legs (supF 16 / 35 civilian vs 143 / 60 surge, annual). One-sentence fix."
  - id: L5-6
    severity: MINOR
    location: "§5.2"
    issue: "Monthly Bai–Perron detects multiple breaks (exports to Russia: 2020m1 and 2022m4; inbound: 2021m7, 2022m6, 2023m8). Only the 2022 breaks are reported. The 2020m1 break in exports to Russia sits inside the stated flat pre-treatment window; COVID-2020 is never discussed as a robustness concern."
    evidence: "rq1_monthly.txt: 'mirW : Bai-Perron break = 2021-07, 2022-06, 2023-08' and 'expRU : Bai-Perron break = 2020-01, 2022-04'. §5.2: 'Bai–Perron break date 2022m4 … flat for the fifteen pre-treatment months.'"
    change_my_mind: "List all detected break dates and account for the non-2022 ones (2020m1 = COVID collapse/rebound; 2023m8 = enforcement tightening). Confirm the 2020m1 break does not disturb the pre-trend claim."
  - id: L5-7
    severity: MINOR
    location: "§8, §10"
    issue: "Having conceded that the cross-country design cannot separate the irreversibility and institutional gates (collinear, all five intermediaries financially shallow, macro aggregates too noisy), the paper still presents the Vietnam/Mexico contrast as confirmation ('This is the pattern the framework predicts'). The supporting 2×2 in 07_crosscountry.R is degenerate — the intermediary × high-financial-depth cell is empty — and the durable-group deltas are weak and mixed."
    evidence: "§8: 'In the sample available to us the two are collinear … country-level macro aggregates … are too noisy to isolate a response of this size.' §8: 'Both invested in capacity despite financial markets that are not uniformly deep. This is the pattern the framework predicts.' crosscountry.txt: intermediary × TRUE cell = NaN; durable d_gfcf 2.6 / -0.3, d_mva 1.1 / 0.5, d_fdi -1.2 / -0.3."
    change_my_mind: "Downgrade 'This is the pattern the framework predicts' to 'consistent with, though not testable in this sample', and do not describe the contrast cases as evidence."
  - id: L5-8
    severity: MINOR
    location: "§7, abstract"
    issue: "The abstract elevates 'a durable shock, the same institutions, a different outcome' to one of two co-equal within-country identification tests, but in the paper's own deal data the durable (auto) shock shows 3 deals post-2022, down from 6 pre-2022, and the transitory (electronics) shock shows 1 deal that is the acknowledged misclassification. The 'durable shock drew real capacity' claim rests entirely on plant-announcement press coverage, not the systematic dataset."
    evidence: "mechanism_tests.txt TEST F: 'auto deals 2015-21: 6 | 2022-25: 3'; 'electronics/precision deals 2015-21: 1 | 2022-25: 1' (the post-2022 record is 'Tokyo Rope Almaty LLP', the steel-wire-rope firm flagged as a misclassification in Table 3 note a and Table 4 note a). §7: 'the durable demand shock in passenger vehicles … drew real capacity'."
    change_my_mind: "Bring the announced/committed auto-assembly capex into the dataset on the same basis as the M&A deals (dated, valued), so TEST F rests on measured investment; or reframe §7 so the durable-vs-transitory contrast is explicitly qualitative and the identification weight sits on the captive-capital test."
scorecard:
  lens: "5. Robustness"
  critical: 1
  major: 3
  minor: 4
  score_out_of_10: 4
```
