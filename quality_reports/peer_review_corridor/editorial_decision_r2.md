# Editorial Decision — "Corridor, Not Factory" — ROUND 2 (R&R)

**Journal:** Journal of Comparative Economics (JCE) · **Manuscript:** `Manuscript/corridor.tex` (~1,303 lines)
**Handling editor:** `/review-paper --peer JCE`, round 2 · **Date:** 2026-09-02
**Round-1 decision:** Major revision (R&R) — 2 FATAL + 4 ADDRESSABLE + 22 secondary. Rule stated: *"If either FATAL returns unchanged in R2, the paper is a reject."*
**Round-2 referees:** A (domain, POLICY) **76.7 / 100 — Minor revision**; B (methods, MEASUREMENT) **76 / 100 — Minor revision**.
**Cross-artifact / reproducibility:** PASS (`reproducibility_audit_corridor.md` — 118 PASS / 0 FAIL).

## Decision: **MINOR REVISION** — accept in principle

The revision is not sent back to referees. It will be checked by the editor against the must-fix list below.
Both round-1 FATALs are **cleared**, on the independent judgement of both referees; the reject trigger is not
activated. What remains is a list of text corrections — one of them an arithmetic erratum in the abstract that
both referees caught independently, the rest failures to propagate a concession the paper has already made
elsewhere. Nothing outstanding requires re-estimation, new data, or a further referee round.

## FATAL rulings (both referees, explicit)

### E1 — value-capture headline is a calibration with no sensitivity map → **CLEARED**

Both referees rule it cleared. The headline is labelled "a band we choose rather than estimate" in the abstract,
§1 and §12; §5.2 sweeps the full BNS bracket (m ∈ [1%, 49%]) with the four requested anchors and states the
margin at which each qualitative reading breaks (one-tenth to m ≈ 12%, one-fifth at m ≈ 19%, one-third at
m ≈ 32%, parity at m ≈ 49%), reconciling to `rq2b_m_sensitivity`. Referee B withdrew its demand for a *figure*
(the prose carries the same information). Residual, non-blocking: the wholesale-distributive-margin component
that carries `m` into the 6–14% band is still author judgement, and the now-load-bearing `arvis2010landlocked`
c.i.f./f.o.b. anchor is UNMATCHED in the audit.

**Conditional on the abstract arithmetic fix (ADDRESSABLE-1 below), which is a correction _inside_ the delivered
sensitivity map, not a return of the concern.**

### E2 — gate claim overstated ("suggestive that the irreversibility gate binds") → **CLEARED**

Both referees rule it cleared. The claim is trimmed to (a) an open market-access gate + (b) capital-market
institutions ruled out as the binding constraint for this null, at every headline surface, with "whether
irreversibility independently binds cannot be settled here" in the abstract. Beyond compliance, §7 now confronts
the round-1 counter-evidence (the logistics-platform opportunities have an open irreversibility gate and also go
unfunded) and rebuilds it into the case's one genuine single-gate-varying contrast — reported *against* the
paper's own preferred reading. Referee B calls this "the strongest mechanism paragraph in the paper."

## Editor's independent check of the arithmetic erratum

Referee B asked the editor to verify this personally. Done: with `ratio_to_produced = 1.030·m` (reproducibility
audit, PASS), a margin of **m = 0.25** ("a quarter") gives a ratio of **0.257 — above one-fifth**, not below it.
The abstract (l.54–55) and §1 (l.128–129) therefore mis-state the paper's own sensitivity result, in the
direction of overstating robustness. The correct threshold is m ≈ 0.19, which §5.2 itself gives. §12 states a
third, loosely-worded version ("a margin below roughly a fifth") while §5.2 defines the "corridor, not factory"
reading as holding to m ≈ 12%. **This is a real erratum and gates acceptance**, but it is a one-word fix plus
two alignment edits.

## Referee convergence

Two referees drawn with non-overlapping priors and peeves (POLICY vs MEASUREMENT), blind to each other, landed
**0.7 points apart** (76.7 / 76.0), at the **same verdict** (Minor revision), and **independently identified the
same single arithmetic error** in the abstract as their one must-fix numerical item. Referee A: "every remaining
item is a sentence, a paragraph, a verb, or a tabulation from data already in hand." Referee B: "the remaining
defects are all failures to propagate a concession, not failures to make one … That is what a good R&R looks
like." The one substantive divergence (below) is narrow and the editor resolves it.

## Must-fix before acceptance — ADDRESSABLE (editor will check each)

1. **Abstract arithmetic erratum** (A: NEW-1; B: New Concern A). In the abstract and §1, change *"any margin
   below a quarter"* → *"any margin below a fifth."* In §12, restate the threshold as §5.2 does (one-tenth
   reading to m ≈ 12%; one-fifth at m ≈ 19%). In §5.2, relabel the "about 25%" figure as *"one-fifth **of the
   gross flow**"* so the two one-fifths (produced-dollar vs gross-flow) cannot be conflated again. **Editor
   verifies this fix directly.**

2. **Propagate the retractions** (B: New Concern B; A: NEW-5). Three sentences still assert pre-revision claims:
   (i) §1 l.148 "does anyone build for a shock this **transitory**" → "this **uncertain**"; (ii) §12 Limitation 1
   "a single configuration in which **every gate is adverse**" → "a single configuration on which the three
   gates are not separately identified" (consistent with the ρ retraction and §7's own "no gate clearly
   favourable"); (iii) the `fig:wedge` caption still invokes "the weight gain domestic transformation would
   produce" — the reading §5.1 has disclaimed.

3. **The verb "rules out"** (A: NEW-2; B: accepts the qualified form). Editor ruling: the full formulation
   *"rules out capital-market institutions **as the binding constraint for this null**"* is the language
   Referee B ruled for in round 1 and **stands**. But every bare-shorthand instance ("rules out the
   institutional gate", without the "as the binding constraint for this null" qualifier) must be brought into
   line with the full form — including in the abstract and the contribution list. This satisfies both referees
   and does not require softening to "provides no support for."

4. **§5.2's closing robustness sentence leans on disclaimed evidence** (B: New Concern C). Delete the clause
   "which the tonnage and pass-through evidence in Section~\ref{sec:capture} rules out," or re-base it on the
   value-weighted aggregate wedge below one (noting that is attributed to under-invoicing, so suggestive not
   dispositive). Fix the self-referential `\ref{sec:capture}` inside §5.2.

5. **`μ_P ≲ μ_T` asserted from a null result** (B: New Concern E). §2 l.274 ("measures the intermediation
   margin μ_T directly") and §8 l.834–836 ("not distinguishable in price or weight … with μ_P ≲ μ_T, building
   is dominated") — non-distinguishability is a null and cannot establish an inequality. Rest the corollary on
   the near-zero domestic base (~$230m electronics output) and the 0.69 value-added multiplier, both already in
   §10 and untouched by this round's concessions.

6. **§5.1 measurement hygiene** (B: New Concern D). One sentence compares a *median* (kg_out/kg_in = 0.084) to
   an *aggregate* (value flow-through = 0.106) and calls both "aggregate." Report the pair on the same basis
   (median vs median and aggregate vs aggregate — both are in the audit outputs), and add a one-line footnote
   defining the three flow-through ratios that appear in §5.1 (0.54 incremental-Western; 0.15 level-West+China;
   0.11 matched-cell) by sample and basis.

## Recommended (response-letter; editor-checked; not gating) — TASTE

- **Armenian GFCF** (A: C5 residual). A short paragraph decomposing the +3pp by asset type/sector (construction
  and the 2022 migration inflow vs tradeable-goods capacity) would likely vindicate the paper; public
  Armstat/WDI series. If not run, state plainly that the counter-evidence stands unexplained.
- **§11.2** (A: C2 residual). Put both sides of the corridor comparison in one unit (Mt or $bn); cite the
  Panama/Red Sea/Hormuz disruptions once; give the Caspian/break-of-gauge ceiling as a number; delete the §2
  duplication of the chokepoint sentence.
- **Exit-route count** (A: C3). Replace/supplement the `qicaifcifc2026pe` cite for "no functioning exit,
  buy-back the leading route" with a route-level tabulation (n trade sales / listings / buy-backs, 2015–25)
  from the 493-deal extract already in hand. Cheap; converts the weakest-sourced load-bearing claim to own
  evidence.
- **Vietnam/Mexico** (A: C4). One clause — label as motivating illustration, or cite the USMCA RVC threshold +
  one greenfield/FDI figure per country. Not both. Do not leave "which is the pattern the framework predicts"
  on an unevidenced sentence.
- **§10 / `tab:priority`** (A: C6 residual). Reconcile caption ("combined score") with body text ("we read them
  jointly rather than collapsing them into a single index"); concede the table orders by gross domestic value
  added per dollar of output, not rate of return; "highest-return use of investment" → "highest
  domestic-value-added use."
- **EAEU literature** (A: C7 residual). 2–3 sentences in §2 or §3 on what the integration literature
  (Isakova–Koczan–Plekhanov, Tarr, Vinokurov) established about trade diversion and the common external tariff,
  and what the open-market-access-gate mechanism adds.
- **§11.1 instrument–gate mismatch** (A: NEW-3). Two sentences distinguishing the onward-trade segment (h
  cannot be closed unilaterally) from the domestic-demand segment (procurement / local content do close h, as
  §12's own new paragraph documents), and stating the surviving instruments act on I and σ.
- **Türkiye and the continuum of h** (A: NEW-4). One paragraph in §9: h is a continuum; a customs border raises
  the cost of the traded path without requiring transformation; the Türkiye flow (3.6× rise across a border)
  bounds how much of Kazakhstan's null the union itself explains.
- **Weight-distribution upper tail** (B: Concern 2 residual). Report the 11% of cells with weight ratio > 1.05
  and the p25/p75 of the six transit cells (0.26 / 0.94); state the share of surge-basket cells with a usable
  Comtrade quantity unit; a threshold grid on the "flow-through near one" cut.
- **Minors** (B): add the inbound zero-share pair (50% → 22%) to §4.2; sign the two downstream mirror-bias
  directions (understates flow-through ratio; inflates inbound DiD); cut §5.2's "even at v̄^M = 0.40" clause;
  reconcile Panel B's `***` inbound with the "weaker leg" language (one clause); replace the circular
  "quantitative weight" cross-attribution with an explicit role assignment.
- **§12 contemporaneous-manufacturing paragraph** (A: NEW-5). Drop `eaeu2014treaty` from the §12 cite (it does
  not support "Kazakhstan imposing mandated local content" — `kzgov2026domprod` does); carry §8's auto-comparison
  caveats forward or label the paragraph a forward-looking reading of out-of-sample data. Referee B's suggestion
  (optional): promote this paragraph into §7 as a fourth named within-country contrast — it is the paper's
  cleanest closed-h gate variation.
- **Replication housekeeping** (B): `/verify-claims` on the now-load-bearing `arvis2010landlocked` "single-digit
  c.i.f./f.o.b." claim (audit lists it UNMATCHED); move the Table 2 zero-share computation from ad-hoc R into a
  versioned pipeline script; honour the audit's circulation gate on `qicaifcifc2026pe` (not yet public).

## Do not change

The population statement in §9 (both referees single it out as a model of how to bound external validity); the
§7 adjacent-opportunities contrast that reports against the paper's own preferred gate; the printed annual
series inside the §7 paragraph that contradicts the mechanism claim; the rule-matched permutation in Table 2
Panel C with its unfavourable p = 0.58; the full leave-one-HS2-out jackknife reported as a finding; the "6–14%,
a band we choose rather than estimate" formulation; the deal-null MDE and "over-determined, not fragile"
framing; the refusal to read sup-F cardinally; the three-database deal cross-check; eq. (2) as an organising
device; the conflict-of-interest footnote; the measured-vs-asserted register throughout — now extended to the
four trimmed claims.

## Hallucination gate: PASS

Every ADDRESSABLE and TASTE item traces to a specific referee finding (A's or B's, cited inline). The only item
the editor acted on directly — verifying the abstract arithmetic — was raised by **both** referees; the editor's
role was confirmation, not introduction. No editor-originated blocker. No new FATAL. Decision recomputed from the
referee findings alone: 2 FATAL cleared + 2 concurring Minor-revision verdicts → Minor revision.

## Editor's note

A round-1 R&R that returns with both referees moving ~8–12 points, converging to the same verdict from opposite
lenses, and independently flagging the same one-line arithmetic slip, is a revision that did the work. The
author's two hardest moves — printing the series that contradicts the mechanism claim inside the paragraph that
makes it, and rebuilding a referee's counter-evidence into the paper's cleanest identification argument — are
exactly the behaviour the measured-vs-asserted register promised. Recommend the author take the ADDRESSABLE list
as binding, treat the TASTE list as a response-letter exercise, and resubmit for editor check rather than a
third referee round.
