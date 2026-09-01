# Lens 1 — Abstract audit (ROUND 3)

**Manuscript:** `Manuscript/corridor.tex` (982 lines)
**Date:** 2026-08-31
**Scope:** the abstract only (lines 36–60), cross-checked against §1–§10 (Setting → Discussion) and the appendix.
**Prior round:** `quality_reports/seven_pass_corridor/round2/lens_1_abstract.md` and `_SYNTHESIS_round2.md`.

---

## Round-2 carry-over: 4 of 6 findings resolved, 2 left partial, and the abstract was re-expanded

The round-2 abstract was ~245 words / 9 sentences. The round-3 abstract is **~330 words / 13 sentences** — it was rewritten and grew. On the six round-2 findings:

| R2 finding | R2 severity | R3 status |
|---|---|---|
| L1-1 flat investment null (no power / no over-determination hedge) | MAJOR | **RESOLVED.** Sentence 9 now reads "We find no investment response---though, with four post-2022 years, the data rule out a large response rather than a modest step-up, and the null is over-determined by contemporaneous shocks." Both §6-power and §2/§10-attribution hedges are now in the abstract. |
| L1-2 twin magnitudes "tenfold" / "3.5×" unsignposted in one sentence | MINOR | **RESOLVED.** Sentence 5 now signposts: "The raw increase is roughly tenfold; a difference-in-differences against control lines, which nets out common shocks, leaves a roughly threefold increase." (New residual on this sentence — see L1-1 below.) |
| L1-3 "built real capacity" / comparisons cleaner than body | MINOR | **MOSTLY RESOLVED.** "built real capacity" → "added assembly capacity" (exactly the R2 suggestion); "though neither is a clean test" added. Residual: the abstract still does not signal that the auto capacity "predates … the reorientation" (§6/§7) — see L1-3 below. |
| L1-4 undefined "sup-$F$ of 561" in the abstract | MINOR | **RESOLVED.** The statistic is gone; sentence 4 now reads "rise sharply and discontinuously in 2022m5." |
| L1-5 over-billed input–output step | MINOR | **RESOLVED.** The I-O propagation framing is dropped; sentence 8 states the margin (6–14%) and the 5–11% result directly. |
| L1-6 no explicit contribution sentence | MINOR | **PARTIAL.** Sentence 3 now carries "to our knowledge this is the first host-economy incidence analysis of the post-2022 rerouting" — a first-ness claim, but buried mid-sentence and not a standalone clause; the framework and multi-source-deal-data contributions still do not surface. See L1-6 below. |

**No new arithmetic error was introduced.** Every hard number in the round-3 abstract reconciles with the body (table below). The round-3 findings are calibration and presentation, plus one length regression.

## Numeric / claim cross-check (round-3 abstract vs body)

| Abstract claim (sentence) | Body support | Verdict |
|---|---|---|
| "In 29 product lines" (s4) | §3 "surge basket … 29 lines"; Table `tab:did` "Surge basket (29 HS6)" | match |
| "exports to Russia rise sharply and discontinuously in 2022m5" (s4) | §3.2 "breaks sharply in 2022m5 (Bai–Perron, 95% CI 2022m4–2022m6)" | match |
| "The raw increase is roughly tenfold" (s5) | §3.1 "\$7–17m per year in 2018–2021 … \$128m in 2022 … a rise of roughly an order of magnitude"; §3.2 event study "+2.4 asinh points (roughly a tenfold rise in level)" | supported |
| "a difference-in-differences … leaves a roughly threefold increase" (s5) | §1 "γ = 2.44 (about threefold in levels)"; Table `tab:did` note "surge basket 3.5× outbound (p=0.02)" | point estimate matches; **presentation drops the §3.3 selection caveat — see L1-1** |
| "Imports of the same goods rise in step, though … dominated by a large pre-existing flow from China" (s6) | §3.1 "inbound flow (West + China) ran near \$440m … roughly \$0.8–2.4bn after … that series is dominated by China" | China caveat matches; **significance of the inbound leg is not disclosed — see L1-2** |
| "no sign of domestic transformation" (s7) | §5.1 "the unit-value evidence shows no sign of transformation"; weight ratio 0.08; "no mass at the high multiples a mark-up would produce" | supported (R2 M7/M8 now fixed in body) |
| "retained trade-and-logistics margin, 6–14% by the national-accounts convention" (s8) | §5.2 "We take m from the Kazakhstan national-accounts convention … 6–14%" | match |
| "domestic value added of roughly 5–11 cents per dollar rerouted" (s8) | §5.2 "m v̄^TT ≈ 5–11%, midpoint about 8%" | match |
| "about three-quarters for a dollar of domestic manufacturing" (s8) | §5.2 "against 76%"; §1 "roughly three-quarters"; KZ BNS robustness v̄^M = 0.74 | match |
| "We find no investment response … data rule out a large response rather than a modest step-up … over-determined by contemporaneous shocks" (s9) | §6 "rule out a large response, not a modest one"; §2/§10 over-determination | match — R2 L1-1 fixed |
| "Deal-making in manufacturing, transport and logistics runs at its pre-2022 rate" (s10) | §6 "7.3 per year in 2015–2021 and 7.5 per year in 2022–2025 (Poisson rate ratio 1.03, 95% CI 0.63–1.65)" | match (abstract omits the wide CI; s9 hedge covers it) |
| "2022 is the weakest year in the series" (s10) | §1, §6 "2022 itself is the weakest year in the series" | match |
| "no transaction over 2015–2025 falls in the product lines the reorientation flows through" (s10) | §6, Table `tab:dealsource` "Surge-basket lines, 2015–25 … 0 / 0 / 0" + footnote (a) on two misclassified records | supported |
| "captive state capital abstained too" (s12) | §7, Table `tab:captive`: of 50 QIC/Baiterek projects 2022–25, one is in a surge-basket sector | supported (gated on the not-yet-public QIC register — KNOWN-PENDING; the body states the same, so no abstract-vs-body gap) |
| "the same institutions added assembly capacity for a durable auto-demand shock but none for the transitory one" (s12) | §6/§7: Changan/Haval/Chery ~90k units, KIA ~\$200m, Škoda; but "kit assembly with low domestic value added" that "predates and is largely independent of the reorientation" | overstated — **see L1-3** |
| "trade statistics move by an order of magnitude while the domestic economy barely registers it" (s13) | §10 "moved by an order of magnitude after 2022. The domestic economic content of that movement … is small" | match |

**Positive:** the R2/R1 "five databases" over-claim is fully absent — the abstract makes **no** claim that depends on the pending FactSet/Dealroom columns (KNOWN-PENDING). "Deal-making runs at its pre-2022 rate" is carried by the three databases already analysed.

---

## Findings (round 3)

### L1-1 (MAJOR) — Sentence 5 presents the DiD "roughly threefold" as a clean estimate that "nets out common shocks", with no hint of the selection-on-outcome problem that dominates §3.3

Abstract sentence 5: "a difference-in-differences against control lines, **which nets out common shocks**, leaves a roughly threefold increase." Sentences 4–5 also never say the 29-line basket is **selected on the post-period outcome**.

The body's own bottom line on the cross-sectional DiD is the opposite of "clean":

- §3.3, "Three qualifications" paragraph: "the placebo γ on those lines averages 2.8, **so the coefficient's magnitude is not separable from the selection**"; and "the cross-sectional difference-in-differences documents the outbound reorientation **but does not identify it on its own**; the structural breaks (Section 3.1) and the neighbour comparison below carry that weight."
- §10 measurement caveats: "the cross-sectional difference-in-differences should be read alongside the structural breaks and the neighbour comparison rather than on its own."
- §3 Product sets: "Because the basket is selected on the post-period outcome, we treat the priority list as a pre-specified alternative throughout and benchmark … against a selection-rule-matched permutation test."

So the abstract's headline "netting out common shocks leaves a roughly threefold increase" reads as the identified causal magnitude, when the body says (a) the magnitude is a selection artifact (permutation placebo γ ≈ 2.8 ≈ the observed 2.44) and (b) identification rests on the 2022m5 breaks and the neighbour comparison, not the DiD. This is the same "abstract flatter than body" pattern as round-2 C1, now concentrated on the DiD-magnitude sentence.

**Evidence:** abstract s5 "a difference-in-differences against control lines, which nets out common shocks, leaves a roughly threefold increase"; body §3.3 "the coefficient's magnitude is not separable from the selection" and "does not identify it on its own; the structural breaks … and the neighbour comparison … carry that weight."

**change_my_mind:** Reword so the abstract's identification claim rests where the body puts it — e.g. "exports to Russia rise sharply and discontinuously in 2022m5 (the same break in Armenia and the Kyrgyz Republic, with no comparable reform); a difference-in-differences against control lines is consistent with a roughly threefold increase, though basket selection inflates that magnitude." If the abstract stops attributing the threefold to a clean net-of-confounders DiD and points identification at the breaks/neighbours, drop to MINOR.

---

### L1-2 (MAJOR) — Sentence 6 "Imports of the same goods rise in step" implies the inbound leg co-moves on equal statistical footing; the body demotes it to product-level corroboration that fails multiple-testing correction

Abstract sentence 6: "**Imports of the same goods rise in step**, though the inbound series is dominated by a large pre-existing flow from China." The China caveat is new and welcome (round-2 M6). But "rise in step" still puts the inbound leg alongside the outbound surge, whereas the body is explicit that the inbound evidence is statistically weak in every headline specification:

- §3.2: "On the *annual* panel … the West + China inbound break is **not significant** (sup-$F$ of 4)."
- §3.3 / Table `tab:did`: inbound W+China DiD γ = 2.10, "$p = 0.05$, **not significant after Holm adjustment**"; Western component alone γ = 1.73, $p = 0.08$. The abstract's own outbound "threefold" **does** survive Holm ($p = 0.039$); the inbound leg it places "in step" does not.
- §10: "we … read the West + China inbound **only at the product level**, where line and year fixed effects absorb the China trend."

"Rise in step" tells the reader the inbound confirms the outbound; the body's position is that only the monthly Western component moves cleanly (factor ~2.3), while the headline W+China inbound break and DiD are insignificant.

**Evidence:** abstract s6 "Imports of the same goods rise in step"; body §3.2 "the West + China inbound break is not significant (sup-$F$ of 4)" and Table `tab:did` inbound γ = 2.10 "not significant after Holm adjustment".

**change_my_mind:** Qualify the co-movement to what the body supports — e.g. "the Western component of imports rises in step at the product and monthly level, though the annual inbound series is dominated by, and statistically swamped by, a large pre-existing flow from China." Then MINOR.

---

### L1-3 (MINOR) — Sentence 12 still implies the auto capacity was a response to the durable shock; the body says it "predates and is largely independent of the reorientation"

Round-2 L1-3 was mostly fixed ("added assembly capacity" replaced "built real capacity"; "neither is a clean test" added). Residual: "the same institutions **added assembly capacity for a durable auto-demand shock** but none for the transitory one" still asserts the capacity was drawn out by the shock. Body §6: "Kazakhstan is adding vehicle assembly … but this **predates and is largely independent of the reorientation**, is kit assembly with low domestic value added". §7: "much of the auto capacity predates the reorientation." The generic "neither is a clean test" does not disclose this specific concession.

**Evidence:** abstract s12 "the same institutions added assembly capacity for a durable auto-demand shock"; body §6 "this predates and is largely independent of the reorientation, is kit assembly with low domestic value added."

**change_my_mind:** Add "(much of it predating the shock)" or recast as a standing contrast in institutional capability rather than a shock response.

---

### L1-4 (MINOR) — First sentence is a premise, not the research question

Sentence 1 ("A large, sector-specific rise in demand … is expected to induce domestic investment…") is a theory hook. The phenomenon lands in sentence 2, the research question in sentence 3 ("We measure the shock …, estimate what Kazakhstan retains, and ask whether it induced investment"). Acceptable house style, but the question could lead; the rubric's "first sentence states the research question" is met only at sentence 3.

**Evidence:** abstract s1 vs s3.

---

### L1-5 (MINOR) — Method under-named on three items

Named well: product-level HS6 Comtrade (2018–2025), difference-in-differences against control lines, the national-accounts retained-margin convention, deal-count comparison. **Not named:** (a) that the 29-line surge basket is *defined from the data* on the post-period outcome (this is the paper's central methods caveat and appears nowhere in the abstract — related to L1-1); (b) the input–output propagation step (folded into "implies", which is defensible); (c) the multi-source deal data / cross-database check, which §1 lists as contribution (iii). Given KNOWN-PENDING (FactSet/Dealroom still "[To run]"), silence on (c) is the safe choice, but it leaves a stated contribution invisible.

**Evidence:** abstract names "difference-in-differences against control lines" and "the national-accounts convention" but not the data-driven basket definition or the cross-database check; §1 contribution (iii) "cross-checking the deal counts across databases rather than relying on one."

---

### L1-6 (MINOR) — No standalone contribution sentence; the first-ness claim is buried mid-sentence

Round-2 L1-6 partial. The abstract now contains "to our knowledge this is the first host-economy incidence analysis of the post-2022 rerouting" — but as a subordinate clause inside sentence 3, not a dedicated contribution statement, and §1's other two contributions (the three-gate decomposition as an organising device; the replicable multi-source measure) do not surface. For JCE/EER a one-sentence "we contribute X against the existing rerouting literature (which establishes that rerouting happened)" is expected.

**Evidence:** abstract s3 clause; §1 "Contribution" paragraph lists three, of which only (i) appears and only in passing.

---

### L1-7 (MINOR) — Length regression, and em-dash monotony

The round-2 abstract was ~245 words / 9 sentences (itself a round-1 fix from ~370). The round-3 rewrite is back up to **~330 words / 13 sentences** — comfortable for a full-length field journal, long for JCE (target ~200–250), and well over an *Economics Letters* limit (~100–150) if that is the outlet. Six of the 13 sentences use an em-dash (s1, s9, s11, s12 twice, s13); the paragraph reads as punctuation-monotone. Candidates to cut or merge: the three-gate list (s11) can fold into s9/s12; s13 restates s10/s9.

**Evidence:** abstract lines 36–60, 13 sentences; round-2 lens-1 report records "~245 words, 9 sentences".

**change_my_mind:** Trim to ~250 words; if the target is *Economics Letters*, a separate ~130-word abstract is needed.

---

## Structural rubric scorecard

| Criterion | Assessment |
|---|---|
| First sentence states the research question | Partial — premise in s1, phenomenon s2, question s3 (L1-4). |
| Names method / data / identification | Mostly — DiD vs control lines, HS6 Comtrade, national-accounts margin, deal counts. Not named: data-driven basket definition, I-O step, cross-database check (L1-5). |
| Quantifies the headline result | Yes — tenfold raw / threefold DiD; 5–11% vs ~76% value capture; deal rate 7.3→7.5/yr "at its pre-2022 rate"; zero surge-basket transactions. |
| One-sentence contribution | No standalone clause; first-ness buried in s3 (L1-6). |
| Every number cross-checks against §2–§10 | Yes — all reconcile; no arithmetic error. Calibration gaps only (L1-1, L1-2, L1-3). |
| Self-contained / no undefined jargon | Yes — "sup-$F$" removed; "HS6", "2022m5", "difference-in-differences" are fine for the target field. |
| Length / density | Regressed to ~330 words / 13 sentences; heavy em-dash use (L1-7). |
| Over-claims vs the hedged body | Two residual gaps: the DiD "threefold … nets out common shocks" omits the selection-on-outcome caveat that governs §3.3 (L1-1); "imports rise in step" hides that the inbound leg fails the annual break test and Holm adjustment (L1-2). The investment null and the gate comparisons are now honestly hedged (R2 L1-1 fixed). |

**Trajectory:** round-2's abstract fixes almost entirely held or were implemented verbatim — the flat investment null, the twin-magnitude sentence, "built real capacity", the bare sup-$F$, and the over-billed I-O step are all resolved. The round-3 rewrite reintroduced mild over-claim on the two quantitative headline legs (DiD magnitude, inbound co-movement) and let the word count creep back up. Net score holds at **7/10**: factually clean, honestly hedged on the null, two calibration MAJORs on the trade-reorientation numbers remain.

```
findings:
  - id: L1-1
    severity: MAJOR
    location: "abstract, sentence 5 vs §3.3 / §10"
    finding: "The DiD 'roughly threefold' is presented as a clean estimate that 'nets out common shocks', with no hint that the 29-line basket is selected on the post-period outcome and that the body says the DiD magnitude is a selection artifact and does not identify the reorientation on its own."
    evidence: "Abstract: 'a difference-in-differences against control lines, which nets out common shocks, leaves a roughly threefold increase.' Body §3.3: 'the placebo gamma on those lines averages 2.8, so the coefficient's magnitude is not separable from the selection' and 'the cross-sectional difference-in-differences documents the outbound reorientation but does not identify it on its own; the structural breaks ... and the neighbour comparison ... carry that weight.'"
    change_my_mind: "Reword so identification in the abstract rests on the 2022m5 break and the Armenia/Kyrgyz parallel (as §3.3/§10 do), and mark the DiD magnitude as inflated by basket selection. Then MINOR."
  - id: L1-2
    severity: MAJOR
    location: "abstract, sentence 6 vs §3.2 / Table tab:did / §10"
    finding: "'Imports of the same goods rise in step' puts the inbound leg on equal footing with the outbound surge; the body reports the annual West+China inbound break insignificant (sup-F 4), the inbound DiD not significant after Holm adjustment (gamma=2.10, p=0.05), the Western-only DiD insignificant (p=0.08), and reads the W+China inbound 'only at the product level'."
    evidence: "Abstract: 'Imports of the same goods rise in step, though the inbound series is dominated by a large pre-existing flow from China.' Body §3.2: 'the West + China inbound break is not significant (sup-F of 4)'. Table tab:did: inbound (W+China) gamma 2.10, note 'not significant after Holm adjustment'. §10: 'read the West + China inbound only at the product level'."
    change_my_mind: "Qualify to 'the Western component of imports rises in step at the product/monthly level, while the annual inbound series is statistically swamped by a large pre-existing China flow.' Then MINOR."
  - id: L1-3
    severity: MINOR
    location: "abstract, sentence 12 vs §6 / §7"
    finding: "'the same institutions added assembly capacity for a durable auto-demand shock' still implies the auto capacity was drawn out by the shock; the body says it 'predates and is largely independent of the reorientation' and is 'kit assembly with low domestic value added'."
    evidence: "Abstract s12; body §6 'this predates and is largely independent of the reorientation, is kit assembly with low domestic value added'; §7 'much of the auto capacity predates the reorientation'."
    change_my_mind: "Add '(much of it predating the shock)' or recast as a standing contrast in institutional capability rather than a shock response."
  - id: L1-4
    severity: MINOR
    location: "abstract, sentence 1"
    finding: "The first sentence is a theory premise, not the research question; the question arrives in sentence 3."
    evidence: "Abstract s1 'A large, sector-specific rise in demand for a tradeable good is expected to induce domestic investment'; s3 'We measure the shock ..., estimate what Kazakhstan retains, and ask whether it induced investment.'"
    change_my_mind: "Lead with, or move up, the question clause."
  - id: L1-5
    severity: MINOR
    location: "abstract, whole (method naming)"
    finding: "Three method elements are not named: that the surge basket is defined from the data on the post-period outcome, the input-output propagation step, and the multi-source / cross-database deal check (which §1 lists as contribution iii)."
    evidence: "Abstract names 'difference-in-differences against control lines' and 'the national-accounts convention' but not the data-driven basket definition or the cross-database check; §1 contribution (iii) 'cross-checking the deal counts across databases rather than relying on one.'"
    change_my_mind: "Name the selected-on-outcome basket (ties to L1-1) and, once FactSet/Dealroom are run, the cross-database check."
  - id: L1-6
    severity: MINOR
    location: "abstract, whole (contribution)"
    finding: "No standalone contribution sentence; the 'first host-economy incidence analysis' claim is a subordinate clause in sentence 3, and the framework and replicable-measure contributions do not surface."
    evidence: "Abstract s3 clause; §1 'Contribution' paragraph lists three, only (i) appears and only in passing."
    change_my_mind: "Add one sentence positioning the paper against Chupilkin et al. (who establish that rerouting happened) -- this paper measures what the intermediary keeps."
  - id: L1-7
    severity: MINOR
    location: "abstract, length"
    finding: "The abstract regressed from ~245 words / 9 sentences (round 2) to ~330 words / 13 sentences, with six em-dash sentences; long for JCE, over an Economics Letters limit."
    evidence: "Abstract lines 36-60, 13 sentences; round-2 lens-1 report records '~245 words, 9 sentences'. Em-dashes in s1, s9, s11, s12 (x2), s13."
    change_my_mind: "Trim to ~250 words (fold the three-gate list into s9/s12; drop the restatement in s13). If the target is Economics Letters, a separate ~130-word abstract is required."
```

```
scorecard:
  lens: "1. Abstract"
  critical: 0
  major: 2
  minor: 5
  score_out_of_10: 7
  one_line: "Round-2 abstract fixes held or were implemented verbatim; the rewrite reintroduced two calibration MAJORs on the trade numbers (DiD 'threefold' shown clean despite the selection-on-outcome caveat in §3.3; 'imports rise in step' hides that the inbound leg fails the annual break test and Holm adjustment) and let the word count creep back up -- factually clean, honestly hedged on the null, score holds at 7."
```
