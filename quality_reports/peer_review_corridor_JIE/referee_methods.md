# Methods Referee Report

**Calibrated to:** Journal of International Economics (JIE)
**Disposition:** CREDIBILITY
**Paper type:** Reduced-form (DiD + structural breaks + a value-capture calibration)
**Critical peeve:** One falsifiable sentence per identifying claim; no aggregating partial arguments into an identification strategy
**Constructive peeve:** Robustness must be tied to a named threat, not coverage theatre
**Manuscript:** `C:\Users\zh.kakishev\my-project2\Manuscript\corridor.tex` — "Corridor, Not Factory: Trade Reorientation and the Missing Investment Response in Kazakhstan, 2022–2025"
**Date:** 2026-09-15

---

## Executive verdict

**Score:** 64 / 100
**Recommendation:** **Major Revision**
**Headline:** The paper's descriptive core (a sharp, narrow, mid-2022 reorientation with thin domestic value capture and no detectable investment response) is measured carefully and reported with unusual candour — but three of its four retained claims currently rest on a *bundle* of partial arguments rather than on one stated, falsifiable identifying assumption each, and the cross-sectional difference-in-differences is presented in the main text with stars and a full inference apparatus around a coefficient the authors themselves declare non-identified.

Two framing remarks before the substance.

First, this is a **methods** report. I do not rule on whether the question is interesting to a JIE readership; that is the domain referee's job. My question is narrower: *does each number in this paper mean what the paper says it means?*

Second, I want to record at the outset that this manuscript is more honest about its own limits than most papers I referee. Section 4.3's three qualifications, the Panel C permutation row, the "a band we choose rather than estimate" phrasing, the "searched sample set against an unsearched one" concession, and the four-point Limitations paragraph are all volunteered by the authors, not extracted by a referee. Several of my concerns below are therefore not disagreements with the authors about the facts — they are disagreements about **where in the paper those facts belong** and **which claims the abstract is entitled to make given them**. That is a different, and more tractable, kind of revision than a dispute over identification.

---

## Pre-scoring sanity checks

| Check | PASS/FAIL | Evidence |
|---|---|---|
| **Sign check** | PASS | Outbound γ = 2.44 > 0 and inbound γ = 2.10 > 0, both in the direction the reorientation story predicts. The civilian placebo runs γ = −0.95, the direction the 2022 tenge depreciation predicts for consumer imports. The investment rate ratio is 0.96, i.e. a null, consistent with the paper's thesis rather than against it. Internally coherent throughout. |
| **Magnitude check** | **FAIL** | Three problems compound. (i) The headline γ = 2.44 is an asinh coefficient whose implied level effect is not invariant to the units of $y$, and the manuscript never states whether $y$ is in USD or USD millions. With 23% pre-period zeros on the treated leg this is not a pedantic point — the asinh "effect" is not interpretable as a proportional effect when the zero mass is large (Chen–Roth; Mullahy–Norton). (ii) The asinh specification implies roughly an 11× level effect while the PPML estimate in the same table gives 3.5×; the text says "the two tell the same story," which is true of the *sign* and false of the *magnitude*. A 3× discrepancy between two estimators of the same object is a result, not a footnote. (iii) The authors' own randomisation inference (Panel C, $p = 0.58$) states that the magnitude is not separable from the sample selection. A coefficient carrying significance stars in a main-text table, surrounded by a wild bootstrap, a Holm adjustment and a seven-row jackknife, whose magnitude has no units-invariant reading *and* which the authors concede is not identified, fails this check. |
| **Dynamics check** | PARTIAL | Pre-trend joint tests do not reject ($p = 0.78$ outbound, $p = 0.42$ inbound), which is good. But the annual event study has only three pre-periods (2018–2020, reference 2021), so the test is low-powered. More importantly, the selection rule uses the **2019–2021 mean as its denominator**, so the rule mechanically favours lines whose 2019–2021 values are low — i.e. it selects on a *declining* pre-path. A flat pre-trend test on a sample constructed this way is close to uninformative; the mechanical prediction is a positive 2018 coefficient (mean reversion), and 2018 is the one year outside the selection window and therefore the one genuinely informative placebo year. Its individual coefficient and standard error are not reported. A monthly event study, which would supply ~38 pre-periods, is available in the authors' data (2019m1–2024m2) but is not shown. |
| **Clustering check** | PASS (with stated caveat) | Standard errors cluster by HS6, which is the level at which treatment is assigned — nominally correct. The authors then volunteer that with a single common treatment date and shocks hitting related lines together, clustering by HS6 while treating lines as independent "is optimistic," and report a wild cluster bootstrap and randomisation inference in response. That is the right diagnosis and the right instinct. My objection (Concern 1) is not that clustering is wrong; it is that the inference the authors say they "lean on" returns $p = 0.58$, and the table nevertheless stars the coefficient at the cluster-robust $p = 0.013$. |
| **Sample check** | PASS — exemplary | Appendix B lists all 75 HS6 codes, marks the 29 surge lines with †, states the two thresholds, both post-period floors, the \$10,000 additive constant that prevents near-zero lines qualifying on a rounding artefact, and reports the 55/41/29 decomposition of which screen binds. This is more sample transparency than the median JIE paper provides, and it is what makes the rest of my critique possible to write precisely. Full credit. |

**One FAIL is recorded. Per protocol, the composite score is capped at 70.** The weighted composite (63.5) falls below the cap independently, so the cap is not binding here.

---

## Dimension scores

The JIE profile's methods adjustments are written against a base that includes a *Measurement / calibration transparency* dimension not present in the generic reduced-form rubric, and it sets Robustness at 12 where the generic rubric sets 15. I reconcile as follows and state it so the editor can audit the arithmetic: Identification stays at the profile's 35; Measurement/calibration transparency enters at the profile's 15; Robustness takes the profile's 12; Replication takes the profile's 8; the generic rubric's Estimation (25) and Inference (20) are scaled proportionally from 45 to the residual 30, giving 17 and 13.

| # | Dimension | Weight | Score | Weighted |
|---|---|---|---|---|
| 1 | Identification | 35% | 55 | 19.25 |
| 2 | Estimation | 17% | 58 | 9.86 |
| 3 | Inference (SEs, clustering, MHT) | 13% | 65 | 8.45 |
| 4 | Measurement / calibration transparency | 15% | 62 | 9.30 |
| 5 | Robustness | 12% | 84 | 10.08 |
| 6 | Replication readiness | 8% | 82 | 6.56 |
| | **Composite** | **100%** | | **63.5 → 64** |

The shape of that profile is the report in miniature: the paper's **robustness practice is the best thing in it** (84), its **replication infrastructure is solid** (82), and its **identification is the weakest link** (55) — which is unfortunate, because identification carries 35% of the weight at this journal.

---

## Part I — The core exercise: one testable sentence per retained claim

### Summary table

| # | Retained claim | The ONE identifying assumption, stated falsifiably | Ruling |
|---|---|---|---|
| 1 | Break dated 2022m5 | *No shock other than the post-February-2022 trade disruption moved surge-basket exports to Russia within the 2022m4–2022m6 window.* | **EARNED for the date; NOT EARNED for the confidence interval** |
| 2 | "Roughly tenfold" outbound rise | *Absent the reorientation, surge-basket exports to Russia would have continued at their 2018–2021 level of ~\$11m/yr.* | **EARNED as arithmetic; the number is selection-inflated and the selection-free analogue is not reported** |
| 3 | ~One-half Western incremental flow-through | *The incremental Western inbound flow and the incremental Kazakh outbound flow refer to the same goods, and neither leg carries a reporting bias the other does not.* | **NOT EARNED as a point figure** |
| 4 | "No investment response" | *A capacity response of economically meaningful size would, with high probability, have generated at least one additional recorded transaction in the three databases in manufacturing/transport/distribution over 2022–2025.* | **EARNED, and carefully bounded — the paper's best-executed claim** |

### Claim 1 — the 2022m5 break date

**The one sentence:** *No shock other than the post-February-2022 trade disruption moved surge-basket exports to Russia within 2022m4–2022m6.*

This is genuinely falsifiable, and the paper mounts a real case for it: the date precedes the June referendum and the November snap election; the response is confined to a narrow product set while a civilian control basket moves far less; Armenia and the Kyrgyz Republic break in the same month with no "New Kazakhstan" reform; and the direction of flow is Western-origin goods moving onward to Russia rather than the reverse. That is four independent implications of the same sentence, three of which could have come out the other way. **I am satisfied that the break is real and that its date is approximately mid-2022.** Full marks for the design of that argument.

What is *not* earned is the precision. The sup-$F$ of 561 and the 95% CI of 2022m4–2022m6 are both computed under a homoskedastic covariance, on a series the authors themselves describe as "highly persistent." The paper handles this correctly in one respect — it explicitly declines to read the sup-$F$ as calibrated inference on the break's *size* — but it then continues to use the *interval* as if it were calibrated, and the interval is doing load-bearing work: the entire "the break precedes the June referendum" leg of the reform-confound rebuttal depends on the upper endpoint of a CI derived from the same uncorrected covariance. With strong positive serial correlation, sup-$F$ statistics are inflated and break-date confidence sets are too narrow, often dramatically so. If an HAC-robust interval widens to, say, 2022m2–2022m9, that leg of the argument weakens considerably — the other two legs (narrow product set, neighbour countries) would still stand, but the paper would need to say so.

This is a cheap fix on data already in hand. See **Concern 4**.

### Claim 2 — "roughly tenfold"

**The one sentence:** *Absent the reorientation, surge-basket exports to Russia would have continued at their 2018–2021 level of about \$11m per year.*

This is the paper's cleanest claim and it does **not** depend on the DiD at all. It is a level comparison visible in Table 1's raw rows: \$17/12/7/8m against \$128/145/119/133m. I checked the increment arithmetic independently — \$525m post minus \$44–46m of counterfactual gives \$479–481m, matching the paper's \$479m. The counterfactual choice is conservative in the authors' favour's *opposite* direction (the pre-period is declining, so a flat counterfactual understates the increment), and the paper says so and quantifies the alternative (\$521m). That is exactly the right way to handle a counterfactual choice.

The problem is that "tenfold" is computed on a basket **selected for having large post/pre ratios on both legs**. A doubling screen with a \$10k regularising constant and post-period floors will, by construction, deliver a basket with a large aggregate ratio; the 29 lines are the survivors of a filter whose criterion is close to the statistic being reported. The paper's honesty about this in the DiD context (Section 4.3) does not carry over to the magnitude in the abstract, where "roughly tenfold" appears unqualified.

The fix is obvious and the authors already have the object: **report Table 1 for the 50-code externally compiled priority list.** That basket is defined on product characteristics, not on Kazakh flows, so its level ratio is a selection-free analogue of "tenfold." The paper reports the priority list's *DiD coefficient* (2.88) but never its *levels*. If the priority list shows, say, 4×, then "roughly tenfold" is substantially a selection artefact and the abstract should carry the selection-free number. If it shows 8–10×, the claim is vindicated and the paper is strengthened at essentially zero cost. See **Concern 3**.

### Claim 3 — the ~one-half Western incremental flow-through

**The one sentence:** *The incremental Western inbound flow to Kazakhstan and the incremental Kazakh outbound flow to Russia over 2022–2025 refer to the same goods, and neither leg carries a systematic reporting bias the other does not.*

I rule this **not earned as a point figure**, for three reasons that stack in the same direction.

First, the paper reports *three* flow-through ratios — 0.54 (incremental, Western basis), 0.15 (incremental, West+China basis), and 0.11 (matched-cell aggregate) — and the footnote that discloses this is admirably explicit, but a ratio that moves from 0.11 to 0.54 purely on the choice of basis is not a measurement, it is a menu. The introduction picks 0.54 and calls it "roughly one-half" without the range.

Second, the two legs are measured on incompatible reporting conventions. The inbound leg is partner-reported mirror data, which the paper concedes overstates Kazakh absorption for onward-moving goods — the *numerator* of the overstatement being precisely the phenomenon under study. The outbound leg is Kazakh-reported and, on the paper's own later argument (Section 5.2), plausibly under-recorded by 13–21%. Those biases push the ratio in *opposite* directions, so the sign of the net bias in 0.54 is unsigned as the paper stands. A bounding exercise — compute the ratio under (a) no bias, (b) 15% outbound under-recording, (c) mirror c.i.f./f.o.b. correction, (d) both — would turn a menu into an interval.

Third, and this one is an arithmetic error rather than a judgement call: **the \$3.2bn West+China increment is computed on mixed bases.** Table 1's own note states that the 2025 West+China figure is the Western component only, because China has not yet reported. But the increment subtracts a West+China baseline (mean of 394/427/483/470 = \$443.5m) from all four post years, including the Western-only 2025 value of \$363m. The 2025 contribution to the increment is therefore 363 − 443.5 = **−\$80.5m** — a negative contribution generated entirely by missing Chinese data, not by any economic event. The same note flags 2024's \$2,360m as "large and preliminary," so the increment is simultaneously dominated by one provisional figure and depressed by one missing one. The direction of the error makes the denominator too small and hence the "one-sixth" ratio too *large*, so correcting it strengthens rather than weakens the corridor reading — but it needs correcting, and a JIE referee will find it. See **Concern 5**.

### Claim 4 — the "no investment response" null

**The one sentence:** *A domestic capacity response of economically meaningful size would, with high probability, have generated at least one additional recorded transaction in the three commercial databases in manufacturing of tradeable goods, transport and logistics, or wholesale distribution during 2022–2025.*

**This is the best-executed claim in the paper**, and I want to be specific about why, because it is the model the other three should follow.

The paper states a Poisson rate ratio with a confidence interval (0.96, 95% CI 0.59–1.53) rather than asserting "no effect." It states the power of its own test explicitly (80% against an increase of roughly 80% or more) and then bounds its conclusion to exactly what that power supports — "rules out a large response, not a modest step-up" — including in the abstract. It **pre-commits to a coding rule** ("we would have coded as a positive investment response any greenfield or capacity-expansion deal, in any of the three databases, tagged to a surge-basket HS6 *or* to its parent class"), which is the correct way to make a null falsifiable. It reports the result three ways (consolidated, per-source, dropping the 2022 trough) and the per-source reconciliation in Table 5 shows the null holds in each database separately. It splits deal *value* from deal *count* and shows the value rise is ownership transfers and nationalisations rather than new capacity. And it volunteers that the null is over-determined by the January 2022 unrest, compliance exposure and the nationalisation wave, so that it cannot be attributed to the trade shock alone.

Every one of those is a decision that makes the claim *harder* to sustain, taken voluntarily. That is what a credible null looks like.

Two residual weaknesses, neither fatal. (i) The databases capture *transacted* investment and under-cover greenfield capacity built without an external transaction — conceded — and the manual substitute is, in the authors' own words, "a searched sample being set against an unsearched one" (autos searched, components not). Since the auto-versus-components contrast is the only evidence bearing on the irreversibility gate, that asymmetry is where the weakest inference in the paper sits. (ii) The per-source all-deal rates diverge sharply across the break (PitchBook 14.6 → 24.2; Preqin 3.7 → 1.8), which means coverage is *not* stable across the period even though the sector subset is; a coverage-stability check on the sector subset specifically would settle whether the flat 5.1 → 5.2 in Capital IQ is a fact about Kazakhstan or about Capital IQ. See **Concern 6**.

---

## Part II — The ruling on the difference-in-differences

**I rule that the surge-basket cross-sectional DiD, as currently presented, does not earn its place in the main text.**

The reasoning is short. Panel C of Table 2 reports that the observed γ = 2.44 sits inside its own selection-rule-matched null distribution (null mean 2.79, s.d. 1.50, $p = 0.58$). Section 4.3 states the implication plainly: "the coefficient's *magnitude* is not separable from the selection and we do not read it as an identified effect size." Section 4.1 states which inference the authors trust: "The randomisation-inference $p$-values below do not rely on it... and are the inference we lean on."

Taken together, the authors have said: *the inference we trust returns 0.58.* Table 2 Panel A then reports γ = 2.44 with a significance star, a cluster-robust standard error, a wild-bootstrap $p$ of 0.010, and a Holm-adjusted $p$ of 0.039; Appendix C wraps it in a further sixteen rows. That is an elaborate inference apparatus constructed around an object the paper has declared non-identified — and it is precisely the construction that produces the reader behaviour the caveats are meant to prevent. A reader who sees a starred coefficient in a main-text table will carry "2.44" away regardless of the paragraph underneath it.

I want to be careful about what I am *not* saying. I am not saying the DiD is wrong, or that the authors are concealing anything — the opposite; they diagnosed this themselves and built the test that exposed it, which most authors would not have done. I am saying the *presentation* has not caught up with the diagnosis.

**Recommended disposition.** The main text should carry the evidence that is identified on its own terms: (i) the raw levels of Table 1, (ii) the structural-break tests, (iii) the neighbour comparison of Appendix E, and (iv) **at most one DiD row — the externally compiled priority list**, which is the single specification where the selection critique does not apply by construction. The surge-basket DiD, its jackknife, its threshold sweep and its bootstrap move wholesale to Appendix C, with a main-text sentence of the form: *"A difference-in-differences on the data-selected basket gives a positive and conventionally significant coefficient, but a selection-rule-matched permutation places it inside its own null; we therefore do not use it, and report it in Appendix C for completeness."*

**But there is a condition, and it is the single most important ask in this report.** The priority-list row can only carry that weight if it is genuinely independent evidence — and as constructed, **it largely is not**. Appendix B shows that 24 of the 29 surge-basket lines are on the 50-code priority list. The priority-list DiD therefore shares roughly half its treated lines, and the great majority of its *economically active* treated lines, with the basket it is supposed to corroborate. "An externally compiled product list, not selected on Kazakh outcomes, shows the same break" (abstract) is, to a first approximation, a statement that the same lines show the same break.

The test that settles this is simple and uses data already in hand: **run the DiD on the 26 priority-list lines that are NOT in the surge basket.** If those 26 lines alone deliver a positive, significant γ, the external-list corroboration is real, the priority-list row can headline the main text, and the paper's identification is materially stronger than it currently looks. If they deliver γ ≈ 0, then the priority-list result is driven entirely by the surge lines, it is not independent evidence, and the abstract's second sentence must be rewritten. Either outcome is informative and the test costs one regression. See **Concern 2**.

---

## Part III — The ruling on the value-capture calibration

**Does presenting "5–11 cents per dollar" as a headline meet JIE's calibration-transparency bar?**

**Partially — the letter of the bar is met, the spirit is not.**

What meets the bar, and should be said plainly: the paper reports a *band* (5–11 cents), not a point. Appendix D sweeps $m$ across the full 0.06–0.49 range including values that break the conclusion. Both input–output sources are reported (OECD ICIO: $\bar v^{TT} = 0.787$, $\bar v^{M} = 0.764$; BNS: 0.885 and 0.742), and the sweep is anchored to externally documented endpoints (BNS transport-only margin ≈ 1%, full trade-and-transport margin ≈ 49%). The parameter is labelled as chosen in the *abstract itself*. Most calibrations I referee bury that admission in a footnote or omit it. Credit where due.

What does not meet the spirit, in three parts.

**First, the propagation step is decorative and the framing does not admit it forcefully enough.** Appendix D states the ratio is $\approx 1.03\,m$. The input–output apparatus — Leontief inverse, domestic technical coefficients, 45 ISIC industries — multiplies the answer by 1.03. The paper concedes this three times, which is honest, but the abstract still reads "Propagating a wholesale-and-freight margin... through the input–output table implies domestic value added of 5–11 cents." A reader encountering that sentence will infer that an input–output computation produced 5–11 cents. What produced 5–11 cents is the sentence "let $m \in [0.06, 0.14]$." The abstract should say so.

**Second, the band's endpoints have no empirical content and the paper does not attempt to give them any.** The only anchors are 1% and 49% — a 49-fold range. Within that, [6%, 14%] is judgement. And the authors have the means to do better *in a source they already use*: the Kazakhstan Bureau of National Statistics supply-use and resources tables report gross output and intermediate consumption for wholesale trade (ISIC 46). A trade margin computed as wholesale-sector output over the basic-price value of goods distributed is a **direct, data-derived estimate of $m$** from the same statistical system the paper already relies on for its robustness check. This is not an exotic ask; it is the natural next step from work the authors have already done.

**Third — and this is the part I find hardest to accept — the one data-derived estimate of $m$ that appears anywhere in the paper is 0.34, and it breaks the headline.** The censored matched-cell gross margin is dismissed as an artefact of the c.i.f./f.o.b. basis mismatch and outbound under-invoicing. Those reasons are plausible and I am not asserting 0.34 is correct. But note where the thresholds fall: the "corridor, not factory" reading holds for $m \lesssim 0.12$, weakens to "about a fifth" at $m \approx 0.19$, and the only internal estimate is 0.34 — comfortably past both. The paper's structure is therefore: *choose a band; derive a headline; observe that the headline fails above 0.19; note that the sole internal estimate is 0.34; dismiss it.* That ordering is uncomfortable, and a JIE referee will say so.

I should be fair about how much turns on this. Even at $m = 0.34$ a rerouted dollar is about a third of a produced one, so the *qualitative* corridor conclusion survives — the paper says this explicitly and it is correct. What does not survive is the *quantitative* headline: "5–11 cents," the "midpoint about 8%," and "\$23–53m retained" are all presented with a precision the chosen band cannot support, and those are the numbers that will be cited.

**Ruling: lead with the sweep, not the point.** Table D.1 should move into Section 5.2 and replace the 6–14% band as the primary object. The headline should be stated as a threshold claim, which is what the evidence actually supports and which is *stronger rhetorically* because it is unconditional: *"A rerouted dollar creates less than a fifth of the domestic value of a produced dollar for any retained margin below 19%, and less than a third for any margin below 32% — including the 34% implied by the censored matched-cell wedge."* That sentence needs no chosen parameter at all. See **Concern 7**.

---

## Part IV — Robustness: what this paper gets right

| Check | Named threat it targets | Did it come out in the authors' favour? |
|---|---|---|
| Trend-preserving cyclic-shift permutation | Selection driven by pre-existing trends rather than the 2022 alignment | **Yes** for basket existence (null mean 5.2 lines, $p < 0.001$) |
| Free selection-rule-matched permutation | Selection on the post-period outcome inflating γ | **No** — $p = 0.58$, reported anyway |
| Size-decile × year fixed effects | The non-homogeneous control pool the placebo reveals | Yes (γ = 2.29, $p = 0.003$) |
| Leave-one-HS2-out jackknife | HS-85 concentration the authors themselves flag | **No** — dropping HS 85 gives γ = 1.36, $p = 0.21$, reported in the main text |
| Threshold sweep 1.5× / 2.0× / 2.5× / 3.0× | Arbitrariness of the doubling rule | **Mixed** — the loosening arm (1.59, $p = 0.08$) is reported alongside the tightening arms |
| Drop-2022 and donut | Anticipation | Yes (γ = 2.71) |
| BNS symmetric IO cross-check | Dependence on OECD ICIO multipliers | Yes (ratio 0.10 → 0.12) |
| Three-database deal reconciliation | Single-source coverage gaps | Yes (null holds in each source) |
| Both-legs screen decomposition (55/41/29) | Selection purely on the outbound outcome the DiD then uses | Partial, and labelled partial |

**Four of these came out against the authors and are reported anyway, two of them in the main text.** The HS-85 jackknife is the clearest case: the authors found that a single chapter carries their point estimate, and wrote it into Section 4.2 in full. The loosening arm of the threshold sweep is the second. The free permutation is the third and most consequential. This is the opposite of theatre and it is why the Robustness dimension scores 84 while Identification scores 55.

**Four gaps remain, all natural extensions of checks already built:**

1. The trend-preserving cyclic-shift null is applied only to the *count* of lines the rule selects, not to the γ *distribution*. Verified in `scripts/R/kz_passthrough/12_did_robustness.R` — block (g) computes `perm_n_cyc` (counts) only. The γ null (mean 2.79, s.d. 1.50) comes from the free permutation at line 48, which permutes year labels within HS6 and therefore **destroys the series' autocorrelation**. Preserving it would almost certainly *widen* the null and push $p = 0.58$ higher still.
2. No randomisation inference is run for the **priority-list** γ.
3. The placebo row (N = 200, 25 civilian lines) — 5 of the 25 civilian control lines are themselves in the surge basket (392490†, 401110†, 610910†, 611020†, 961900†). If any of those five are among the "largest," the placebo is contaminated.
4. No HAC-robust break test (Concern 4).

---

## Major concerns

### Concern 1: The main-text DiD stars a coefficient the paper declares non-identified
**Dimension:** 1 (Identification), 3 (Inference) · **Severity:** MAJOR

Table 2 Panel A reports γ = 2.44 with a significance star and a full inference apparatus while Panel C of the same table reports the coefficient sits inside its own permutation null ($p=0.58$), and Section 4.1 names randomisation inference as "the inference we lean on." **What would change my mind:** demote the surge-basket DiD to Appendix C (keeping at most the priority-list row, conditional on Concern 2) and replace Table 2 Panel A with the levels/break evidence; or strip the stars/Holm/bootstrap from the surge-basket row and report only the point estimate beside $p=0.58$, plus state the units of $y$.

### Concern 2: The "externally compiled list corroborates it" claim is 83% the same lines
**Dimension:** 1 (Identification) · **Severity:** MAJOR — the highest-value single fix in this report

24 of 29 surge-basket lines are on the 50-code priority list (Appendix B). The abstract's defence against selection-on-outcome largely reduces to "the same lines show the same result." **What would change my mind:** run the DiD on the 26 priority-list lines NOT in the surge basket — one regression, decisive either way.

### Concern 3: "Roughly tenfold" is computed on a basket selected for large ratios
**Dimension:** 1 (Identification), 4 (Measurement) · **Severity:** MAJOR

The abstract's headline magnitude is computed on a basket filtered on a ratio criterion, which mechanically produces a large ratio. **What would change my mind:** report Table 1 levels for the 50-code priority list (and the 26-line residual set from Concern 2); state the selection-free ratio in the abstract if it differs materially from tenfold.

### Concern 4: The break-date CI is computed without a HAC correction, and it is load-bearing
**Dimension:** 2 (Estimation) · **Severity:** MAJOR

The 2022m4–2022m6 CI (sup-F 561, homoskedastic) underwrites the "precedes the June referendum" leg of the reform-confound rebuttal on a series the authors call "highly persistent." **What would change my mind:** re-run Bai–Perron with an HAC covariance for the monthly outbound/inbound series and each Appendix E row; report the corrected interval.

### Concern 5: The West+China increment mixes bases across the 2025 boundary
**Dimension:** 4 (Measurement) · **Severity:** MAJOR

2025's West+China figure is Western-only per Table 1's own note, but the increment subtracts a West+China baseline from it, making 2025's contribution −$80.5m — a negative number from a reporting gap, not an economic event. Runs in the authors' favour once fixed (lowers flow-through, reinforcing the corridor reading) but needs correcting. **What would change my mind:** restrict the increment to years both components are reported, or impute 2025 China and state the method.

### Concern 6: The investment null's weakest link is an asymmetric search, and it carries the irreversibility reading
**Dimension:** 1 (Identification) · **Severity:** MAJOR

The auto-vs-components contrast — the only evidence on the irreversibility gate — pairs a searched sample (autos) against an unsearched one (components). **What would change my mind:** run the same announcement-search protocol for electrical-machinery/components/instruments that was run for autos; report the sector-subset deal counts by source by year.

### Concern 7: The value-capture headline leads with a chosen parameter rather than the threshold the evidence supports
**Dimension:** 4 (Measurement) · **Severity:** MAJOR

The IO propagation multiplies by 1.03 (does no work); the band [6%,14%] has no data-derived anchor though the BNS supply-use tables the paper already uses could supply one; the only internal estimate of m (0.34) exceeds the 0.19 threshold and is dismissed. **What would change my mind:** (1) compute a data-derived m from BNS wholesale-trade (ISIC 46) margins; (2) promote Table D.1 into §5.2 as the primary object, headlining the unconditional threshold statement instead of "5-11 cents"; (3) engage the 0.34 estimate quantitatively rather than dismissing it.

### Concern 8: The abstract says "rules out"; the body says "illustrative"
**Dimension:** 1 (Identification) · **Severity:** MAJOR

The abstract claims the case "rules out capital-market institutions as the binding constraint"; §7 calls the same QIC evidence "illustrative rather than a controlled test." **What would change my mind:** soften the abstract to match the body, or supply the missing sector-denominator comparison from the QIC report (which reports activity "by sector and year").

---

## Minor suggestions

1. State the units of $y$ in the asinh spec; report the implied level effect with a delta-method interval; justify or lead with PPML given 23% pre-period zeros.
2. Reconcile the asinh (~11×) vs PPML (3.5×) magnitude gap explicitly rather than "the two tell the same story."
3. Report the 2018 event-study coefficient individually — the one placebo year outside the selection window.
4. Show the monthly event study (≈38 pre-periods vs the annual panel's 3).
5. Name the lines used in the placebo row; 5 of 25 civilian control lines are themselves surge-basket lines.
6. Clarify the placebo is a different sample (N=200 vs N=600).
7. Run the trend-preserving cyclic-shift null for γ itself, not just the selection count (likely strengthens the authors' own conclusion).
8. Appendix E: Kazakhstan is the only country in the table whose flow persists (Türkiye/Armenia/Kyrgyz Republic all revert) — extend the reversion note to Türkiye and flag this as independently interesting (persistence is the moderator the framework cares most about).
9. Mark the 2025 column's partial-coverage caveat visibly in the table body, not only the caption.
10. Rephrase "no investment response in the reoriented lines" to "in the sectors the reoriented flow passes through" — the actually-informative test is the sector-level rate, and this is if anything a stronger claim.

---

## Replication readiness

**Positive.** Numbered sequential pipelines with `00_setup.R`/`00_run_all.R` entry points; raw Comtrade JSON cached; seeds set (`set.seed(20260831)`); Appendix A's deal-database query spec is unusually complete (screens, de-dup rule, ISIC crosswalk, extraction dates pinned); Data Availability statement correctly distinguishes redistributable from licensed sources.

**Gaps for a JIE revision.** No visible environment capture (renv.lock / sessionInfo) in what I could inspect; `.rds` outputs rather than inspectable CSVs; no explicit script-to-exhibit map; manuscript hard-codes numbers rather than `\input`-ing generated fragments (Tables 1, 2, C.1, D.1 would benefit from converting).

**Score: 82.**

---

## Positive observations

1. **The paper built the test that damages it most and published the result.** The selection-rule-matched permutation (Table 2 Panel C) is a check the authors designed knowing what it would do to their own headline coefficient.
2. **Every robustness check is tied to a named threat**, not filler — four came out against the authors and all four are reported, two in the main text (HS-85 jackknife, loosening threshold arm).
3. **The investment null is a model of how to report a null**: rate ratio with CI, explicit power calculation, a pre-committed coding rule, three-source reconciliation, value vs. count separated, voluntary over-determination disclosure.
4. **Sample construction is fully transparent** — Appendix B is what made Concern 2 findable.
5. **The paper states what it does not identify, repeatedly, in the right places** — Concern 8 is the one place that discipline slips, which is itself evidence of how consistently it holds elsewhere.
6. **The arithmetic checks out** — independently verified the $479m/$887m increments and the flow-through ratios against Table 1; the one defect found (Concern 5) is a basis-mixing issue, not a computational error, and runs in the authors' favour.
7. **The conflict-of-interest disclosure is exemplary** and directly relevant given §7 leans on a report the author's employer co-published.

---

## Summary for the editor

The descriptive core — a sharp, narrow, mid-2022 trade reorientation, thin domestic value capture, no detectable investment response — is real, carefully measured, and (for the investment null) exceptionally well executed. My concerns are not that the conclusions are wrong; with one exception (Concern 5, which favours the authors) I found no error. My concerns are that the paper's **presentation has not caught up with its own diagnostics**: the DiD is starred after the authors showed its magnitude isn't identified (C1); its external corroboration shares 24 of 29 lines with what it corroborates (C2); the headline magnitude is computed on the selecting basket (C3); the break interval is uncorrected on a persistent series (C4); the value-capture headline leads with a chosen parameter over an available unconditional threshold statement (C7); and the abstract says "rules out" where the body says "illustrative" (C8).

Six of eight major concerns are answerable with data and code the authors already have, and three (C2, C3, C7.1) could plausibly come out *strengthening* the paper. **Recommendation: Major Revision**, turning primarily on Concern 2 — the 26-line test, one regression, decisive either way.
