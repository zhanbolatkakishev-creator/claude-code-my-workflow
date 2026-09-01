# Lens 3 — Methods / Identification — ROUND 3

**Manuscript:** `Manuscript/corridor.tex` (982 lines)
**Verdict:** REVISE — 3 CRITICAL, 14 MAJOR, 7 MINOR. **Score 6.5/10** (round 2: 5).

> Reconstructed from the agent's completion payload (the subagent could not write to disk this session).

## Part I — the five round-2 CRITICALs

| R2 | Status | Note |
|---|---|---|
| C2 RI not matched to selection rule | **RESOLVED** | `12_did_robustness.R:30–66` is a genuine rule-matched permutation; §4.3 reports both halves against the paper's interest — existence P(≥29)<0.001, magnitude null-mean γ 2.79 > observed 2.44. Old uniform-random p=0.009 gone from the text. |
| C3 §5.2 freight-netting incoherent | **PARTIAL — new CRITICALs same paragraph** | Freight-netting gone; censoring artifact now named. But `m` still uncited (L3-2) and the new under-invoicing bound is not derivable and wrong by ~2.5× (L3-1). |
| C4 Fig 3 saturated regression | **RESOLVED** | `fig:es` → `rq1_fig_eventstudy.png` from `feols(y ~ i(t_rel, TR, ref=-1) | hs6 + tt)` on both outcomes with real CIs. |
| C5 negative placebo spun | **RESOLVED** | "Sharpens the contrast" deleted; size-decile×year DiD run (γ 2.29, p 0.003); placebo star → `**`. |
| C6 §8 ARM/KGZ "deal data show one" | **RESOLVED** | Sentence gone; §8 states the opposite; full 2018–2025 series; ARM +3.3pp disclosed. |
| C7 unrun drop-2022 check | **RESOLVED** | `12_did_robustness.R:101–109`; γ 2.713 (p 0.012). |

Also in: M1 stars, M4 2015-zero label, M5 both flow-through bases, M6 inbound demoted, M8 weight statistic, M10 BNS I-O, M12 neighbour series, M13 exact rule. **Substantial good-faith revision.**

## Part II — CRITICAL

### L3-1 (CRITICAL) — §5.2 under-invoicing bound is not derivable and, corrected, reverses
The sentence ("for domestic VA to reach one-fifth of the gross flow the retained margin would have to be ~25%… would require exports to Russia to be under-recorded by roughly 40% — an order of magnitude larger than the mirror-gap discrepancies typical in this literature") is computed nowhere in the scripts. `reproducibility_audit_corridor.md:105` "verifies" it by assuming the margin scales linearly with recorded export value. With `m=(E−C)/E`, `C` fixed, an uplift `E*=kE` gives `m*=1−(1−m)/k`, so `k=(1−m_obs)/(1−m_target)`:

| baseline m | k for m*=0.254 | implied under-recording |
|---|---|---|
| 0.14 | 1.153 | 13.3% |
| 0.10 | 1.206 | 17.1% |
| 0.06 | 1.260 | 20.6% |

13–21% is *inside* the mirror-gap range this literature routinely finds (incl. the Chupilkin et al. onward-transit gaps the paper cites as its own identification). The sentence's conclusion flips: a typical amount of under-recording *would* be enough. Only quantitative defence of the headline 5–11%; the one number in §5 with no script behind it. Thesis survives (20% vs 76% is still 1-in-4); the claim that under-invoicing cannot move it does not.

### L3-2 (CRITICAL) — m = 6–14% is uncited, absent from §3, exists only as a code comment
`VA = m · v̄^TT`, with `v̄^TT ≈ 0.79 ≈ v̄^M = 0.76` — §5.2 concedes "the propagation step does little work: the result is essentially m." No `\cite` anywhere near it (grep `national-accounts` → 4 hits, none cited); §3 Data lists Trade / Product sets / I-O / Deal data / Macro with no national-accounts source; `08_io_propagation.R:12–13` carries it as a comment, exactly as round 2, when the synthesis flagged it and required "cited to a source." An economy-wide TIF convention; no argument for why it transfers to high-value electronics under a transit regime. A calibration presented as an estimate, driving abstract/§1/§5.2/§10.

### L3-3 (CRITICAL) — §7 Test D has no pre-period and no denominator; §3 over-states the QIC register
1. **No pre-2022 baseline.** Table 3 / `mechanism_tests.txt:7–13` are a 2022–2025 cross-section only. `qic_data_fields_needed.md:44–47`: "a curated set of recent flagship projects cannot support" a pre/post claim.
2. **No denominator.** 1 of 50 projects in a sector with $230m gross output (§9) in a ~$260bn economy ≈ 2% of projects for ~0.1% of output — arguably over-weight.
3. **Provenance over-stated.** §3 asserts the register "is a public disclosure of the fund (QIC/Baiterek); the replication package pins the release date… and lists the fields drawn from it." `qic_data_fields_needed.md` is a live request to QIC for exactly those fields, under "Essential fields (the paper cannot be replicated without these)."

Round 2 relabelled Test F "illustrative"; Test D got two interpretation caveats, none about design. The abstract leans on Test D ("captive state capital abstained too").

## Part III — MAJOR (14)
- **L3-4** §4.3 reads its own selection numbers backwards ("inbound criterion close to redundant… operative screen is the outflow"): `rq1_did_robustness.txt:19` inbound 41, outbound 55 — inbound is the *rarer* screen. `12_did_robustness.R:83–84` prints a buggy line too.
- **L3-5** CHPL/priority list called "pre-specified" / "not selected on the outcome" — it is the Feb-2024 EU/US/UK/JP list, compiled two years into the sample by sanctioning authorities partly from observed diversion through these countries. Now load-bearing (permutation removed surge-γ from identification). Under-used: the external basket gives γ 2.88 (SE 0.74) — larger and tighter than the outcome-selected 2.44.
- **L3-6** asinh → levels two ways: "about threefold" (abstract/§1) vs "roughly a tenfold rise" (§4.2); exp(2.44)≈11.5, "threefold" is the PPML exp(1.262)=3.53 silently attached to the asinh γ. No Bellemare–Wichman / Chen–Roth, no units statement, no extensive-margin discussion.
- **L3-7** §5.1 c.i.f./f.o.b. gap 0.73 vs 1.6 attributed to "roughly the inbound freight" → freight ≈ 119% of goods value, vs the 6–14% TIF margin 20 lines later. Denominators differ in reporter, partner set and basis simultaneously.
- **L3-8** "no weight gain" does not follow from a ratio of 0.08 — confounds share of tonnage re-exported with per-unit weight change; `share > 1.05` = 0.11 annual, 0.19 monthly, unreported. Appears 4× incl. abstract.
- **L3-9** "no mass at the high multiples" contradicted by the paper's own tiers: p75 = 4.40; CHPL tier 2 median 3.83 ($150.8m gross), tier 4A 3.94 ($67.4m) — ~42% of matched outbound flow at ~4×. Round-2 M7 reworded, not fixed.
- **L3-10** selective reporting of size-decile×year check: `mirWC_usd` falls 2.099 → 1.280 (−39%) under the same control reported as passing for the outbound. That is the outcome the abstract's "imports rise in step" rests on.
- **L3-11** permutation null = within-line exchangeability of years → destroys secular trends; §3 says the China inbound flow was "already large and rising well before 2022"; so P(≥29)<0.001 rejects "no trends," not "no reorientation." Also 200/2000 draws dropped non-randomly.
- **L3-12** Eq. (2) multiplicative gates do not follow from Eq. (1) additive NPV threshold; "a closed gate anywhere drives R to zero" is asserted; §8 re-claims "the framework's testable content is…" which §1/§2 disclaim.
- **L3-13** the wedge measures μ_T; §2 calls it "a direct measurement of this parameter [μ_P ≤ μ_T]" and §7 asserts μ_P ≲ μ_T — μ_P is a counterfactual Kazakhstan does not produce.
- **L3-14** "no contamination between surge and control baskets" asserted as identifying, contradicted by outputs: control basket's exports to Russia break in 2022 (supF 34.4, p 1.5e-07); 5 civilian HS6 in the surge basket (5.1% of post-2022 flow); Table 2 placebo uses the unpurged 25 lines though a purged 20-line variant exists.
- **L3-15** wild-cluster-bootstrap rationale still the wrong one (single common date → cross-sectional dependence, Donald–Lang / Conley–Taber; the bootstrap over HS6 addresses few clusters + serial correlation). The paper now has the right tool (permutation) — wording fix + pointer.
- **L3-16** §6's headline zero has no expected count and no pre/post contrast (count is 0 in both periods; MDE ≈ 1.8× is about the sector-aggregate count, not this zero).
- **L3-17** Kazakhstan's own +1.0pp GFCF (`crosscountry.txt:17`) is unreported while Armenia's +3.3pp is reported as a complication.

## Part IV — MINOR (7): L3-18 "drop 2022" and "TREAT=2023" are the same regression + neither tests anticipation; L3-19 §5.2 benchmarks v̄^M=0.76 vs Table 6's 0.69 for the actual counterfactual sector; L3-20 only inbound event-study coefficients printed though the text describes the outbound path; L3-21 "$22m/4yr" is the mid-cell of a $9.6–38.3m grid, cleared_share=0.75 not stated; L3-22 2015 zero is a coverage-ramp risk (excluding it: pre-mean 8.5, RR 0.88), disclose direction; L3-23 frequency sensitivity unreported (retained share 0.343 annual vs 0.434 monthly); L3-24 §2 mediation paragraph asserts signs and a polar case nothing estimates.

## Answers to the brief (condensed)
1. Parallel trends stated/tested/reported ✔; no-anticipation mislabelled (L3-18); SUTVA asserted & contradicted (L3-14); RI correctly rule-matched, existence vs magnitude correctly separated, magnitude concession honestly reported in §4.3 + §10 — **not buried**; the gap is that neither abstract nor §1 carries any hint of it.
2. asinh caveat entirely absent + two contradictory level translations; PPML is internally consistent and should carry all level statements.
3. supF tension **handled well** — §4.2 states the insignificant annual W+China break where the claim is made and explains it.
4. §5.2 now an assumption-driven calibration with the key parameter assumed and uncited (L3-2) + a broken sensitivity bound (L3-1). BNS cross-check is real work, not theatre (independent source; moves against the paper; adverse direction reported). It does not cross-check `m`.
5. §5.1 wedge sign coherent, magnitude incoherent (L3-7); descriptive-only framing correct and explicit ✔.
6. Framework is an organizing narrative correctly labelled — but Eq. (2) asserted (L3-12), §8 re-claims testable content. Test F properly downgraded; **Test D not held to the same standard** (L3-3).
7. Deal-count null **adequately bounded and prominent** (MDE ≈ 1.8× in §6, §1 and abstract). Only over-reach: the surge-line zero (L3-16).
8. §8 **used appropriately** — suggestive, collinearity conceded, ARM contrary GFCF disclosed. Only gap: L3-17 (KZ's own +1.0pp).

## Meta-note (recurring from round 2)
Both §5.2 CRITICALs are numbers that exist only in the `.tex` with no script — and `reproducibility_audit_corridor.md:105` "verified" the under-recording bound against a derivation reconstructed from the manuscript's own claim, so the audit structurally could not catch it. Hand-derived `.tex` numbers are the residual risk surface; a render-from-`_outputs/` build step (proposed round 2) would close it.

```
scorecard:
  lens: "3. Methods"
  critical: 3
  major: 14
  minor: 7
  score_out_of_10: 6.5
  one_line: "Four of five round-2 CRITICALs genuinely fixed and the DiD section is now close to publishable; remaining weight has shifted to §5.2 (headline calibrated on an uncited parameter, sensitivity bound wrong by 2.5x and reverses when corrected) and §7 (captive-capital test with no pre-period, no denominator, over-stated data provenance)."
```
