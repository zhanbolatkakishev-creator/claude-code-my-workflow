# Redirecting PE deployment to raise domestic value capture from the trade flows

**Date:** 2026-08-28
**Inputs:** OECD ICIO Kazakhstan I-O (domestic VA multipliers by sector, 2019); UN Comtrade KZ
imports by HS2, 2017--2025 (authenticated), with the reorientation "surge basket" netted out
of the electronics-adjacent chapters; the PE/M&A deal history (dealflow by sector).
**Code:** `scripts/R/kz_valueadd/04_sector_priority.R`. Outputs: `sector_priority_matrix.csv`,
`sector_priority_fig.png`, `sector_priority_platform.txt`.
**Score:** `0.40 * VA-multiplier + 0.30 * import-substitution gap + 0.15 * import growth +
0.15 * dealflow`, ranked within Kazakhstan. Surge-basket and low-VA kit-assembly sectors are
excluded (AVOID).

## The rule

Deploy where a dollar of investment generates the most **domestic** value added given the
trade the corridor has proven. That means: (i) high domestic VA multiplier, (ii) a real
import-substitution gap (Kazakhstan buys far more than it makes), (iii) demand the trade data
confirm is there, (iv) enough of a firm base to be financeable. It explicitly does **not**
mean financing the re-export flow.

## Tier 1 --- the logistics/trade platform (do first; durable)

| sector | VA mult | output \$m | rank |
|---|---|---|---|
| Wholesale & retail trade infrastructure (G) | 0.82 | 81,000 | 1 |
| Warehousing & transport support (H52) | **0.82** | 6,800 | 2 |
| Land transport (H49) | 0.79 | 36,800 | 3 |

Warehousing/transport-support has one of the **highest domestic VA multipliers in the whole
economy** and is exactly the corridor's bottleneck. Bonded warehousing, container and
cross-dock terminals, cold chain, customs-broker and track-and-trace technology, last-mile
distribution. These are real assets with a real margin and they hold their value whether or
not the Russia flow persists. This is the single best "benefit from the trade flows" use of
PE money, and it is the least distortionary.

## Tier 2 --- import-substitution with a genuine gap + decent VA + some dealflow

| # | sector | VA mult | output \$m | imports 2023 \$m | imports/output | import growth 22-25 vs 19-21 | deals (post-22) |
|---|---|---|---|---|---|---|---|
| 1 | **Machinery & equipment n.e.c.** (C28) | 0.80 | 1,160 | ~9,600 | **8.3x** | 1.27 | 7 (3) |
| 2 | **Fabricated metal products** (C25) | 0.81 | 1,850 | 3,300 | 1.8x | 1.22 | 7 (2) |
| 3 | **Electrical equipment** (C27, surge basket removed) | 0.81 | 1,150 | ~7,300 | ~6x | 1.4 | 5 (0) |
| 4 | **Chemicals** (C20) | 0.79 | 3,480 | 5,900 | 1.7x | **1.52** | 4 (1) |
| 5 | Building materials / non-metallic minerals (C23) | 0.77 | 4,660 | 1,000 | 0.2x | 1.15 | 4 (2) |

Machinery, fabricated metal and (non-electronics) electrical equipment: Kazakhstan imports
6--8x what it produces, the VA multiplier is ~0.80, import demand grew after 2022, and a
nascent deal base exists. These are where mid-market growth equity can build genuine domestic
capacity for the domestic + Central Asian market. Chemicals has the fastest-growing import
demand of the group.

## Tier 3 --- large and mature, but limited greenfield case

- **Food, beverages & tobacco** (C10T12): VA mult 0.81, large output (\$19bn), the deepest
  dealflow in the data (26 deals) --- but Kazakhstan is largely self-sufficient (imports only
  0.34x output). Play here is expansion/roll-up and export-processing, not import substitution.
- **Basic metals** (C24): VA mult 0.80, huge base --- but Kazakhstan is a net exporter, and the
  recent deal activity is nationalisations (Qarmet), which PE should not be financing.

## Latent --- big gap, no ecosystem yet

- **Textiles, apparel, footwear** (C13T15): imports **11.6x** domestic output --- the largest
  gap in the economy --- but the VA multiplier is mid (0.74) and dealflow is zero. A longer
  play that needs cluster-building (skills, one anchor investor) before growth equity can follow.

## AVOID

| sector | VA mult | why |
|---|---|---|
| Computer, electronic & optical (C26) --- **the surge basket** | **0.69** | near-lowest VA multiplier; domestic output only ~\$230m; localising it adds secondary-sanctions exposure for a temporary flow |
| Motor vehicles & parts (C29) | **0.69** | kit assembly, near-lowest VA multiplier; imports grew 2.5x but the domestic content of "assembly" is thin |
| Rubber & plastics (C22) | 0.69 | low multiplier |

## How the state fund should deploy (the mechanism, from the PE-market evidence)

The sectors above are only investable at scale if QIC/Baiterek changes how it invests:

1. **Co-invest behind private leads**, not as the dominant direct investor --- matching capital,
   first-loss tranches, or a fund-of-funds that seeds private GPs, with market-terms governance.
2. **Bigger, syndicated tickets** --- the current sub-\$20m check size cannot finance a
   warehousing platform or a machinery plant.
3. **A real exit** --- commit to trade sales to strategics and AIX listings with genuine free
   float, so private co-investors have an exit other than buy-back.
4. **Stop absorbing the pipeline with nationalisations** --- a re-privatisation timetable for
   Qarmet/Eurocopter/Lokomotiv frees state capacity and signals direction.
5. **Fund the enabling public goods directly** --- metrology, testing and certification labs,
   technician training, reliable industrial power/water --- which no tax incentive can supply.

## One line

Point PE at the **logistics platform** (Tier 1) and at **machinery / fabricated metal /
chemicals import-substitution** (Tier 2) for the domestic and regional market; keep it away
from the surge-basket products and from kit assembly; and reform QIC from lead direct investor
to co-investor-with-an-exit so private capital can actually follow.
