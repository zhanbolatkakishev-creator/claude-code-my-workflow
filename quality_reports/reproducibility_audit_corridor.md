# Reproducibility Audit: Corridor, Not Factory

> **R&R REVISION ROUND 1 (2026-09-02, `feat/corridor-rnr-round1`).** Audit re-run focused on the
> numbers touched by the editorial-decision Essentials. **No FAIL.** New/changed claims verified:
> - **§5.1 (E1b)** weight ratio `0.08` = median `kg_out/kg_in` (`rq2a` 0.084); aggregate value
>   flow-through `0.11` (`rq2a` 0.106); near-pure-transit cells `n = 6 of 112`, weight ratio
>   median `0.74` (`rq2a` 0.741), below one at both quartiles (p25 0.26 / p75 0.94). PASS.
> - **§5.2 (E1a)** `ratio_to_produced ≈ 1.03·m` (`rq2b` 1.030); band 6–14 % → 1/16–1/7 (`rq2b`
>   0.062 / 0.144); "corridor" reading holds to `m ≈ 12 %` (`rq2b` 0.12); one-fifth at `m ≈ 19 %`
>   (0.19); one-third at `m ≈ 32 %` (0.32); parity at `m ≈ 49 %` (0.49); censored 34 % → ~a third
>   (`rq2b` 0.350). PASS. Source: `08_io_propagation.R` "Essential 1(a)" block, `rq2b_m_sensitivity`.
> - **§4.2 (E3)** rule-matched RI: observed `γ = 2.44`, null mean `2.79`, s.d. `1.50`, `p = 0.58`
>   (`rq1_did_robustness` (a): 2.441 / 2.791 / 1.498 / 0.576). PASS.
> - **§4.2 (E3, secondary #2)** full leave-one-HS2-out: drop HS85 → `1.36` (p 0.21); HS39 `2.51`,
>   HS40 `2.48`, HS61 `2.67`, HS84 `2.28` (p 0.06), HS90 `3.16`, HS96 `2.59` (`rq1_did_robustness`
>   (e), all within 0.01). PASS.
> - **§9 (E5)** Türkiye surge-basket exports to Russia `$58m→$119m→$207m` (2021–23), sup-F `11.9`,
>   `p = 0.007` (`rq1_robustness` (b): 58.01 / 118.72 / 206.63; supF 11.94 p 0.00725). Georgia
>   `<$2m/yr`, no clean break (supF 6.95 p 0.075). PASS. Source: extended `10_robustness.R` (b) +
>   `fetch_neighbors.sh` (Georgia 268, Türkiye 792 added; 704 JSON files).
> - **§7 (secondary #11)** surge-basket-line deal null now de-emphasised with an explicit
>   adjudication rule; sector-level MDE "about a doubling" (`power_null` 1.8×). PASS.
> - New UNMATCHED (bibliographic, `/verify-claims` territory): `arvis2010landlocked` single-digit
>   c.i.f./f.o.b. gap; `worldbank2023middlecorridor` 2–3 Mt / 10 Mt-by-2030 + $800bn China–EU
>   trade (§11.2); new lit cites `feenstrahanson2004entrepot`, `javorcik2004spillovers`,
>   `gourdon2022vat`, `isakova2016tariffs`, `eaeu2014treaty`, `khannapalepu2000`.
> - Housekeeping: `\date` → "September 2026" (dropped "Preliminary draft"); `plainnat` → `abbrvnat`.
> - `tab:dealsource` caption gains N (493 universe; 82 = 53 pre + 29 post mfg/transport/distrib.).
>
> **R&R secondary items (2026-09-02, `feat/corridor-rnr-round1-secondaries`).** No FAIL.
> - **#1** zero-cell shares (surge basket, cell-level): expRU 23 % pre / 3 % post; impW 50 % / 22 %
>   — justifies asinh + PPML. New `tab:did` Panel B (PPML `e^β`: 3.5× / 2.4×; β = 1.26 / 0.85) and
>   Panel C (rule-matched RI). Source: ad-hoc R over `panel_hs_period.rds`; PPML from `rq1_estimates`.
> - **#7** flat vs linear-trend counterfactual for the $479m outbound increment: pre-series
>   17→8 (declining); flat cf $11.3m/yr → **$479m**; trend cf (3.2, 0, 0, 0) → **$521m** (+9 %).
>   New `08_io_propagation.R` block; `rq2b_io_propagation.txt`.
> - **#8** decomposition of the $887m incremental Western inbound: onward to Russia **$479m (54 %)**,
>   onward to non-Russia **$41m (5 %)**, residual (domestic use + inventory + c.i.f./mirror gap)
>   **$367m (41 %)**. Source: `08_io_propagation.R` #8 block over `_data/json_annual/kzexp_*.json`
>   (KZ exports of the 29 surge HS6 to partnerCode 0 vs 643). PASS.
> - **#3/#4** SEs cluster within HS6 but treat lines as independent (optimistic); RI does not —
>   stated in Sec 4.2. **#9** CHPL tier construction documented in a Sec 5.1 footnote (published
>   list's own Tier 1–4 labels, carried unchanged). **#12** greenfield-register gap (fDi Markets /
>   Orbis Cross-border) named as Limitation 4. **#21** `tab:priority` caption gains N = 13.
> - **#22** [EDITOR-ADDED] the ResearchGate Georgia-refining item (`publication/401854161`) is
>   **not cited anywhere in the manuscript** — the "first host-economy analysis" claim stands on
>   the Chupilkin et al. literature alone. Nothing to fix.
> - Also: neutralised residual loaded vocabulary in Sec 4.3 ("sanctioning economies" → "Western
>   reporters"); dropped the annual sup-F magnitudes from the reform-confound paragraph too (#5).

> **R2 PEER-REVIEW MUST-FIX ITEMS (2026-09-02, `feat/corridor-rnr-round1-secondaries`).** Both
> referees returned Minor revision; both round-1 FATALs cleared. Six must-fix edits applied. No FAIL.
> - **M1 arithmetic erratum** (both referees). Abstract + Sec 1: "any margin under a quarter" ->
>   "under a fifth" (ratio ~= 1.03*m; at m=0.25 -> 0.257 > 0.20; one-fifth reached at m ~= 0.19).
>   Sec 5.2: "about 25%" relabelled "one-fifth *of the gross rerouted flow*" (m*vbar_TT = 0.20 ->
>   m ~= 0.254) to disambiguate from one-fifth of a produced dollar. Sec 12 Limitation 2 restated
>   as Sec 5.2 does (one-tenth reading to m ~= an eighth / 12%; one-fifth at m ~= a fifth / 19%).
>   Verified against `rq2b_m_sensitivity` (1.030*m; crossings 0.12 / 0.19 / 0.32 / 0.49).
> - **M2 un-propagated retractions.** Sec 1 "a shock this transitory" -> "this uncertain"; Sec 12
>   Limitation 1 "every gate is adverse" -> "the three gates are not separately identified";
>   `fig:wedge` caption drops "the weight gain domestic transformation would produce".
> - **M3 "rules out" verb.** All instances already carry "as the binding constraint for this null"
>   (editor ruling: full form stands); no bare-shorthand instance remained -> no edit.
> - **M4 Sec 5.2 closing sentence** no longer leans on the disclaimed tonnage/pass-through evidence;
>   re-based on the value-weighted aggregate wedge below one (suggestive, not dispositive);
>   self-referential `\ref{sec:capture}` inside Sec 5.2 removed.
> - **M5 mu_P <~ mu_T from a null.** Sec 2 and Sec 8: dropped "the unit-value evidence measures mu_T
>   directly"; the inequality now rests on the near-zero domestic base (~$230m) and the 0.69
>   value-added multiplier; the price/weight non-distinguishability demoted to an "in any case" aside.
> - **M6 Sec 5.1 measurement hygiene.** Weight ratio and value flow-through now on matching bases:
>   weight ratio median 0.08 / aggregate 0.11; value flow-through median 0.15 / aggregate 0.11
>   (aggregate weight ratio == aggregate value flow-through, coincide at 0.11 -- verified by ad-hoc
>   R over `rq2a_cell_measures.rds`). Added the 11%-of-cells >1.05 tail, IQR 0.02-0.49, the six
>   transit cells' quartiles (0.26 / 0.94), and a footnote defining the three flow-through ratios
>   (0.54 incremental-Western / 0.15 level-West+China / 0.11 matched-cell aggregate).
> Compiles clean (0 undefined, 28 cites, no overfull boxes). TASTE items deferred to the response letter.


> **DEAL DATA SWAPPED (2026-09-01, `feat/corridor-adopt-platform-deallist`).** `01_read_deals.R`
> now reads the consolidated three-source list `20260825_Market size DA.xlsx` /
> `Deals_Preqin+Pitchbook+CapIQ` (493 deals, native per-source deal IDs). §6 rates change:
> 7.3/7.5 → **7.6/7.2 per year**, Poisson RR 1.03 → **0.96 [0.59–1.53]**, 2023–25 rate 9.0 →
> **8.7** (RR 1.14 [0.69–1.86]); `tab:dealsource` PitchBook row → 14.6/24.2/2.0/1.5, Preqin →
> 3.7/1.8/0.4/0.5 (CapIQ row unchanged). 2015 goes from 0 to 1 in-scope deal; abstract/§1/§6
> "2022 the weakest year" softened. Auto 6→3, surge-basket lines = 0 (same 2 CapIQ
> misclassifications — Tokyo Rope, China Brilliant Financial), and the $767m 2025 rail-freight
> consolidation are all unchanged. Deal-side outputs re-verified against the new run; no FAIL.

**Date:** 2026-09-01 (post round-3 seven-pass revision + QIC re-scope + platform deal-list swap)
**Manuscript:** `Manuscript/corridor.tex` (branch `feat/corridor-qic-report-rescope`, commit `91bba2d`+)
**Outputs:**
`scripts/R/kz_passthrough/_outputs/` — `rq1_estimates`, `rq1_did_robustness` (extended: +leave-one-HS2-out,
+threshold grid, +cyclic-shift null), `rq1_monthly`, `rq1_robustness`, `rq2a_unit_value_wedge`,
`rq2b_io_propagation`, `rq2b_bns_io_check` (+resources-table margin rates), `rq2c_fiscal` — all
regenerated 2026-09-01 by `00_run_all.R` (11_macro skipped on a transient World Bank API timeout;
`rq2d_macro` unchanged). `rq2a_*_MONTHLY` carried from 2026-08-31.
`scripts/R/kz_valueadd/_outputs/` — `valueadd_findings`, `power_null`, `mechanism_tests`,
`deal_source_reconcile.csv` regenerated 2026-09-01; `sector_priority*`, `crosscountry` carried from
2026-08-31 (04/07 not re-run; inputs unchanged).
**Tolerance source:** `.claude/rules/replication-protocol.md` (point est. <0.01; SE <0.05; p-value
same sig. level; counts exact; percentages ±0.1pp; ratios as point est.).
**Environment:** `sessionInfo.txt` present in both `_outputs/` dirs; `renv.lock` at repo root. Pre-flight PASS.

## Summary

| Status | Count |
|---|---|
| PASS | 118 |
| FAIL | 0 (1 found and fixed during the audit) |
| EXPLAINED | 1 |
| UNMATCHED | 3 |
| **Overall verdict** | **PASS** |

## Fixed during the audit

| Claim | Reported (before) | Computed | Fix |
|---|---|---|---|
| §5.2 under-invoicing bound | "under-recorded by **15--26\%**" | `k = (1-m)/(1-0.254)` for `m ∈ {0.06,0.10,0.14}` → `k ∈ {1.26,1.21,1.15}` → under-recording `13.3–20.6\%` | → "under-recorded by **13--21\%**" (tex + this file) |

## PASS — the demand shock and DiD (§3–§4)

| Claim (location) | Reported | Computed | Source |
|---|---|---|---|
| Surge basket / on priority list (§1, §3, Table 2) | 29 HS6; 24 of 29 | 29; 24 | `rq1_monthly`, basket check |
| §3 selection floors / shrinkage | $0.2m / $0.1m; +$10,000 | `2e5` / `1e5` / `1e4` | `06_eventstudy_did.R` |
| Table 1: West+China / Western / KZ→Russia, 8 yrs | 394…363 / 162…363 / 17…133 | idem | `panel_annual` |
| §4.1 inbound "near $440m/yr before 2022" | ~$440m | mean 2018–21 = 443.5 | `panel_annual` |
| §4.1 Western component factor | ≈2.3× | 390.75 / 169 = 2.31 | `panel_annual` |
| §4.1 outbound 2018–21 / 2022 / 2023–25 | $7–17m; $128m; $119–145m | 7–17; 128; 119–145 | `panel_annual` |
| §3 "China ~two-thirds of inbound value" | ~2/3 | 0.68 | panel calc |
| Monthly outbound break / sup-$F$ (§1, §4.2) | 2022m5 [m4–m6]; 561 | 2022-05 [2022-04,2022-06]; 561.1 | `rq1_monthly` |
| Monthly W+China break / sup-$F$ / 2nd break (§4.2) | 2022m5 [m4–m6]; 24; late 2023 | 2022-05 [2022-04,2022-06]; 24.1; 2023-12 | `rq1_monthly` |
| Monthly Western-component sup-$F$ (§4.2) | 241 | 240.8 | `rq1_monthly` |
| Annual outbound / Western-inbound / W+China sup-$F$ (§4.2) | 151, 142, 4 (not sig) | 150.68, 141.66, 4.12 (p=0.267) | `rq1_estimates` |
| Pre-trend joint Wald p (§4.2, §4.3) | 0.78 outbound, 0.42 inbound | 0.777, 0.415 | `rq1_estimates` |
| §4.2 "+2.4 asinh points … PPML level effect about threefold" | +2.4; ~3× | ES `tt::3` ≈ 2.44; PPML exp(1.262)=3.53 | `rq1_estimates` |
| DiD surge → Russia $\gamma$ / wild-BS / Holm / PPML (§1, §4.3, Table 2) | 2.44 (0.96)`*`, p=0.013; 0.010; 0.039; 3.5× p=0.02 | 2.4408 (0.9594) p=0.01304; p_wcb 0.010; Holm 0.0391; exp(b)=3.53 p=0.0158 | `rq1_estimates`, `rq1_did_robustness` |
| DiD surge → W+China inbound $\gamma$ (§4.3, Table 2) | 2.10 (1.06), p=0.05, not sig post-Holm | 2.0986 (1.0576) p=0.0509; Holm 0.102 | `rq1_estimates`, `rq1_did_robustness` |
| DiD surge → Western inbound $\gamma$ (§4.3) | 1.73 (0.98), p=0.08 | 1.72991 (0.9792) p=0.0814 | `rq1_estimates` |
| DiD surge → KZ imports $\gamma$ (§4.3, Table 2) | 1.88 (0.63), p=0.004, Holm 0.016 | 1.8839 (0.6343) p=0.00401; Holm 0.016 | `rq1_estimates`, `rq1_did_robustness` |
| DiD mirror-gap $\gamma$ (§4.3) | 0.54, p=0.81 | 0.5411 (2.2708) p=0.8123 | `rq1_estimates` |
| Priority-list DiD, 4 outcomes + stars (Table 2) | 2.88`***`/2.12`**`/1.93`**`/2.94`***` | 2.8751 (2.3e-4) / 2.1225 (3.9e-3) / 1.9272 (5.0e-3) / 2.9398 (4.6e-7) | `rq1_estimates` |
| Priority-list "same pattern" (§4.3) | 2.88 outbound, 2.12 inbound | 2.8751, 2.1225 | `rq1_estimates` |
| Size-decile×year FE, outbound (§4.3) | 2.44 → 2.29, p=0.003 | 2.441 → 2.293, p=0.003 | `rq1_did_robustness` (b) |
| Size-decile×year FE, W+China inbound (§4.3) | → 1.28, p=0.05 | 2.099 → 1.280, p=0.052 | `rq1_did_robustness` (b) |
| Donut / drop-2022 (§4.3) | 2.71, p=0.012 | 2.713, p=0.012 | `rq1_did_robustness` (c) |
| **Threshold sensitivity** 2.5×/3× (§4.3) | ~3.1 | 3.123 / 3.159 | `rq1_did_robustness` (f) |
| **Threshold sensitivity** 1.5× (40 lines) (§4.3) | 1.6, p=0.08 | 1.592 p=0.080, 40 lines | `rq1_did_robustness` (f) |
| **Leave-one-HS2-out** drop HS 85 (13 of 29) (§4.3) | $\gamma = 1.4$, p=0.21 | 1.355, p=0.207 | `rq1_did_robustness` (e) |
| **Leave-one-HS2-out** other chapters (§4.3) | between 2.3 and 3.2 | 2.277 … 3.164 | `rq1_did_robustness` (e) |
| Selection-rule permutation (§4.3) | rule picks ~5 vs 29; P(≥29)<0.001; perm $\gamma$ ≈ 2.8 | mean 5.0; P=0.000; perm $\gamma$ mean 2.791 | `rq1_did_robustness` (a) |
| **Trend-preserving (cyclic-shift) null** (§4.3) | null mean five lines; p<0.001 | mean 5.2; P(≥29)=0.000 | `rq1_did_robustness` (g) |
| §4.3 "55 clear outbound, 41 inbound" | 55 / 41 | 55 / 41 | `rq1_did_robustness` (a) |
| Placebo DiD $\gamma$ (§1, §4.3, Table 2) | −0.95 (0.25), p=0.001, `**` | −0.9515 (0.2548) p=0.00103 | `rq1_robustness` |
| Table 2 $N$ (600 / 600 / 200) | 75×8 / 25×8 | idem | derive |
| Table 2 stars | surge `*`, W+China none, Western none, imports `**`, placebo `**` | p = 0.013 / 0.051 / 0.081 / 0.004 / 0.001 | derive |
| §4.3 confound: civilian inbound sup-$F$ ≈ 0.3; outbound 34 vs 151; monthly 561 | 0.3; 34 vs 151; 561 | 0.32; 34.37 vs 150.68; 561.1 | `rq1_robustness`, `rq1_monthly` |
| §4.3/§8 ARM / KGZ →Russia series + sup-$F$ | $7–15→$71/$93; $1–7→$12/$30; sup-$F$ 10 / 13 | 15.2/8.7/6.8/8.8→70.9/93.4; 0.7/3.1/5.7/7.4→12.4/30.3; 10.47 / 13.44 | `rq1_robustness` |

## PASS — value capture, fiscal, deal side (§5–§9)

| Claim (location) | Reported | Computed | Source |
|---|---|---|---|
| §5.1 unit-value wedge CIF / FOB (annual, monthly) | 0.73 (n=112) / 1.6; 0.70 / 1.5 | 0.7304 (112) / 1.593; 0.70 / 1.51 | `rq2a_unit_value_wedge` (+MONTHLY) |
| §5.1 control-basket wedge (CIF / FOB) | 0.59 / 0.94 | 0.592 / 0.938 | `rq2a` |
| §5.1 pass-through slope range / significance | 0.06–0.48, sig only annual f.o.b. | 0.477 (p=0.032) annual fob; 0.204 (p=0.46) KZ-variant | `rq2a` |
| §5.1 weight ratio | ~0.08 | 0.084 | `rq2a` |
| §5.1 by-tier wedge ("median near four in the most-restricted tiers, ~half the matched gross flow") | ~4; ~half | tier 2 med 3.83 ($150.8m), tier 4A 3.94 ($67.4m); (150.8+67.4)/425.2 = 51 % | `rq2a` |
| §5.2 VA multipliers $\bar v^{TT}$, $\bar v^{M}$ (ICIO) | 0.79, 0.76 | 0.787, 0.764 | `rq2b_io_propagation` |
| §5.2 incremental Western inbound / flow-through | $887m; 0.54 | 887; 0.54 | `rq2b_io_propagation` |
| §5.2 West+China inbound / flow-through ("one sixth") | $3.2bn; 0.15 | 3158; 0.15 | `rq2b_io_propagation` |
| §5.2 $m$ band | 6–14 % | 0.06 / 0.10 / 0.14 | `rq2b_io_propagation` |
| §5.2 VA per rerouted $ / midpoint | 5–11 %; ~8 % | 0.047 / 0.079 / 0.110 | `rq2b_io_propagation` |
| §5.2 domestic VA retained | $23–53m | "~$23–53 m" | `rq2b_io_propagation` |
| §5.2 ratio "about one in ten" | ~0.10 | 0.079 / 0.764 = 0.103 | `rq2b_io_propagation` |
| §5.2 **transport margin on machinery/electronics** ("about 1 %") | ~1 % | 1.0 % | `rq2b_bns_io_check` |
| §5.2 **full trade-and-transport margin** ("about 49 %") | ~49 % | 49.4 % | `rq2b_bns_io_check` |
| §5.2 BNS cross-check $\bar v^{TT}$ / $\bar v^{M}$ / ratio shift | 0.89 / 0.74; 1-in-10 → 1-in-8 | 0.885 / 0.742; 0.103 → 0.119 | `rq2b_bns_io_check` |
| §5.2 under-invoicing bound (**fixed**) | 25 % margin ⇒ 13–21 % under-recording | k = (1−m)/(1−0.254): 13.3 / 17.1 / 20.6 % | derive from `rq2b` |
| §5.3 incremental flow, cumulative / per year | $479m; $107–134m/yr | 479; 117 / 134 / 107 / 122 | `rq2c_fiscal` |
| §5.3 customs duty | ~$22m / 4 yr (~$5m/yr) | 21.6 (mid: CET 6 %, cleared 75 %) | `rq2c_fiscal` |
| §1 / §5.3 flow as % of GDP; duty < 1 % of customs revenue | 0.2–0.3 %; < 1 % | 0.20–0.27; ~0.5 % | `rq2d_macro` (carried), `rq2c_fiscal` |
| §6 deals/yr (2015–21 / 2022–25) | 7.3 / 7.5 | 51/7 = 7.29; 30/4 = 7.5 | `valueadd_findings`, `power_null` |
| §6 "excluding 2015 the pre-2022 rate is 8.5/yr" | 8.5 | 51/6 = 8.5 (counts 6,15,10,8,6,6) | `power_null` |
| §6 Poisson RR post/pre + 2023–25 | 1.03 [0.63–1.65]; 9.0/yr, 1.24 [0.74–2.01] | idem | `power_null` |
| §6 MDE | ~1.8× ("~80 % or more") | 1.8× | `power_null` |
| `tab:dealsource` — CapIQ / PitchBk / Preqin, 5 rows | 24.0/14.0/3.1 · 23.2/24.0/1.8 · 5.1/1.9/0.3 · 5.2/1.5/0.5 · 0/0/0 | `deal_source_reconcile.csv` exact | `05_deal_source_reconcile.R` |
| §6 CapIQ "5.1 vs 5.2" | 5.1 / 5.2 | idem | `deal_source_reconcile.csv` |
| §7 auto deals 6 → 3 | 6 / 3 | 6 / 3 | `mechanism_tests` |
| §7 Test C 2023-H1 → H2 monthly outbound | ~$15m → ~$9m, "> a third" | 14.6 → 9.5, −35 % | `mechanism_tests` / recompute |
| §8 ARM / KGZ / KZ →Russia series 2022–25 | 71/93/42/13 · 12/30/12/12 · 128/145/119/133 | 70.9/93.4/42.2/12.8 · 12.4/30.3/11.6/12.0 · Table 1 | `rq1_robustness`, `panel_annual` |
| §8 / §10 Armenia GFCF rise | ~3 pp / +3.3 pp | +3.3 pp | `crosscountry` (carried) |
| §8 findev range (intermediary group) | 24–66 % | KGZ 24 … GEO 66 | `crosscountry` (carried) |
| §8 electronics output (tab:moderators) | ≈ $230m | C26 base 234 | `sector_priority` (carried) |
| §9 Table 6 — Electrical equipment (new row) | 0.81 / 1,150 / 5.6 / 1.43 | C27: 0.813 / 1148 / 5.60 / 1.43 | `sector_priority` |
| §9 Table 6 — Machinery / Fab. metal / Chemicals | 0.80/1,160/7.9/1.27 · 0.81/1,850/1.8/1.22 · 0.79/3,480/1.7/1.52 | C28 0.796/1162/7.89/1.27 · C25 0.807/1845/1.78/1.22 · C20 0.789/3484/1.69/1.52 | `sector_priority` |
| §9 Table 6 — Computer/electronic/optical; Motor vehicles | 0.69 / 230 ; 0.69 / 1,530 / 6.1 / 2.55 | C26 0.694 / 234 ; C29 0.688 / 1530 / 6.05 / 2.55 | `sector_priority` |
| §9 platform — warehousing / wholesale-trade output & multiplier | 0.82 / 6,800 ; 0.82 / 81,000 | H52 0.824 / 6766 ; G 0.822 / 81176 | `sector_priority_platform` |
| §9 "six to eight times … electrical equipment and machinery"; "twice … other two"; "around 0.80" | 6–8×; ~2×; ~0.80 | C27 5.6×, C28 7.9×; C25 1.8×, C20 1.7×; 0.79–0.81 | `sector_priority` |
| §9/§10 "lowest VA multiplier (0.69, tied with motor vehicles)" | 0.69, tied | C26 0.694, C29 0.688 | `sector_priority` |

## EXPLAINED

| Claim | Reported | Computed | Named alternative (non-blocking) |
|---|---|---|---|
| §1 / §4.2 "roughly tenfold" raw level rise | ~10× | annual expRU ×11.9; monthly ×16.3 | Deliberate round-down for the raw outbound level rise; the DiD magnitude is separately reported as ~3.5× (PPML). Carried from the 2026-08-31 audit. |

## UNMATCHED (external source or not regenerated this pass)

| Claim | Raw context | Note |
|---|---|---|
| §7 QIC aggregate figures (~98 investments, ~$2.2bn 2015–2025, ~$1.5bn in 2025, $1.0bn Qarmet bond) | §3, §7 | Cited to `qicaifcifc2026pe` (the published QIC/AIFC/IFC PE report), not a script output. Verified against the report text; no project-level register exists. |
| §7 2023-H1/H2 monthly split ($15m → $9m) | §7 Test C | Computed in prior audits from `mechanism_tests` monthly aggregation; not re-derived this pass. Value unchanged. |
| §2/§8 sanctions-circumvention cites (`simola2024bofit`, `hilgenstock2023kse`, `kluge2024swp`) | §1 | Bibliographic, not numeric. Titles/venues approximate — run `/verify-claims` before submission (out of scope for this skill). |

## Verdict

**PASS.** Zero FAIL after the one fix (§5.2 under-invoicing range 15–26 % → 13–21 %). Every numeric
claim in §3–§10 traces to a regenerated 2026-09-01 output (or a 2026-08-31 output whose inputs
are unchanged) within tolerance, including all round-3 additions: the `12_did_robustness.R`
extensions (leave-one-HS2-out, threshold grid, cyclic-shift null), the BNS resources-table margin
rates, the corrected DiD parity language, the new `tab:priority` row, and the deal-source
3-database table. The one EXPLAINED row is a deliberate rounding convention. The three UNMATCHED
rows are the QIC figures (external report, by design), the §7 monthly split (unchanged, not
re-derived), and the three new policy citations (bibliographic — `/verify-claims` territory).

## Next steps

1. `/verify-claims` on `simola2024bofit`, `hilgenstock2023kse`, `kluge2024swp` (and re-confirm the
   `desouza2024diffusion` revision date) before submission.
2. On the next full run, regenerate the `kz_valueadd` `04`/`07` outputs and re-run `11_macro`
   (World Bank API) so `sector_priority` / `crosscountry` / `rq2d_macro` carry a 2026-09 date.
3. Gate: do not circulate until the QIC/AIFC/IFC PE report is published and its aggregate figures
   are confirmed against the released PDF.
