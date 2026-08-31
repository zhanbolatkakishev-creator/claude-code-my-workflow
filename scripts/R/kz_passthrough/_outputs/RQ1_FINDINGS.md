# RQ1 — The reorientation of trade through Kazakhstan

**Date:** 2026-08-28 (monthly upgrade added)
**Data:** UN Comtrade, HS6. **Annual 2018–2025** (keyless) for magnitudes + **monthly
2019m1–2025m12** (authenticated API) for break timing / event study / unit-value cells.
2024 excluded from the monthly KZ-reported series (Kazakhstan stopped monthly reporting to
Comtrade after 2024-02; mirror covers it). KZ-reported + partner-mirror.
75 HS6 = 50 EU/US/UK/JP "Common High Priority Items" (technology-intensive / dual-use) + 25
civilian control codes. West→KZ inflows measured by **mirror** (partner-reported); KZ's own
import reporting has gaps for 2020–2022. KZ→Russia measured by KZ-reported exports (complete).
Monthly upgrade pending an API key.

## Headline

Surge-basket products (31 of 75 HS6 lines where both the inflow from the EU+China **and** the
outflow to Russia at least doubled after 2022):

| USD m / year | 2018 | 2019 | 2020 | 2021 | **2022** | 2023 | 2024 | 2025 |
|---|---|---|---|---|---|---|---|---|
| EU+China → KZ (mirror) | ~183 | ~176 | ~172 | ~196 | **412** | 585 | 511 | 445 |
| KZ → Russia | ~36 | ~32 | ~16 | ~12 | **156** | 213 | 175 | 170 |

Pre-2022 these lines carried almost no KZ→Russia trade (~$15–35m/yr); from 2022 they carry
~$155–213m. EU+China exports of the same lines to Kazakhstan roughly tripled. Both series turn
at 2022 and partly recede after 2023 (compliance tightening).

## Tests

**Structural break (aggregate surge-basket series, supF / QLR):**
| series | supF | p |
|---|---|---|
| EU+China → KZ (mirror) | **143** | ≈ 0 |
| KZ → Russia | **60** | 5.5 × 10⁻¹³ |
| mirror gap (mirror − KZ-reported imports) | 5.3 | 0.16 |

**Difference-in-differences** — dual-use vs civilian controls, HS6 + year FE, cluster HS6
(`asinh(value) ~ exposed:post`):
| outcome | coef (log pts) | p |
|---|---|---|
| KZ imports from West (reported) | 2.94 | 4.6 × 10⁻⁷ |
| KZ exports to Russia | 2.88 | 2.3 × 10⁻⁴ |
| EU+China → KZ (mirror) | 1.93 | 5.0 × 10⁻³ |

Data-driven surge basket gives directionally identical but weaker DiD (basket is partly
endogenous to these outcomes) — the pre-specified dual-use set is the cleaner test.

**Event study** (annual, dual-use set, mirror inflow, ref = year before treatment): leads
−4…−2 = 0.78 / 0.15 / 0.21; lags 0…+3 = **2.72 / 2.75 / 1.65 / 1.73** (all p < 0.05).

**Monthly (the sharp version).** Aggregate surge-basket series, 2019m1–2025m12:
- **EU+China → KZ (mirror): supF = 329**, Bai–Perron break **2022-06**; level ×2.9
  ($14.9 → $43.4 m/month).
- **KZ → Russia: supF = 424**, Bai–Perron break **2022-04**; level **×10.0**
  ($1.7 → $16.9 m/month).
- Event study around 2022m3 (fig `rq1_fig_monthly_eventstudy.png`): both series flat for the
  ~15 pre-months, then climb over months +1…+6 and **plateau** (KZ→Russia to ≈ +3.2 asinh
  points, EU+China→KZ to ≈ +1). The break is at **2022m4–m6** — right after the March-2022
  sanctions, **not** 2019, the June-2022 referendum, or the November-2022 election, and not
  the gradual ramp a liberalisation would produce.

## Reform-confound check

The "New Kazakhstan" liberalisation (2019 →) predicts broad, gradual trade growth. What we see
instead:
- the jump is concentrated in dual-use / near-zero-base lines, discontinuous at **2022** (not
  2019, the June-2022 referendum, or the Nov-2022 election);
- **placebo:** within the civilian control basket, a placebo DiD (large vs small pre-2022 lines)
  gives **−0.28, n.s.**; the control basket's own break is supF **16** vs the surge basket's
  **143**;
- **Armenia & the Kyrgyz Republic** show the identical 2022 break in surge-basket exports to
  Russia — Armenia $6–11 m/yr → **$78 m (2022), $92 m (2023)** (supF = 49, p = 1×10⁻¹⁰);
  Kyrgyz Rep. $2–4 m/yr → **$26 m, $31 m** (supF = 66, p = 4×10⁻¹⁴). Neither had a "New
  Kazakhstan" reform → the break is the **common post-2022 Russia-trade shock**, not
  KZ-specific liberalisation.

Monthly data will add the exact-timing check (break at 2022m3 vs political-calendar dates) and
the same-HS6 in→out lag.

## Status

RQ1 established on annual data. Next: RQ2 value capture (unit-value wedge is coded; I-O
propagation needs the KZ input-output table — OECD ICIO or ADB MRIO). Monthly re-pull upgrades
RQ1's event study when the API key is available.

Outputs: `rq1_estimates.txt`, `rq1_fig_surge.png`, `rq1_fig_eventstudy.png`,
`surge_basket_stats.rds`, `panel_hs_period.rds`.
