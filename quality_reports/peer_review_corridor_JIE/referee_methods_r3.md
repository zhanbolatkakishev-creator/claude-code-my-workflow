# Methods Referee Report — Round 3 (final)

**Calibrated to:** Journal of International Economics (JIE)
**Disposition:** CREDIBILITY
**Paper type:** Reduced-form (DiD + structural breaks + a value-capture calibration)
**Critical peeve:** One falsifiable sentence per identifying claim; no aggregating partial arguments into an identification strategy
**Constructive peeve:** Robustness must be tied to a named threat, not coverage theatre
**Manuscript:** `C:\Users\zh.kakishev\my-project2\Manuscript\corridor.tex`
**Round-1 report:** `referee_methods.md` (64/100, Major Revision)
**Round-2 report:** `referee_methods_r2.md` (70/100, Minor Revision conditional on N1, N2)
**Date:** 2026-09-16

---

## Executive verdict

**Score:** **79 / 100** (weighted composite 78.7; **no sanity-check cap applies this round**)
**Trajectory:** 64 → 70 → 79
**Recommendation:** **Accept**, subject to editorial corrections. No further referee round is required.
**Headline:** Both conditions are genuinely discharged. The residual-set DiD is now estimated on a sample that is clean by construction, its numbers reproduce to the digit from the regenerated output, and — the part that matters most to me — the corrected regression *reversed the author's own previously-published null in the author's favour*, and the author reported that reversal with more hedging than the new result requires rather than less.

I verified every claim in this report against the code and `_outputs/` files directly. I did not take the response letter's word on any number.

---

## Part I — The two conditions

### N1 — **RESOLVED.** The regression is clean, the numbers reproduce exactly, and the reversal is real.

I checked this three ways, because it is the item my round-2 recommendation hung on.

**1. Does the code genuinely subset to an uncontaminated control?** Yes. `06_eventstudy_did.R:44`:

```r
p_resid <- p[exposed_only == TRUE | (exposed == FALSE & surge == FALSE)]
```

with `exposed_only := exposed == TRUE & surge == FALSE` at `:36`. Since `exposed_only == TRUE` already implies `surge == FALSE`, `p_resid` is exactly the set of lines with `surge == FALSE` — i.e. **all 29 surge-basket lines are removed from both sides of the comparison**, including the 5 civilian lines that fall inside the surge basket and contaminated the old placebo. The arithmetic closes without residue: 75 total = 29 surge + 26 residual priority-list + 20 purged civilian; 26 + 20 = 46 clusters; 46 × 8 years = 368 rows. `:69–74` routes `dtv <- p_resid` for the `exposed_only` arm only, and `:98` passes `p_resid` to the wild-cluster bootstrap. The `surge` and `exposed` arms correctly keep the full panel, which is the right control set for those two. **This is precisely the specification I asked for, with no residual contamination.**

**2. Do the reported numbers exist in the regenerated output?** Yes, exactly.

| Manuscript location | Claim | `rq1_estimates.txt` | Verdict |
|---|---|---|---|
| Table 2 `:664`, Table C.1 `:1585` | γ = 1.94, s.e. 0.90 | `:98` — 1.944413, 0.9020866 | ✓ exact |
| Table C.1 `:1585` | analytic p = 0.037 | `:98` — 0.03651153 | ✓ exact |
| Abstract `:118`, note `:686`, Table C.1 `:1586` | wcb p = 0.035 | `:139` — p_wcb = 0.035 | ✓ exact |
| Intro `:119`, note `:686` | inbound γ = 1.12, p = 0.238 | `:104`, `:140` — 1.124143; p_wcb = 0.238 | ✓ exact |
| Table 2 caption `:644`, note `:684`, Table C.1 `:1585` | N = 368, 46 clusters | `:94`, `:139–140` | ✓ exact |
| Intro `:119` | residual own level rise 2.4× | `:171` — 2.4x | ✓ exact |

**3. Has the reversal propagated everywhere, with no stale text?** Yes. I text-searched the manuscript for `N = 208`, `N=208`, `26 clusters`, `-0.15`, `indistinguishable from zero`, `no independent`, `does not corroborate`. **Zero hits.** The old null's framing has been removed rather than left standing beside the new result. The corrected finding is stated consistently in all five load-bearing locations: abstract (`:49`), introduction (`:113–124`), Table 2 Panel A (`:664`) with a caption that names the defect it corrects (`:644–647`), the Table 2 note (`:683–685`), Table C.1 (`:1585–1586`), and Limitations (`:1470–1474`). The reading is the same in all five: *partial, smaller-scale corroboration, not a fully independent replication.*

**Why I weight this heavily.** The contaminated specification returned a null that was damaging to the paper, and the author had already withdrawn a claim on the strength of it across five locations. Re-running it on the control set I demanded *reversed that null into a significant positive result* — an outcome the author could have quietly banked as vindication. Instead the revision keeps the withdrawal's cautious framing ("partial," "not a fully independent replication," "not independent of the surge basket either") and adds the non-confirming half of the new result (the inbound leg remains null, γ = 1.12, p = 0.238) in the abstract-adjacent text. That is the correct asymmetry, and it is the second time across three rounds that this author has reported a result against their own interest when nobody would have checked.

### N2 — **RESOLVED**, and resolved in the conservative direction.

`06_mechanism_tests.R:60–68` and the regenerated `mechanism_tests.txt:55–63` no longer assert that no search was run. They now state that a WebSearch-based announcement search on the same 2022–2025 window for electrical-machinery, component and instrument capacity **was** conducted separately, that it turned up no comparable named project, and — this is the part I did not ask for — that it "is treated in the paper as a weaker check than this auto-sector triangulation, not an equally thorough symmetric search: the auto-sector evidence draws on more extensive public reporting on that sector specifically."

The manuscript at `:1029–1037` now says the same thing in the same words. The cross-artifact contradiction is gone, and the reconciliation moved *toward* the referee's original C6 critique rather than away from it: the author downgraded their own evidence rather than upgrading the script comment to match the paper. That is the right direction of travel.

Residual (minor, not blocking): the manuscript sentence still *opens* with "A symmetric announcement search…" (`:1030`) and then denies symmetry two sentences later (`:1035`). One word — "parallel" — removes the self-contradiction. And no search protocol (strings, sources, dates, hit list) is documented anywhere in the repository for either this search or the Türkiye/Georgia one; a short appendix note would close the last gap. Neither is a condition.

---

## Part II — Pre-scoring sanity checks

| Check | R1 | R2 | **R3** | Evidence |
|---|---|---|---|---|
| Sign | PASS | PASS | **PASS** | Unchanged; the new γ = 1.94 is positive, as the reorientation story predicts, and the inbound null is reported rather than suppressed. |
| Magnitude | **FAIL** | PARTIAL | **PASS** (one caveat) | All three round-1 defects cured. The star on the surge-basket outbound row is now removed (`:662` — "2.44 (0.96)", no star), which was the sole basis for the round-2 PARTIAL. Caveat: the "roughly a fifth" cross-row ratio is asserted without a derivation (M1), and the `**` survives on the surge row's KZ-imports column. |
| Dynamics | PARTIAL | PASS | **PARTIAL** | Fine for the surge arm (2018 coefficient 0.19/0.90/p = 0.835; pre-trend Wald p = 0.777 outbound, 0.415 inbound). But the newly load-bearing residual row has **no pre-trend test on its headline outcome**: `:102–107` runs `wald()` only on `p`/`surge`, and `:78–79` prints the residual arm's event study for `mirWC_usd` only, not `expRU_usd`. See M2. |
| Clustering | PASS | PASS (caveat) | **PASS** (exemplary) | The caveat is cured. At 46 clusters the paper privileges the wild-cluster bootstrap and states outright that "analytic cluster-robust $p$ is unreliable at this cluster count" (`:680`). Restricted-residual Rademacher, B = 1999, clustered at the assignment level. This is how it should be done. |
| **Sample** | PASS | **FAIL** | **PASS** | The round-2 FAIL is fully cured. N = 368 / 46 clusters is producible from the code, reproduces from the output, and is reported identically in four places. |

**No FAIL is recorded. The round-2 cap is lifted.** The composite stands at its weighted value for the first time in three rounds.

---

## Part III — Disposition of every prior concern

| # | Concern | R1 | R2 | **R3** | Basis |
|---|---|---|---|---|---|
| C1 | Main-text DiD stars a non-identified coefficient | — | Partial | **Resolved** | Star removed from the surge-basket outbound row (`:662`); caption and note both direct the reader to Panel C. One `**` survives on the KZ-imports column — see M3. |
| C2 | "External corroboration" shares 24 of 29 lines | — | Partial | **Resolved** | The clean test now exists, is significant, and is characterised as partial rather than full corroboration in all five locations. |
| C3 | "Tenfold" computed on a basket selected for large ratios | — | Partial | **Resolved** | 3.5× attached to "tenfold" at both first appearances (abstract `:44–45`, intro `:95`); new Table 1 row (`:492`) with year-by-year priority-list levels; note `:497–499` gives the ratio. I re-derived it from the printed cells: (82+89+59+61)/4 = 72.75 and (306+293+229+187)/4 = 253.75, ratio 3.49 — matches `rq1_estimates.txt:170` exactly. |
| C4 | Break-date CI has no HAC correction | — | **Resolved** | **Resolved** | Unchanged. |
| C5 | West+China increment mixes bases | — | **Resolved** | **Resolved** | Unchanged. |
| C6 | Auto-vs-components pairs searched against unsearched | — | Partial (contradicted) | **Partial — adequately disclosed** | The contradiction is gone (N2) and the asymmetry is now stated in the paper itself as a limitation rather than papered over. The underlying asymmetry remains, correctly, un-fixable without a greenfield register; the paper says so at `:1449–1462`. No protocol documented (minor). |
| C7 | Value-capture headline leads with a chosen parameter | — | Partial | **Partial — adequately disclosed; I withdraw the substantive ask** | (2) and (3) are done: the abstract now carries the unconditional threshold ("a reading that holds for any margin under about a fifth," `:54`) and the 0.34 estimate is engaged quantitatively (`:855`). On (1) — the author's claim that no change was needed — **I judge this a fair claim, not a dodge.** I re-read `:821–826` and `:1638–1643` against `08b_kz_bns_io.R:120–127`, and the manuscript never called 48% a wholesale-only anchor; it says the table "does not separate wholesale from retail, so it cannot independently validate a band meant to exclude the retail leg," and the script's own comment says the same. My round-2 complaint was accurate about the *response letter* and inaccurate about the *manuscript*; the author is right to say so, and I record the correction against myself. The ISIC-46 computation remains untried, but the paper now states why the available table cannot support it, which is enough. |
| C8 | Abstract says "rules out"; body says "illustrative" | — | Partial | **Resolved** | I grepped `rules out\|ruling out\|rule out` myself. Seven hits survive; **every one is legitimate**: five are power statements about the Poisson test ("rule out only a large response, not a modest one" — `:56`, `:143`, `:892`, `:916`) and one is an explicit concession against the author ("it cannot rule out that Kazakhstan's absence of an electronics industry is equally consistent…", `:330`). All four capital-market/institutional-gate instances are now "is inconsistent with" (`:380`, `:997`, `:1062`, `:1386`). This is a clean fix. |
| N1 | Residual DiD run against a contaminated control; N misreported | — | MAJOR | **Resolved** | Part I. |
| N2 | Manuscript/repo contradict on the components search | — | MAJOR | **Resolved** | Part I. |
| N3 | Kyrgyz break dated 2019, not 2022 | — | Minor–Major | **Resolved** | Table E.1 has a "largest jump" column (`:1725`) disclosing Kyrgyz Republic and Georgia at 2019 against Armenia/Türkiye at 2022, with an explanatory note at `:1738–1746` that explicitly credits the referee item and states the correct reading. The in-text claim is rescoped at `:108–110`, `:236–238`, `:534–535`, `:1395–1396`. One location was missed — see M4. |
| N4 | B = 814 cyclic-shift retention rule undocumented | — | Minor | **Not addressed (accepted)** | Deferred by design. I do not press it. |
| N5 | Stray malformed line in `rq1_did_robustness.txt:20` | — | Minor | **Not addressed (accepted)** | Raw-output cosmetic; no manuscript claim depends on it. |

**Summary: 8 Resolved, 2 Partial-but-adequately-disclosed, 2 accepted-as-deferred, 0 Not addressed.** Both round-2 blocking items are discharged.

---

## Part IV — New items this round

None rises to MAJOR. None is a condition of my recommendation. Listed in the order I would want them fixed at proof stage.

### M2 (the one I would most like to see) — the newly load-bearing residual row has no pre-trend test on its headline outcome
**Dimension:** 2 (Estimation) · **Severity:** MODERATE

γ = 1.94 on `expRU_usd` now appears in the abstract and the introduction. But `06_eventstudy_did.R:102–107` runs the pre-trend joint Wald test only on the full panel with `surge` as treatment, and `:78–79` prints the residual arm's event study only for `mirWC_usd`. So the paper's newly promoted estimate has neither an event-study figure nor a pre-trend test on the outcome it is quoted for. The indirect evidence is reassuring — the residual arm's *inbound* event study (`rq1_estimates.txt:128–130`) has flat pre-period coefficients (0.22/0.50, 0.29/0.25, −0.03/0.30) — but that is the outcome where the result is null, not the one carrying the abstract.

**What would change my mind:** add `mk(p_resid, "expRU_usd", "exposed_only")$es` to the printed block and run `wald(..., keep = "t_rel::-[2-9]")` on it. Two lines of code, one number in the Table C.1 stub. I expect it to pass; I want it on the record because the row is now quoted in the abstract.

### M1 — "roughly a fifth of the shared lines' scale" is asserted twice with no supporting estimate
**Dimension:** 1 (Identification), 4 (Measurement) · **Severity:** MODERATE

The claim appears in the Introduction (`:122–123`) and in Limitations (`:1472–1473`). The **24 shared lines' own DiD coefficient is never estimated** — it appears in no table, no appendix, and no output file. So the paper compares its new estimate against an object it has not computed. I tried to reverse-engineer the ratio and found five plausible derivations giving 0.21, 0.35, 0.39, 0.57 and 0.67; the "fifth" appears to come from the *level ratios* (2.4× / 11.6×), which are residual-vs-surge-basket, not residual-vs-shared-lines. This is exactly my standing peeve: a quantitative claim with no falsifiable derivation.

Nothing turns on it — every candidate ratio is below one, so the qualitative reading ("partial, smaller-scale corroboration") holds under all of them.

**What would change my mind:** either (a) run the 24 shared lines as treatment against the same purged control and report the ratio, or (b) delete four words and write "at a smaller magnitude." **(b) fully discharges this.** I recommend (b).

### M3 — Panel A rows are not estimated against a common control pool, and one `**` survives
**Dimension:** 1 (Identification) · **Severity:** MINOR (and it runs in the author's favour)

Rows 1–2 of Panel A use the full 75-line panel as control; row 3 uses the 20-line purged civilian set. A reader comparing 2.44, 2.88 and 1.94 down the column is comparing three different counterfactuals. Worth one clause in the note.

There is a pleasing corollary the paper could claim and does not: now that the 26 residual lines are *established* to be genuinely treated (γ = 1.94), the surge-basket row's own control pool is known to contain 26 treated lines, so γ = 2.44 is attenuated. The direction is conservative for the paper's headline, which is why I record it as an observation rather than a concern — but the symmetry is worth a sentence, and it is the mirror image of the defect I raised as N1.

Separately, the `**` on the surge row's KZ-reported-imports column (`:662`) survives. It is defensible — that outcome's random-basket randomisation inference gives p = 0.003 (`rq1_estimates.txt:162`) — but Panel C prints only the outbound RI, so the reader cannot see the defence. Either print the other three RI rows in Panel C or drop the star.

### M4 — one unreconciled N3 location
**Dimension:** 4 (Measurement) · **Severity:** MINOR

`:1109–1111` still reads "Armenia and the Kyrgyz Republic received the same shock, with surge-basket exports to Russia rising several-fold and breaking in 2022 on the same timing." The response letter lists four in-text locations rescoped; this fifth one (the moderators section) was missed. Apply the same "elevated from 2022 on a noisier series" language.

### M5 — LaTeX was not compiled; I checked the table structure independently
**Dimension:** 6 (Replication readiness) · **Severity:** MINOR (largely discharged)

Since I read the `.tex` source directly, I verified column arithmetic for every table the revision touched:

| Table | Spec | Columns | Edited rows | Verdict |
|---|---|---|---|---|
| Table 1 | `{lrrrrrrrr}` | 9 | `:492` new priority-list row | 9 cells ✓ |
| Table 2 | `{@{}lcccc@{}}` | 5 | `:662`, `:664` | 5 cells ✓; `\multicolumn{5}` panels ✓ |
| Table C.1 | `{@{}lrrr@{}}` | 4 | `:1585`, `:1586` | 4 cells ✓ |
| Table E.1 | `{@{}lrrrrrrrrrrc@{}}` | 12 | `:1725` header + 5 rows | 12 cells ✓ |

Brace balance and `$…$` pairing are sound in all four blocks. **The compile risk on the revised content is low.** A compile pass is still required before submission for reference/label resolution, but I do not treat it as a residual risk on anything I have reviewed.

One presentational defect I caught by reading the source that a compile would *not* have flagged: Table 1's new priority-list row is indented with `\quad\emph{}` directly beneath "Kazakhstan → Russia," which reads as an "of which" subset. It is not a subset — the 50-line priority list is a different, larger set overlapping the 29-line basket in 24 lines, and the row's own numbers give it away (82 > 17 in 2018). Un-indent it and relabel, e.g. "Priority list (50 HS6), overlapping comparator."

---

## Part V — Dimension scores

| # | Dimension | Weight | R1 | R2 | **R3** | Weighted | Δ (R2→R3) |
|---|---|---|---|---|---|---|---|
| 1 | Identification | 35% | 55 | 68 | **76** | 26.60 | +8 |
| 2 | Estimation | 17% | 58 | 70 | **76** | 12.92 | +6 |
| 3 | Inference (SEs, clustering, MHT) | 13% | 65 | 72 | **78** | 10.14 | +6 |
| 4 | Measurement / calibration transparency | 15% | 62 | 70 | **79** | 11.85 | +9 |
| 5 | Robustness | 12% | 84 | 86 | **87** | 10.44 | +1 |
| 6 | Replication readiness | 8% | 82 | 80 | **84** | 6.72 | +4 |
| | **Weighted composite** | 100% | 63.5 | 72.3 | | **78.7 → 79** | +6.4 |
| | **After sanity-check cap** | | 64 | 70 | | **79 (no cap)** | +9 |

Notes on the largest movers. **Identification (+8):** the clean residual test converts the priority list from decorative corroboration into partial-but-real independent evidence — the single largest structural improvement across three rounds; C8's resolution removes the last over-claim; N3's disclosure removes a leg of the neighbour argument that was not earned. **Measurement (+9):** C3 fully closed with arithmetic I re-derived independently, C7 substantially closed and correctly bounded, N3 disclosed with a diagnostic that works against the author. **Replication readiness (+4, recovering the round-2 loss and then some):** the `mechanism_tests.txt` contradiction is gone, and the practice I flagged as worth standardising in round 2 — every revision-driven code block carrying an inline comment naming the referee concern it answers (`06_eventstudy_did.R:37–43` is the best example I have seen of this) — is what let me verify this entire round against source in well under an hour. I would like to see this become a norm.

---

## Part VI — Recommendation

**Accept**, subject to editorial corrections. **No further referee round is required, and I do not need to see the paper again.**

My round-2 recommendation was a Minor Revision conditional on N1 and N2. Both conditions are discharged — verified against the code and regenerated outputs, not the response letter. The conditional therefore converts, and I am converting it decisively, as the final-round protocol requires.

**Editorial corrections (none is a condition; priority order):**

1. **M2** — add the pre-trend Wald test and event study for the residual arm on `expRU_usd`. Two lines of code. The only one I would ask the editor to confirm in the proof file, because the row is quoted in the abstract.
2. **M1** — delete "roughly a fifth of the shared lines' scale/magnitude" at `:122–123` and `:1472–1473`, replacing with "at a smaller magnitude."
3. **M4** — rescope the surviving "breaking in 2022 on the same timing" for the Kyrgyz Republic at `:1109–1111`.
4. **M5** — un-indent and relabel Table 1's priority-list row; run a full LaTeX compile.
5. **M3** — one clause in the Table 2 note stating that row 3's control pool differs from rows 1–2; and either print the remaining three randomisation-inference rows in Panel C or drop the `**` from the KZ-imports column.
6. **N2 residual** — change "A symmetric announcement search" to "A parallel announcement search" at `:1030`; add a short appendix note documenting the two WebSearch protocols (strings, sources, dates).

---

## Summary for the editor

Three rounds, and the thing I want on the record is how this author behaves when a referee's demand cuts against them. In round 2 I found that the regression carrying the paper's most prominent withdrawal was estimated against a control pool containing the treated lines, reported with a sample size that existed nowhere in the code. I asked for it to be re-run on a clean control. It was — and the correction **reversed the null into a significant positive result**, which the author could have banked as vindication. Instead the revision keeps the cautious framing throughout ("partial," "not a fully independent replication"), carries the non-confirming inbound leg into the same sentence as the headline, and names the defect it corrects in the table caption itself. The second condition — a manuscript claim the replication package directly denied — was resolved by *downgrading the author's own evidence* to match the script rather than upgrading the script to match the paper.

I independently verified every load-bearing number against `_outputs/`: γ = 1.94, s.e. 0.90, wcb p = 0.035, N = 368, 46 clusters — all exact; the Table 1 selection-free ratio re-derived from the printed cells to 3.49 against the code's 3.5×; zero surviving instances of the stale "N = 208" or "−0.15"; all four "rules out" over-claims correctly softened, with the seven surviving instances all legitimate power statements. I also re-checked one of my own round-2 complaints (C7's BNS characterisation) and found the author's rebuttal correct and my complaint misaimed at the manuscript when it belonged to the response letter; I have recorded that correction against myself above.

What remains is six editorial items, the largest of which is a two-line code addition to put a pre-trend test on the record for a row now quoted in the abstract. None of them changes a conclusion. The identification story the paper finally tells — break dates, raw levels, a neighbour comparison, and a partially-independent priority-list DiD, with the data-selected basket's magnitude explicitly disowned — is one I can sign off on, and it is a materially stronger and more honest story than the one the paper told in round 1.

**64 → 70 → 79. Accept, subject to editorial corrections.**
