# Lens 1 — Abstract audit (ROUND 2)

**Manuscript:** `Manuscript/corridor.tex`
**Date:** 2026-08-31
**Scope:** the abstract only (lines 36–56), cross-checked against §1–§10.

---

## Round-1 carry-over: both prior abstract findings are resolved

- **R1 L1-1** ("five commercial databases" over-claim in the abstract) — FIXED. Abstract now
  reads "deal data from three commercial databases" (line 47), matching §4 ("Capital~IQ,
  PitchBook and Preqin") and the pending-FactSet/Dealroom language in App. A.
- **R1 L1-2** (abstract ~370 words, three 50–60-word sentences, nine-clause roadmap) — FIXED.
  Abstract is now ~245 words, nine sentences, no roadmap. Density is acceptable for a field
  journal; still slightly heavy for a general-interest outlet (see L1-4).

## Numeric cross-check (every hard number in the abstract)

| Abstract claim | Body support | Verdict |
|---|---|---|
| "29 product lines" | §1, §4 "surge basket ... 29 lines"; Table `tab:did` "Surge basket (29 HS6)" | ✅ match |
| "exports to Russia rose roughly tenfold" | §5.1: "\$7--17m per year in 2018--2021 ... \$128m in 2022 ... a rise of roughly an order of magnitude"; §5.2 event study "+3 asinh points (more than a tenfold rise in level)" | ✅ supported (128 / ~11 ≈ 11.6×) |
| "breaking in 2022m5 (sup-$F$ of 561)" | §5.2: "breaks sharply in 2022m5 (Bai--Perron, 95\% CI 2022m4--2022m6; sup-$F$ of 561)"; §1 "outbound sup-$F$ of 561" | ✅ match |
| "imports of the same goods rose too" | §5.1 inbound "near \$440m ... roughly \$0.8--2.4bn after"; §5.3 KZ-reported imports DiD γ = 1.88 (p = 0.004) | ✅ supported |
| "difference-in-differences ... outbound increase at about $3.5\times$" | §5.3: "a Poisson specification in levels puts the increase at $3.5\times$ (p = 0.02)"; §1 "$\gamma = 2.44$ ($3.5\times$ in levels)"; `tab:did` note | ✅ supported (see L1-2 re: presentation) |
| "domestic value added of about a tenth of a dollar per dollar rerouted (5--9\%)" | §5.2: "$m\,\bar v^{TT} \approx$ 5--9\%, midpoint about 8\%" | ✅ supported |
| "against roughly three-quarters for a dollar of domestic manufacturing" | §5.2: "against 76\% per dollar of domestic manufacturing output"; $\bar v^{M} = 0.76$ | ✅ match |
| "runs at the same rate after 2022 as before" | §7: "7.3 per year in 2015--2021 and 7.5 per year in 2022--2025 (Poisson rate ratio 1.03, 95\% CI 0.63--1.65)" | ⚠️ point estimate matches; CI is wide (see L1-1) |
| "2022 is the weakest year" | §1 and §7: "2022 itself is the weakest year in the series" | ✅ match |
| "no transaction over 2015--2025 falls in the product lines the reorientation flows through" | §7: "across the whole 2015--2025 window the data contain no transaction in the specific product lines"; `tab:dealsource` row "Surge-basket lines ... 0 / 0 / 0" + footnote (a) on two misclassified records | ✅ supported |
| "captive state capital also abstained" | §6: "of the state fund's 50 industrial and logistics projects financed in 2022--2025, one is in a surge-basket sector"; `tab:captive` | ✅ supported (but heavily caveated in body — see L1-3) |
| "built real capacity for a durable auto-demand shock" | §6: Changan/Haval/Chery ~90k units, KIA ~\$200m, Škoda assembly, car-multimedia plant | ⚠️ body also calls this "kit assembly with low domestic value added" that "predates ... the reorientation" (see L1-3) |

**No abstract number is unsupported by the revised body.** Every quantitative claim the rubric
flagged ("tenfold", "sup-F of 561", "3.5×", "5–9%", "three-quarters", "weakest year", "no
transaction 2015–2025") reconciles. The findings below are about *calibration of certainty*
and *presentation*, not arithmetic.

---

## Findings

### L1-1 (MAJOR) — The investment null is stated flatly; the body says the test only rules out a *large* response and the null is over-determined

The abstract asserts the null without any of the two hedges the body now carries:

- **Sentence 6:** "And there is no investment response: ... dealmaking ... runs at the same
  rate after 2022 as before ...".
- **Sentence 9:** "Kazakhstan operates as a corridor, not a factory---the trade statistics
  move by an order of magnitude, the domestic economy barely registers it."

The body is materially more cautious on both the *power* and the *attribution* of this null:

- Power: §7, line 560–561 — "with only four post-2022 years, the deal-count test can rule out
  a large response, not a modest one"; line 567–568 — "The test has 80\% power only against an
  increase of roughly 80\% or more, so it excludes a surge in dealmaking but not a modest
  step-up." The 95% CI on the rate ratio is 0.63–1.65, and dropping 2022 gives 9.0/yr vs
  7.3/yr (rate ratio 1.24).
- Attribution: §2, line 189–191 — the null is "*over*-determined rather than fragile, but
  they also mean we cannot cleanly attribute it to the trade shock alone" (the Jan-2022
  unrest, secondary-sanctions exposure, and the nationalisation wave); §10, line 882–884 —
  "we can bound its magnitude ... but not attribute it to the trade shock alone."

"There is no investment response" + "barely registers it" + "not a factory" reads as an
established causal finding. The rubric explicitly asks whether "corridor not factory" is used
"as if proven" — here it is. A referee who reads §7 and §2 will mark the abstract as
over-claiming.

**Evidence:** abstract "And there is no investment response" / "the domestic economy barely
registers it"; body "the deal-count test can rule out a large response, not a modest one" and
"we cannot cleanly attribute it to the trade shock alone."

**change_my_mind:** Add one clause of hedging that the body already supplies — e.g. "we detect
no investment response (the design rules out a large one, not a modest step-up), and the null
is over-determined by contemporaneous shocks" — or soften "no investment response" to "no
*detectable* investment response". If sentence 6 and sentence 9 are brought into line with
§7/§2, downgrade to MINOR.

---

### L1-2 (MINOR) — Sentence 4 reports two different magnitudes for the same quantity without signposting

"In 29 product lines exports to Russia rose **roughly tenfold** ... a difference-in-differences
against control lines puts the outbound increase at **about $3.5\times$**." Both numbers
describe the post-2022 rise in surge-basket exports to Russia. The body reconciles them (the
raw rise is unconditional; the DiD nets out common shocks / control-line movements —
§5.3), but the abstract places "tenfold" and "3.5×" in a single sentence with only the phrase
"against control lines" to explain a ~3× discrepancy. A reader not steeped in DiD will read
this as internally inconsistent. Additionally, the "3.5×" is specifically the **Poisson
levels** specification (§5.3 line 435; `tab:did` note), not the headline asinh DiD
(γ = 2.44) — the abstract's "a difference-in-differences ... puts the outbound increase at
about 3.5×" is defensible but compresses two estimators into one clause.

**Evidence:** abstract sentence 4; body §5.3 "exports to Russia rise by $\gamma = 2.44$ ... a
Poisson specification in levels puts the increase at $3.5\times$".

---

### L1-3 (MINOR) — Sentence 8 presents both within-country comparisons more cleanly than the body allows

"Two within-country comparisons point to the irreversibility gate: captive state capital also
abstained, and the same institutions built **real capacity** for a *durable* auto-demand shock
but none for the transitory one."

Both halves are hedged in the body in ways the abstract drops:

- Captive capital: §6, line 649–656 — "Two caveats keep it from being decisive. QIC allocates
  under statutory sectoral programmes ... its silence in component manufacturing is partly a
  mandate artefact; and a state-owned vehicle is precisely the actor most exposed to
  secondary-sanctions ... so its abstention is also consistent with a compliance constraint
  rather than an irreversibility one."
- Durable-shock comparison: §6, line 691–701 — "We treat this as illustrative rather than as a
  controlled test, for three reasons"; the auto capacity "predates" the shock; "it is not a
  clean $\rho$ experiment." §7, line 622–624 — the vehicle assembly "is kit assembly with low
  domestic value added". So "built real capacity" overstates: the body's own characterisation
  is low-value-added kit assembly that predates the reorientation.

The abstract's verb "point to" is itself adequately hedged; the problem is "real capacity" and
the omission of any signal that neither comparison is clean.

**Evidence:** abstract "the same institutions built real capacity for a durable auto-demand
shock"; body "is kit assembly with low domestic value added" and "We treat this as
illustrative rather than as a controlled test".

**change_my_mind:** Replace "built real capacity" with "added assembly capacity" and add
"(neither comparison is a clean experiment)" or similar. Then MINOR → drop.

---

### L1-4 (MINOR) — Undefined statistic "sup-$F$ of 561" in the abstract, with no scale and a body caveat against reading it as effect size

Sentence 4 puts "(sup-$F$ of 561)" in the abstract. "sup-$F$" is undefined; a general reader
has no reference scale, and "561" reads as an enormous effect. The body itself warns against
that reading: §5.2, line 384–385 — "The sup-$F$ statistics come from a mean-shift test on a
persistent series and are evidence of a break, not a cardinal measure of its size." Round-1
M6 flagged the same over-reading risk in the body. Carrying the bare number into the abstract
imports the problem into the paper's most-read paragraph.

**Evidence:** abstract "breaking in 2022m5 (sup-$F$ of 561)"; body "evidence of a break, not
a cardinal measure of its size."

**Suggested fix:** "breaking sharply and precisely in 2022m5" — drop the statistic, or keep
only "a structural break in 2022m5 (95% CI 2022m4–m6)".

---

### L1-5 (MINOR) — Sentence 5 over-bills the input–output step

"Kazakhstan re-exports these goods with no more than a trade-and-logistics margin:
**propagated through the input--output table**, the retained margin implies domestic value
added of about a tenth of a dollar per dollar rerouted (5--9\%) ...". The phrasing makes the
I-O propagation sound analytically load-bearing. The body says the opposite: §5.2, line
528–531 — "$\bar v^{TT} = 0.79$ and $\bar v^{M} = 0.76$---close enough that the propagation
step does little work here: the result is essentially the retained margin $m$ against the full
domestic value $\bar v^{M}$". Round-1 M2 made the same point (the Leontief step cancels; 8% ≈
m × 1.03). The 5–9% headline is essentially the assumed 6–12% trade margin times ~0.8.

**Evidence:** abstract "propagated through the input--output table, the retained margin
implies ..."; body "the propagation step does little work here".

**Suggested fix:** "the retained trade-and-logistics margin (bounded at 6–12%) implies
domestic value added of 5–9% per dollar rerouted, against ~76% for a dollar of domestic
manufacturing." Drop the I-O framing from the abstract, or keep it to one neutral phrase.

---

### L1-6 (MINOR) — No explicit contribution sentence

The abstract states the phenomenon (s1–s2), what the paper does (s3), the results (s4–s6), the
interpretive frame (s7–s8), and a conclusion (s9). It never states the contribution. §1's
"Contribution" paragraph leads with "to our knowledge it is the first host-economy incidence
analysis of the post-2022 trade rerouting ... extending the existing literature ... to what
the intermediary retains, and to 2025" — none of that novelty positioning surfaces in the
abstract. For a general-interest or top field outlet, one clause locating the contribution
against \citet{chupilkin2026roundabout}/\citet{chupilkin2025intermediated} (who establish that
rerouting happened) is expected.

**Evidence:** abstract has no "we are the first / this paper contributes" clause; §1
"to our knowledge it is the first host-economy incidence analysis of the post-2022 trade
rerouting".

---

## Structural rubric scorecard

| Criterion | Assessment |
|---|---|
| First sentence states question / phenomenon | Partial — s1 is a theory hook ("is expected to induce domestic investment"); the phenomenon lands in s2, the research question in s3. Acceptable, not ideal. |
| Names method / data / identification | Yes — HS6 Comtrade 2018–2025, DiD vs control lines, OECD ICIO input–output table, deal data from three commercial databases. |
| Quantifies headline result | Yes — tenfold, 3.5×, 5–9%, ~three-quarters, "same rate", zero surge-basket transactions. |
| One-sentence contribution | No (L1-6). |
| Every number cross-checks against §2–§10 | Yes — all supported (see table). Calibration issues only (L1-1, L1-3). |
| Self-contained / no undefined jargon | Mostly — "HS6", "2022m5", "difference-in-differences" fine for field econ; "sup-$F$ of 561" is undefined and mis-scaleable (L1-4). |
| Length / density | ~245 words, 9 sentences — fixed since round 1; fine for a field journal, dense-but-tolerable for general-interest. |
| Over-claims vs the hedged body | Yes — "there is no investment response" / "barely registers it" / "corridor, not a factory" outrun §7's power limits and §2/§10's attribution caveats (L1-1); "real capacity" outruns §6/§7 (L1-3). |

The abstract is factually clean and much improved since round 1 (word count and the
five-databases claim both fixed). The remaining work is tone calibration: one MAJOR (the flat
investment null) and a set of MINORs (twin magnitudes in s4, "real capacity", the bare sup-F,
the over-billed I-O step, the missing contribution clause).

```
findings:
  - id: L1-1
    severity: MAJOR
    location: "Abstract, sentences 6 and 9"
    issue: "The investment null is asserted flatly ('And there is no investment response'; 'the domestic economy barely registers it'; 'a corridor, not a factory') with none of the two hedges the revised body now carries: the deal-count test's low power, and the over-determination of the null by contemporaneous shocks."
    evidence: "Abstract: 'And there is no investment response ... runs at the same rate after 2022 as before' and 'Kazakhstan operates as a corridor, not a factory---the trade statistics move by an order of magnitude, the domestic economy barely registers it.' Body §7: 'with only four post-2022 years, the deal-count test can rule out a large response, not a modest one' and 'The test has 80% power only against an increase of roughly 80% or more.' Body §2/§10: the null is 'over-determined rather than fragile, but they also mean we cannot cleanly attribute it to the trade shock alone.'"
    change_my_mind: "Insert one hedging clause the body already supports (e.g. 'no detectable investment response --- the design rules out a large one, not a modest step-up --- and the null is over-determined by contemporaneous shocks'). If sentences 6 and 9 are aligned with §7 and §2, this drops to MINOR."
  - id: L1-2
    severity: MINOR
    location: "Abstract, sentence 4"
    issue: "Two different magnitudes for the same quantity (post-2022 rise in surge-basket exports to Russia) appear in one sentence --- 'roughly tenfold' and 'about 3.5x' --- with only 'against control lines' to explain the ~3x gap, and the 3.5x is specifically the Poisson-levels spec, not the headline asinh DiD (gamma = 2.44)."
    evidence: "Abstract: 'exports to Russia rose roughly tenfold ... a difference-in-differences against control lines puts the outbound increase at about 3.5x.' Body §5.3: 'exports to Russia rise by gamma = 2.44 ... a Poisson specification in levels puts the increase at 3.5x.'"
    change_my_mind: "Signpost the contrast ('the raw rise is roughly tenfold; netting out common shocks via difference-in-differences leaves about 3.5x') or drop one of the two figures from the abstract."
  - id: L1-3
    severity: MINOR
    location: "Abstract, sentence 8"
    issue: "'built real capacity for a durable auto-demand shock' overstates relative to the body, which calls the auto capacity 'kit assembly with low domestic value added' that 'predates and is largely independent of the reorientation', and treats both within-country comparisons as 'illustrative rather than ... a controlled test'."
    evidence: "Abstract: 'the same institutions built real capacity for a durable auto-demand shock but none for the transitory one.' Body §7: 'is kit assembly with low domestic value added'. Body §6: 'We treat this as illustrative rather than as a controlled test' and 'Two caveats keep it from being decisive' (for the captive-capital comparison)."
    change_my_mind: "Replace 'built real capacity' with 'added assembly capacity' and add a parenthetical that neither comparison is a clean experiment."
  - id: L1-4
    severity: MINOR
    location: "Abstract, sentence 4"
    issue: "'sup-$F$ of 561' is undefined jargon with no reference scale in the abstract, and the body explicitly warns it is 'not a cardinal measure of its size'."
    evidence: "Abstract: 'breaking in 2022m5 (sup-$F$ of 561)'. Body §5.2: 'The sup-$F$ statistics come from a mean-shift test on a persistent series and are evidence of a break, not a cardinal measure of its size.'"
    change_my_mind: "Drop the statistic or replace with 'a structural break in 2022m5 (95% CI 2022m4--m6)'."
  - id: L1-5
    severity: MINOR
    location: "Abstract, sentence 5"
    issue: "'propagated through the input--output table, the retained margin implies ...' bills the I-O step as analytically load-bearing, but §5.2 says it 'does little work here' because v^TT (0.79) and v^M (0.76) are near-identical."
    evidence: "Abstract: 'propagated through the input--output table, the retained margin implies domestic value added of about a tenth of a dollar per dollar rerouted (5--9%).' Body §5.2: 'close enough that the propagation step does little work here: the result is essentially the retained margin m against the full domestic value v^M'."
    change_my_mind: "State the retained margin bound (6--12%) and the 5--9% result directly without foregrounding the input--output propagation."
  - id: L1-6
    severity: MINOR
    location: "Abstract, whole"
    issue: "No explicit contribution / novelty sentence; the abstract never positions the paper against the existing rerouting literature the way §1's Contribution paragraph does ('the first host-economy incidence analysis of the post-2022 trade rerouting ... to what the intermediary retains, and to 2025')."
    evidence: "Abstract contains no 'we are the first' / 'this paper contributes' clause. §1: 'to our knowledge it is the first host-economy incidence analysis of the post-2022 trade rerouting, extending the existing literature ... to what the intermediary retains, and to 2025.'"
    change_my_mind: "Add one clause locating the contribution relative to Chupilkin et al. (who establish that rerouting happened) --- this paper measures what the intermediary keeps."
scorecard:
  lens: "1. Abstract"
  critical: 0
  major: 1
  minor: 5
  score_out_of_10: 7
```
