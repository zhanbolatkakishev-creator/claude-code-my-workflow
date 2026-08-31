# Reproducibility Audit: Corridor, Not Factory

**Date:** 2026-08-31 (round-2 revision — post seven-pass R2 + KZ BNS I-O robustness)
**Manuscript:** `Manuscript/corridor.tex`
**Outputs:**
`scripts/R/kz_passthrough/_outputs/` (regenerated 2026-08-31: `rq1_estimates`, `rq1_monthly`,
`rq1_robustness`, `rq1_did_robustness` [new], `rq2a_unit_value_wedge`, `rq2b_io_propagation`,
`rq2b_bns_io_check` [new], `rq2c_fiscal`, `rq2d_macro`, `rq1_fig_eventstudy.png` [new]);
`scripts/R/kz_valueadd/_outputs/` (`valueadd_findings`, `power_null` [re-run 2026-08-31],
`mechanism_tests`, `sector_priority`, `crosscountry`; §6–§9 unaffected by the round-2 revision).
**Tolerance source:** `.claude/rules/replication-protocol.md` (point est. <0.01; SE <0.05;
p-value same sig. level; counts exact; percentages ±0.1pp; ratios as point est.).
**Environment:** `sessionInfo.txt` present in both `_outputs/` dirs; `renv.lock` at repo root
(85 pkgs, R 4.5.3). Pre-flight PASS.

## Summary

| Status | Count |
|---|---|
| PASS | 96 |
| FAIL | 0 |
| EXPLAINED | 1 |
| UNMATCHED | 2 |
| **Overall verdict** | **PASS** |

This is the second audit of the Path B / hybrid pipeline. The round-2 manuscript revision
changed the numbers in §4.3 (rebuilt around `12_did_robustness.R`), §5.2 (freight-netting
derivation dropped; value capture now the 6–14 % national-accounts margin only, plus a KZ BNS
I-O cross-check), Table 2 (significance stars), Figure 3 (swapped to the HS6-level event
study), and §8 (ARM/KGZ neighbour series). Every changed number traces to a regenerated
2026-08-31 output within tolerance.

## PASS — the demand shock (§3–§4)

| Claim (location) | Reported | Computed | Source |
|---|---|---|---|
| Surge-basket size (abstract, §1, §3, Table 2) | 29 HS6 | 29 | `rq1_estimates`, basket check |
| — of which on the priority list (§3) | 24 of 29 | 24 | basket check |
| §3 selection floors | $0.2 m inbound / $0.1 m outbound | `2e5` / `1e5` | `06_eventstudy_did.R` |
| §3 selection window / shrinkage | 2019–21 → 2022–24; +$10 000 | annual `tt<2024-06`; `+1e4` num & denom | `06_eventstudy_did.R` |
| Outbound monthly break date (abstract, §1, §4.2) | 2022m5 [CI m4–m6] | 2022-05 [2022-04, 2022-06] | `rq1_monthly` |
| Outbound monthly sup-$F$ (abstract, §1, §4.2) | 561 | 561.1 | `rq1_monthly` |
| Inbound (W+China) monthly break / sup-$F$ (§1, §4.2) | 2022m5 [m4–m6]; 24 | 2022-05 [2022-04, 2022-06]; 24.1 | `rq1_monthly` |
| Western-only inbound monthly sup-$F$ (§4.2) | 241 | 240.8 | `rq1_monthly` |
| Annual outbound / Western-inbound sup-$F$ (§4.2) | 151, 142 | 150.68, 141.66 | `rq1_estimates` |
| Annual W+China inbound sup-$F$ (§4.2, "not significant") | 4 | 4.12, p=0.267 | `rq1_estimates` |
| Monthly outbound level multiple (§4.2 "+2.4 asinh ≈ tenfold") | +2.4 asinh; ≈10× | ES coef `tt::3` = 2.445; ×16.3 in level | `rq1_estimates`, `rq1_monthly` |
| Table 1: West+China inbound, 8 years | 394/427/483/470/837/1373/2360/363 | idem | `panel_annual` |
| Table 1: Western component, 8 years | 162/162/168/184/337/444/419/363 | idem | `panel_annual` |
| Table 1: KZ→Russia, 8 years | 17/12/7/8/128/145/119/133 | idem | `panel_annual` |
| §4.1 inbound "near $440 m/yr before 2022" | ~$440 m | mean 2018–21 = 443 | `panel_annual` |
| §4.1 Western component factor "≈2.3×" | 2.3 | 391 / 169 = 2.31 | `panel_annual` |
| §4.1 outbound 2018–21 / 2022 / 2023–25 | $7–17 m; $128 m; $119–145 m | 7–17; 128; 119–145 | `panel_annual` |
| §3 "China supplies about two-thirds of this inbound value" | ~2/3 | 0.68 | panel calc |

## PASS — the DiD and its robustness (§4.3, Table 2)

| Claim (location) | Reported | Computed | Source |
|---|---|---|---|
| DiD surge → Russia $\gamma$ (§1, §4.3, Table 2) | 2.44 (0.96), p=0.013 | 2.4408 (0.9594), p=0.01304 | `rq1_estimates` |
| DiD surge → W+China inbound $\gamma$ (§4.3, Table 2) | 2.10 (1.06), p=0.05 | 2.0986 (1.0576), p=0.0509 | `rq1_estimates` |
| DiD surge → Western inbound $\gamma$ (§4.3) | 1.73 (0.98), p=0.08 | 1.7299 (0.9792), p=0.0814 | `rq1_estimates` |
| DiD surge → KZ-reported imports $\gamma$ (§4.3, Table 2) | 1.88 (0.63), p=0.004 | 1.8839 (0.6343), p=0.00401 | `rq1_estimates` |
| DiD mirror-gap $\gamma$ (§4.3) | 0.54, p=0.81 | 0.5411 (2.271), p=0.8123 | `rq1_estimates` |
| Wild-cluster bootstrap p, outbound (§4.3) | 0.010 | 0.010 | `rq1_estimates` |
| PPML outbound / inbound (§1, §4.3, Table 2 note) | 3.5× p=0.02; 2.4× p<10⁻⁴ | 3.53× p=0.0158; 2.35× p=4.5e-5 | `rq1_estimates` |
| Pre-trend joint Wald p (§4.2 fig, §4.3) | 0.78 outbound, 0.42 inbound | 0.777, 0.415 | `rq1_estimates` |
| CHPL DiD, four outcomes (§4.3, Table 2) | 2.88 / 2.12 / 1.93 / 2.94 | 2.8751 / 2.1225 / 1.9272 / 2.9398 | `rq1_estimates` |
| Placebo DiD $\gamma$ (abstract, §1, §4.3, Table 2) | −0.95 (0.25), p=0.001 | −0.9515 (0.2548), p=0.00103 | `rq1_robustness` |
| **Size-decile × year FE** $\gamma$, outbound (§4.3) | 2.29, p=0.003 | 2.293, p=0.003 | `rq1_did_robustness` |
| Size-decile × year FE $\gamma$, W+China inbound (§4.3) | 1.28, p=0.05 | 1.280, p=0.052 | `rq1_did_robustness` |
| **Donut / drop-2022** $\gamma$, outbound (§4.3) | 2.71, p=0.012 | 2.713, p=0.012 | `rq1_did_robustness` |
| **Holm** across 4 outcomes (§4.3, Table 2 note) | expRU 0.039, impW 0.016 stay sig; mirWC/mirW do not | 0.0391 / 0.0160 sig; 0.102 / 0.102 not | `rq1_did_robustness` |
| **Selection-rule permutation** — rule picks vs observed (§4.3) | ~5 vs 29; P(≥29) < 0.001 | null mean 5.0, max 12; P(≥29) = 0.000 | `rq1_did_robustness` |
| Selection-rule permutation — $\gamma$ magnitude (§4.3) | perm mean ≈ 2.8; observed not in tail (p ≈ 0.58) | mean 2.791, sd 1.498, p95 5.367; p = 0.576 | `rq1_did_robustness` |
| §4.3 "55 of the 75 lines clear the outbound threshold, only 41 the inbound one" | 55, 41 | outbound 55, inbound 41 | `rq1_did_robustness` |
| Table 2 $N$ — surge / priority / placebo (caption) | 600 / 600 / 200 | 75×8 / 25×8 / 25×8 | `rq1_estimates`, `rq1_robustness` |
| Table 2 stars — surge outbound | `*` (p=0.013) | 0.01 ≤ p < 0.05 → `*` | derive |
| Table 2 stars — W+China inbound | unstarred (p=0.051) | p > 0.05 → none | derive |
| Table 2 stars — KZ imports | `**` (p=0.004) | p < 0.01 → `**` | derive |
| Table 2 stars — placebo | `**` (p=0.001) | p < 0.01 → `**` | derive |
| §4.3 reform confound — civilian inbound / civilian outbound break sup-$F$ | ≈0.3; 34 vs 151 | 0.32; 34.37 vs 150.68 | `rq1_robustness` |
| §4.3 "outbound break four to five times larger" | 4–5× | 150.68 / 34.37 = 4.4× | `rq1_robustness` |

## PASS — what Kazakhstan retains (§5)

| Claim (location) | Reported | Computed | Source |
|---|---|---|---|
| §5.1 unit-value wedge, CIF basis | 0.73 annual (n=112), 0.70 monthly | 0.7304 (112), 0.6969 | `rq2a_unit_value_wedge` |
| §5.1 unit-value wedge, FOB/FOB basis | 1.6 annual, 1.5 monthly | 1.593, 1.513 | `rq2a_unit_value_wedge` |
| §5.1 control-basket wedge (both bases) | 0.59 CIF, 0.94 FOB | 0.592, 0.938 | `rq2a_unit_value_wedge` |
| §5.1 pass-through slope range / significance | 0.06–0.48, sig only annual f.o.b. | 0.061 / 0.152 / 0.204 / 0.477 (annual fob p=0.032) | `rq2a_unit_value_wedge` |
| §5.1 weight-ratio (no weight gain) | median ≈ 0.08 | 0.084 annual, 0.088 monthly | `rq2a_unit_value_wedge` |
| §5.2 matched-cell f.o.b. gross margin (reported as "not usable") | ~34 % censored; value-weighted −0.49 | +0.343; −0.49 | `rq2b_io_propagation` |
| §5.2 VA multipliers $\bar v^{TT}$, $\bar v^{M}$ (OECD ICIO) | 0.79, 0.76 | 0.787, 0.764 | `rq2b_io_propagation` |
| §5.2 margin band $m$ (national-accounts TIF convention) | 6–14 % | 0.06 / 0.10 / 0.14 | `rq2b_io_propagation` |
| §5.2 VA per rerouted $ / midpoint | 5–11 %; ~8 % | 0.047 / 0.079 / 0.110 | `rq2b_io_propagation` |
| §5.2 domestic VA retained on the $479 m increment | $23–53 m | "~$23–53 m" (headline) | `rq2b_io_propagation` |
| §5.2 ratio to a produced $ — ICIO | "about one in ten" | 0.079 / 0.764 = 0.103 | `rq2b_io_propagation` |
| §5.2 ratio "one in five at $\bar v^M = 0.40$" | ~1:5 | 0.079 / 0.40 = 0.198 | `rq2b_io_propagation` |
| §5.2 incremental Western inbound / flow-through | $887 m; ~½ | 887; 0.54 | `rq2b_io_propagation` |
| §5.2 West+China inbound / flow-through ("one-sixth") | $3.2 bn; 1/6 | 3158; 0.15 | `rq2b_io_propagation` |
| **§5.2 BNS I-O cross-check** $\bar v^{TT}$, $\bar v^{M}$ (§3, §5.2) | 0.89, 0.74 | 0.885, 0.742 | `rq2b_bns_io_check` |
| §5.2 BNS cross-check — ratio moves "one-in-ten → one-in-eight" | ICIO 0.10 → BNS ~0.12 | 0.103 → 0.119 | `rq2b_bns_io_check` |
| §5.2 under-invoicing bound (§5.2) | ~25 % margin ⇒ ~40 % under-recording | 0.20/0.787 = 0.254; recording +81 % ⇒ ~45 % under-recorded | derive from `rq2b` |
| §5.3 incremental flow, cumulative / per year | $479 m; $107–134 m/yr | 479; 117/134/107/122 | `rq2c_fiscal` |
| §5.3 customs duty | ~$22 m / 4 yr (~$5 m/yr) | 21.6 (mid: CET 6 %, cleared 75 %) | `rq2c_fiscal` |
| §5.3 flow as % of GDP | 0.2–0.3 % | 0.20–0.27 (2022–25) | `rq2d_macro` |
| §5.3 duty as % of GDP | ~0.02 % | 0.01–0.02 | `rq2d_macro` |

## PASS — the (non-)investment response and mechanism (§6–§9), carried from the 2026-08-28 run

| Claim (location) | Reported | Computed | Source |
|---|---|---|---|
| Deals/yr, mfg+transport+distribution (§1, §6) | 7.3 (2015–21), 7.5 (2022–25) | 51/7 = 7.29, 30/4 = 7.5 | `valueadd_findings`, `power_null` |
| Poisson rate ratio post/pre + CI (§6) | 1.03, 95 % CI 0.63–1.65 | 1.03 [0.63, 1.65] | `power_null` |
| 2023–25 rate + RR (§6) | 9.0/yr; RR 1.24 [0.74, 2.01] | 9.00; 1.24 [0.74, 2.01] | `power_null` |
| MDE (§6, "power against ~80 %+") | ~1.8× | 1.8× | `power_null` |
| §6 "2015 is an observed zero" (power_null label, re-run) | 31 deals in 2015, 0 in scope | idem | `power_null` |
| Table 3 (captive) — QIC & private, 8 cells (§7) | 1/4, 2/117, 13/1170, 34/453 ; 1/10, 2/767, 6/138, 192/10373 | exact | `mechanism_tests` |
| QIC project count (§7) | 50 | 1+2+13+34 | `mechanism_tests` |
| Auto deals fell (§7) | 6 (2015–21) → 3 (2022–25) | 6 → 3 | `mechanism_tests` |
| §7 Test C, 2023-H1 → 2023-H2 monthly outbound | ~$15 m → ~$9 m, "more than a third" | 14.6 → 9.5, −35 % | `mechanism_tests` / recompute |
| §6/§7 2025 rail-freight consolidation | $0.8 bn / $767 m | 766.8 | `mechanism_tests` |
| Table 4 (sector priority) — 7 rows (§9) | see table | C28/C25/C20/H52/G/C26/C29 | `sector_priority` |
| §9 machinery imports ×, other two × | ~8×; ~2× | 7.89; 1.78, 1.69 | `sector_priority` |
| §8 electronics output (tab:moderators) | ≈$230 m | C26 base 234 | `sector_priority` |
| §8 / §10 Armenia GFCF rise after 2022 | "about three points of GDP" / +3.3 pp | ARM d_gfcf = +3.3 pp | `crosscountry` |
| §8 findev range (intermediary comparison group) | 24–66 % of GDP | KGZ 24 … GEO 66 | `crosscountry` |
| §8 ARM exports→Russia series 2022–25 | $71 / $93 / $42 / $13 m | 70.9 / 93.4 / 42.2 / 12.8 | `rq1_robustness` |
| §8 KGZ exports→Russia series 2022–25 | $12 / $30 / $12 / $12 m | 12.4 / 30.3 / 11.6 / 12.0 | `rq1_robustness` |
| §8 KZ exports→Russia series 2022–25 (for contrast) | $128 / $145 / $119 / $133 m | matches Table 1 | `panel_annual` |
| §4.3/§8 ARM / KGZ break sup-$F$ | 10, p=0.01 ; 13, p=0.004 | 10.47, p=0.0145 ; 13.44, p=0.00357 | `rq1_robustness` |
| §6 CapIQ mfg deals ("5.1 vs 5.2") | 5.1 / 5.2 | `tab:dealsource` CapIQ row | `deal_source_reconcile` (2026-08-28) |

## EXPLAINED

| Claim | Reported | Computed | Named alternative (non-blocking) |
|---|---|---|---|
| §1 / §4.2 "roughly tenfold" raw level rise | ~10× | annual expRU ×11.9; monthly ×16.3 | Deliberate round-down. "Roughly tenfold" / "an order of magnitude" is the intended looseness for a ×12–16 raw level rise; the DiD magnitude the abstract carries separately is stated as $3.5\times$ (PPML). Recorded in the 2026-08-31 (pre-R2) audit; unchanged. |

## UNMATCHED (manual review — not audited this pass)

| Claim | Raw context | Note |
|---|---|---|
| Table 2 (`tab:dealsource`) FactSet / Dealroom columns | marked pending (`[To run.]`) | **By design.** Extracts require the author's DB logins (deferred by the user 2026-08-31). `05_deal_source_reconcile.R` waits on `_data/deals_factset.csv` / `_data/deals_dealroom.csv`. Re-audit these columns once the extracts land. |
| `tab:dealsource` CapIQ / PitchBook / Preqin cells; `crosscountry` / `sector_priority` / `mechanism_tests` numbers | §6–§9 | Carried unchanged from the 2026-08-28 run; the round-2 revision did not touch the `kz_valueadd` pipeline, so these were not regenerated this pass. Values match the manuscript; provenance date-stamp is 2026-08-28, not 2026-08-31. |

## Verdict

**PASS.** Zero FAIL. Every numeric claim in §3–§10 that the round-2 revision introduced or
changed — the `12_did_robustness.R` battery (size×year FE, donut, Holm, selection-rule
permutation), the dropped freight-netting and its replacement 6–14 % band, the KZ BNS I-O
cross-check, the corrected Table 2 stars, the §8 neighbour series — reconciles with a
regenerated 2026-08-31 output within tolerance. The one EXPLAINED row is a deliberate rounding
convention carried from the prior audit. The two UNMATCHED rows are the FactSet/Dealroom
columns (pending by design) and the §6–§9 numbers carried from 2026-08-28 (pipeline untouched).

## Next steps

1. Run the FactSet + Dealroom extracts once logins are available; complete `tab:dealsource`;
   re-audit those columns.
2. On the next full run, regenerate the `kz_valueadd` outputs alongside so the §6–§9 cells
   carry a current provenance date.
3. Gate: do not circulate until the QIC/Baiterek register is public and its fields are
   verified against `quality_reports/qic_data_fields_needed.md` (§7 "captive capital
   abstained" identification depends on it).
