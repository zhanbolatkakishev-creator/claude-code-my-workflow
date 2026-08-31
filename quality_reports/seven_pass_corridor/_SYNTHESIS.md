# Seven-Pass Review: "Corridor, Not Factory" — ROUND 2

**Date:** 2026-08-31
**Path:** `Manuscript/corridor.tex` (937 lines, 25 pp, compiles clean)
**Lens reports:** `quality_reports/seven_pass_corridor/round2/lens_1..7_*.md`
**Round 1:** `_SYNTHESIS_round1.md` (verdict was REVISE-MAJOR, 6 CRITICALs)

## Executive verdict

**REVISE-MAJOR.** Five CRITICALs, all from the methods lens; the gate predicate blocks on
`CRITICAL > 0`.

**But the trajectory is clearly positive.** Five of seven lenses improved (Abstract 6→7,
Intro 6→7, Results 5→7, Robustness 4→6, Citations 7→8); Prose held at 6; Methods rose 3→5.
Round 1's cross-lens CRITICALs are substantially resolved: the "five databases" over-claim,
the missing regression table, the framework inflation, "Test F contradicted by own data", the
placebo-purge, and the missing power analysis are all fixed or honestly hedged. The round-2
CRITICALs are a narrower and more tractable class: **(a) two round-1 fixes that did not go
deep enough** (the randomisation-inference benchmark; Figure 3), and **(b) arithmetic and
evidentiary slips introduced by the fast Path B / hybrid rebuild** (the §5.2 freight-netting
derivation; an §8 sentence with no data behind it; an unrun robustness check cited as run).
None is fatal to the paper. Two headline numbers must move; the qualitative "corridor, not
factory" conclusion survives an honest recomputation (and probably gets *smaller* value
capture, not larger).

**Hallucination gate:** all five CRITICALs originate in Lens 3 and none is
synthesis-introduced. The two most consequential were independently re-verified against the
outputs before this report: **C3** — Σ expRU = \$524.3m, Σ matched-inbound = \$781.3m, so the
value-weighted aggregate matched-cell margin is **−49%**, not the +34% the paper reports (the
+34% is an artifact of censoring negative-margin cells); **C6** — `07_crosscountry.R` pulls
World Bank WDI only, and Appendix A specifies every deal extract as Kazakhstan-only geography,
so the §8 claim "the deal data show one [null]" for Armenia/Kyrgyz has no data behind it.
C2, C4, C7 are corroborated by lenses 4 and/or 5.

## Cross-lens CRITICAL issues

| # | Lens(es) | Issue | Recommendation |
|---|---|---|---|
| **C1** | 1, 2 (×2), 3, 5 | **The abstract and §1 state the interpretive claims flatter than §2/§6/§7/§10 now hedge them.** "Two within-country comparisons point to the irreversibility gate as binding" / "built real capacity for a durable auto-demand shock" / "there is no investment response" / "both [legs] at least doubled" — but §7 calls the two comparisons "illustrative rather than … a controlled test" and "not a clean ρ experiment", §6 concedes the auto capacity "predates … the reorientation", §2/§10 call the null "over-determined … we cannot cleanly attribute it to the trade shock alone", and §4.2 discloses the annual West+China inbound break is *insignificant*. Four lenses independently flag the same gap. | One editing pass over the abstract + §1: insert the concessive clauses that already exist downstream (null is over-determined + power-limited; "which gate binds" is suggestive not dispositive; Test F is illustrative; the inbound leg is product-level/monthly corroboration, not a co-equal aggregate break). Compress the §1 framework paragraph (18 lines → ~7). No new analysis. |
| **C2** | 3, 5 | **The randomisation-inference benchmark does not test the selection-on-outcome problem it is offered for.** `06_eventstudy_did.R` draws *uniformly random* 29-line baskets; the surge basket is the extreme tail of the very moment the DiD estimates, so p = 0.009 is near-tautological. The correct null is baskets chosen by the *same ≥2×/≥2× rule* under H₀. Compounding: the rule is a post/pre *ratio* with the pre-period in the denominator, which induces mean reversion the unit+year FE absorb the level of and the 3-coefficient pre-trend test cannot see; and the inbound criterion is near non-binding (China ≈ ⅔ of the measure and grew economy-wide), so the operative screen is `expRU_ratio ≥ 2` — selection directly on the headline outcome. | Re-run RI as a **selection-rule-matched permutation**: permute the break date (and/or use pre-period splits), re-apply the ≥2× rule, collect the γ distribution, show the observed γ = 2.44 in its tail. Report how many of the 29 lines the inbound criterion actually binds on. If a rule-matched RI still puts γ in the tail, this resolves; if not, §4's causal language comes down to descriptive. |
| **C3** | 3 (+ 4, 5 on the unsourced constant) | **The §5.2 "34% → 12% freight-netted margin" is arithmetically incoherent, and the abstract's 5–9% rests on it.** `07:29` censors the per-cell margin at zero (Σ retained = \$180m); `08:39` then subtracts freight (15% × \$781m) from that censored numerator over the *uncensored* base — mixing bases. Computed consistently, the value-weighted aggregate margin is **−49%** (KZ's matched re-exports to Russia are booked at less than the mirror-reported inbound cost — an outbound-under-invoicing / basis artifact, not a "retained margin"). The 15% freight rate is an uncited hardcode used at one point of a 10–20% range that inverts the band at 20%; the "6–14% national-accounts convention" appears only as a code comment, uncited. | **Drop the freight-netting derivation.** Bound the retained trade-and-logistics margin only by the KZ national-accounts trade-insurance-freight convention (6–14%), cited to a source. VA per rerouted dollar = 6–14% × 0.79 ≈ **5–11%**, midpoint ~8%; retained ≈ \$25–65m of \$479m. Keep the unit-value wedge in §5.1 as descriptive only ("median 0.73 c.i.f. / 1.6 f.o.b., no weight gain, too basis-dependent to pin the margin"). "Corridor, not factory" (5–11% ≪ 76%) is unaffected. |
| **C4** | 3, 4, 5 | **Figure 3 was never actually fixed.** `06m_monthly_profile.R:45–47` fits 30 event-time dummies + intercept on 31 monthly aggregate observations → exactly saturated, zero residual df. The new caption says "the interval bands are correspondingly wide"; they are **zero-width**, and the shipped PNG's own subtitle still reads "95% CI". The real HS6-level DiD event study against the control basket (with the pre-trend Wald test the paper cites) already exists — `rq1_estimates.txt:38–47`, `rq1_fig_eventstudy.png` — and is not shown. | Swap `fig:es` to `rq1_fig_eventstudy.png`; report the HS6-level event-study coefficients (pre: 0.02 / −0.10 / 0.33; post builds to ~2.4) in a small table. Relabel the monthly aggregate profile as a raw two-series plot with no coefficients/bands, or delete it. |
| **C5** | 3, 5 | **The significant negative placebo (γ = −0.95, p = 0.001) cannot be spun as "sharpens rather than muddies the contrast."** It is a different design — treatment assigned on the top quartile of pre-2022 `mirWC`, regressed on `mirWC` — so the coefficient is regression to the mean; but the pair (select on ratio → +2.44***; select on level → −0.95***) shows the panel returns a signed significant DiD for whichever moment the basket rule keys on, and it establishes that the control pool diverges sharply by pre-period size. The surge rule selects small-pre lines, so treated vs control is confounded with size. | Add a **pre-2022-size-decile × year FE** DiD (or a size-matched control); if γ survives, the size-divergence threat is answered. Alternatively add a Rambachan–Roth honest-DiD sensitivity bound. Replace a genuine selection-rule-matched placebo for the "reform confound" argument. Delete "sharpens the contrast". |
| **C6** | 3 | **§8's "the deal data show one [null]" for Armenia and the Kyrgyz Republic has no data behind it**, and the cross-country evidence that exists runs the other way: `crosscountry.txt` gives Armenia's post-2022 investment rate **+3.3 pp of GDP** and FDI/GDP +0.9 pp. `07_crosscountry.R` pulls WDI macro only; Appendix A specifies every deal extract as Kazakhstan-only. | Delete "and the deal data show one". Either report ARM +3.3 pp GFCF explicitly with an explanation, or drop the ARM/KGZ external-validity claim. Add the full 2018–2025 neighbour outbound series (both revert to baseline by 2025 while Kazakhstan's does not — which *supports* §7's transitory-shock argument and should be used there). |
| **C7** | 3 | **"results are similar dropping 2022" (§4.3) is an unrun robustness check** — no year-exclusion, alternative TREAT, or donut specification exists in any script or output. The same sentence cites a *monthly* reference period (2022m2) as the no-anticipation basis for the *annual* DiD (TREAT = 2022-01-01, reference year 2021). | Run it (drop 2022; and/or TREAT = 2023 donut) and put it in Table 2. State the annual reference period correctly. |

## MAJOR issues (second round)

| # | Lens(es) | Issue |
|---|---|---|
| M1 | 3, 4 | **Table 2 (`tab:did`) mechanical errors, all overstating:** surge/exports-to-Russia p = 0.013 marked `**` (→ `*`); surge/inbound-W+China p = 0.051 marked `*` (→ unstarred; prose "p = 0.05" rounds a non-sig p down); placebo p = 0.00103 marked `***` (→ `**`). The note never says the parenthetical is the SE. Caption N = 600 is wrong for the placebo row (N = 200). Regenerate the table programmatically from `rq1_estimates.txt`. |
| M2 | 3, 4 | **Stale figure labels after the Path B rebuild:** `valueadd_fig_mismatch.png` y-axis reads "imports from EU+China" but plots the Western-only series; `rq2a_fig_wedge_hist.png` title/x-axis/subtitle describe the c.i.f. variant while it plots the f.o.b. wedge. Pure label fixes in `03_fig.R` and `07:68–75`. |
| M3 | 7 | **`desouza2026diffusion` cited as year 2026.** FRB Chicago WP 2024-20 is September 2024, revised March 2025 (SSRN 4972150). `\citet` renders "de Souza et al. (2026)" — a year matching no release. Set `year = 2024` (canonical WP) with a note that the March 2026 revision was consulted; rename the key. |
| M4 | 3 | **§6 deal count: the 2015 pre-period value is an imputed zero** (`08_power_null.R` comment concedes the bucket table starts 2016). On 2016–21 the pre-mean is 8.5/yr (not 7.3), and the 2023–25 rate ratio is **1.06** (not 1.24). Verify whether 2015 is an observed zero in `deals_classified.rds`; if imputed, disclose and report the 2016–21 window. |
| M5 | 3, 5 | **§5 denominator inconsistency.** §4 selects the basket on West+China; §5 measures flow-through on incremental *Western* inbound only (\$479m / \$887m = 0.54). On the selection basis the incremental inbound is ~\$3.2bn and flow-through ~0.15. Report both bases and justify the Western choice. Baseline windows also drift (selection 2019–21; incremental 2018–21). |
| M6 | 5, 3 | **The inbound leg is over-claimed.** Annual West+China break insignificant (supF 4.12, p = 0.27); W+China DiD borderline (γ = 2.10, p = 0.051); Western-only DiD insignificant (γ = 1.73, p = 0.08). "Both legs at least doubled" (§1) and "imports of the same goods rose too" (abstract) outrun this. Lead with the outbound surge; present the inbound as product-level / monthly-Western corroboration, and state the null annual break where the claim is made, not only in §10. |
| M7 | 3 | **"No large mark-up … on any basis" (§5.1) is contradicted by the paper's own tier medians:** 3.83 (CHPL tier 2, \$150.8m gross) and 3.94 (tier 4A, \$67.4m) — 42% of matched-cell outbound flow at ~4× markups; overall p75 = 4.40. Only the median is reported. Report the tier table or drop the universal. |
| M8 | 3 | **"No systematic weight gain" is asserted four times (including in the abstract) with no statistic anywhere.** `wt_ratio` is computed at `07:25` and never enters any output. Supply the distribution of `expRU_kg / mirWC_kg` with a test against 1, or drop the claim. |
| M9 | 4, 3 | **§5.1 (f.o.b. wedge 1.6) and §5.2 (gross margin 34% / −49% recomputed) are never bridged** — the two ends of the load-bearing value-capture chain. Add the reconciliation (median-of-ratios vs value-weighted quantity match; matched-cell inbound is ~9× the outbound) and state which object the claim rests on. |
| M10 | 5 | **No alternative input–output multiplier** (ADB MRIO / EORA / KZ BNS) despite the OECD ICIO's unusually high Kazakhstan domestic-content shares; the freight rate is uncited with no sensitivity grid. |
| M11 | 3 | **Annual `supF` inference on 8 observations**, mean-only model, no HAC, reported to four significant figures ("p < 10⁻⁴"; a literal "p = 1" appears in `rq1_robustness.txt`). Report annual breaks descriptively without p-values, or rely on the monthly tests (60+ obs), which are sound. |
| M12 | 3, 5 | **Neighbour series truncated at 2023.** ARM 8.8→70.9→93.4→**42.2→12.8**; KGZ 7.4→12.4→30.3→**11.6→12.0** — both revert to baseline by 2025 while Kazakhstan's does not (128/145/119/133). Report the full 2018–2025 series. The reversion supports §7 (transitory) and complicates §8 ("share Kazakhstan's value on every moderator"). |
| M13 | 3 | **§3 misstates the selection rule:** the post window is `tt < 2024-06-01` (2022–2024 on the annual panel, not "2022–2023"); the ratios are shrunk by +\$10,000 on both sides (not a raw doubling); the "modest post-period levels" floors are \$200k inbound / \$100k outbound. State the rule exactly as coded. |
| M14 | 6 | **Prose (7 MAJOR):** four dangling participles reintroduced in the rewrites (§1 L102, §5.1 L497/L501, §2 L260); the §10 Limitations paragraph is one ~165-word non-parallel sentence; the §2 confound sentence is ~85 words and contains "discontinuous in 2022m**4**" (contradicts the 2022m5 break used everywhere else); ~10 sentences run 52–72 words in the rewritten passages; AI-voice tells re-entered §5.1/§8 ("genuinely ambiguous and worth stating carefully", "That alone is close to sufficient", symmetric "When the gate is open … closed …"); five spellings of "West + China"; hedge saturation in the §5.2 derivation (11 of ~13 clauses hedge). |
| M15 | 3 | **The stated inference concern is the wrong one.** Clustering on HS6 *is* the Bertrand–Duflo–Mullainathan fix for within-HS6 serial correlation; the threat from a single common treatment date is cross-sectional dependence in the year shocks (Donald–Lang). No multiple-testing adjustment across ~20 reported tests with headline p = 0.013 and 0.051. (The wild bootstrap itself is implemented correctly.) |
| M16 | 5, 7 | **Under-invoicing named but never bounded** (§5.1, §10). One line would do: "exports to Russia would need to be under-invoiced by ≈X% to lift retained domestic value added above Y% of the gross flow." Fisman–Wei is also a loose mechanism match (it is importer under-invoicing to evade tariffs); Chupilkin et al. or Ferrantino–Liu–Wang fit the onward-transit bias better. |
| M17 | 2 | **§1 framework paragraph is an 18-line theory block** wedged between the three steps and the contribution paragraph, pre-running §3 and §7 in full; it is where the residual over-claiming concentrates. Compress to ~7 lines. |
| M18 | 5, 7 | **§8 Vietnam/Mexico contrast asserted with no citation** ("widely read as structural"). The EU-11th-package / anti-circumvention enforcement timeline in §7 is also unsourced. Consider engaging Simola/BOFIT on Russia's third-country import recovery and Hilgenstock–Ribakova on export-control leakage. |

## MINOR polish

Roadmap is a nine-clause single sentence (L2, L6); abstract has two comma splices (L6-9, L6-10) and no explicit contribution clause (L1-6); "roughly tenfold" vs "3.5×" in one abstract sentence is unsignposted (L1-2, L2-R2-6); "sup-F of 561" is unscaled jargon in the abstract (L1-4); BrE/AmE mixing incl. "organizes" vs "organised" within §1, and "value addition" for "value added" (L6-11, L6-12); `$R$` used before it is defined (L6-14); acronyms unexpanded on first use — ICIO, EAEU, Bai–Perron, asinh, USMCA, PIPE (L6-15); §7 run-in headings inconsistent in form and "for three reasons" not enumerated (L6-16, L6-17); em-dash splices at §7 L715 and §10 (L6-18, L6-24); "not X but Y" seven times (L6-23); `power_null.txt` header label bug (L3-MIN2); trim the last two sentences of the §2 mediation paragraph (L3-MIN1); §2 mediation "polar case: h = 1" asserts a sign nothing estimates.

## Per-lens scorecard

| Lens | R1 | R2 | Critical | Major | Minor |
|---|---|---|---|---|---|
| 1. Abstract | 6 | **7** | 0 | 1 | 5 |
| 2. Intro | 6 | **7** | 0 | 3 | 5 |
| 3. Methods | 3 | **5** | 5 | 14 | 3 |
| 4. Results | 5 | **7** | 0 | 5 | 7 |
| 5. Robustness | 4 | **6** | 0 | 5 | 5 |
| 6. Prose | 6 | **6** | 0 | 7 | 18 |
| 7. Citations | 7 | **8** | 0 | 1 | 3 |
| **Overall** | ~4 | **~5.5** | **5** | ~36 | ~46 |

## Revision plan (recommended order)

1. **Front matter → body (C1, M6, M17, + abstract minors).** One editing pass: propagate the
   hedges that already exist in §2/§6/§7/§10 into the abstract and §1; compress the §1
   framework paragraph; lead with the outbound surge and demote the inbound leg to
   corroboration; add a contribution clause. No new analysis. **~2 hrs, highest leverage.**
2. **§5.2 value-capture derivation (C3, M5, M9, M10).** Drop the freight-netting. Bound the
   margin by the 6–14% national-accounts convention, cited; VA per rerouted \$ ≈ 5–11%,
   midpoint ~8%; retained ≈ \$25–65m. Report the wedge as descriptive only; report both
   flow-through bases; add one alternative I-O multiplier if time. Update the abstract, §1,
   §5, §10 to the new range.
3. **DiD robustness rebuild (C2, C5, C7, M15).** (a) selection-rule-matched randomisation
   inference; (b) size-decile × year FE DiD (or Rambachan–Roth bound); (c) drop-2022 / donut
   spec into Table 2; (d) reframe the placebo text; (e) restate the inference rationale and
   add a Romano–Wolf adjustment across the grid.
4. **Figure 3 (C4).** Swap to `rq1_fig_eventstudy.png`; report the HS6-level event-study
   coefficients; relabel/kill the aggregate profile.
5. **§8 Armenia/Kyrgyz (C6, M12).** Delete "the deal data show one"; address ARM +3.3 pp GFCF;
   add the full 2018–2025 neighbour series and note the reversion asymmetry.
6. **Mechanical / drift fixes (M1, M2, M3, M13, M4, M7, M8).** Regenerate Table 2 from
   `_outputs/`; fix stale figure labels; de Souza year → 2024; state the selection rule
   exactly; verify the 2015 zero; supply the weight-ratio statistic or drop "no weight gain";
   report the tier-median table or drop "no large mark-up on any basis".
7. **Statistics hygiene (M11, M16).** Annual `supF` → descriptive only; negative-binomial RR
   CI for the deal count; one-line under-invoicing bound.
8. **Prose pass (M14, minors).** Split the ~10 long sentences; fix the four dangling
   participles and the §10 Limitations mega-sentence; correct "2022m4"; standardise
   "West + China"; de-hedge §5.2; expand acronyms on first use.
9. **Citations (M18).** Cite the Vietnam/Mexico characterisation and the EU-11th-package
   timeline; consider Simola/BOFIT + Hilgenstock–Ribakova.

**Meta-fix (Lens 3's closing note, strongly endorsed):** add a build step that renders
Table 2 and the §5.2 bounds directly from the `.txt`/`.rds` outputs. It would have caught
M1, M2, M13 and C7 automatically and made C3's freight sensitivity impossible to hide. Four
of the round-2 findings are the manuscript text drifting from the code during the Path B
rebuild.

## Contradictions between lenses

None hard. Lens 1 wants an explicit contribution sentence *added* to the abstract; Lens 2
wants the §1 framework paragraph *compressed* — both point to tightening + retargeting the
front matter, not in tension. Lens 4 says plotting the Western series in `fig:mismatch` is
analytically correct (just relabel it); Lens 5 says lead with the outbound — compatible (the
figure can stay, the emphasis in the text shifts).

## Token-budget report

Seven forked reviewers (2 completed on the first pass, 4 completed-but-file-only after the
session-limit interruption, 1 re-run) + synthesis with independent re-verification of C3 and
C6 against the outputs. Round-1 synthesis preserved as `_SYNTHESIS_round1.md`.
