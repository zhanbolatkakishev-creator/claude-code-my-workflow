# Editorial Decision — Round 2 (R&R)

**Journal:** Journal of International Economics (JIE)
**Manuscript:** "Corridor, Not Factory: Trade Reorientation and the Missing Investment Response in Kazakhstan, 2022–2025"
**File:** `Manuscript/corridor.tex` (46 pp., commit `aa87539`)
**Round-1 decision:** Major Revision (0 FATAL / 12 ADDRESSABLE) — `editorial_decision.md`
**Date:** 2026-09-16

---

## Decision

**Major Revision** — moved one full tier from Round 1's Reject-leaning split (58/64) to a Round 2 split of **65 (Major Revision, weakest form) / 70 (Minor Revision, conditional)**, but not yet to a decision I can issue as Minor Revision, because one referee's outstanding items include two fresh MAJOR items of my own classification (not carried over, introduced by the revision itself) and the other referee's are conceptual, not mechanical.

**This is a good position to be in.** Both referees independently verified the author's claimed fixes against the manuscript text and the underlying code rather than trusting the response letter, and both found the verification-worthy claims held up (8/10 numbers exact for Referee B; the Section 3 rewrite exact and well-executed for Referee A). What remains is a **short, named, bounded list** — not a re-opening of the theoretical or empirical strategy. I am confident a Round 3 clears Minor Revision or better if the list below is executed in full, including the cascade.

---

## Score summary

| | Round 1 | Round 2 | Δ | R2 recommendation |
|---|---|---|---|---|
| Referee A (domain, THEORY) | 58 | **65** | +7 | Major Revision (weakest form) |
| Referee B (methods, CREDIBILITY) | 64 | **70** (72.3 uncapped) | +6 (+8.3) | Minor Revision (conditional on N1, N2) |

Both referees explicitly commend the same thing from different vantage points: the author ran the tests each referee asked for, and **reported the results even where they cut against the paper** — the 26-line residual DiD came back null and the claim was withdrawn everywhere but four locations (Referee A); the HAC correction bound asymmetrically across series in exactly the pattern that indicates it isn't cosmetic (Referee B). That is the behavior R&R is supposed to select for, and it is why neither referee is trending toward reject.

---

## What moved the needle

- **Referee A, Lit. Positioning 55→72** (the single largest movement across both reports): Handley–Limão integrated as the genealogy for `eq:build`, not decoration; Bown–Crowley load-bearing in the contribution paragraph.
- **Referee A, C1/C2 in Section 3 itself**: the "separately necessary" overclaim is gone, replaced with the correct asymmetric statement (irreversibility/institutions independently sufficient; market access sufficient only jointly with a small transformation margin) — "more precise... than the one in my own report," per the referee.
- **Referee B, C4/C5 fully Resolved**: HAC break-date correction (differential CI widening, verified against `rq1_monthly.txt`) and the West+China basis-mixing fix are both clean, verified, done.
- **Referee B verification**: 8 of 10 spot-checked numbers reproduce exactly against `_outputs/*.txt`, including numbers with no incentive to be right (the 2018 placebo coefficient, the cyclic-shift null moments).

## What stalled: a fix made in one place, asserted nowhere else

Both referees independently converged on the **same failure mode**: a genuine, correct fix was made at the point of first mention, and the old, now-contradicted claim was left standing everywhere else that depends on it.

- Referee A: Section 3 says the market-access gate is sufficient only *jointly* with a small margin. The abstract (NEW-1), the introduction (l. 144–146), Section 8 (l. 949, l. 956–957), and Section 11 (l. 1219–1220) still say it is sufficient *on its own* — unchanged, in Section 8's case verbatim from Round 1.
- Referee B: the residual-set DiD test was genuinely run and the claim was withdrawn from the abstract, Table 2, Table C.1, and Limitations — but the regression itself uses a contaminated control pool (N1) and a fabricated sample size (N=208/26 clusters vs. the actual N=600/75 clusters), and a parallel claim (the components-sector search) was added to the manuscript without updating the script whose output it's supposed to describe (N2).

This is a single underlying pattern — **the propagation step of a fix is being skipped** — and it is the organizing theme of this round's required items.

---

## Consolidated concern list (both referees, Round 2)

### ADDRESSABLE — required before Round 3 can clear

| # | Source | Concern | Scope |
|---|---|---|---|
| **R2-1** | Referee B, N1 | Residual-set (`exposed_only`) DiD control pool includes the 29 surge-basket lines; reported N=208/26 clusters does not exist in the code (actual N=600/75 clusters) | Re-run one regression on a clean control (the existing purged 20-line civilian set, or equivalent); correct 3 numbers in the manuscript |
| **R2-2** | Referee B, N2 | Manuscript claims a symmetric components-sector search was run (§7); `06_mechanism_tests.R`/`mechanism_tests.txt` state the opposite | Either commit a search protocol and update the script/output to match, or soften the manuscript to withdraw the word "search" |
| **R2-3** | Referee A, NEW-1 | Abstract asserts the market-access gate is independently sufficient; Section 3 says the opposite | Rewrite one abstract sentence to match Section 3's asymmetric statement |
| **R2-4** | Referee A, NEW-2 | Limitations paragraph signs the Türkiye/Georgia null as "consistent with" the framework; the framework predicts the *opposite* result there, so a null is non-supportive, not consistent | Restate to match Section 9's own (correct) framing |
| **R2-5** | Referee A, C1 (cascade) | Four locations still assert "sufficient on its own": §8 l.949, §8 l.956–957 (verbatim Round-1 text), Intro l.144–146, §11 l.1219–1220 | Propagate Section 3's qualifier to all four |
| **R2-6** | Referee A, C2 | §8 l.952–953 still asserts as established fact the two pieces of evidence (0.69 multiplier, near-zero base) that Section 3 itself now labels circular/only loosely relevant | Rewrite to inherit Section 3's "suggestive, not dispositive" framing; restate what Section 8's conclusion actually is under that weaker premise |
| **R2-7** | Referee B, C8 | "Rules out capital-market institutions" survives at 6 body locations despite the abstract being softened | Replace with "is inconsistent with" (or equivalent hedge) at all 6 |

### ADDRESSABLE — smaller, bounded, non-blocking for a Minor Revision read but expected by Round 3

| # | Source | Concern | Scope |
|---|---|---|---|
| R2-8 | Referee B, C1 | Star survives on Table 2's surge-basket row despite the disclosure text | Delete the star, or move the row to Appendix C |
| R2-9 | Referee B, C3 | "Roughly tenfold" still unqualified in abstract/§5.1; no Table 1 row for the priority-list ratio | Attach the 3.5× selection-free ratio the first two times "tenfold" appears; add a Table 1 row |
| R2-10 | Referee B, C7(1) | BNS "wholesale-margin anchor" (48%) is the pre-existing ceiling minus the known transport share, not a new wholesale-specific estimate | Either compute `mrate(mach, "trade_m")` as a genuinely distinct anchor and characterize it honestly as an *upper bound including retail* (the data does not support a cleaner split — this is what `08b_kz_bns_io.R` already prints as of the R1 revision), or drop the "anchor" framing from the response letter/manuscript language that oversold it |
| R2-11 | Referee A, C4 | Entry-hysteresis literature (Roberts–Tybout / Das–Roberts–Tybout) and upgrading foils (Atkin–Khandelwal–Osman / Verhoogen) still uncited | One paragraph each, in the sections the referee names |
| R2-12 | Referee B, N3 | Kyrgyz Republic's own break test dates the jump to 2019, not 2022, in 4 places the manuscript asserts "the same 2022 break" | Report per-neighbour jump years in Table E.1; qualify the "same break" claim to the countries it actually holds for (Armenia, Türkiye) |

### TASTE / editor's discretion — do not block on these

- Referee B N4 (document why the cyclic-shift null uses B=814 vs. 2000 for the free permutation — a one-line footnote) and N5 (a pre-existing typo in raw `_outputs/rq1_did_robustness.txt`, not a manuscript claim — fix in the script for cleanliness, no manuscript action needed).
- Referee A's C3 in full (an ex-ante, mechanically-coded 5-episode test across the reference class). This is the one item where I side with the author's Round-1 choice: the referee's own Round-1 note said the *bounded WebSearch proxy* was an acceptable substitute for the unavailable ideal data, and the proxy was executed and honestly reported as inconclusive both times (Kazakhstan search: null, reported as null in §7 pending R2-2's fix; Türkiye/Georgia search: null, reported as a weak instrument, not a confirmation — this is exactly right per the referee's own R2 report). The referee's residual ask — a fully mechanical ex-ante coding rule across 5 reference-class episodes — is a materially larger empirical undertaking than an R&R item, and the referee's own fallback (present the framework "throughout as a taxonomy of the Kazakhstan case" if this isn't done) is already close to true after R2-3 through R2-6 land: once the sufficiency claim is properly hedged everywhere, the framework *is* being presented as an organizing taxonomy for this case rather than a tested cross-country theory. I do not require the 5-episode exercise for this round. If the author wants to strengthen External Validity further, adding one clear sentence in Section 12 stating explicitly that the framework's reference-class claims are illustrative, not tested, would address the spirit of C3 at near-zero cost, and I encourage but do not require it.

---

## Why this isn't yet a clean Minor Revision

Two things hold this at Major Revision rather than Minor:

1. **N1 is not cosmetic.** It is now the regression carrying the paper's second most important empirical finding (the withdrawal of the "independent corroboration" claim), and it is reported with a sample size that does not exist anywhere in the repository. A referee re-reading a corrected version needs to see the actual clean-sample regression, not a promise that it would come out the same way — Referee B is explicit that the qualitative conclusion likely survives (2.4% level rise is not zero) but the regression as specified does not yet support that conclusion on its own terms.
2. **The cascade (R2-5, R2-6, R2-7) is a self-contradiction, not a stylistic residue.** A manuscript that asserts a claim in Section 3 and its negation in Section 8 cannot be read as internally consistent by any referee, regardless of how correct Section 3 is. This is the kind of defect that, left uncorrected, would draw a *third* referee round rather than a decision — better to close it now.

Both are bounded and mechanical: R2-1 is one regression re-run and three corrected numbers; R2-3 through R2-7 are placing an already-drafted qualifier at five more locations and a phrase substitution at six. Neither requires new analysis, new data, or new theory — which is why I am not moving this to Reject and expect a Round 3 submission to clear.

---

## Recommended next step

Execute R2-1 through R2-7 (required) and R2-8 through R2-12 (expected) as a bounded Round-2 fix pass, then request a fresh Round 3 from the same two referees. Given the narrow, named scope of what's left, I would expect Round 3 to be the closing round.

---

*Prepared by the editor agent (synthesizing `referee_domain_r2.md` and `referee_methods_r2.md`) per `/review-paper --peer JIE --r2`.*
