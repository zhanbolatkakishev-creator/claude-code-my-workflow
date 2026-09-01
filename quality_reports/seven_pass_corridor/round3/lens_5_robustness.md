# Lens 5 — Robustness & Threat Pre-emption — ROUND 3

**Manuscript:** `Manuscript/corridor.tex` (982 lines, re-read in full)
**Grounding:** `scripts/R/kz_passthrough/_outputs/` — `rq1_did_robustness.txt`, `rq1_robustness.txt`,
`rq1_estimates.txt`, `rq1_monthly.txt`, `rq2a_unit_value_wedge.txt`, `rq2b_io_propagation.txt`,
`rq2b_bns_io_check.txt`; `scripts/R/kz_valueadd/_outputs/power_null.txt`.
**Prior:** round-2 Lens 5 = 6/10, 0 CRITICAL / 5 MAJOR / 5 MINOR. Round-2 synthesis verdict REVISE-MAJOR.

---

## Round-2 Lens-5 items — disposition (all five MAJORs are genuinely addressed)

| R2 id | Status | Evidence in the round-3 text |
|---|---|---|
| **L5-R2-1** placebo DiD (−0.95, p=0.001) spun as "sharpens the contrast"; no size check | **RESOLVED** | §4.3: "we do not read the placebo as corroboration"; the size-decile×year FE DiD is now reported (`rq1_did_robustness.txt` (b): γ 2.44→2.29, p=0.003). "sharpens the contrast" is gone. Also §4.3 closes: the DiD "does not identify it on its own; the structural breaks … and the neighbour comparison … carry that weight." |
| **L5-R2-2** randomisation inference used a uniform-random basket, not the selection rule | **RESOLVED** | §4.3 now reports the selection-rule-matched permutation (`rq1_did_robustness.txt` (a)): the rule never re-selects 29 lines under H₀ (existence p<0.001) but the permuted-null γ averages 2.8, so "the coefficient's *magnitude* is not separable from the selection." Honestly stated. |
| **L5-R2-3** inbound leg over-claimed ("both legs doubled") | **RESOLVED** | Abstract: "though the inbound series is dominated by a large pre-existing flow from China." §1: "the inbound flow breaks in the same month but more weakly, and not at all in the noisier annual series." §4.2 states the annual W+China break sup-F of 4 where the claim is made. §4.3 flags the W+China DiD "not significant after Holm." |
| **L5-R2-4** "which gate binds" asserted flatter in front matter than in §7 | **RESOLVED** | Abstract: "are suggestive that the irreversibility gate binds, though neither is a clean test." §1: "which we read as suggestive rather than dispositive." Contribution (ii): "suggestive, not dispositive." |
| **L5-R2-5** freight rate hardcoded/uncited; no alternative I-O; no under-invoicing bound | **RESOLVED** | Freight-netting derivation dropped entirely. §5.2 now takes m from the "6–14%" convention only; BNS 68-product I-O cross-check added (`rq2b_bns_io_check.txt`: v_TT 0.89 / v_M 0.74 → ratio one-in-eight vs one-in-ten); under-recording bound added ("≈40% under-recording → 25% margin"). |
| L5-R2-6 neighbour breaks 8-obs, no caveat | **RESOLVED** | §4.3: "rest on eight observations and we read them as corroboration rather than inference." |
| L5-R2-7 ρ inferred ex-post | **PARTLY** | EU Reg. 2023/1214 (anti-circumvention transit tool) now cited as a contemporaneous signal; §7 still leads with the realised 2023-H2 decline. See L5-6 below. |
| L5-R2-8 under-invoicing not bounded | **RESOLVED** | §5.2 one-line bound now present. |
| L5-R2-9 genuine HS6×year event study not plotted | **RESOLVED** | `fig:es` now points to `rq1_fig_eventstudy.png` (the HS6×year DiD event study); pre-trend Wald p = 0.78 / 0.42 reported in §4.2. |
| L5-R2-10 Vietnam/Mexico "structural" uncited | **PARTLY** | `juhaszlanerodrik2024` now cited; USMCA rules-of-origin argument added. Adequate. |

This is a clean revision on the robustness lens. The DiD section in particular now does the honest
thing: it runs the correct selection-aware null, reports that the null swallows the coefficient's
magnitude, and explicitly hands identification to the monthly break + neighbours. Motivation
(Lens Q2) is now genuinely threat-by-threat, not a battery — the "three qualifications" in §4.3 and
the three sensitivity moves in §5.2 each name the specific threat they answer.

---

## Lens questions, round 3

### Q1 — the top 5 objections a JCE/EER referee raises, and whether each is pre-empted

1. **"Surge basket selected on the outcome."** *Pre-empted, and handled with integrity.* The
   selection-rule-matched permutation is now run and the paper concedes the DiD magnitude "is not
   separable from the selection" (permuted-null γ mean 2.79 vs observed 2.44 — the coefficient is
   fully inside the selection-induced distribution). The count-vs-magnitude split is convincing:
   *existence* of a 29-line basket is p<0.001, *magnitude* is not identified. The residual is that
   the **abstract** still reports the "threefold … nets out common shocks" without this caveat
   (L5-3).

2. **"The 2022 break is the Tokayev / New Kazakhstan agenda."** *Pre-empted.* Three-part defense:
   civilian-basket placebo (annual outbound sup-F 34 vs 151; monthly surge 561; civilian inbound
   sup-F ≈ 0.3), 2022m5 dating ahead of the June referendum and November election, and the
   Armenia/Kyrgyz parallel break with no comparable reform. The paper discloses that the civilian
   basket's *outbound* flow does shift (a general Russia-trade effect) — honest. Adequate.

3. **"Value capture rests on an assumed 6–14% margin."** *Partly pre-empted — m is still doing all
   the work, and it is uncited.* The BNS I-O cross-check and the 40%-under-recording bound are
   good additions, and the paper is candid that "the propagation step does little work: the result
   is essentially m against the full domestic value." But the 6–14% figure itself is asserted four
   times (abstract, §1, §5.2, §10) as "the national-accounts convention" **with no citation** — the
   exact fix round-1 C3 and the round-2 synthesis asked for and did not get (L5-1).

4. **"No investment response = you lack power."** *Pre-empted well.* MDE ≈ 1.8× is foregrounded in
   §6 ("80% power only against ≈80%+") and the abstract ("rule out a large response rather than a
   modest step-up"). The over-determination (Qandy Qantar, compliance risk, nationalisations) is in
   the abstract, §2 and §10. The one part power does not rescue — zero transactions in the
   surge-basket lines across 2015–2025 — is correctly flagged as "a zero that a modest-response CI
   does not soften."

5. **"China is 2/3 of inbound and Chinese re-exports can't be seen cleanly."** *Pre-empted.* §3
   tracks the Western component separately, discloses the mirror onward-movement bias
   (`chupilkin2026roundabout`), and §4.2 states the annual W+China break is insignificant. The
   onward China→KZ→Russia flow is in fact captured by the outbound (KZ-reported, complete) series,
   which is the identification workhorse.

### Q2 — robustness checks motivated or listed?

Motivated. §4.3's three qualifications map to (i) selection-on-outcome, (ii) is the operative screen
really the outcome, (iii) control-pool homogeneity. §5.2's three moves map to I-O vintage, multiplier
level, and under-invoicing. §6's two windows map to the 2022 trough. Improvement over round 2.

### Q3 — the negative significant placebo (γ = −0.95, p = 0.001)

The round-2 spin is gone. The round-3 explanation — big consumer-goods lines contracted post-2022
"as the tenge depreciation would predict," so the control pool is not homogeneous in trend, and the
size-decile×year FE is "what addresses this" — is **satisfying for the outbound leg** (γ 2.44→2.29,
survives) and **incomplete for the inbound leg**: the same size control roughly *halves* the inbound
DiD (mirWC 2.10 → 1.28, p = 0.052, `rq1_did_robustness.txt` (b)) and that is not disclosed (L5-2).
The depreciation mechanism itself is asserted with no in-paper evidence or cite (L5-8, minor).

### Q4 — heterogeneity where promised

- **By size decile:** now done (size-decile×year FE DiD).
- **Donut / drop-2022:** done (§4.3 γ = 2.71; §6 2023–25 rate 9.0/yr). Matches `rq1_did_robustness.txt` (c).
- **By CHPL tier:** *not done, and it cuts against a headline.* `rq2a_unit_value_wedge.txt` gives
  tier-2 median wedge **3.83** and tier-4A median **3.94** — ≈42% of matched gross outbound flow
  ($218m of $524m) sits at ≈4× f.o.b./f.o.b. wedges; overall p75 = 4.40. §5.1 asserts "no mass at
  the high multiples a mark-up would produce" but shows only the median and the histogram. This is
  the round-2 M7 issue softened in wording but not resolved in substance (L5-4).

### Q5 — a conspicuously absent robustness check

Two:

- **Leave-one-HS2-out / jackknife by chapter.** The 29-line basket is concentrated in HS 84/85/90.
  Nothing shows the DiD γ, the Table-1 tenfold magnitude, or the 2022m5 monthly break survive
  dropping any one chapter. With n = 29 and "29 product lines" in the abstract, a JCE referee asks
  this routinely (L5-5).
- **Alternative surge thresholds.** The basket is fixed at ≥2×/≥2×. No ≥1.5× or ≥3× variant to show
  the basket membership and γ are not knife-edge on the 2× cut (L5-5).
- Minor: **COVID-2020 sits inside the pre-window** (2019–2021 monthly, 2018–2021 annual). If
  2020–21 trade was COVID-depressed, the post/pre *ratio* selection rule over-selects lines that
  merely recovered — a mean-reversion channel the unit+year FE absorb the level of but not the
  composition of. Not discussed (folded into L5-5 change-my-mind).
- Not flagging: alternative I-O vintage (two are now shown), seasonality in the monthly break (a
  single 2022m5 break with CI [2022m4–m6] and sup-F 561 is not plausibly seasonal).

### Q6 — does any robustness result weaken the headline, and is that disclosed in the main text?

The paper is now *generally very good* at this: the insignificant annual W+China break (sup-F 4),
the W+China DiD failing Holm, the Western-only DiD at p = 0.08, the mirror-gap null (γ = 0.54), and
the selection-permutation concession are all in the **main text**. The **one exception** is the
size-decile×year FE result: only the outbound survival is reported; the inbound halving
(2.10 → 1.28) is in `rq1_did_robustness.txt` and not in the paper (L5-2).

### Q7 — §10 Limitations: complete and honest?

Much improved — the round-2 mega-sentence is now a lead (two central limitations) plus five parallel
measurement caveats, and they are candid (over-determination, selection, the opposite-signed
placebo, mirror bias, single-margin assumption). Two live threats named elsewhere are **missing
from §10**: (a) the monthly identification series has a 2024 gap (KZ stopped reporting), so the
workhorse break test runs on 2019–2023 + 2025 — in §3, not §10; (b) the Armenia/Kyrgyz flows revert
to baseline by 2024–2025 while Kazakhstan's persist, so the neighbour "same shock" identification
holds for the 2022–2023 surge only — in §8, not §10 (L5-7).

---

## The one check whose absence most threatens this at R&R

**A leave-one-HS2-out / threshold-sensitivity pass on the 29-line basket**, paired with the
**by-tier unit-value wedge table**. Everything else on the list below is a citation, a one-line
disclosure, or a reframe. These two are missing analyses that a methods referee opening the
replication package will run themselves: the basket concentration is unaddressed, and the tier
medians (two tiers at ≈4×, 42% of flow) sit in a shipped output file directly contradicting "no
mass at the high multiples."

---

```
findings:
  - id: L5-1
    severity: MAJOR
    location: "§5.2, §1, §10, Abstract"
    finding: "The load-bearing retained-margin parameter m = 6–14% is asserted four times as 'the Kazakhstan national-accounts convention' with no citation; the headline VA of 5–11% is essentially m and the paper concedes the I-O step 'does little work'."
    evidence: "§5.2: 'We take m from the Kazakhstan national-accounts convention for trade, insurance and freight on goods trade, 6--14%.' No \\citep. Round-1 C3 and round-2 synthesis both required 'cited to a source.' rq2b_io_propagation.txt line 9: 'm taken instead from the KZ national-accounts trade+insurance+freight convention: 6-14%.'"
    change_my_mind: "Add a citation to the KZ Bureau of National Statistics SNA methodology / trade-transport-margin table, or a published estimate of Kazakh TTM margins on goods trade. If no citable source exists, say so and show sensitivity across a wider band (e.g. 4–20%) so the qualitative 'one-tenth of a produced dollar' is shown to survive."
  - id: L5-2
    severity: MAJOR
    location: "§4.3 (robustness paragraph)"
    finding: "The size-decile×year FE DiD — offered as what 'addresses' the significant opposite-signed placebo / size-composition threat — is reported only for the outcome it survives (outbound). The same control roughly halves the inbound DiD and pushes it to borderline, undisclosed."
    evidence: "§4.3: 'adding size-decile×year fixed effects … leaves γ = 2.29 (p = 0.003)'. rq1_did_robustness.txt (b): 'mirWC_usd: baseline gamma=2.099 (p=0.051) -> with size#year FE gamma=1.280 (p=0.052)'."
    change_my_mind: "Report the inbound size#year result next to the outbound one and state plainly that the inbound leg does not survive the size control — which is consistent with, and should be folded into, the existing 'inbound is product-level corroboration only' framing."
  - id: L5-3
    severity: MAJOR
    location: "Abstract"
    finding: "The abstract reports the DiD as 'a difference-in-differences against control lines, which nets out common shocks, leaves a roughly threefold increase' — an affirmative identification claim that §4.3 retracts ('magnitude is not separable from the selection … does not identify it on its own')."
    evidence: "Abstract lines 43–45 vs §4.3 lines 452–461 and rq1_did_robustness.txt (a): permuted-null γ mean 2.791 (sd 1.498), p(|perm| ≥ |obs|) = 0.576."
    change_my_mind: "In the abstract, either attach the caveat ('magnitude not separable from basket selection; identification rests on the 2022m5 break') or restructure the sentence to lead with the structural break and present the DiD threefold as corroboration."
  - id: L5-4
    severity: MAJOR
    location: "§5.1 (unit-value wedge)"
    finding: "By-tier heterogeneity of the wedge is promised terrain (the CHPL tiers are in the data) and unreported, and it runs against 'no sign of transformation': two tiers show ≈4× median f.o.b./f.o.b. wedges on ≈42% of matched gross outbound flow. Round-2 M7 was softened in wording ('no mass at the high multiples') but not resolved."
    evidence: "rq2a_unit_value_wedge.txt: tier 2 med_wedge 3.834 (gross $150.8m), tier 4A 3.936 (gross $67.4m), p75 = 4.399; total matched expRU $524.3m. §5.1: 'wide dispersion with no mass at the high multiples a mark-up would produce.'"
    change_my_mind: "Report the by-tier wedge table and explain why the ≈4× tiers are not a transformation margin (HS6 composition, a handful of cells, outbound invoicing), or drop the 'no mass at the high multiples' universal and rely on the value-weighted aggregate (<1) and the weight ratio (0.08) alone."
  - id: L5-5
    severity: MAJOR
    location: "§3 (product sets), §4 (magnitudes + DiD)"
    finding: "The 29-line basket is never stress-tested for concentration or for the 2× threshold choice. No leave-one-HS2-out / jackknife-by-chapter on γ, the Table-1 magnitudes or the 2022m5 monthly break; no alternative-threshold basket (1.5× / 3×). The permutation test addresses selection-on-outcome but not chapter concentration or knife-edge threshold sensitivity, and COVID-depressed 2020–21 in the ratio denominator is a live mean-reversion channel."
    evidence: "Basket = 29 HS6 concentrated in HS 84/85/90 (Table 1); selection rule ≥2×/≥2× with pre-window 2019–2021 (§3). No leave-one-out or threshold row in rq1_did_robustness.txt or rq1_robustness.txt."
    change_my_mind: "Add (a) a leave-one-HS2-out row giving the range of γ and of the tenfold magnitude across chapter drops, and (b) a threshold-sensitivity row (basket size and γ at 1.5× / 2× / 3×). If both are stable, this resolves."
  - id: L5-6
    severity: MINOR
    location: "§7 ('The transitory condition is observed, not assumed')"
    finding: "ρ is still argued primarily ex-post — the passage leads with the realised 2023-H2 decline; the ex-ante case (sanctions-contingent flows carry high σ / low expected ρ regardless of realised path) is secondary. A 2022 entrant could not condition on the 2023-H2 path."
    evidence: "§7: 'The surge-basket flow to Russia peaked in September 2022 and then fell by more than a third over the second half of 2023 … A firm observing this in real time saw the flow already receding.' EU Reg. 2023/1214 is cited but as corroboration of the realised decline."
    change_my_mind: "Lead with the ex-ante argument (policy-contingent by construction → high σ, low expected ρ) and present the realised 2023-H2 decline and the neighbour reversion as consistent-with, not proof-of."
  - id: L5-7
    severity: MINOR
    location: "§10 (Limitations)"
    finding: "§10 omits two live threats named elsewhere in the paper: (a) the monthly identification series has a 2024 gap (KZ stopped reporting to Comtrade), so the workhorse break test runs on 2019–2023 + 2025; (b) Armenia/Kyrgyz flows revert to baseline by 2024–2025 while Kazakhstan's persist, so the neighbour 'same shock' identification holds for the 2022–2023 surge only."
    evidence: "(a) §3 lines 300–302; not in §10. (b) §8 lines 794–798 ('the \"same shock\" claim holds for the 2022--2023 surge, not for its persistence'); not in §10."
    change_my_mind: "Add both to the §10 measurement-caveats list."
  - id: L5-8
    severity: MINOR
    location: "§5.2, §4.3"
    finding: "Two asserted mechanisms lack in-paper support: (i) §5.2's claim that 25% margin / 40% under-recording is 'an order of magnitude larger than the mirror-gap discrepancies typical in this literature' overstates (typical Fisman–Wei-type discrepancies are ~10–30%, so ~2–4×, not an order of magnitude); (ii) §4.3's 'the large consumer-goods lines contracted after 2022 as the tenge depreciation would predict' has no cite or evidence."
    evidence: "§5.2 lines 573–577; §4.3 lines 457–458."
    change_my_mind: "(i) soften to 'well outside the range typically found in mirror-gap studies'; (ii) add a one-line cite/figure for the tenge-depreciation channel or hedge to 'consistent with'."
```

```
scorecard:
  lens: "5. Robustness"
  critical: 0
  major: 5
  minor: 3
  score_out_of_10: 7
  one_line: "REVISE — all five round-2 robustness MAJORs are genuinely fixed and the DiD section is now candid about its own non-identification; what remains is an uncited headline parameter (6–14% m), one robustness check reported only where it passes (size×year FE on the inbound leg), an abstract sentence that still over-claims the DiD, and two heterogeneity/concentration checks (by-tier wedge, leave-one-HS2-out) a referee will demand. None fatal; trajectory strongly positive."
```
