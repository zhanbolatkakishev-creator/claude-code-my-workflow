# Methods Referee Report — Round 2 (R&R)

**Calibrated to:** Journal of Comparative Economics (JCE) · **Referee B** · **Disposition:** MEASUREMENT
**Paper type:** theory+empirics / descriptive hybrid
**Critical peeve:** how much of the headline is calibration?
**Constructive peeve:** credit a case that genuinely discriminates the three gates
**Date:** 2026-09-02 · **Paper:** `Manuscript/corridor.tex` (1,303 lines)
**Round-1 report:** `referee_methods.md` (64/100, Major) · **Audit consulted:** `reproducibility_audit_corridor.md` (PASS, 118 / 0 FAIL)

## Executive verdict

**Score: 76/100 — Minor revision. Both FATALs have cleared. E1 (calibration) and E2 (gate overclaim) do not return.**

Serious revision. The three claims flagged as stated more strongly than the evidence — value-capture headline,
"no transformation" reading, threefold DiD — are now at the strength the evidence supports, at every headline
surface; the low-ρ premise is replaced by a high-σ one with the contradicting annual series printed in the same
paragraph. §7's addition on the adjacent opportunities finds the one place in the case where a single gate
varies while the others hold and reports that it points *against* the paper's preferred gate.

What holds the score at 76: trimming was done surface by surface and not fully propagated (five sentences still
assert retracted versions), and the abstract's new sensitivity sentence is **arithmetically wrong in the
paper's favour** (New Concern A). Everything outstanding is a text fix; none requires re-estimation.

## Pre-scoring sanity checks — re-run

| Check | R1 | R2 | Note |
|---|---|---|---|
| Prediction sharpness | FAIL | **PARTIAL** | Framework restated as three necessary conditions with two out-of-sample sign predictions; §7 concedes "a single configuration … the three not separately identified." Screening-off unchanged in substance but no longer over-claimed. |
| Power — headline deal null | PASS | **PASS** | MDE ≈ 1.8×. |
| Power — surge-basket-line null | FAIL | **PASS** | §6: "we do not lean on this … the post-period zero carries little information on its own" + adjudication rule + inference routed to the sector-level rate test. |
| Construct validity — `m` | FAIL | **PASS (with erratum)** | Labelled a calibration in abstract/§1/§12; full sweep with four anchors and stated thresholds. Erratum = New Concern A. |
| Construct validity — "no weight gain" | FAIL | **PASS (qualified)** | §5.1 concedes verbatim; near-pure-transit fallback; abstract softened. Qualified by New Concern D and the unreported upper tail. |
| Honest reporting | PASS (strong) | **PASS (strong)** | Strengthened — full jackknife as a finding against the paper; Panel C prints p = 0.58; §7 reports evidence against its own preferred gate. |
| Construction / replication | PASS | **PASS** | Audit PASS; new outputs verified. Two small regressions (see Replication). |

**Composite is NOT capped at 70** — three of four R1 FAILs cleared, the fourth is PARTIAL (an intrinsic limit of a
single-configuration design; correct remedy is scoping, delivered). If the editor treats PARTIAL as FAIL the cap
binds at 70 and the recommendation is still Minor.

## Round-1 concerns — disposition

- **Concern 1 (= E1, FATAL) — RESOLVED, with erratum. E1 HAS CLEARED.** (c) verbatim in abstract/§1/§12;
  (a) delivered as prose not a figure — sweep across the full BNS bracket with the four anchors and the
  breakpoints (m ≈ 12% / 19% / 32% / 49%), reconciling to `rq2b_m_sensitivity`; figure request withdrawn;
  (d) honoured. (b) **partial** — BNS endpoints and `arvis2010landlocked` are external, but the "wholesale
  distributive margin of a few points" that carries `m` into the 6–14% band remains author judgement.
  *CMM (residual):* a wholesale-only distributive-margin number from the BNS resources table; `/verify-claims`
  on the now-load-bearing `arvis2010landlocked` "single-digit" claim (audit lists it UNMATCHED).
- **Concern 2 — PARTIAL (substantively resolved; two residuals).** Core concession made in the authors' words;
  abstract demoted to a null statement; near-pure-transit fallback honestly labelled. Residuals: the p75 = 0.49
  and the **11% of cells with weight ratio > 1.05 are unmentioned anywhere** (the only direct evidence *for*
  weight gain); the per-unit test is declined citing the extract, but the Comtrade API does return `qty`.
  *CMM:* report the >1.05 tail and the six transit cells' quartiles (0.26 / 0.94); state the quantity-coverage
  share; a threshold grid on the "flow-through near one" cut.
- **Concern 3 — RESOLVED.** Route (a) taken (the one ruled acceptable). "Threefold"/3.5× nowhere in abstract/§1;
  §1 states the coefficient with the caveat in the same sentence; Table 2 Panel C prints the rule-matched null.
  Residual (minor): §4.3 results sentence lists three favourable p-values with no adverse one, caveat ~25 lines
  later; Panel A still leads with the disclaimed row. *CMM:* append ", though see Panel C"; reorder Panel A or
  footnote the priority-list γ = 2.88 as the only uncontaminated DiD magnitude.
- **Concern 4 — RESOLVED (one un-propagated sentence).** §7 retitled; contradicting series printed in-text;
  high-σ reframing; Table 5 rows 1–2 recoded; §9 and §12 match. Residual: §1 l.148 still says "this transitory."
  *CMM:* "this transitory" → "this uncertain." One word.
- **Concern 5 (= E2, FATAL) — RESOLVED. E2 HAS CLEARED.** Trimmed to (a)+(b) at every headline surface in the
  ruled-for formulation; "suggestive that the irreversibility gate binds" gone from the abstract; §10's "adverse
  on the first two" survives only as a generic framework implication. Beyond compliance: §7 l.896–908 converts
  the round-1 counter-evidence into the case's one genuine single-gate-varying contrast, reported against the
  paper's own reading. §12's contemporaneous-manufacturing paragraph is a same-country closed-h contrast where
  investment followed — better evidence for claim (a) than anything in §7; **suggest promoting it into §7** as a
  fourth named within-country contrast (not a condition). Residual: §12 Limitation 1 still says "every gate is
  adverse" — inconsistent with the ρ retraction and with §7's "no gate clearly favourable."

## Minors roll-call

RESOLVED: 1 (inbound weaker stated), 2 (all seven jackknife values as a finding), 4 (cross-line dependence),
5 (annual sup-F dropped, HAC stated), 7 ($521m counterfactual), 8 (flow-through gap decomposed), 9 (CHPL tiers
footnote), 11 (fDi Markets / Orbis named), 12 (adjudication rule), 13 ("testable content" → three necessary
conditions).
PARTIAL: 3 (Panel B added but manuscript reports only the outbound 23%→3% zero share; audit has inbound 50%→22%
— add it), 6 (mirror bias signed for absorption but not the two downstream directions — understates the
flow-through ratio, inflates the inbound DiD), 10 ("even at v̄^M = 0.40" still present, now harmless but cut it).

## New concerns introduced by the revision

- **A — MAJOR (one-word fix). The abstract's sensitivity claim is arithmetically wrong, in the paper's favour.**
  Abstract l.54–55 and §1 l.128–129: headline "stays below one-fifth … for any margin **below a quarter**."
  With `ratio = 1.030·m`, m = 0.25 → ratio = 0.257 — *above* one-fifth. Correct threshold m ≈ 0.19, which §5.2
  itself states. Source of the error: §5.2 l.721 has a *different* one-fifth — "one-fifth of the **gross flow**"
  (m·0.787 = 0.20 → m ≈ 0.254) — imported into the produced-dollar sensitivity statement. §12 then gives a
  third figure ("a margin below roughly a fifth") while §5.2 defines the corridor reading as holding to m ≈ 12%.
  Three mutually inconsistent statements of the one number §5 now rests on; the abstract's is the most generous.
  *CMM:* abstract/§1 "below a quarter" → "below a fifth"; §12 restate as §5.2 does (one-tenth to m ≈ 12%,
  one-fifth at m ≈ 19%); §5.2 l.721 relabel 25% as "one-fifth *of the gross flow*." **Editor should verify personally.**
- **B — MAJOR in aggregate, trivial individually. Retracted claims survive in three un-propagated sentences.**
  (i) §1 l.148 "this transitory and policy-contingent"; (ii) §12 Limitation 1 "a single configuration in which
  every gate is adverse"; (iii) `fig:wedge` caption "the weight gain domestic transformation would produce."
  *CMM:* "this uncertain"; "the three gates are not separately identified"; a caption that drops the weight-gain reading.
- **C — MAJOR (logic). §5.2's closing sentence leans on evidence §5.1 has just disclaimed.** L.712–715: robust
  "unless the corridor captures a near-complete retail-inclusive markup, which the tonnage and pass-through
  evidence … rules out." §5.1 has withdrawn the tonnage statistic as a discriminator; and a retail-inclusive
  markup is a *value* fact tonnage cannot bear on. Cross-reference is also self-referential.
  *CMM:* delete the "which … rules out" clause or re-base it on the value-weighted aggregate wedge below one.
- **D — MODERATE (measurement hygiene). §5.1 labels a median as an aggregate; three flow-through ratios in one
  subsection.** 0.084 is the *median* of `kg_out/kg_in`; 0.106 is an *aggregate* value ratio — both called
  aggregates in one sentence. Reader meets 0.54, 0.15 and 0.11 on three bases with no signposting.
  *CMM:* report the two statistics on the same basis; footnote defining the three flow-through ratios.
- **E — MODERATE. §2 and §8 still assert `μ_P ≲ μ_T` from a null result.** §2 l.274 "measures the intermediation
  margin μ_T directly" — denied by §5.1 and §5.2; §8 completes the chain "not distinguishable in price or weight
  … with μ_P ≲ μ_T, building is dominated." Non-distinguishability is a null; it cannot establish an inequality.
  *CMM:* rest `μ_P ≲ μ_T` solely on the near-zero domestic base (~$230m) and the 0.69 multiplier (already in §10).
- **F — MINOR. Panel B makes the inbound leg look strong while three passages call it weak.** Both true (weak in
  asinh / under controls / after Holm; precise under size-weighted PPML). *CMM:* one clause at §4.3 l.512.
- **G — MINOR but conspicuous. Circular attribution of "quantitative weight."** §4.2 defers to the event study
  and DiD; §4.3 defers to the breaks and neighbour comparison. *CMM:* one sentence assigning roles explicitly —
  raw levels carry magnitude, monthly break carries timing, DiD carries sign vs control, neighbours carry the
  "not a domestic reform" inference, no estimate is a causal elasticity.

## Dimension scores

| Dimension | Weight | R1 | R2 | Weighted |
|---|---|---|---|---|
| Identification | 30 | 72 | 79 | 23.7 |
| Mechanism / framework discrimination | 25 | 58 | 76 | 19.0 |
| External validity / generalisation | 20 | 62 | 72 | 14.4 |
| Measurement / construct validity | 17 | 52 | 68 | 11.6 |
| Replication | 8 | 88 | 86 | 6.9 |
| **Composite** | | **64** | | **76** |

Not capped. Replication −2: Table 2 zero-share numbers come from ad-hoc R rather than a versioned script; the
load-bearing `arvis2010landlocked` anchor is UNMATCHED pending `/verify-claims`; the §7 institutional ruling-out
rests entirely on the not-yet-public `qicaifcifc2026pe`.

## Recommendation: **Minor revision.**

- **E1 — CLEARED** (conditional on the New Concern A arithmetic fix, which is a correction *within* the delivered
  sensitivity map, not a return of the concern).
- **E2 — CLEARED.** Neither FATAL returns; the reject trigger is not activated.

**Must-fix before acceptance (all text; none touches an estimate):** A (abstract "a quarter" → "a fifth", align
§12, relabel §5.2's 25% — editor verifies); B (three un-propagated retractions); C (§5.2 withdrawn-evidence
clause); E (`μ_P ≲ μ_T` chain in §2/§8); D (same-basis ratios + footnote); Concern 2 residual (>1.05 tail,
transit-cell quartiles, quantity-coverage share); minors 3, 6, 10, F, G; `/verify-claims` on
`arvis2010landlocked`; move the ad-hoc zero-share computation into the pipeline; honour the audit's circulation
gate on the QIC report.

**On the record:** the response printed the series that contradicted its own mechanism claim inside the paragraph
making that claim, and rebuilt a referee's counter-evidence into the paper's cleanest identification argument
against its own preferred gate. The remaining defects are failures to propagate a concession, not failures to
make one — one of them a single misplaced word. That is what a good R&R looks like.
