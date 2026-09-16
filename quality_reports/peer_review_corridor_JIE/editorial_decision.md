# Editorial Decision: "Corridor, Not Factory: Trade Reorientation and the Missing Investment Response in Kazakhstan, 2022–2025"

**Calibrated to:** Journal of International Economics (JIE)
**Decision:** **Major Revision**
**Date:** 2026-09-15 · **Manuscript:** `Manuscript/corridor.tex` (42 pp, commit `91ae253`)

## One-paragraph editor's assessment

This is a carefully measured, unusually honest paper whose descriptive core — a sharp, dated, sector-specific trade reallocation through Kazakhstan, thin domestic value capture, and no detectable investment response — is real and well documented. It does not clear JIE's bar as submitted, but not because of a fatal defect: both referees, reading from genuinely different angles, converged on the same underlying diagnosis — **the paper's own diagnostics are more rigorous than its presentation of them.** The organizing framework (the three-gate decomposition) is asserted rather than derived from the paper's own entry model, and a plausible alternative reading (Kazakhstan simply lacks comparative advantage in electronics assembly) is not ruled out. The central difference-in-differences is starred in the main text after the authors' own permutation test tells them not to trust its magnitude, and the "independent" corroborating evidence for it turns out to share 24 of 29 treated lines with the basket it corroborates. None of this is concealed — the manuscript volunteers most of the facts a referee needs to build these objections, which is exactly why I am treating them as addressable rather than fatal. The path to a JIE-viable revision is bounded, specified by both referees down to the exact regression or citation needed, and does not require new data collection beyond what the authors already hold.

## Referee summary

- **Referee A (domain/substance, THEORY disposition):** score 58/100, recommends **Reject**. Central objection: the three-gate decomposition is not derived from the paper's own model, conflates a value-added multiplier with a per-unit transformation margin, and generates no prediction a reader could check and find wrong. Credits the paper's scope-fencing and value-capture honesty explicitly.
- **Referee B (methods/identification, CREDIBILITY disposition):** score 64/100, recommends **Major Revision**. Central objection: three of the paper's four retained claims rest on bundled partial arguments rather than one stated identifying assumption, and the main-text DiD is presented with full inferential apparatus around a coefficient the authors' own permutation test declares non-identified. Credits the robustness battery and the investment-null design as exemplary.

**Editor's spot-check.** Before classifying concerns, I independently verified the two most consequential factual claims driving each report, since a synthesis should not simply inherit unverified numbers: (1) Referee B's Concern 2 — corridor.tex l.359 and l.1346 both confirm "24 [of 29 surge-basket lines] are on the priority list" (of 50 codes) — **verified, not a hallucination**. (2) Referee B's Concern 5 — Table 1 (l.415) gives West+China 2018–2021 as 394/427/483/470 (mean 443.5) against 2022–2025 837/1373/2360/363, with the caption (l.407) confirming the 2025 figure is "the Western component only" — the arithmetic (363 − 443.5 = −80.5) is **verified, not a hallucination**. Both referees' reports check out on inspection; I found no basis to discount either on evidentiary grounds.

## Concern classification

### FATAL

None. See "Where referees disagreed" below for why Referee A's own bottom-line recommendation (Reject) is not adopted mechanically.

### ADDRESSABLE

| Concern | From | Suggested path |
|---|---|---|
| Three-gate decomposition (Eq. 2) is not derived from the paper's own entry threshold (Eq. 1); necessity of each gate is a property of the asserted multiplicative form, not of the model | Referee A, C1 | Either derive the separate-necessity property from an explicit entry model, or (the referee's own cheaper suggestion) drop Eq. (2) and reason throughout from Eq. (1)'s scalar threshold, restating "which gate binds" claims as statements about the sign of the threshold condition |
| Market-access mechanism is not separated from a simple comparative-advantage/no-domestic-base story; conflates the ICIO value-added multiplier (0.69) with a per-unit transformation margin (μ_P) | Referee A, C2 | Either a within-Kazakhstan comparison exploiting variation in EAEU local-content bindingness across lines, or an explicit paragraph confronting the export-platform-FDI alternative and conceding what cannot be ruled out — the same honest-fencing move the paper already uses elsewhere |
| Framework offers no falsifiable prediction; the one available out-of-sample fact (Armenia's GFCF rising post-2022) runs against the mechanism and is not treated as a test | Referee A, C3 | Attempt the greenfield-announcement count for Türkiye/Georgia vs. the EAEU intermediaries (fDi Markets/Orbis, already named in the paper's own Limitations), or further narrow the external-validity claim in the abstract and Section 12 |
| Trade-theoretic literature is thin — Handley–Limão (trade-policy uncertainty), Bown–Crowley (trade deflection), Brainard/HMY/Ekholm-Forslid-Markusen (export-platform FDI) absent | Referee A, C4 | Engage these explicitly in Section 3; position Eq. (1) relative to Handley–Limão with a re-export outside option |
| Main-text DiD (Table 2 Panel A) is starred with a full inference apparatus around a coefficient Panel C's own permutation test places at p=0.58 in its null | Referee B, C1 | Demote the surge-basket DiD to Appendix C; keep at most the priority-list row in the main text, conditional on the next item |
| "An externally compiled list... shows the same break" (abstract) — 24 of 29 surge lines are on the 50-code priority list, so this is largely the same lines, not independent corroboration | Referee B, C2 | Run the DiD on the 26 priority-list lines NOT in the surge basket — one regression on data in hand, decisive either way |
| "Roughly tenfold" (abstract) is computed on a basket selected for large post/pre ratios | Referee B, C3 | Report Table 1 levels for the priority list (and the 26-line residual set); state the selection-free ratio if it differs materially |
| 2022m5 break-date 95% CI (2022m4–2022m6) computed without HAC correction on a series described as highly persistent; the CI underwrites the "precedes the June referendum" leg of the reform-confound argument | Referee B, C4 | Re-run Bai–Perron with an HAC covariance for the monthly series and each Appendix E row; report the corrected interval |
| West+China incremental-inbound calculation mixes bases: 2025 is Western-only per the table's own note, but is subtracted from a West+China baseline, producing a spurious −$80.5m 2025 contribution | Referee B, C5 (independently verified) | Restrict the increment to years both components are reported, or impute/flag 2025 explicitly; state the method |
| The only evidence on the irreversibility gate (auto sector vs. components) pairs a searched sample against an unsearched one | Referee B, C6 | Run the same announcement-search protocol for electrical-machinery/components/instruments that was run for autos |
| Value-capture headline ("5–11 cents") leads with a chosen parameter (m ∈ [6%,14%]) rather than the unconditional threshold statement the sensitivity table (Appendix D) already supports; the one data-derived internal estimate of m (0.34) exceeds the threshold at which the headline weakens and is dismissed rather than engaged | Referee B, C7 | Attempt a data-derived m from the BNS wholesale-trade (ISIC 46) margin already used for the IO robustness check; promote Table D.1 into Section 5.2 as the primary object; engage the 0.34 estimate quantitatively |
| Abstract claims the case "rules out capital-market institutions as the binding constraint"; Section 7 calls the identical QIC evidence "illustrative rather than a controlled test" | Referee B, C8 | Soften the abstract to match the body's own fencing, or supply the QIC report's sector-by-year breakdown as a partial denominator |

### TASTE (author may push back)

| Concern | From | Editor's view |
|---|---|---|
| Section 10/11 Policy Implications reads as normative commentary JIE does not publish (both referees flag this independently — desk review, Referee A minor suggestions) | Editor + Referee A | I agree this section should be compressed for a JIE submission, but it is not a rejection-grade issue on its own; the author may retain a condensed version if it is explicitly subordinated to the framework (each lever mapped to a named gate and a quantity from Sections 5–8), which the paper mostly already does |
| The mediation restatement paragraph (Referee A minor) adds a third framing of the same content with no estimated content | Referee A | Reasonable suggestion; author may keep it as a one-paragraph aside if space allows, cut if not — does not affect the identification or framework concerns above |
| Ten presentational minor items from Referee B (asinh units, PPML/asinh reconciliation, 2018 placebo coefficient, monthly event study, placebo-line contamination check, trend-preserving γ null, Appendix E reversion framing, Table 1 2025 caveat visibility, "reoriented lines" vs. "sectors" phrasing) | Referee B | All reasonable, all cheap; author should address most but may reasonably defer the monthly event study (data exists, but it's additional analysis, not a correction) to the next round if time-constrained |

## Where referees disagreed

**The central disagreement is not about facts — both referees independently arrived at compatible readings of the manuscript — but about how far the identified problems travel.** Referee A (THEORY) treats the framework's lack of derivation as disqualifying for a journal whose bar is "a well-quantified mechanism," and closes with "[t]he revision that would fix this... is a new paper, not a revision." Referee B (CREDIBILITY) treats a structurally similar family of problems — claims resting on bundled partial arguments rather than single derivations — as a bounded, specifiable revision, and explicitly frames six of eight concerns as answerable from data the authors already hold, three of which could plausibly *strengthen* the paper.

**Editor's view:** I side with Referee B's procedural read over Referee A's terminal one, for three reasons specific to this paper. First, Referee A's own critical peeve offers a "cheaper" fix for its most serious objection (Concern 1) — dropping Eq. (2) and reasoning from Eq. (1) directly — which the referee itself frames as a reframing exercise, not new theory. A referee who states an addressable fix for their own central objection while recommending Reject is not, in my reading, saying the fix is impossible; the referee is registering that the paper as submitted asks a JIE reader to accept more than the model delivers, which is a legitimate MAJOR concern but not evidence the gap cannot be closed. Second, the domain referee's Concern 2 (comparative advantage vs. market access) is real and load-bearing, but the paper's established practice — visible throughout in the scope-fencing both referees separately praised — is to concede exactly this kind of alternative explanation rather than paper over it; there is no structural reason the authors cannot do the same here. Third, the manuscript is not a formal-theory submission; the JIE profile explicitly accommodates a well-measured case study built on an organizing device provided the case is honest about what it does and does not identify, which is the standard the paper already meets in every other section both referees reviewed.

I am not, however, discounting Referee A's substance to zero. The domain concerns (C1–C4) are listed as ADDRESSABLE rather than TASTE precisely because they are serious enough to gate the next round: **if the revision's response to Referee A amounts to citation-padding rather than either deriving the framework or honestly narrowing its claims, I would expect the paper to draw a Reject on resubmission from a referee with this disposition.** The response-to-referees document should treat Referee A's concerns with the same weight as Referee B's, not as the "softer" of the two reports.

A secondary, smaller disagreement: Referee A treats the Armenia GFCF divergence as a missed falsification opportunity (Concern 3); Referee B does not mention it. I read this as Referee A correctly extending the "reference-class" test that is specific to a THEORY disposition and not a gap in Referee B's coverage — the two referees were doing different jobs, as intended.

## Response-planning block (for the author)

**MUST address (all twelve ADDRESSABLE items above):**
1. Resolve the priority-list overlap (Referee B, C2) — run the DiD on the 26 non-overlapping priority-list lines. This is the single highest-value action in the whole review: it is one regression, it directly answers Referee B's central identification concern, and its outcome partially determines how much weight the abstract's "externally compiled list" sentence can bear.
2. Either derive or explicitly relabel the three-gate decomposition (Referee A, C1) — the cheaper path (reasoning from Eq. 1's scalar threshold throughout, dropping the "separately necessary" language) is available and does not require new theory.
3. Confront the comparative-advantage/export-platform-FDI alternative explicitly (Referee A, C2) rather than resting on the μ_P ≲ μ_T conflation as currently stated.
4. Demote the surge-basket DiD's inferential apparatus out of the main text (Referee B, C1), contingent on (1).
5. Correct the West+China increment arithmetic (Referee B, C5, independently verified).
6. Re-run the structural-break tests with an HAC covariance (Referee B, C4).
7. Report the selection-free "tenfold" analogue from the priority list (Referee B, C3).
8. Engage the trade-policy-uncertainty and trade-deflection literatures (Referee A, C4).
9. Symmetrize the auto-vs-components search (Referee B, C6) or explicitly flag the asymmetry as an unresolved limitation with a stated reason it could not be closed.
10. Rebalance the value-capture headline toward the sensitivity threshold and engage the 0.34 internal estimate (Referee B, C7).
11. Harmonize the abstract's "rules out" language with Section 7's "illustrative" framing (Referee B, C8).
12. Attempt or explicitly further-bound the external-validity/falsifiability gap (Referee A, C3).

**SHOULD address:** the ten minor presentational items from Referee B (units, magnitude reconciliation, placebo transparency, Appendix E framing) — all cheap, all improve the paper's credibility with a JIE reader.

**MAY push back:** retaining a condensed Policy Implications section provided each lever is explicitly tied to a named gate and an estimated quantity; retaining the mediation-restatement paragraph as a one-paragraph aside; deferring the monthly event study to a later round if the annual pre-trend evidence combined with the HAC-corrected break dates (item 6) is judged sufficient by the next round's referees.

## Editor's note on process

This run used a newly added JIE profile in `.claude/references/journal-profiles.md` (no JIE profile existed before this session; adapted from the shipped JCE field-journal template). Cross-artifact Phase 0 (reproducibility) was carried forward as PASS/0-FAIL from the prior round rather than re-executed, since no analysis code changed since that audit. Novelty probes (desk review) cleared with a stated verification caveat (no RePEc/NBER/CEPR working-paper sweep). No editor-introduced FATAL concern required the post-judge hallucination gate, since this synthesis only reclassifies referee-raised concerns rather than introducing new ones; the two most load-bearing factual claims (methods-referee C2 and C5) were independently spot-checked against the manuscript source and both verified accurate.
