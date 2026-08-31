# Phase 0 — Feasibility probe: **GO**

**Date:** 2026-08-27
**Question:** Is there a statistically significant, sanctions-timed break in trade routed through Kazakhstan — enough to justify building the full paper?
**Data:** Eurostat `ext_lt_main*` — EU-27 exports/imports vs partner countries, **annual**, TOTAL goods + 6 broad SITC groups. **No API key.** (This is a probe, not the identifying design; Phase 1 uses monthly HS6 + the Common High Priority List + UN Comtrade mirror data.)

## Results

### 1. Structural break in EU exports to Kazakhstan
| Series (log, 2010–2024) | supF / QLR | p | Bai–Perron break | Jump: mean 2017–21 → 2022–24 |
|---|---|---|---|---|
| TOTAL goods | 85.4 | ≈ 0 | **2021** (i.e. 2021→22) | ×2.05 (**+105%**) |
| SITC 7 machinery & transport equipment | 47.8 | 2.4 × 10⁻¹⁰ | 2021 (+ old 2014/17) | ×2.19 (**+119%**) |

Chow test at 2022: F = 85.4 (TOTAL) / 47.8 (SITC7), p < 10⁻⁵ both.

### 2. Difference-in-differences — treated intermediaries {KZ, AM, KG} vs 7 far controls {US, BR, IN, ZA, EG, MA, RS}
`feols  log(EU exports) ~ treated:post | partner + year`, cluster by partner, 2010–2024.

| Group | treated × post (log pts) | ≈ % | p |
|---|---|---|---|
| TOTAL | 0.81 | +124% | 0.040 |
| SITC 7 machinery/transport | 1.10 | +200% | 0.029 |

Kazakhstan **only** vs controls: TOTAL 0.27 (p = 0.013), SITC7 0.36 (p = 0.004). Smaller than the pooled figure because Armenia (+149%) and Kyrgyzstan (+345%) jumped harder; also single-treated-cluster inference is optimistic here.

### 3. Event study (SITC 7, treated × year, ref = 2021)
2022: **+1.25** (p = 0.008), 2023: **+1.55**, 2024: **+1.39** log points — a discontinuous jump ≈ 4× the largest pre-2022 deviation. Mild positive drift 2018–2020 (~0.25–0.36) — see confound note.

Figures: `phase0_fig1_intermediaries_total.png`, `phase0_fig2_kz_by_group.png`, `phase0_fig3_eventstudy_sitc7.png`. Full log: `phase0_break_tests.txt`.

## Caveats (why Phase 1 is still needed)
1. **Annual, broad SITC** — not the identifying design. Real design: monthly, HS6, CHPL tiers, mirror gap, unit-value pass-through, civilian placebo goods.
2. **Pre-trend** 2018–2020 in the event study — the annual/broad data is noisy; needs cleaner controls + higher frequency.
3. **Single treated cluster** for the KZ-only DiD — use wild-cluster bootstrap / more partners in Phase 1.
4. **Presidential-transition confound** (Tokayev / "New Kazakhstan" outward-oriented reform agenda, 2019 → accelerating 2022 with the June-2022 referendum and November-2022 re-election). A reform-driven trade expansion overlaps the sanctions shock. Discriminating evidence to build into Phase 1:
   - concentration in CHPL / dual-use / near-zero-base categories (broad liberalisation ≠ battlefield goods);
   - the re-export signature — same HS6 in from the EU and out to Russia within months, unit-value pass-through ≈ 1;
   - partner asymmetry — imports surge **from sanctioning countries**, exports surge **to Russia**;
   - Armenia and Kyrgyzstan show the same 2022 jump with no "New Kazakhstan" reform → common Russia-sanctions shock;
   - high-frequency break at **2022m3**, not 2019 and not the referendum/election months;
   - civilian non-restricted placebo goods should carry the reform trend but not the spike.
   For the macro question (RQ3) the confound is harder — demote to "correlates", add the reform agenda as a competing explanation, consider synthetic control.

## Decision
**GO.** Proceed to Phase 1. Blocker: a free UN Comtrade API key (`COMTRADE_PRIMARY`).
