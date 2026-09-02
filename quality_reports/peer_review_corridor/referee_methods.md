# Methods Referee Report (Referee B) — /review-paper --peer JCE

**Calibrated to:** Journal of Comparative Economics · **Disposition:** MEASUREMENT
**Paper type:** theory+empirics / descriptive hybrid
**Critical peeve:** Value capture rests on an assumed 6–14% margin `m` — how much of the headline is calibration?
**Constructive peeve:** Credit a case that genuinely *discriminates* the three gates rather than illustrating them.
**Date:** 2026-09-01 · **Paper:** `Manuscript/corridor.tex` (commit b2c3368)

> Reconstructed from the referee agent's completion payload (subagent could not write to disk).

## Executive verdict: **64/100 — Major revision (R&R)**

The measurement of the *shock* is careful and unusually honest; the measurement of what Kazakhstan *retains* is a calibration wearing input–output clothing; one of the two pieces of evidence against transformation does not measure transformation; and after the paper's admirable concessions the case identifies a *plausible* irreversibility gate, not a *binding* one.

## Pre-scoring sanity checks — **4 FAIL** (composite capped at 70)

| Check | Result | Evidence |
|---|---|---|
| Prediction sharpness | **FAIL** | Eq. (2) multiplicative: R≈0 whenever any gate ≈0. Observed R≈0 consistent with 1/2/3 closed gates; no comparison varies one gate holding others fixed. §2 says open market-access gate is "close to sufficient" — a sufficient cause screens off the rest. |
| Power — headline deal null | PASS | MDE ≈ 1.8× at 80% power; §6 scopes the claim correctly. Exemplary. |
| Power — surge-basket-line null | **FAIL** | "No transaction 2015–2025" rests on 1 pre + 1 post obs; no MDE; presented as the *strongest* of three features, inferentially the weakest. |
| Honest reporting of non-confirming results | **PASS (strong)** | permutation γ 2.79 > estimate 2.44 reported; placebo wrong-signed reported; drop-HS85 kills significance reported; "does no work" reported; auto deals fell 6→3 reported; Armenia GFCF rose reported. |
| Construct validity — `m` | **FAIL** | `m` hand-set inside a BNS bracket [0.01, 0.49]; ratio = 1.03·m; headline ratio *is* the chosen number ±3%; no sensitivity map. |
| Construct validity — "no weight gain" | **FAIL** | median kg_out/kg_in = 0.084 ≈ value flow-through 524.3/4925.2 = 0.106 — the tonnage ratio tracks the value ratio, so it's uninformative about transformation. |
| Validation / benchmarking | PARTIAL | BNS cross-check validates v̄^TT/v̄^M (which the paper concedes do no work); `m` cross-checked against nothing. |
| Construction transparency | PASS | 118 PASS / 0 FAIL; Appendix A query spec; per-source deal IDs; sessionInfo + renv.lock. |
| Break inference | PASS | 2022m5 [m4,m6] on all three series; refusal to read sup-F cardinally is correct. |
| Clustering / inference | PASS w/ qualification | HS6 (75) + wild bootstrap (B=1999, p=0.010) + Holm; cross-sectional dependence from a single common date acknowledged, delegated to RI. |

| Dimension (JCE weight) | Score | Weighted |
|---|---|---|
| Identification (30) | 72 | 21.6 |
| Mechanism / framework discrimination (25) | 58 | 14.5 |
| External validity / generalisation (20) | 62 | 12.4 |
| Measurement / construct validity (17) | 52 | 8.8 |
| Replication (8) | 88 | 7.0 |
| **Composite** | | **64** |

## Major concerns

**1. The §5 headline is a calibration with no sensitivity map.** ratio = m·0.787/0.764 = 1.030·m — to within 3%, the headline *is* the number the author selected; every downstream figure (5–11¢, $23–53m, "one-tenth") inherits it. The 6–14% band is "defended" against a 1%-to-49% BNS bracket by asserting it "sits in the lower part". The paper's own §5.2 already contains the route to m≈25% (under-recording 13–21%, "within the range found for transit trade") and 34% (censored matched-cell), at which "corridor, not factory" becomes "a third", not "a tenth". Abstract/§1/§10 report only the one-tenth version.
→ *Change my mind:* (1) a sensitivity figure with m on [0.01, 0.49], four anchors marked (transport-only 1%, band 6–14%, censored margin 34%, full 49%), stating the m at which "corridor not factory" stops being right; (2) an external anchor for 6–14% that isn't the author's judgement (BNS *wholesale-only* rate; regional freight-forwarder / electronics-wholesale gross margins; KZ BOP c.i.f./f.o.b. wedge for HS 84/85); (3) one sentence in the abstract/§1 that the band *width* is chosen; (4) do **not** add more I-O work.

**2. The weight ratio does not measure "no weight gain".** median kg_out/kg_in = 0.084; in the same cells value_out/value_in = 0.106 — same number. ~9/10 of imported tonnage never leaves for Russia (domestic absorption / onward to third destinations / mirror overstatement — the gap §5.2 says it "cannot separate"). An aggregate tonnage ratio is uninformative about transformation when flow-through is partial. §5.1's other feature (the wedge) the paper concedes isn't distinctive (0.73/1.6 vs control 0.59/0.94; slope significant in 1 of 2 specs) — so "no sign of domestic transformation" (in the abstract) rests on nothing that discriminates the surge basket from ordinary Kazakh trade, which undermines §2's μ_P ≲ μ_T corollary (the market-access-gate pivot).
→ *Change my mind:* recompute *per unit* — median[(netWgt_out/qty_out) ÷ (netWgt_in/qty_in)] across matched cells sharing a quantity unit, with the tier breakdown; or condition the tonnage test on near-pure-transit cells (flow-through ≈ 1). Explain the p75 = 0.49 and the 11% of cells > 1.05.

**3. "About threefold" should not appear in the abstract or §1.** Rule-matched RI: placebo γ mean 2.791 (p95 5.367) vs observed 2.441 → p(|perm γ| ≥ |obs|) = **0.576**. The null distribution *conditional on the selection rule* is centred above the estimate. The three favourable p-values (wild-bootstrap 0.010, Holm 0.039, random-basket RI 0.009) condition on the *basket*, not the *rule*.
→ **Ruling:** No — "about threefold" may not be a headline number in the abstract/§1; it may stay in §4.3 as a descriptive magnitude with the rule-matched caveat in the same sentence. **What survives:** the existence result — P(rule selects ≥ 29 | H₀) = 0.000 under both the free permutation and the trend-preserving cyclic-shift null — is well-constructed and publishable as-is; it's the strongest statistical evidence in §4.
→ *Change my mind:* (a) report the rule-matched RI p (0.58) as a Table 2 row; remove "threefold"/3.5× PPML from abstract/§1, keep the raw tenfold level rise + the monthly break; **or** (b) promote the externally defined priority list to the headline spec (γ = 2.88, p = 0.0002) and demote the surge basket to robustness — the cleaner fix, one paragraph away; add a sentence distinguishing selection-on-product-characteristics from selection-on-the-Kazakh-outcome-the-regression-uses.

**4. Low ρ is asserted; Table 1 contradicts it; §7's conclusion rests on it.** §7 "the transitory condition is observed, not assumed" — evidence is a within-2023 decline ($15m→$9m/mo). But annual outbound is 128/145/119/133 across 2022–25 — flat at ~10× baseline, no trend, 2025 > 2024; §8 concedes "Kazakhstan's persist" (vs ARM 71/93/42/13, KGZ 12/30/12/12). The 2023 decline is a level correction from a Sept-2022 spike to a plateau, not decay; and monthly reporting stopped after Feb 2024, so the only decay evidence is one half-year. Ex post this is a **high**-ρ realisation. The evidence *does* support high σ (policy-contingent, EU 11th-package monitoring provision, compliance risk) — and §2 says Ω rises in σ, so high-σ/high-ρ delivers the same null. But low ρ is the sole thing that makes the durable-vs-transitory auto comparison a comparison, supplies Table 5 row 1, and frames Vietnam/Mexico as "structural".
→ *Change my mind:* (1) re-label the mechanism as σ (policy contingency / uncertainty) throughout §7/Table 5/§8; state the low-ρ reading is *ex ante* expectation, not observed outcome — this is *more* defensible; (2) or produce *ex ante* evidence of expected persistence (sanctions-package announcement dates, contract tenors) and say the ex post series went the other way; (3) put the 2022–25 annual outbound series into §7 as a direct counterpoint.

**5. What survives §7's concessions is a *plausible* gate, not a *binding* one.** §2: open market-access gate is "close to sufficient" → in a multiplicative model where only R≈0 is observed, a sufficient cause screens off the others. Neither offered piece supplies within-gate variation: the QIC pipeline varies the *institutional* gate holding the others fixed (real work — rules out institutions as the binding constraint for the shock-specific null — but silent between market access and irreversibility); the auto comparison varies ρ, I, destination *and local content* at once, and local content **is** the market-access gate. Also unconfronted: §9's logistics-platform opportunities have an *open* irreversibility gate (multiplier 0.82) and *also* go unfunded except by directed state capital — that points *toward* the institutional gate binding and *against* irreversibility.
→ **Ruling:** the case identifies (a) the market-access gate as open and (b) the institutional gate as *not* the binding constraint for the shock-specific null — it does **not** identify irreversibility as binding. The abstract's "suggestive that the irreversibility gate binds" and §10's "adverse on the first two" overstate the evidence. (a)+(b) are still a real contribution that clears the JCE bar *if the claim is trimmed to them*.
→ *Change my mind:* (1) a within-country contrast holding market access fixed, varying ρ/σ (logistics-platform vs surge basket) — confront its answer; (2) run the symmetric press/announcement search for component/electronics/precision assembly 2022–25 (a null would strengthen the paper); (3) failing both, downgrade throughout to "(a) + (b); whether irreversibility independently binds cannot be determined from this case."

## Minor (selected)
- The DiD battery is **not theatrical** — each element targets a named threat and two return unfavourable answers the paper reports. On the record.
- The inbound leg is systematically weaker (W+China γ 2.10→1.28 with size×year; Western 1.73 p=0.08; annual sup-F 4.12 n.s.; wild-BS p 0.051/0.090) — say so in one place; discount §5.2's flow-through accordingly.
- Leave-one-HS2-out is under-sold: drop HS 85 (45% of basket) → γ 1.36 p=0.21; drop HS 90 → 3.16. Report all seven jackknife values as a finding — the reorientation is an HS 84/85 phenomenon.
- Make PPML the headline spec (genuine zeros; asinh is scale-dependent); report the zero share pre/post.
- State that analytic + bootstrap SEs both assume away cross-line dependence; RI is the only inference that doesn't.
- Bai–Perron: state whether sup-F uses an HAC covariance; drop the *annual* sup-F values from running text (cross-series comparison of statistics you decline to read cardinally, on 8 obs, conveys nothing) — keep the monthly ones + CIs.
- Sign the mirror bias in §3/§4.3/§5.2 (inflates inbound → understates flow-through ratios, inflates inbound DiD).
- The $479m increment assumes a flat counterfactual on a *declining* pre-series (17/12/7/8) — state + give sensitivity.
- Decompose the flow-through gap: KZ surge-basket exports to all destinations − exports to Russia = onward flow elsewhere; residual = domestic absorption + measurement.
- Document the CHPL tier construction (1/2/3A/3B/4A/4B) — defined nowhere.
- Replace §5.2's "even at v̄^M = 0.40" sensitivity with the `m` sensitivity of Concern 1.
- The deal null is on *transacted* investment, not capacity — incumbent greenfield from retained earnings is invisible to all three databases (the paper's own §7 proves it: the auto plants are in press announcements, not deal data). Name the complementary source not run (fDi Markets / Orbis Crossborder) or run it.
- State the adjudication rule behind the 0/0/0 surge-basket-line row, not just the outcome.
- §8: a device not derived from the model can't have "testable content" in the model's sense — attach it to the three necessary conditions, not eq. (2). (Eq. (2) itself is now correctly presented — keep as written.)

## Positives
- Replication package exemplary and above JCE's bar (118 verified, 0 FAIL, one error found + corrected in-audit).
- The selection-rule-matched permutation + cyclic-shift variant is the right test and rarely done; the unfavourable verdict reported verbatim.
- §7's four-part statement of why the auto comparison isn't clean is the best-written passage and the reason this is R&R not reject.
- §5.2's admission the I-O step "does no work".
- MDE for the deal-count null; "over-determined, not fragile" framing.
- §8's volunteered counter-evidence (Armenia GFCF up; KZ flow persists).
- The refusal to read sup-F cardinally.

## Recommendation: **Major revision (R&R)**

Three of the four headline claims are stated more strongly than the evidence: the value-capture number is a chosen parameter × 1.03 with no sensitivity map; one of the two "no transformation" pieces measures partial flow-through, not transformation; "about threefold" is headlined against a rule-matched null centred above it; and the low-ρ premise is contradicted by the paper's own Table 1. None requires new data. A sensitivity map over `m`, a per-unit weight statistic from fields already in the Comtrade extract, promotion of the priority list to the headline spec, a relabelling of ρ as σ, and a trim of the gate claim to what the QIC pipeline + the customs-union fact establish would produce a publishable JCE case study — one that discriminates two of three gates cleanly and says so.
