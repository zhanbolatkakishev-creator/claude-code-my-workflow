# Seven-Pass Review: Corridor, Not Factory — ROUND 3

**Date:** 2026-09-01
**Path:** `Manuscript/corridor.tex` (commit `301d243`, 982 lines)
**Prior rounds:** `_SYNTHESIS_round1.md`, `_SYNTHESIS_round2.md`
**Lens reports:** `round3/lens_1..7_*.md`
**Context:** run after the full 9-step round-2 revision + KZ BNS I-O robustness. FactSet/Dealroom
deal-source columns and the QIC register are known-pending; lenses were told not to re-flag
those as novel but to check the paper hedges them honestly in-place.

---

## Executive verdict

**Overall state: REVISE-MAJOR.** Blocked by **3 CRITICALs, all from the methods lens, all
concentrated in §5.2 and §7.** The DiD half of the paper (§3–§4) is now, in the methods
reviewer's words, "close to publishable" — four of the five round-2 methods CRITICALs are
genuinely fixed, not papered over. The weight has shifted to the value-capture headline and
the captive-capital test.

**Score roll-up:** 3 CRITICAL / 35 MAJOR / ~44 MINOR across seven lenses.

| Lens | Crit | Maj | Min | Score/10 | Δ vs R2 |
|---|---|---|---|---|---|
| 1. Abstract | 0 | 2 | 5 | 7 | = |
| 2. Intro | 0 | 1 | 4 | 8 | +1 |
| 3. Methods | 3 | 14 | 7 | 6.5 | +1.5 |
| 4. Results | 0 | 7 | 12 | 7 | = |
| 5. Robustness | 0 | 5 | 3 | 7 | +1 |
| 6. Prose | 0 | 5 | 8 | 6 | = |
| 7. Citations | 0 | 1 | 5 | 8 | +1 |
| **Overall** | **3** | **35** | **~44** | **6.5** | **+1** |

**Hallucination gate:** the synthesis introduces no CRITICAL that a lens did not raise. All
three CRITICALs trace to Lens 3 with cited evidence and were spot-verified against the source:
- **L3-2** (m uncited) — CONFIRMED: "the Kazakhstan national-accounts convention … 6–14%"
  at `corridor.tex` lines 47, 107, 536, 557–558, 574, 940, with no `\cite` on any of them,
  and no national-accounts source in the §3 Data section. Corroborated at MAJOR by Lens 4 and
  Lens 5. Two-strikes (round-1 C3, round-2 synthesis both required a source).
- **L3-1** (under-invoicing bound) — CONFIRMED that the "~25% margin → ~40% under-recording"
  sentence (lines 573–577) is computed in no script; the correct derivation direction
  (13–26% under-recording, holding goods cost fixed) is PLAUSIBLE and would weaken or
  reverse the sentence's own conclusion. Also indicts `reproducibility_audit_corridor.md:105`,
  which "verified" the bound against a derivation reconstructed from the manuscript's claim.
- **L3-3** (QIC provenance + Test D design) — CONFIRMED: §3 lines 344–346 assert the register
  "is a public disclosure … the replication package pins the release date," present tense,
  while the project's own `qic_data_fields_needed.md` is a live pre-publication request.
  `mechanism_tests.txt` is a 2022–2025 cross-section (no pre-period). Test F was downgraded
  to "illustrative" in round 2; Test D was not.
  **ADDRESSED 2026-09-01 (`feat/corridor-qic-report-rescope`):** no project-level QIC register
  will be published; §3 re-sourced to the public QIC/AIFC/IFC PE report (`qicaifcifc2026pe`),
  `tab:captive` deleted, §7 Test D rewritten as illustrative (Test F's treatment), the private
  QIC workbook removed from the pipeline. FactSet/Dealroom dropped throughout. See
  `quality_reports/plans/2026-09-01_qic-report-rescope.md`.

---

## Cross-lens CRITICAL issues

| # | Lens(es) | Issue | Recommendation |
|---|---|---|---|
| C1 | **3 (CRIT); 4, 5 (MAJ)** | **The 6–14% margin `m` is uncited and is the entire headline.** `VA = m·v̄^TT` with `v̄^TT ≈ v̄^M`, so §5.2 itself concedes "the result is essentially m." No citation, no §3 Data entry, exists only as a code comment in `08_io_propagation.R:12`. Flagged in round 1 (C3) and round 2 — **two strikes, unaddressed.** | Cite `m` to a specific source (KZ BNS national-accounts trade-margin / TIF table, page + year) **or** to a trade-margin study; add a §3 Data row; report it as a sensitivity grid, not a point band; add one sentence conceding the headline is a calibration on an assumed parameter, not an estimate. |
| C2 | **3 (CRIT)** | **§5.2 under-invoicing bound is unsourced and likely wrong-signed.** "Retained margin would have to be ~25% … requires exports under-recorded by ~40% — an order of magnitude larger than typical mirror-gap discrepancies." No script. Correct derivation (m*=1−(1−m)/k, goods cost fixed) gives 13–26%, inside the range this literature (incl. the Chupilkin et al. gaps the paper cites for its own identification) routinely finds. | Either derive the bound in a script from a stated accounting identity (say what is held fixed) and report the honest number, or delete the sentence and replace with "we cannot rule out that under-recording contributes." The 20% vs 76% thesis survives regardless; the "under-invoicing cannot rescue it" claim does not. |
| C3 | **3 (CRIT); tied to project QIC gate** | **§7 Test D has no pre-2022 baseline, no denominator; §3 over-states the register as already public.** The abstract leans on "captive state capital abstained too." `mechanism_tests.txt` is a 2022–25 cross-section; 1 of 50 projects in a $230m-output sector is ~2% of projects for ~0.1% of output — no benchmark. §3 asserts present-tense public availability the register does not yet have. | Add pre-2022 QIC rows to Table 3 (from the September PE report — see note below) **or** explicitly downgrade Test D to "illustrative" in Test F's exact terms; add a benchmark share; rewrite §3 lines 344–346 to name the actual document, its publication date, and coverage, in the tense that will be true at submission. **Gate:** do not circulate until the register/PE report is public and its fields are verified against `qic_data_fields_needed.md`. |

> **Note on C3 and the September PE report.** The user has identified `PE Report_Draft_MasterFile_v2 clean`
> (Trade-research folder, to be published September 2026) as the intended public source for the
> QIC deal data, with platform-listed deals also citable from it. Reviewing that report and
> re-basing §7 / Table 3 / §3 on it is the concrete path to closing C3. Queued as the immediate
> next task.

---

## MAJOR issues (grouped; 35 total — see lens files for the full list)

### Summary–body parity (5 lenses: 1, 2, 3, 5, 6)
- **The abstract is cleaner than the body on identification.** Sentence 5 ("nets out common
  shocks, leaves a roughly threefold increase") presents the DiD as a clean identified estimate;
  §4.3 concedes the coefficient's magnitude "is not separable from the selection" (permuted-null
  γ ≈ 2.79 ≈ observed 2.44). Sentence 6 ("imports of the same goods rise in step") puts the
  inbound leg on equal footing; body: annual W+China break insignificant (supF 4), inbound DiD
  fails Holm, Western-only p=0.08. [L1-1, L1-2, L5-3, L3-14]
- **§1 is now *less* hedged than the abstract** on the investment null: the abstract concedes
  it is "over-determined by contemporaneous shocks," §1 step three does not. One concessive
  clause closes it. [L2 sole MAJOR]
- Fix by rewriting the whole abstract paragraph and the §1 preview against the body — not
  surgically (per `summary-parity.md`).

### asinh → levels, told two ways (lenses 3, 4, 1)
Same DiD coefficient rendered "about threefold" (abstract/§1, actually the PPML exp(1.262)=3.53)
and "roughly a tenfold rise in level" (§4.2, actually exp(2.44)≈11.5). No asinh interpretation
caveat anywhere (Bellemare–Wichman / Chen–Roth), in a zero-heavy panel where asinh was chosen
*because* of the zeros. → Use PPML for every level statement; delete the tenfold gloss on γ; add
the caveat + a units line. [L3-6, L4-7]

### By-tier wedge heterogeneity contradicts "no transformation" (lenses 3, 4, 5) — two strikes
"No mass at the high multiples that domestic transformation would produce" (§5.1) vs the paper's
own tiers: p75 wedge = 4.40, CHPL tier-2 median 3.83 ($150.8m gross), tier-4A 3.94 ($67.4m) —
~42% of matched outbound flow at ~4×. Round-2 M7 reworded, not fixed. → Report the six-row tier
table; replace the universal with a claim the data support. [L3-9, L4-4, L5-4]

### Robustness checks reported only where they pass (lenses 3, 5) — recurring pattern
Size-decile × year FE reported for the outbound (γ 2.44→2.29, survives) and omitted for the
inbound, where the same control cuts the coefficient 39% (2.10→1.28, p=0.052) — and the inbound
leg carries the abstract's "imports rise in step." → Report both rows; soften the inbound claim.
[L3-10, L5-2]

### Missing analyses a referee will demand (lens 5, echoed by 3)
- Leave-one-HS2-out / jackknife-by-chapter on the 29-line basket (concentrated in HS 84/85/90).
- Alternative surge thresholds (1.5×, 3×) beyond the 2× rule.
- These are the only items on the list that are genuine *new analyses* rather than citations or
  reframes. [L5-5]

### Methods MAJORs that are one-paragraph / one-sentence fixes (lens 3)
L3-4 (§4.3 reads its selection counts backwards — inbound 41 is the rarer screen, not
"redundant"); L3-5 (the priority/CHPL list is called "pre-specified" but was published Feb-2024
by sanctioning authorities partly from observed diversion — and it yields a *larger, tighter* γ,
which the paper under-uses); L3-11 (permutation null destroys secular trends, so P(≥29)<0.001
rejects "no trends," not "no reorientation" — needs a trend-preserving null); L3-12 (Eq. 2's
multiplicative gates do not follow from Eq. 1's additive threshold; §8 re-claims "testable
content" the paper elsewhere disclaims); L3-13 (the wedge measures μ_T, not μ_P); L3-14
(control-basket contamination — the civilian basket also breaks in 2022, supF 34); L3-15
(wild-bootstrap rationale still misattributed — point to the permutation instead).

### Figures / tables (lens 4)
L4-1 (Fig 1 caption names blue/orange; plot is salmon/cyan — reader maps series backwards;
regression from the round-2 label sweep); L4-3 (Fig 4 x-axis starts 2016 while §7's 7.3/yr
rate rests on an unverified 2015=0 — 2016–21 mean is 8.5/yr, which flips the post period to a
slight decline; subtitle truncated in the shipped PNG); L4-5 (Fig 5 / Table 6 / `sector_priority.txt`
do not reconcile — Table 6 omits Electrical equipment, its own #1 substitution candidate, and
its inclusion rule is unstated); L4-6 (§10 "lowest VA multiplier in the economy (0.69)" is
false — motor vehicles and rubber & plastics tie at 0.688).

### Citations (lens 7) — two strikes
The 2023–2026 sanctions-circumvention / parallel-imports literature (Simola/BOFIT,
Hilgenstock–Ribakova/KSE, Kluge/SWP) is still entirely uncited apart from the two Chupilkin
et al. papers — round-2 M18 already asked for it. Does not threaten the "first host-economy
incidence" novelty claim, but it is the neighbourhood the paper must position against. [L7-1]

### Prose (lens 6)
L6-1 (systemic 45–78-word sentences; §2's worst untouched despite the §2 revision); L6-2
("Deal-making"/"dealmaking" + "artefact"/"artifact" — global-replace consistency regressions,
one in the abstract); L6-3 (em-dash overuse + an unrepaired em-dash splice in §7 lines 754–756);
L6-4 (antithesis-frame saturation — ~6 "X not Y" in §7 alone); L6-5 (dangling modifier still in
§4.3: "imposing the null … the rule selects").

---

## MINOR polish (~44 total — consolidated in the lens files)

Representative: Fig 2 caption omits the pre-trend Wald p; QIC project count 50 in one output /
28 in another; baseline windows mismatch (2019–21 selection vs 2018–21 value/fiscal); "$22m
customs" is the mid-cell of a $9.6–38.3m grid with `cleared_share=0.75` unstated; `desouza2024diffusion`
`note` says "Revised 2026" (documented revision is March 2025); "an order of magnitude" appears
~6×; roadmap is one 85-word sentence; year-format "2022--25" vs "2022--2025" in prose; Kazakhstan's
own +1.0pp GFCF (`crosscountry.txt:17`) unreported while Armenia's +3.3pp is flagged.

---

## Revision plan (in recommended order)

> **STATUS 2026-09-01 — COMPLETE (`feat/corridor-qic-report-rescope`, 9 commits `5a311a3`→`e0d5cf0`):**
> All 3 CRITICALs + all 35 MAJORs + most MINORs addressed.
> - **C3** closed (QIC re-scoped to the public PE report; `tab:captive` deleted; Test D illustrative).
> - **C1** — `m` reframed as a wholesale+freight calibration, BNS-bounded (transport 1%, full 49%),
>   cited `qazstat2023io`, conceded not-estimated.
> - **C2** — under-invoicing bound corrected: `k=(1-m)/(1-0.254)` → **13–21%** (not the "40%" in the
>   draft, nor the "15–26%" of the first fix; caught in the audit).
> - Abstract/§1 DiD parity; asinh threefold(PPML)/tenfold(raw) separated; L3-4/L3-5/L3-10/L3-12/
>   L3-13/L3-14/L3-15; by-tier wedge ("no mass at high multiples" replaced); Fig 1/Fig 4 captions;
>   §10 superlative; `tab:priority` +Electrical-equipment row; prose MAJORs L6-1..L6-5 + MINORs
>   L6-9/L6-11/L6-13/L6-14.
> - **New analyses** in `12_did_robustness.R`: leave-one-HS2-out (drop HS 85 → γ 1.36), thresholds
>   (1.5×→γ 1.59 / 2.5–3×→γ 3.1), trend-preserving cyclic-shift null (P(≥29)=0.000).
> - **`/verify-claims`** run on the new cites: `simola2023bofit` (BOFIT PB 15/2023),
>   `kse2024exportcontrols` (WGP 16, Jan 2024), `wisniewska2025osw` (OSW report) — all verified;
>   the invented Kluge/SWP entry dropped. `desouza` "Revised March 2025" note removed.
> - **`/audit-reproducibility`: PASS** — 118 PASS / 0 FAIL / 1 EXPLAINED / 3 UNMATCHED.
> Not pushed / not ff'd to main — awaiting user review. Before submission: regenerate `04`/`07`
> (live Comtrade/WDI) and `11_macro` for a current provenance date.

1. **Close C1 (uncited `m`).** Find and cite the KZ national-accounts trade-margin figure; add
   the §3 Data row; convert the 6–14% band to an explicit sensitivity grid; concede calibration.
   *Highest leverage — three lenses, two prior rounds, and it is the headline.*
2. **Close C2 (under-invoicing bound).** Script the bound from a stated identity or delete the
   sentence; correct `reproducibility_audit_corridor.md` (the audit could not catch a
   manuscript-only number — see step 10).
3. **Review the September PE report and close C3.** Re-base §7 Test D / Table 3 on it with a
   pre-2022 baseline + a benchmark share; rewrite §3 lines 344–346 to the true document, date,
   coverage, tense; optionally cite platform-listed deals from the report. *Queued as the
   immediate next task per the user.*
4. **Abstract + §1 parity rewrite.** Whole-paragraph, against the body: carry the selection and
   inbound-significance caveats into the abstract; add the "over-determined" clause to §1;
   reconcile threefold/tenfold via PPML; trim the word count back toward ~245. [L1-1/2, L2, L5-3, L3-6]
5. **By-tier wedge table + "no mass at the high multiples" fix.** Data already in
   `rq2a_unit_value_wedge.txt`; surface the six-row tier table. [L3-9, L4-4, L5-4]
6. **Disclose the checks that weaken the headline.** Inbound size×year FE row; soften "rise in
   step." [L3-10, L5-2]
7. **New analyses:** leave-one-HS2-out + threshold sensitivity (1.5×/3×) on the basket; a
   trend-preserving permutation null. [L5-5, L3-11]
8. **Methods one-liners:** L3-4, L3-5, L3-12, L3-13, L3-14, L3-15 — mostly a sentence or a
   paragraph each; no new estimation.
9. **Figures/tables:** Fig 1 caption colours; Fig 4 x-axis + the 8.5/yr recompute; Fig 5 /
   Table 6 / `sector_priority` reconciliation + state Table 6's inclusion rule; §10 superlative.
   [L4-1, L4-3, L4-5, L4-6]
10. **Citations:** add the 2023–26 sanctions-intermediation literature; fix the `desouza` note.
    [L7-1]
11. **Prose pass:** the ~6 worst sentences; "Deal-making"/"artefact" global replace; §7 em-dash
    splice; §7 antithesis thinning; the §4.3 dangling modifier. [L6-1..L6-5]
12. **Build-step (structural, recurring recommendation):** render load-bearing numbers from
    `_outputs/` into the `.tex` so hand-derived numbers cannot recur. Both §5.2 CRITICALs are
    manuscript-only numbers the reproducibility audit structurally could not catch.

---

## Contradictions between lenses

- **Abstract length.** Lens 1 wants a standalone contribution sentence + the method named
  (data-driven basket, cross-database check) — additions; Lens 1 and Lens 6 also say the
  abstract regressed to ~330 words and must be cut. The reviser must add specificity *and* cut
  length — i.e. remove the em-dash asides, not the substance.
- **Framework paragraph.** Lens 2 judges the round-2 compression fine ("dropped no necessary
  content"); Lens 6 still calls it over-long (~14 lines, wants ~7). Tension on target length,
  not on content.
- **The priority/CHPL basket.** Lens 3 (L3-5) says calling it "pre-specified / not selected on
  the outcome" is wrong (published Feb-2024, endogenous to observed diversion) — and, because
  the permutation removed the surge-γ from the identification load, this basket is now
  load-bearing. Lens 2 treats the Chupilkin gap-statement deferral to Contribution (i) as fine.
  Resolve in Lens 3's favour: relabel the basket honestly and lean on its larger, tighter γ.

---

## Token-budget report

```
Seven-pass review (round 3) complete.
Subagents: 7 (parallel) + 1 synthesizer.
Approx token usage: ~1.1M subagent tokens (lens 3 and 6 could not write to disk; reconstructed from payloads).
Runtime: ~14 min wall-clock (longest lens: methods, ~14 min).
Cheaper alternatives for the next pass: /review-paper --adversarial (iterative, ~2x cheaper).
```
