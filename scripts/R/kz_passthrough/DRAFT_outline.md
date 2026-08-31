# Passing Through: Kazakhstan's Post-2022 Trade Reorientation and the Limits of Value Capture

*Outline + all v1 numbers. **Full first draft written**: `Manuscript/passthrough.tex`
(+ `passthrough.bib`). This file is the working scratch; the `.tex` is the deliverable.
Reproduce everything: `scripts/R/kz_passthrough/00_run_all.R`.*

---

## Abstract (≈150 words — draft, update with monthly + final I-O)

Since 2022, geopolitical tensions in the region have disrupted direct trade between Russia and
several of its largest partners, and a growing share of that trade is rerouted through
neighbouring economies. This paper documents the reorientation for **Kazakhstan** at the
product level (HS6, 2018–2025) and asks a question the literature leaves open: **how much of
this gross-trade windfall does the host economy retain?** In 31 product lines, exports to
Russia rose from ~$25m/yr before 2022 to ~$200m and imports from the EU and China roughly
tripled, both breaking sharply in 2022 (supF = 60 and 143). Yet Kazakhstan re-exports these
goods at a *lower* unit value than it imports them, and — propagating the retained trade
margin through the national input–output table — the domestic value added created per dollar
rerouted is about **8%**, versus **~76%** for a dollar of domestic manufacturing output. The
customs-duty take is under 1% of customs revenue. Kazakhstan operates as a corridor, not a
factory: the trade statistics move sharply, the domestic economic footprint far less.

## 1. Introduction

- The 2022 disruption of direct Russia–EU and Russia–China goods trade; third-country rerouting
  as a first-order feature of the new geography (cite Chupilkin–Javorcik–Plekhanov *EER* 2026;
  Chupilkin–Javorcik–Peeva–Plekhanov *AEA P&P* 2025).
- What is known: the rerouting happened; rough magnitudes; substitution ratios.
- **The gap:** whether the intermediary economy *benefits*. Gross trade ≠ GDP, jobs, or revenue
  when the activity is thin-margin transit. This matters for (i) Kazakhstan's own policy —
  how much is the reorientation worth net of compliance/reputational cost — and (ii) the
  general economics of transit-hub countries.
- **This paper:** (1) measures the reorientation for Kazakhstan, HS6 monthly, through 2025,
  reported + mirror; (2) quantifies value capture — retained trade margin (unit-value wedge),
  domestic value added / employment / indirect tax via the KZ input–output table, and
  customs/VAT incidence.
- **Findings preview.** [• reorientation magnitude • retained margin • I-O multiplier contrast
  • fiscal • the "corridor not factory" conclusion]
- **Contribution.** First host-economy incidence analysis of post-2022 trade rerouting;
  Kazakhstan-specific and extended to 2025.

## 2. Context

- Kazakhstan's position: EAEU member (no internal customs frontier with Russia), land corridor
  between China/EU and Russia, the Middle Corridor.
- The 2019→ "New Kazakhstan" reform agenda (Tokayev; June-2022 referendum; Nov-2022 election) —
  an outward-oriented liberalisation that **overlaps** the 2022 shock. Addressed as a competing
  explanation throughout §4.

## 3. Data

- **UN Comtrade**, HS6, **annual 2018–2025** (monthly 2019m1–2025m12 planned): KZ-reported
  exports (complete) + partner-**mirror** for the inbound side (KZ's own import reporting is
  incomplete 2020–2022). 75 HS6 = 50 EU/US/UK/JP *Common High Priority Items* + 25 civilian
  control codes.
- **Exposed product set:** the data-driven "surge basket" — **31 of 75** HS6 lines whose inflow
  from the EU+China **and** outflow to Russia both ≥ doubled after 2022 (25 dual-use, 6
  consumer). CHPL-list membership is a robustness lens, not the organising device.
- **Controls:** 25 civilian non-restricted HS6 (food, apparel, furniture, personal care, toys).
- **Kazakhstan input–output table:** OECD ICIO 2023 edition, KAZ block, 45 ISIC-rev4
  industries, 2019. (Robustness: KZ BNS 68-product symmetric table.)
- Neighbour comparison: Armenia & Kyrgyz Republic (Comtrade annual, same basket).

## 4. The reorientation (RQ1)   — *established, annual*

- **4.1 Aggregate.** Surge basket, 2018–2025. KZ→Russia: **~$12–37 m/yr (2018–21) → $158 m
  (2022) → $214 m (2023) → ~$170 m (2024–25)**. EU+China→KZ (mirror): **~$180 m/yr → $413 m
  (2022) → $584 m (2023)**. Structural break (supF): **KZ→Russia = 60 (p = 5×10⁻¹³)**,
  **EU+China→KZ = 143 (p ≈ 0)**. [FIG rq1_fig_surge]
- **4.2 Event study.** *Annual:* leads flat (−4…−2 ≈ 0.2–0.8), lags jump (0…+3 = 2.7 / 2.8 /
  1.7 / 1.7, p < 0.05, dual-use set). *Monthly (2019m1–2025m12, 2024 excluded — KZ stopped
  monthly reporting):* aggregate surge-basket series — **EU+China→KZ supF = 329 (break
  2022-06), KZ→Russia supF = 424 (break 2022-04)**; level ×2.9 and **×10.0**. Event study
  around 2022m3: flat for ~15 pre-months, climbs over +1…+6, then **plateaus** (KZ→Russia
  ≈ +3.2, EU+China→KZ ≈ +1 asinh pts). Break at **2022m4–m6** — right after the March
  sanctions, not any political-calendar date, not a gradual reform ramp.
  [FIG rq1_fig_monthly, rq1_fig_monthly_eventstudy]
- **4.3 Difference-in-differences** (dual-use vs civilian controls, HS6 + year FE, cluster HS6):
  KZ→Russia **+2.88** (p = 2×10⁻⁴); KZ imports from West **+2.94** (p = 5×10⁻⁷);
  EU+China→KZ mirror **+1.93** (p = 5×10⁻³).
- **4.4 Reform-confound checks.** (i) jump concentrated in dual-use / near-zero-base lines;
  (ii) discontinuous at 2022, not 2019 / the referendum / the election; (iii) civilian
  placebo — within-controls DiD (big vs small pre-2022) = **−0.28, n.s.**; control-basket
  break supF **16** vs surge-basket **143**; (iv) **Armenia & the Kyrgyz Republic show the
  identical 2022 break** in surge-basket exports to Russia — Armenia $6–11 m/yr → **$78 m
  (2022) → $92 m (2023)** (supF = 49, p = 10⁻¹⁰); Kyrgyz Rep. $2–4 m/yr → **$26 m → $31 m**
  (supF = 66, p = 10⁻¹⁴) — neither had a "New Kazakhstan" reform, so the break is the common
  post-2022 Russia-trade shock; (v) direction — in from the West, out to Russia.

## 5. Value capture (RQ2 — the contribution)   — *v1, annual*

- **5.1 Retained trade margin.** Flow-through KZ→Russia ÷ (EU+China→KZ) = **0.43–0.47**.
  Median unit-value wedge uv(KZ→Russia) ÷ uv(West→KZ) = **0.75** (monthly, n = 647; annual
  0.74) — Kazakhstan re-exports these goods at a **lower** price/kg than it imported them:
  no markup. Pass-through regression slope **0.27 (p = 0.004)** — the price charged to Russia
  barely tracks the price paid (within-HS6 mix and/or outbound under-invoicing). By dual-use
  tier the wedge runs 0.55 (integrated circuits) → 1.25 (semiconductor-mfg equipment).
  [FIG rq2a_fig_wedge_hist]
- **5.2 Input–output propagation** (OECD ICIO KAZ, 2019). Domestic VA multiplier v′L:
  trade+transport = **0.787**, manufacturing = **0.764**. With a 6–14 % trade+freight margin
  on transiting goods: domestic VA per $ rerouted = **4.7–11.0 % (mid 7.9 %)** vs **76 %** per
  $ of domestic manufacturing output → **ratio ≈ 10 %** (band 6–14 %). Of ~$560 m rerouted,
  Kazakhstan retains ~**$44 m** as domestic VA. *Corridor, not factory* — robust even if the
  relevant-manufacturing multiplier is as low as 0.40 (ratio still ~20 %).
- **5.3 Fiscal.** Reorientation-attributable (incremental) KZ→Russia flow = **$618 m** cum.
  2022–25. Customs duty on it ≈ **$28 m over four years (~$7 m/yr)**, band $12–50 m; net import
  VAT ≈ 0 (onward supply to Russia intra-EAEU, zero-rated). **< 1 % of KZ customs revenue** —
  the fiscal channel is negligible.
- **5.4 Macro correlates (descriptive; not causal).** The reorientation-attributable flow is
  **0.2–0.3 % of KZ GDP** — macro-immaterial. Context: 2022 current-account **surplus**
  (+$6.4 bn, vs deficits before/after; oil prices), reserves +$31 bn over 2023–25, services VA
  +$63 bn over 2022–24 — all far too large to be driven by a ~$0.6 bn/yr goods-rerouting
  channel. The reorientation registers in the **trade statistics, not the national accounts** —
  itself the point. [FIG rq2d_fig_macro]. REER from BIS still to add.

## 6. Discussion

- "Corridor, not a factory": trade statistics overstate the economic gain from rerouting.
- Implications for Kazakhstan (net value vs exposure) and for the transit-hub literature.
- Limitations: mirror-data coverage; I-O table vintage; margin vs. true evasion rents
  unobserved; 2025 partial.

## 7. Conclusion

---

### Target outlets
*Economics Letters* / *Journal of Comparative Economics* / *Review of World Economics* /
EBRD Working Paper / VoxEU column. Decide after §5 numbers.

### Reproducibility
All public data; `scripts/R/kz_passthrough/` numbered pipeline; `renv` snapshot; every headline
number checked by `/audit-reproducibility`. Literature via `/verify-claims`.
