# Response to Referees — JIE Round 1 (internal simulation)

**Manuscript:** "Corridor, Not Factory: Trade Reorientation and the Missing Investment Response
in Kazakhstan, 2022–2025" · **Date:** 2026-09-16 · **Revised file:** `Manuscript/corridor.tex`
(46 pp, was 42) · **Decision responded to:** Major Revision (`editorial_decision.md`)

This is an internal document tracking how the revision addresses each MUST-address item from
the editorial synthesis. It is not a submission artifact.

## Referee A (domain, THEORY) — MUST items

**C1. The three-gate decomposition is not derived from the entry-threshold model.**
Addressed by reframing, not by a formal re-derivation (the referee's own "cheaper" suggested
route). Section 3's `eq:gates` paragraph no longer claims the three conditions are "separately
necessary." It now states explicitly that only two of the four observations (irreversibility,
institutions) are stand-alone sufficient for a null; the market-access gate is sufficient only
*jointly* with a small transformation margin, and `eq:gates` is labelled a summary of the
case's argument, not a result derived from `eq:build`. Cascaded to §9 (moderators) and §12
(discussion), both of which previously restated the necessity claim in prose.

**C2. Market access is not separated from a no-comparative-advantage story; VA multiplier ≠
per-unit margin.** Addressed with a new paragraph in §3 observation (iii) confronting the
export-platform-FDI literature (Brainard 1997; Helpman–Melitz–Yeaple 2004; Ekholm–Forslid–
Markusen 2007) directly: a customs union can pull production toward the member as readily as
it enables re-export, so an open gate alone does not predict the null. Observation (ii) is
rewritten to flag that the value-added multiplier is a share of gross output, not a per-unit
margin, and that "near-zero domestic base" is the outcome being explained, not independent
evidence — both flagged as suggestive, not dispositive. The paper now states plainly that it
cannot rule out a pure comparative-advantage reading.

**C3. No falsifiable prediction; Armenia's GFCF is an unexploited test.** A bounded, explicitly
caveated public-record search (not a substitute for fDi Markets/Orbis) was run for
component/machinery/instrument capacity investment in Türkiye and Georgia, 2022–2025 — the
framework's one genuine differential prediction. It found no comparable project in either
country. Reported honestly in §9 as *consistent with, but not a confirmation of*, the
prediction, since a public-record search is a weak instrument next to a purchased register.
The Limitations paragraph (§12) is updated to name this attempt and its limits.

**C4. Thin trade-theoretic literature.** Six citations added and verified (author/year/journal/
volume/pages checked via WebSearch against the published record, not fabricated): Handley &
Limão (2015, *AEJ:Policy*; 2017, *AER*) on trade-policy uncertainty, positioned explicitly
against `eq:build` in §3; Bown & Crowley (2007, *JIE*) on trade deflection, positioned in the
§1 Contribution paragraph as the closest formal precedent for the reference class; Brainard
(1997, *AER*), Helpman–Melitz–Yeaple (2004, *AER*), Ekholm–Forslid–Markusen (2007, *JEEA*) on
export-platform FDI, used in the C2 fix above.

## Referee B (methods, CREDIBILITY) — MUST items

**C1. Main-text DiD stars a coefficient declared non-identified.** Table 2 (`tab:did`) note
now states plainly that stars are reported for completeness and should be read against Panel
C. A new row reports the 26-line residual-priority-list DiD (γ = −0.15, p = 0.87) directly
beside the full priority-list row, so the reader sees the non-independence immediately rather
than inferring it.

**C2. The priority list shares 24 of 29 lines with the surge basket — is it independent
corroboration?** Tested directly: re-ran the DiD on the 26 priority-list lines *not* in the
surge basket (`06_eventstudy_did.R`, new `exposed_only` treatment arm). Result: γ = −0.15
(bootstrap p = 0.87, outbound), i.e. **no effect**. This is the single highest-value action
identified in the review and the answer came out against the paper's prior framing: the
priority list's significant coefficient is carried entirely by its overlap with the surge
basket. The abstract, §1, §5.3, Table 2, Appendix C, and the §12 Limitations paragraph are all
rewritten to state this plainly rather than claim independent corroboration.

**C3. "Roughly tenfold" is basket-selection-inflated.** Computed the selection-free level ratio
for the full priority list (3.5×) and the 26-line residual (2.4×, not statistically
distinguishable from zero) against the surge basket's own 11.6×. Reported in §1 and the
abstract; the paper no longer implies the priority list validates the magnitude.

**C4. Break-date CI has no HAC correction.** Added a Newey–West-covariance variant of the
Bai–Perron/sup-F test (`06m_monthly_profile.R`). Result is favourable: the sup-F drops (561→326
outbound) as expected, but the 95% CI is essentially unchanged (2022m4–2022m6), so the
"precedes the June referendum" argument is unaffected. Reported in §5.2. Also attempted for the
four Appendix E neighbour series; not numerically stable at n=8 annual observations, and the
note now says so rather than silently omitting the attempt.

**C5. West+China increment mixes bases (2025 is Western-only).** Fixed in
`08_io_propagation.R`: the West+China increment now uses 2022–2024 only (both components
reported); the mixed-basis 2022–2025 figure is also printed for comparison. The corrected
ratio is numerically the same to two decimals (0.15 either way), so no headline number changes,
but the computation is now methodologically correct and documented as such in the footnote.

**C6. Auto-vs-components search is asymmetric.** A symmetric public-record search was run for
Kazakhstan electrical-machinery/component/instrument capacity, 2022–2025, using the same method
as the existing auto-sector search. It found no comparable project. Reported in §8 as a weaker
but genuinely executed check, not as an equally thorough symmetric search (the auto search drew
on more extensive public reporting on that specific sector).

**C7. Value-capture headline leads with a chosen parameter.** A data-derived anchor was added:
the BNS resources table's trade-margin component alone (net of transport) is 48% for machinery
and electronics — nearly the full 49% ceiling, confirming transport is a small share of the
margin for this category, though the table cannot separate wholesale from retail and so does
not validate a wholesale-only reading on its own. The 0.34 matched-cell estimate is now engaged
quantitatively rather than dismissed: the paper states explicitly that the under-recording
bound it can support elsewhere (13–21%) is not large enough to explain the gap to 0.34, so the
paper does not claim to fully reconcile it, and treats 0.34 as an upper bound the qualitative
reading must survive (and does, at "about a third") rather than a validated estimate.

**C8. Abstract says "rules out"; body says "illustrative."** The abstract now reads "finds that
the least capital-constrained investor in the economy did not build either," matching §7's
language, rather than "rules out."

## SHOULD items (Referee B minor, ten items)

Applied: asinh units and the asinh/PPML magnitude-gap sentence (§5.3); 2018 individual
event-study coefficient reported (Table `tab:appc`, new row); placebo fake-treatment lines
named and the zero-overlap-with-surge-basket check disclosed (`tab:appc` caption); Appendix E
reversion note extended to Türkiye; Table 1's 2025 partial-coverage caveat made visible via a
dagger in the table body, not only the caption; "no investment response in the reoriented
lines" rephrased to name the sectors. Deferred: the monthly event study (additional analysis,
not a correction — left for a future round if requested).

## TASTE items

Not acted on beyond what MUST items already touched: §11 (Policy implications) already ties
each lever to a named gate and an estimated quantity, which is what both referees' TASTE note
asked for; no further compression applied given time and the risk of cutting substantive
content the editorial synthesis explicitly said not to remove.

## What changed the paper's actual claims (not just its presentation)

Two results came back different from what the pre-revision text assumed, and both are now
stated as such rather than smoothed over:

1. The 26-line residual priority-list DiD is a **genuine null** (γ = −0.15, p = 0.87). The
   paper's identification no longer leans on "an independent list shows the same result" —
   it rests on the break dates, raw levels, and the neighbour comparison instead.
2. The cross-country and cross-sector falsifiability checks (Phase B, bounded WebSearch) came
   back **null but low-fidelity** — consistent with the paper's existing findings, but not a
   confirmation of the framework's differential prediction, and reported with that caveat.

Both are disclosed as findings, not concealed as complications, consistent with the paper's
existing style of honest scope-fencing that both referees separately credited.

## Verification

- Compiles clean: 46 pp (was 42), 34 citations (was 28, +6 verified new), 0 undefined
  references/citations, no new overfull hboxes beyond the 3 pre-existing.
- Loaded-vocabulary sweep clean (no circumvention/evasion/sanctions-busting framing).
- All six new R-script analyses (`06_eventstudy_did.R`, `06m_monthly_profile.R`,
  `08_io_propagation.R`, `08b_kz_bns_io.R`, `10_robustness.R`, `12_did_robustness.R`) ran
  end-to-end via `kz_passthrough/00_run_all.R` with no errors; every new number in the
  manuscript traces to a line in a regenerated `_outputs/*.txt` file.
- Not yet done: a fresh `/review-paper --peer JIE --r2` pass to confirm the referees would
  now classify these as Resolved rather than re-litigate them.
