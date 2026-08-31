# RQ2 — What Kazakhstan captures from the reorientation (annual, v1)

**Date:** 2026-08-27
**Contribution of the paper.** RQ1 shows the flows moved; RQ2 asks how much domestic value
Kazakhstan retains. Two pieces: (a) the retained trade margin (unit-value evidence), (b) the
induced domestic value added, employment and tax (input-output propagation).

## (a) Retained trade margin — unit-value wedge

Surge basket, post-2022, HS6 cells with both an import weight and a re-export weight
(**monthly: n = 647**; annual: n = 96 — consistent):

| measure | monthly | annual |
|---|---|---|
| flow-through: KZ→Russia value / (EU+China→KZ) value | 0.47 | **0.43** |
| median unit-value wedge  uv(KZ→Russia) / uv(West→KZ) | **0.75** | 0.74 |
| p25 – p75 of the wedge | 0.30 – 1.56 | 0.35 – 1.62 |
| pass-through regression: log uv(out) ~ log uv(in), slope | **0.27 (p = 0.004)** | 0.18 (n.s.) |

The re-export unit value is **below** the import unit value in the median cell — Kazakhstan is
not marking these goods up on the way through. And the pass-through slope is **0.27, far from
1**: the price Kazakhstan charges Russia barely tracks the price it paid — consistent with
heterogeneous within-HS6 mix and/or **under-invoicing on the outbound leg** (a known feature of
this trade). By dual-use tier the wedge runs 0.55 (integrated circuits) to 1.25
(semiconductor-manufacturing equipment). Pass-through, not transformation.

## (b) Input-output value capture  (FULL mode — OECD ICIO 2023 ed., Kazakhstan block, 2019)

Domestic Leontief inverse from the **OECD ICIO** KAZ×KAZ block (45 ISIC-rev4 industries).
Domestic VA multiplier v′L: **trade + transport + warehousing = 0.787**, **manufacturing = 0.764**
(both high — the ICIO attributes a large domestic-intermediate share to Kazakhstan; a KZ
national I-O table is the planned robustness check). Trade+insurance+freight margin retained on
a transiting good: **6–14 %** band (KZ national accounts / the project's own "Capture"
methodology on the KZ 2021 I-O base; the ICIO does not isolate the re-export margin).

| per USD of… | low (6 %) | **mid (10 %)** | high (14 %) |
|---|---|---|---|
| …gross flow rerouted → domestic VA | 4.7 % | **7.9 %** | 11.0 % |
| …domestic manufacturing output → domestic VA | — | **76.4 %** | — |
| ratio (corridor / factory) | 6 % | **≈ 10 %** | 14 % |

**Headline (mid):** of the ~$562 m rerouted to Russia in the surge basket (post-2022),
Kazakhstan retains on the order of **$44 m (~8 %)** as domestic value added. The same dollar of
domestic manufacturing output would generate **~76 %**. A rerouted dollar creates roughly
**one-tenth** the domestic value of a produced dollar — *corridor, not factory.* The
conclusion is robust: even if the relevant-manufacturing multiplier were as low as 0.40, the
ratio is still ~20 %.

## Caveats / to finalize

1. **I-O multiplier level.** OECD ICIO gives KZ domestic VA multipliers ~0.76–0.79 across
   sectors (high domestic-intermediate share). Cross-check with the KZ Bureau of National
   Statistics symmetric I-O table (68 products). Also weight the "manufacturing" counterfactual
   toward the surge-basket sectors (electronics/machinery: VA_mult ~0.69–0.81) rather than the
   equal-weighted mean.
2. **Annual, thin.** 96 wedge cells. Monthly data (~900 cells) firms up the wedge, the
   pass-through slope, and lets us date the flow-through lag.
3. **Fiscal.** Customs duty + import VAT on the KZ-clearing (non-EAEU-exempt) share not yet
   computed — `09_fiscal_macro.R`.
4. **Under-invoicing** on the KZ→Russia leg biases the wedge and the retained-margin measure
   *down*; treat as a lower bound; cross-check against gross-vs-mirror discrepancies.
5. **No employment multiplier** — ICIO SML has no labour data. Add from KZ BNS employment by
   activity, or ILO.

Outputs: `rq2a_unit_value_wedge.txt`, `rq2a_fig_wedge_hist.png`, `rq2b_io_propagation.txt`,
`rq2a_cell_measures.rds`, `rq2b_io_results.rds`.
