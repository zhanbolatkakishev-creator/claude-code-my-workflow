# Lens 5 — Robustness & Threat Pre-emption — ROUND 2

**Manuscript:** `Manuscript/corridor.tex` (re-read in full)
**Grounding:** `scripts/R/kz_passthrough/{06_eventstudy_did.R,10_robustness.R}`,
`scripts/R/kz_valueadd/{06_mechanism_tests.R,07_crosscountry.R,08_power_null.R}`, and the
shipped `_outputs/` (`rq1_estimates.txt`, `rq1_robustness.txt`, `rq1_monthly.txt`,
`rq2a_unit_value_wedge.txt`, `rq2b_io_propagation.txt`, `power_null.txt`, `mechanism_tests.txt`,
`crosscountry.txt`). Round-1: 4/10, 1 CRITICAL + placebo/selection concerns.

---

## Round-1 items — disposition

| R1 item | Status in R2 | Evidence |
|---|---|---|
| **C1** headline DiD run on the wrong (priority-list) basket; surge-basket DiD insignificant and unreported | **RESOLVED** | Surge basket re-defined (West+China inbound + expRU, ≥2× both legs, level floors → 29 HS6). Surge-basket DiD is now primary and significant: expRU γ = 2.44 (p = 0.013), wild-cluster bootstrap p = 0.010, RI p = 0.009, PPML 3.53× (p = 0.016). Reported in `tab:did` **with its own row**, alongside the pre-specified priority list (2.88 / 2.12 / 1.93 / 2.94, all p < 0.01). |
| **C2** placebo basket purged of surging civilian lines "cannot fail by construction" | **PARTLY RESOLVED** | `10_robustness.R` now reports the placebo on the **unpurged** 25-line civilian basket (supF 0.32 inbound, 34.4 outbound) as well as the purged 20-line one. Placebo DiD = −0.95 (p = 0.001). But the significant opposite-signed placebo DiD is now **spun** rather than confronted — see MAJOR-1. |
| **C3** central null has no power analysis; flips with the window | **RESOLVED** | §6 now carries the Poisson rate ratio (1.03, 95% CI 0.63–1.65), the 2023–25 window (9.0/yr, RR 1.24, CI 0.74–2.01), and the MDE ("80% power only against ≈80%+"). Framed as "rule out a large response, not a modest one." |
| **C4** Figure 3 is not an event study; zero-width CIs | **PARTLY RESOLVED** | `fig:es` caption now states plainly it is "a single aggregate time series with no control group, not a difference-in-differences event study … interval bands are correspondingly wide." A genuine HS6×period event study + pre-trend Wald test (p = 0.42 / 0.78) is now in the §4.3 **text** — but the figure shown is still the weaker aggregate profile (see MINOR). |
| **C5** Test F confounded and over-claimed as "identification" | **RESOLVED** | §7 now: "We treat this as illustrative rather than as a controlled test, for three reasons" (auto deals actually fell; capacity evidence is announcements not deal data; no symmetric component search; ρ, I, market access and destination all move together). |
| **C6** "five commercial databases" claim not yet true | **RESOLVED** | Abstract/§1/§3/Table 2/App. A now say three analysed, FactSet + Dealroom "specified … for cross-validation in the final draft" / "[To run.]". |
| **M8** mirror-gap DiD null and unreported | **RESOLVED** | §4.3: "The mirror-gap outcome … does not move significantly (γ = 0.54, p = 0.81); we do not lean on it." |
| **M9** `asinh` on a panel of structural zeros; no PPML | **RESOLVED** | PPML (`fepois`) DiD now reported in text (3.5× outbound, 2.4× inbound), corroborating the `asinh` coefficients. |
| **M2/M4** margin drives the headline; promised under-invoicing bound absent | **PARTLY** | The §10 promise of an under-invoicing bound has been removed (resolved by retraction); under-invoicing is now only *named* (Fisman–Wei). Freight-rate / alternative-IO sensitivity on the value-capture headline is still absent — MAJOR-5. |
| **M6/M7** 8-observation annual break tests; confounds that generate the null unnamed | **PARTLY** | §2 now names Qandy Qantar, secondary-sanctions exposure and the nationalisation wave and calls the null "over-determined." But the neighbour break tests are still 8-obs annual and presented without a fragility caveat (MINOR), and the "over-determined" concession is not propagated to the abstract/intro (MAJOR-4). |

Six of the eight round-1 CRITICAL/near-CRITICAL items are genuinely closed. That is real progress and the DiD section in particular is now defensible in structure.

---

## Top 5 objections a hostile referee raises about the CURRENT paper

### 1. "Your placebo DiD is significant — your parallel-trends assumption is demonstrably violated, and you have no sensitivity analysis." — **NOT pre-empted**

`rq1_robustness.txt`: the placebo DiD (fake treatment = top-quartile pre-2022 size within the civilian basket) is **γ = −0.95, p = 0.001** — a large, precisely-estimated, opposite-signed effect. §4.3 reads this as: the placebo "does not deliver a clean zero, but its sign is the opposite of the treatment effect and it sharpens rather than muddies the contrast."

That is spin. A significant placebo means the cross-sectional DiD design is picking up a systematic post-2022 movement that differs across HS6 classes for reasons other than the reorientation — the obvious candidate being a generic **big-line-vs-small-line import-compression / relative-price pattern** (tenge depreciation hit large consumer-goods lines hardest; the surge basket is by construction "small pre, large post"). The surge coefficient could be partly a size-composition artefact. **There is no check that isolates the surge basket from this:** no size-matched control, no within-size-stratum DiD, no Rambachan–Roth-style sensitivity bound on the DiD given the observed pre-trend/placebo violation. The paper needs one of these, and it needs to drop "sharpens the contrast."

Mitigant that keeps this a MAJOR not a CRITICAL: identification of the reorientation does not actually rest on the cross-sectional DiD — it rests on the monthly structural break (expRU supF 561, BP 2022m5 [2022m4–m6]), which is not a parallel-trends design. The DiD is corroborative. But the paper still leans on it rhetorically ("a difference-in-differences against control lines puts the outbound increase at about 3.5×" — abstract), so the referee's hit lands.

### 2. "The surge basket is selected on the post-2022 outcome, and neither of your two fixes actually neutralises that." — **PARTLY pre-empted**

The paper offers (a) the pre-specified priority list and (b) randomisation inference over random 29-line baskets.

- **(b) uses the wrong null.** `06_eventstudy_did.R:88` draws **uniformly random** 29-line baskets from the 75. A random basket has no reason to show a large treated×post coefficient, so beating it (expRU p₂ = 0.009) is nearly mechanical. The selection-aware null the round-1 synthesis asked for is different: re-apply the **≥2×/≥2× selection rule** to permuted treatment timing (or to placebo/pre-period outcomes) and ask whether the real basket's γ still stands out. That preserves the inflation from selecting-on-outcome; the current RI does not.
- **(a) is ~80% the same lines.** 24 of the 29 surge lines are on the 50-code priority list. The priority-list DiD (γ = 2.88) being significant shows the effect survives *diluting* the 24 surging lines with 26 non-surging ones — a reasonable robustness — but it is not independent evidence, and a referee will say so.

Net: the selection concern is softened but not resolved. The honest framing (which §4.3 and §10 partly adopt) is that the DiD magnitude is not to be trusted as a point estimate and the section rests on the break tests + neighbours.

### 3. "The inbound leg of your 'both legs surged' story is not there at annual frequency, and your explanation for that undercuts the story." — **PARTLY pre-empted**

`rq1_estimates.txt`: the **annual West+China inbound break is insignificant (supF 4.12, p = 0.27)**. The W+China DiD is borderline (γ = 2.10, p = 0.051; RI p₂ = 0.025) and the **Western-only DiD is insignificant** (γ = 1.73, p = 0.08; RI p₂ = 0.058). Only KZ-reported imports (`impW`, the series §3 disavows as incomplete) and the *monthly* Western component (supF 241) clearly move.

The paper's explanation — "the large pre-existing China flow swamps the 2022 movement at annual frequency" — is honest and is now also in §10 ("read the West-plus-China inbound only at the product level … not in the aggregate"). But it means the headline "both the inbound flow (West and China) and the outflow to Russia at least doubled" (§1) and "imports of the same goods rose too" (abstract) are **not carried by the aggregate evidence**. The neighbour tests are outbound-only (ARM/KGZ exports to Russia). So the identification effectively rests on: the outbound break + the placebo + the (now weaker) neighbours, with the inbound leg as product-level corroboration at monthly frequency only. The abstract and §1 should be reframed to lead with the outbound leg and present inbound as corroboration; as written they oversell.

### 4. "You concede both within-country comparisons are non-decisive, then the abstract still says they identify the binding gate." — **NOT pre-empted**

§7 now concedes: Test D (captive capital) is confounded because "a state-owned vehicle is precisely the actor most exposed to secondary-sanctions and reputational risk" — i.e. QIC's abstention is equally consistent with a compliance constraint; and Test F is "illustrative rather than … a controlled test." Both mechanism tests in `06_mechanism_tests.R` are now hedged into near-non-claims.

Yet the **abstract** still asserts "Two within-country comparisons point to the irreversibility gate," §1 still says "uses two within-country comparisons to argue the irreversibility gate is the binding one here," and contribution (ii) is built on it. Once Test D is sanctions-confounded and Test F is illustrative, the honest answer to "which gate binds?" is: the market-access gate is definitely open; the rest is suggestive. The "over-determined" concession (§2, §10) is candid but has **not been propagated** to the abstract/intro/contribution. This does not threaten the central *descriptive* claim ("corridor, not factory / no deals in the surge lines") — that stands on its own — but it guts §7's current framing.

### 5. "Your value-capture headline moves with an uncited hardcoded parameter." — **NOT pre-empted**

`rq2b_io_propagation.txt`: the matched-cell gross margin is 0.343; "after netting inbound freight (~15%)" it becomes 0.120, which sets the **upper bound** of the "6–12%" band and hence the "5–9% domestic VA" headline. The 15% is hardcoded and uncited. **There is no sensitivity to it:** the only robustness shown is on the manufacturing multiplier (v_M down to 0.40). At 8% freight the margin band is roughly 6–26% and the headline becomes ≈5–20%; at 25% it tightens to ≈6–9%. A freight-rate grid (8 / 15 / 25%) with a one-line cite (Arvis et al. is already in the bib; or KZ BNS trade-and-transport margins) is needed, and it should show the *direction* ("a rerouted dollar ≈ one-tenth to one-fifth of a produced dollar") survives. Relatedly, only OECD ICIO 2019 is used — no ADB MRIO / EORA / KZ national-IO alternative, despite the ICIO's unusually high KZ domestic-content shares (v_TT = 0.79, v_M = 0.76). The propagation step "does little work" (the margin dominates), so this is the lesser half of the same MAJOR.

---

## Findings

```findings
- id: L5-R2-1
  severity: MAJOR
  location: §4.3 "Results" para + tab:did (placebo row); 10_robustness.R:36-39
  finding: >
    The placebo DiD is a large, significant, opposite-signed effect (γ = −0.95, p = 0.001,
    rq1_robustness.txt) and the paper presents it as "sharpens rather than muddies the
    contrast." A significant placebo means parallel trends fails in the control basket —
    plausibly a generic big-line-vs-small-line post-2022 import-compression / relative-price
    pattern that the surge basket (small-pre, large-post by construction) could partly share.
    No size-matched control, no within-size-stratum DiD, and no Rambachan–Roth-style
    sensitivity bound on the DiD is reported.
  change_my_mind: >
    A size-matched or within-stratum DiD in which the surge effect survives, OR an honest-DiD
    sensitivity bound (Rambachan–Roth) that keeps γ bounded away from zero under the observed
    placebo/pre-trend violation, OR an explicit reframe making the DiD secondary to the
    monthly break tests + neighbours and deleting "sharpens the contrast."

- id: L5-R2-2
  severity: MAJOR
  location: §3 "Product sets" + §4.3 selection paragraph; 06_eventstudy_did.R:84-94
  finding: >
    The two defenses against selecting the basket on the post-2022 outcome are both thin.
    (a) The randomisation inference draws uniformly random 29-line baskets, not baskets
    produced by the same ≥2×/≥2× selection rule applied to permuted timing or placebo
    outcomes, so it does not neutralise the mechanical inflation of γ from selection-on-
    outcome — it tests a weaker null. (b) The pre-specified priority list overlaps the surge
    basket in 24 of 29 lines, so it is not independent corroboration.
  change_my_mind: >
    Re-run the RI as a selection-rule-matched permutation (apply the doubling rule to
    randomly re-timed / pre-period data, collect the placebo γ distribution), and report the
    priority-list result with the line-overlap stated. If the selection-matched RI still
    puts the real γ in the tail, this downgrades to resolved.

- id: L5-R2-3
  severity: MAJOR
  location: Abstract ("imports of the same goods rose too"); §1 ("both … at least doubled"); §4.2
  finding: >
    The inbound leg is over-claimed. The annual West+China inbound break is insignificant
    (supF 4.12, p = 0.27); the W+China DiD is borderline (γ = 2.10, p = 0.051) and the
    Western-only DiD is insignificant (γ = 1.73, p = 0.08). Clear inbound movement is only in
    the monthly Western component and in KZ-reported imports (the series §3 disavows). The
    neighbour tests are outbound-only. Identification effectively rests on the outbound break
    + placebo + neighbours; the abstract/§1 "both legs" framing outruns the evidence.
  change_my_mind: >
    Reframe abstract/§1 to lead with the outbound surge (supF 561 monthly, DiD 2.44) and
    present the inbound leg explicitly as product-level / monthly-Western corroboration,
    with the null annual W+China break stated where the claim is made (not only in §10).

- id: L5-R2-4
  severity: MAJOR
  location: Abstract (final sentence); §1 contribution (ii); §7 vs §2/§10
  finding: >
    §7 concedes Test D is confounded by QIC's own secondary-sanctions exposure and demotes
    Test F to "illustrative," and §2/§10 call the investment null "over-determined" (Qandy
    Qantar, compliance risk, nationalisations). But the abstract still says "two within-
    country comparisons point to the irreversibility gate" and §1 still claims they "argue
    the irreversibility gate is the binding one here." The concession is not propagated;
    "which gate binds" is no longer supported at the strength the front matter asserts.
  change_my_mind: >
    Bring the abstract/§1/contribution (ii) into line with §7: the market-access gate is
    demonstrably open; the irreversibility gate is suggestive (two hedged comparisons); the
    null is over-determined. The descriptive "corridor, not factory" claim is unaffected and
    can stay as stated.

- id: L5-R2-5
  severity: MAJOR
  location: §5.2 "Input–output propagation"; §10 limitations; rq2b_io_propagation.txt
  finding: >
    The 6–12% retained-margin band's upper bound is set by a hardcoded, uncited 15%
    inbound-freight assumption, with no sensitivity. At 8% freight the band is ≈6–26% and
    the "5–9% domestic VA" headline becomes ≈5–20%. No alternative input–output table (ADB
    MRIO / EORA / KZ national IO) is shown despite the OECD ICIO's unusually high KZ
    domestic-content shares.
  change_my_mind: >
    A freight-rate grid (≈8 / 15 / 25%) with a citation for the central value, showing the
    qualitative conclusion (rerouted dollar ≈ one-tenth to one-fifth of a produced dollar)
    survives; plus at least one alternative IO multiplier as a robustness row.

- id: L5-R2-6
  severity: MINOR
  location: §4.3 "reform confound" para; 10_robustness.R:64-70
  finding: >
    Armenia/Kyrgyz break tests (supF 10.47, p = 0.014; 13.44, p = 0.004) sit close to
    standard supF critical values and are computed on 8 annual observations. They are
    presented as clean confirmation with no fragility caveat.
  change_my_mind: >
    Add a caveat that the neighbour tests are short-sample annual and marginal, and/or
    show the neighbour outbound series with a visual break, and lean the confound defense
    primarily on the civilian-inbound null (supF 0.32) and the monthly 2022m5 outbound
    break dated before every political-calendar event.

- id: L5-R2-7
  severity: MINOR
  location: §7 "The transitory condition is observed, not assumed"
  finding: >
    ρ is inferred partly from the realized 2023-H2 decline ("$15m → $9m, more than a
    third"). Investment decisions in 2022 could not condition on that path. The header
    concedes the ex-post nature rather than resolving it.
  change_my_mind: >
    Lead with the ex-ante argument (sanctions-driven flows are inherently policy-contingent
    → high σ, low expected ρ regardless of realized path; EU 11th package / anti-
    circumvention instrument as contemporaneous signals) and present the realized decline as
    consistent-with, not proof-of.

- id: L5-R2-8
  severity: MINOR
  location: §5.1; §10; Fisman–Wei citation
  finding: >
    Under-invoicing of exports to Russia is named as an alternative reading of the sub-1
    CIF wedge (0.73) but not bounded — no calculation of how much under-invoicing would be
    needed to lift retained value added above, say, 20% of the gross flow, even though this
    alternative cuts against the "thin capture" thesis.
  change_my_mind: >
    A one-line bound: "exports to Russia would need to be under-invoiced by ≈X% to raise
    retained domestic value added above Y% of the gross flow."

- id: L5-R2-9
  severity: MINOR
  location: fig:es; rq1_fig_eventstudy.png (unused) vs rq1_fig_monthly_eventstudy.png (shown)
  finding: >
    The genuine HS6×period DiD event study (with the p = 0.42 / 0.78 pre-trend Wald test)
    is computed and in _outputs but not plotted; the figure shown is still the aggregate
    no-control profile. The stronger object is relegated to a text sentence.
  change_my_mind: Plot the HS6×period event study as fig:es (or beside it).

- id: L5-R2-10
  severity: MINOR
  location: §8 "Contrast cases"; crosscountry.txt
  finding: >
    The Vietnam/Mexico contrast is asserted ("widely read as structural") with no citation
    and no in-paper data; the 2×2 in crosscountry.txt collapses (intermediary×high-findev
    cell empty; the intermediary manufacturing-VA-growth cell is driven by an Uzbekistan
    outlier, 106→7). §8 is candid that it identifies nothing, but the contrast cases still
    need citations.
  change_my_mind: Add citations for the Vietnam/Mexico structural-reallocation characterisation; keep the "what we cannot show" candor.
```

```scorecard
lens: "5. Robustness"
round: 2
critical: 0
major: 5
minor: 5
score_out_of_10: 6
resolved_from_round_1: [C1, C3, C5, C6, M8, M9]
partly_resolved_from_round_1: [C2, C4, "M2/M4 (under-invoicing promise retracted; freight/IO sensitivity still absent)"]
```

---

## The one check whose absence most threatens this at R&R

**A selection-rule-matched placebo / randomisation exercise for the cross-sectional DiD** —
re-apply the ≥2×/≥2× basket-selection rule to permuted treatment timing (and/or to pre-period
/ placebo outcomes), collect the resulting placebo-γ distribution, and show the real γ = 2.44
still sits in its tail; paired with a size-stratified or size-matched DiD so the significant
opposite-signed placebo (−0.95, p = 0.001) cannot be read as "the surge coefficient is a
big-line/small-line composition artefact." This is the single attack that a methods referee
can mount against the DiD's identification rather than its framing: the paper's own placebo
shows parallel trends failing in the control basket, and the current RI (uniform random
baskets) does not answer the mechanical-inflation-from-selection-on-outcome concern the paper
itself flags as its top threat. Everything else on the MAJOR list is a reframe or a bounding
exercise; this one is a missing analysis.

Secondary (if only one more table fits): a freight-rate sensitivity grid on the value-capture
headline (L5-R2-5), because "5–9% domestic value added" is a top-three number in the abstract
and its upper bound is currently pinned by an uncited constant.
