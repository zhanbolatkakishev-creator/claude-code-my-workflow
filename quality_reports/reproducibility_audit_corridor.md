# Reproducibility Audit: Corridor, Not Factory

**Date:** 2026-08-31 (Path B / hybrid rebuild)
**Manuscript:** `Manuscript/corridor.tex`
**Outputs:** `scripts/R/kz_passthrough/_outputs/` (regenerated 2026-08-31),
`scripts/R/kz_valueadd/_outputs/` (2026-08-28; §6--§9, unaffected by Path B)
**Tolerance source:** `.claude/rules/replication-protocol.md` (point est. <0.01; SE <0.05;
p-value same sig. level; counts exact; percentages ±0.1pp; ratios as point est.)

## Summary

| Status | Count |
|---|---|
| PASS | 71 |
| FAIL | 0 (3 found and fixed during the audit) |
| EXPLAINED | 1 |
| UNMATCHED | 1 |
| **Overall verdict** | **PASS** |

Environment capture (`sessionInfo.txt` / `renv.lock`) still absent — run `/capture-environment`
before the replication package.

## Fixed during the audit

| Claim | Reported (before) | Computed | Fix |
|---|---|---|---|
| §7 Test C, monthly outbound 2023-H1 → 2023-H2 | "\$21m → \$15m per month, fell by roughly 30\%" | 29-line basket: \$14.6m → \$9.5m, −35\% (the \$21m/\$15m were the old 31-line West-only basket) | → "about \$15m → about \$9m ... fell by more than a third" |
| §5.3, incremental flow per year | "\$107--145m per year" | incremental = 117 / 134 / 107 / 122 → \$107--134m (the 145 was the raw 2023 expRU, not the increment) | → "\$107--134m per year" |
| §5.2, domestic VA retained | "roughly \$25--45m" | `rq2b` headline "~\$23--45m" | → "\$23--45m" |
| §4.2, level rise gloss | "($\approx$ a tenfold rise in level)" | monthly expRU pre→post ×16.3 | → "(more than a tenfold rise in level)" |

## PASS (within tolerance) — trade side (§3--§5), Path B rebuild

| Claim (location) | Reported | Computed | Source |
|---|---|---|---|
| Surge-basket size (abstract, §1, §3, Table 2) | 29 HS6 | 29 | `rq1_estimates`, basket check |
| — of which on priority list (§3) | 24 of 29 | 24 | basket check |
| Outbound monthly break date (abstract, §1, §4.2/3) | 2022m5 [CI m4--m6] | 2022-05 [2022-04, 2022-06] | `rq1_monthly` |
| Outbound monthly sup-$F$ (abstract, §1, §4.2) | 561 | 561.1 | `rq1_monthly` |
| Inbound (W+China) monthly sup-$F$ (§1, §4.2) | 24 | 24.1 | `rq1_monthly` |
| Inbound monthly 2nd break (§4.2 "late 2023") | 2023m12 | 2023-12 [2023-11, 2025-01] | `rq1_monthly` |
| Western inbound monthly sup-$F$ (§4.2) | 241 | 240.8 | `rq1_monthly` |
| Annual outbound / Western-inbound sup-$F$ (§4.2) | 151, 142 | 150.68, 141.66 | `rq1_estimates` |
| Annual W+China inbound sup-$F$ (§4.2, "not significant") | 4 | 4.12, p=0.267 | `rq1_estimates` |
| Monthly outbound level multiple (§4.2 "+3 asinh, >tenfold") | +3 asinh / >10× | asinh shift 2.79; ×16.3 in level | `rq1_monthly`, recompute |
| DiD surge → Russia $\gamma$ (§1, §4.3, Table 2) | 2.44 (0.96), p=0.013 | 2.4408 (0.9594), p=0.01304 | `rq1_estimates` |
| DiD surge → W+China inbound $\gamma$ | 2.10 (1.06), p=0.05 | 2.0986 (1.0576), p=0.0509 | `rq1_estimates` |
| DiD surge → Western inbound $\gamma$ | 1.73 (0.98), p=0.08 | 1.7299 (0.9792), p=0.0814 | `rq1_estimates` |
| DiD surge → KZ-reported imports $\gamma$ | 1.88 (0.63), p=0.004 | 1.8839 (0.6343), p=0.00401 | `rq1_estimates` |
| DiD mirror-gap $\gamma$ (§4.3) | 0.54, p=0.81 | 0.5411 (2.271), p=0.8123 | `rq1_estimates` |
| Wild-cluster bootstrap p, outbound (§4.3) | 0.010 | 0.010 | `rq1_estimates` |
| Randomisation-inference p, outbound (§4.3 "under one in a hundred") | 0.009 | 0.009 | `rq1_estimates` |
| PPML outbound / inbound (§1, §4.3, Table 2) | 3.5× p=0.02; 2.4× p<10⁻⁴ | 3.53× p=0.0158; 2.35× p=4.5e-5 | `rq1_estimates` |
| Pre-trend joint Wald p (§4.3) | 0.42 inbound, 0.78 outbound | 0.415, 0.777 | `rq1_estimates` |
| CHPL DiD, all four outcomes (Table 2) | 2.88 / 2.12 / 1.93 / 2.94 | 2.8751 / 2.1225 / 1.9272 / 2.9398 | `rq1_estimates` |
| Placebo DiD $\gamma$ (abstract, §1, §4.3, Table 2) | −0.95 (0.25), p=0.001 | −0.9515 (0.2548), p=0.00103 | `rq1_robustness` |
| Civilian inbound / exports-to-Russia break sup-$F$ (§4.3) | 0.3; 34 (p<10⁻⁴) | 0.32; 34.37 (p=1.5e-7) | `rq1_robustness` |
| "surge-basket outbound break four to five times larger" (§4.3) | 4--5× | 150.68 / 34.37 = 4.4× | `rq1_robustness` |
| Armenia exports→Russia (§4.3) | \$7--15m → \$71m (2022), \$93m (2023); sup-$F$ 10, p=0.01 | 6.8--15.2 → 70.9, 93.4; 10.47, p=0.0145 | `rq1_robustness` |
| Kyrgyz Rep. exports→Russia (§4.3) | \$1--7m → \$12m, \$30m; sup-$F$ 13, p=0.004 | 0.7--7.4 → 12.4, 30.3; 13.44, p=0.00357 | `rq1_robustness` |
| Panel $N$ (Table 2 note) | 600 | 600 | `rq1_estimates` |
| §3 "China supplies about two-thirds of this inbound value" | ~2/3 | 68% | panel calc |
| Table 1: West+China inbound, all 8 years | 394/427/483/470/837/1373/2360/363 | idem | `panel_annual` |
| Table 1: Western component, all 8 years | 162/162/168/184/337/444/419/363 | idem | `panel_annual` |
| Table 1: KZ→Russia, all 8 years | 17/12/7/8/128/145/119/133 | idem | `panel_annual` |
| §4.1 outbound 2018--21 range / 2022 / 2023--25 | \$7--17m; \$128m; \$119--145m | 7--17; 128; 119--145 | `panel_annual` |
| §4.1 inbound "near \$440m per year before 2022" | ~\$440m | mean 2018--21 = 443 | `panel_annual` |
| §4.1 Western component "≈2.3×" | 2.3 | 391 / 169 = 2.31 | `panel_annual` |
| §5.1 wedge, CIF basis (§5.1) | 0.73 annual (n=112), 0.70 monthly | 0.7304 (112), 0.6969 | `rq2a_*` |
| §5.1 wedge, FOB/FOB basis | 1.6 annual, 1.5 monthly | 1.593, 1.513 | `rq2a_*` |
| §5.1 control-basket wedge (both bases) | 0.59 and 0.94 | cif 0.592, fob 0.938 | `rq2a` |
| §5.1 pass-through slope range / significance | 0.06--0.48, sig only annual f.o.b. | 0.061 / 0.152 / 0.204 / 0.477 (annual fob p=0.032) | `rq2a_*` |
| §5.2 incremental outbound / Western inbound / flow-through | \$479m; \$887m; ~½ | 479; 887; 0.54 | `rq2b` |
| §5.2 VA multipliers $\bar v^{TT}$, $\bar v^{M}$ | 0.79, 0.76 | 0.787, 0.764 | `rq2b` |
| §5.2 matched-cell f.o.b. gross margin | ~34% | 0.343 | `rq2a`, `rq2b` |
| §5.2 freight-netted margin | ~12% | 0.120 | `rq2b` |
| §5.2 $m$ band / VA per rerouted \$ / midpoint | 6--12%; 5--9%; ~8% | 0.06/0.10/0.12; 0.047/0.079/0.094 | `rq2b` |
| §5.2 "one to five" at $\bar v^M=0.40$ | ~1:5 | 0.079 / 0.40 = 0.20 | `rq2b` |
| §5.3 incremental cumulative | \$479m | 479 | `rq2c` |
| §5.3 customs duty | ~\$22m / 4yr (~\$5m/yr) | 21.6 (mid: CET 6%, cleared 75%) | `rq2c` |
| §5.3 flow as % of GDP | 0.2--0.3% | 0.20--0.27 (2022--25) | `rq2d` |

## PASS — investment side (§6--§9), carried from the 2026-08-28 run (Path B does not touch these)

| Claim (location) | Reported | Computed | Source |
|---|---|---|---|
| Deals/yr, mfg+transport+distrib. (§1, §6) | 7.3 (2015--21), 7.5 (2022--25) | 51/7 = 7.29, 30/4 = 7.5 | `valueadd_findings` |
| Poisson rate ratio post/pre + CI (§6) | 1.03, 95% CI 0.63--1.65 | 1.03 [0.63, 1.65] | `power_null` |
| 2023--25 rate (§6) | 9.0/yr; RR 1.24 [0.74, 2.01] | 9.00; 1.24 [0.74, 2.01] | `power_null` |
| MDE (§6 "80% power against ~80%+") | ~1.8× | 1.8× | `power_null` |
| Table 3 (captive) — QIC & private, all 8 cells | 1/4, 2/117, 13/1170, 34/453 ; 1/10, 2/767, 6/138, 192/10373 | exact | `mechanism_tests` |
| QIC project count (§7) | 50 | 1+2+13+34 | `mechanism_tests` |
| Auto deals fell (§7) | 6 (2015--21) → 3 (2022--25) | 6 → 3 | `mechanism_tests` |
| §7 2025 rail-freight consolidation (§6, §7) | \$0.8bn / \$767m | 767 | `mechanism_tests` |
| Table 4 (sector priority) — all 7 rows | see table | `sector_priority.txt` C28/C25/C20/H52/G/C26/C29 | `sector_priority` |
| §9 machinery imports ×, other two × | ~8×; ~2× | 7.89; 1.78, 1.69 | `sector_priority` |
| §8 electronics output (tab:moderators) | ≈\$230m | C26 base 234 | `sector_priority` |
| §8 findev range | 24--66% of GDP | GEO 66 … KGZ 24 | `crosscountry` |
| §6 CapIQ mfg deals (§6 "5.1 vs 5.2") | 5.1 / 5.2 | Table 2 CapIQ row | `deal_source_reconcile` (2026-08-28) |

## EXPLAINED

| Claim | Reported | Computed | Named alternative |
|---|---|---|---|
| §4.2 / abstract "roughly tenfold" | ~10× | annual expRU ×11.9; monthly ×16.3 | Deliberate round-down: "roughly tenfold" / "an order of magnitude" is the intended looseness for a ×12--16 raw level rise; the DiD magnitude the abstract carries is separately stated as $3.5\times$. Non-blocking. |

## UNMATCHED (manual review)

| Claim | Raw context | Note |
|---|---|---|
| Table 2 (`tab:dealsource`) FactSet / Dealroom columns | "--- / ---", marked pending | By design: extracts not yet run. Not audited. The CapIQ/PitchBook/Preqin columns are carried from the 2026-08-28 `deal_source_reconcile` run and were not regenerated this pass (Path B is trade-side only). |

## Verdict

**PASS.** Zero FAIL after the four fixes above. The Path B / hybrid rebuild reproduces: every
§3--§5 headline number now traces to a regenerated 2026-08-31 output within tolerance; §6--§9
are unchanged and were verified in the 2026-08-28 audit.

## Next steps

1. Run `/capture-environment` (renv snapshot + `sessionInfo.txt`).
2. Run the FactSet + Dealroom extracts; complete `tab:dealsource`; then re-audit those columns.
3. Regenerate `deal_source_reconcile` alongside, to date-stamp the CapIQ/PitchBook/Preqin cells to the current tree.
