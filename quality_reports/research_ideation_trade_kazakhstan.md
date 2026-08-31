# Research Ideation: Kazakhstan / Central Asia Trade

**Date:** 2026-08-27
**Input:** "Research idea on trade" → scoped (via clarifying Qs) to **Kazakhstan / Central Asia trade**, **standalone new project**, **method-agnostic**.
**Data reviewed:** `C:\Users\zh.kakishev\OneDrive - AIFC\...\Trade research\Claude feeder\` (12 files — inventory below).
**Literature verification status:** NOT YET RUN. All citations below are flagged `[H]` (high confidence exists as described), `[M]` (plausible — verify), `[L]` (uncertain). Run `/verify-claims` on this file before circulating.

---

## Data inventory (what's actually in the folder)

| File | What it is | Research value |
|---|---|---|
| `Модель внешней торговли.xlsm` | **Econometric trade model.** KZ exports & imports, **~12 commodity groups × 10 partner macro-regions** (EU, Russia, China, India, Turkey, Japan, S. Korea, Central Asia, SE Asia, RoW), **annual 2001–2022 actuals + projections to 2035**, in **physical volume (tons)** and value. Contains **estimated elasticities** (demand/supply/price) per commodity, an **estimated commodity×region fixed-effects matrix**, dummy matrix, and macro drivers (Brent, KZ GDP/population/income/investment, world manufacturing output, USD rate, sectoral output). 4 scenarios. | **Core asset.** A ready bilateral (region-level) commodity panel + a first-pass structural estimation to build on. |
| `Модель грузоперевозок.xlsx` | **Freight model.** Same KZ export/import flows in tons, tagged by **corridor / direction** (`east`, `north-west`, …), 2001 onward. | Corridor attribution → the "Middle Corridor vs Northern route" reorientation story. |
| `Интерфейс2.xlsm` | Scenario dashboard (`What_if`, `Tech`, `Transit` sheets). | Transit-corridor volume series. |
| `2021.11.30_PPP_BPA_RU...pdf` | **GIZ "Trade Facilitation in Central Asia" Business Process Analysis (2021).** Field time-release + BPMN process studies at **7 named border crossing points**: Konysbaeva/Yalama & Tazhen (KZ–UZ road), Zhaysan (KZ–RU, intra-EAEU), Karasu (KZ–KG, intra-EAEU), Altynkol/Khorgos (KZ–CN rail), Saryagash (KZ–UZ rail). Procedure inventories, dwell times, documents, infrastructure observations. | Trade-cost / friction measurement at the crossing-point level. |
| `230529_GDP_create_methodology_v2.pdf` | Methodology note ("Capture / Consolidate / Create") using the **KZ 2021 Input–Output table**, UN Comtrade, KZ Bureau of National Statistics. Computes GDP / employment / tax multipliers of incremental trade via I-O iteration. | Domestic value-added propagation of trade shocks. |
| `230606_..._President Memo...pdf`, `230519_..._Final deck...pdf` | **Confidential** government "Delivery Unit" pitch: "2X non-oil trade" program (+US$60bn non-oil trade by 2030, Middle-Corridor pivot, 4 "accelerators", 300k jobs, +US$16bn GDP, proposed Presidential decree). | Policy framing, testable headline claims, initiative list. **Not citable/quotable — see provenance note.** |
| `..._Customer Journey...xlsx`, `Customer RIS.xlsx` | Per-product import "customer journey" maps (medicaments, precious metals, electronics, machinery, tyres, grain) — process steps, time, cost, pain points. | Value-chain-level friction case studies. |
| `20230525 ...Сантос... Поти.docx` | Worked routing/cost example, Santos (Brazil) → Almaty via Poti (Georgia). | Illustrative corridor-cost anecdote. |

**Bottom line:** you hold a region×commodity trade panel with corridor tags and a first-pass elasticity/FE estimation, plus border-friction and I-O multiplier inputs. That supports descriptive, gravity/reduced-form, and quantitative-model work on **corridor reorientation, trade facilitation, and the domestic pay-off from trade/transit**.

---

## ⚠️ Data provenance & confidentiality (read before building anything)

1. **The model, elasticities, scenario design, memo and deck are proprietary consulting/government deliverables** (attributed to "Whiteshield" for the Kazakhstan Delivery Unit / Presidential Administration; the President Memo is stamped *"Конфиденциально — не для распространения"*). They **cannot be published, quoted, or posted** as-is, and results derived from them may be encumbered.
2. **A publishable paper must be rebuildable from public sources:** UN Comtrade / BACI (CEPII), WITS-TRAINS & WTO tariff data, KZ Bureau of National Statistics (Stat.gov.kz) trade and I-O tables, EDB / Eurasian Economic Commission statistics, World Bank WDI/LPI, GIZ's *published* trade-facilitation reports, IMF DOTS. Treat the folder as a **scoping aid and a benchmark**, not as the analysis dataset.
3. **Your own involvement:** one filename addresses you directly, i.e. you had a professional role in this project. Clear (a) any data-use / NDA terms with the data owners, (b) conflict-of-interest disclosure, and (c) whether AIFC / the Delivery Unit expect co-authorship or pre-publication review, **before** investing in a paper that leans on this material.
4. If in doubt, the safe path is: use the folder to decide *which* public datasets to assemble, then never open it again during estimation.

---

## Research Questions

### RQ1: How, and how much, has Kazakhstan's non-oil trade reoriented across corridors since 2014/2022 — by commodity and partner? (Feasibility: High)

**Type:** Descriptive
**Paper type:** descriptive (measurement)

**Hypothesis:** After the 2014 Crimea sanctions and especially after February 2022, KZ non-oil trade and transit shifted at the margin from the Northern (Russia) route toward the Trans-Caspian "Middle Corridor," but the shift is concentrated in a few commodity×partner cells (containerisable mid-value goods; China–EU transit) and is small relative to the policy rhetoric of "2X."

**Identification / approach:** No causal claim. Construct a consistent 2001–2023 bilateral (partner-region) × commodity panel from Comtrade/BACI + KZ BNS; map flows to corridors using the freight-model direction tags as a crosswalk (validated against EDB/KTZ published corridor throughput). Decompose growth into commodity mix, partner mix, and corridor mix (shift-share). Document the value-vs-tonnage wedge on transit (the memo's "88% of tonnage, 3% of value" claim — reproduce it from public data).

**Data requirements:**
- UN Comtrade / BACI bilateral trade, HS 4–6 digit, 2001–2023 (public).
- KZ BNS trade by mode of transport; KTZ / EDB Middle Corridor & Northern route TEU series (public).
- Folder: `Модель грузоперевозок.xlsx` and `Интерфейс2.xlsm` as the corridor crosswalk + benchmark.

**Potential pitfalls:**
1. Corridor attribution is not in Comtrade — mitigation: build the crosswalk transparently, publish it, show robustness to alternative mappings.
2. Re-exports inflate 2022–23 flows (see RQ4) — mitigation: flag mirror-statistics anomalies and treat re-export cells separately.

**Related work:** Pomfret, *The Central Asian Economies in the 21st Century* `[H]`; Chupilkin, Javorcik & Plekhanov (2023), "The Eurasian roundabout" `[H]`; Grafe, Raiser & Sakatsume (2008), "Beyond borders: reconsidering regional trade in Central Asia," *JCE* `[H]`.

---

### RQ2: What is the ad-valorem-equivalent trade cost of Central Asian border frictions, and how much trade would deep trade facilitation on the Middle Corridor create? (Feasibility: Medium–High)

**Type:** Causal / structural-gravity
**Paper type:** theory+empirics (structural gravity)

**Hypothesis:** Border and procedural frictions at KZ crossing points impose a tariff-equivalent of the order of tens of percent, largest for time-sensitive and perishable goods (agri-food, machinery), and larger at non-EAEU crossings (KZ–UZ, KZ–CN) than intra-EAEU ones. Removing half of the measured friction raises affected bilateral trade by a double-digit percentage.

**Identification strategy:**
- **Method:** Structural gravity, PPML with exporter-year, importer-year, and pair fixed effects; friction proxies enter the pair-time term.
- **Treatment variation:** (a) cross-crossing-point differences in dwell time / procedure count from the GIZ BPA and successor rounds; (b) discrete facilitation reforms as events — EAEU Customs Code (2018), Uzbekistan's 2017–2019 border/tariff liberalisation, Khorgos/Altynkol capacity ramp — in an event-study / DiD on exposed commodity×partner cells.
- **Key assumption:** conditional on the FE structure, the timing of each reform is not driven by contemporaneous bilateral trade shocks in the specific exposed commodities.

**Data requirements:**
- Bilateral panel as in RQ1.
- Border-friction measures over time: GIZ BPA (2021) + any repeat rounds, World Bank LPI, WB Doing Business "Trading across borders" (through 2020), UNESCAP trade-cost database, WCO time-release studies.
- Tariffs / NTMs: WITS-TRAINS, WTO, EAEU CET schedules.

**Potential pitfalls:**
1. GIZ BPA is essentially one cross-section — mitigation: use it to calibrate a friction index, get the time variation from LPI/UNESCAP and reform events.
2. Reforms are bundled with other policy changes — mitigation: narrow commodity exposure windows, placebo commodities, pre-trends.
3. Landlocked, few partners → gravity noise — mitigation: region aggregation as in the existing model; report MRT-consistent counterfactuals.

**Related work:** Head & Mayer (2014) gravity handbook chapter `[H]`; Santos Silva & Tenreyro (2006), "The log of gravity" `[H]`; Hummels & Schaur (2013), "Time as a trade barrier," *AER* `[H]`; Djankov, Freund & Pham (2010), "Trading on time," *REStat* `[H]`; Volpe Martincus, Carballo & Graziano (2015), "Customs," *JIE* `[M]`; Baniya, Rocha & Ruta (2020), "Trade effects of the New Silk Road," *JDE* `[M/H]`.

---

### RQ3: What was the effect of the 2010 EAEU Customs Union common external tariff on Kazakhstan's imports and trade diversion? (Feasibility: Medium–High)

**Type:** Causal
**Paper type:** reduced-form (DiD / event study)

**Hypothesis:** Joining the Customs Union forced KZ to raise applied tariffs on many products to the higher Russian-set CET, reducing imports of treated products from outside the bloc and diverting them toward Russia/Belarus; welfare-relevant diversion is concentrated in consumer manufactures and machinery.

**Identification strategy:**
- **Method:** DiD across HS products, treatment intensity = the 2009→2011 change in KZ applied tariff (large for products where KZ's pre-CU tariff was below the new CET; ≈0 where it already matched).
- **Treatment date:** 2010 (CU) / 2011 (full CET adoption).
- **Control group:** products with little or no tariff change; also within-product variation across partners (bloc vs non-bloc).
- **Key assumption:** parallel trends in import growth across high- vs low-ΔT products absent the CET; pre-2010 event-study leads flat.

**Data requirements:**
- KZ applied tariffs by HS line, 2007–2013: WITS-TRAINS.
- Import values/quantities by HS × partner, 2001–2022: Comtrade.
- Folder model brackets 2010 cleanly (panel starts 2001) — use as a cross-check on the aggregate series.

**Potential pitfalls:**
1. 2008–09 crisis and oil-price collapse confound the pre-period — mitigation: control for product-level income/price elasticities, drop 2008–09 from the trend window, use partner-specific controls.
2. Simultaneous WTO-accession negotiations (KZ acceded 2015 with ~3,500 lines below CET) — mitigation: exploit the CET-vs-WTO wedge as additional variation; robustness excluding "sensitive list" lines.
3. Prior work exists (see below) — mitigation: the contribution is the **commodity×partner reorientation** and a **long (2011–2022) post-window** that ends in the 2022 shock, not the short-run price pass-through already estimated.

**Related work:** Isakova, Koczan & Plekhanov (2016), "How much do tariffs matter? Evidence from the customs union of Belarus, Kazakhstan and Russia," *J. Economic Policy Reform* `[H]`; World Bank (2012), assessment of the Customs Union for Kazakhstan `[M]`; Vinokurov / EDB Eurasian integration studies `[M]`.

---

### RQ4: Did Kazakhstan become a re-export conduit into Russia after 2022 — and did that intermediation create any domestic value added? (Feasibility: High)

**Type:** Descriptive + Mechanism
**Paper type:** descriptive (trade-gap forensics) + light reduced-form

**Hypothesis:** After February 2022, KZ imports of specific goods (dual-use machinery, electronics, vehicles, some consumer categories) from the EU/China rose sharply and were mirrored by a rise in KZ exports of the same categories to Russia, with a widening mirror-statistics discrepancy. The margin captured domestically (logistics/markup) is small relative to the gross flow — Kazakhstan is a "pass-through," not a value-adding processor.

**Identification / approach:**
- **Trade-gap forensics:** compare partner-reported vs KZ-reported flows (Comtrade mirror stats) by HS6, month where available; flag "missing" / "phantom" flows post-2022; benchmark against the Caucasus/Central Asia pattern in Chupilkin–Javorcik–Plekhanov.
- **Value-added test:** map the incremental gross re-export flow through the KZ 2021 I-O table (public) using the folder's "Capture vs Create" logic; estimate the domestic GDP / employment / tax content per dollar of re-export vs per dollar of genuine local production/assembly.
- Optional event-study: KZ↔Russia exports of exposed vs non-exposed HS categories around March 2022 and around each subsequent sanctions package.

**Data requirements:**
- Comtrade / BACI monthly & annual, HS6, both-side reporting, 2018–2024 (public).
- EU & China export data to KZ; KZ export data to Russia.
- KZ 2021 I-O table, KZ BNS (public); folder methodology note as the multiplier recipe.

**Potential pitfalls:**
1. Sensitivity — sanctions-evasion framing is politically charged and touches your employer's remit → keep the paper measurement-first, no naming of firms, clear COI disclosure, consider co-authoring with an outside academic.
2. Monthly HS6 mirror data is patchy for KZ — mitigation: annual HS6 + quarterly where available; triangulate with EU Eurostat and China customs.
3. Attribution of "phantom" flows to evasion vs. legitimate demand shifts — mitigation: report ranges, use non-sanctioned placebo goods, follow the established discrepancy methodology.

**Related work:** Chupilkin, Javorcik & Plekhanov (2023), "The Eurasian roundabout," EBRD WP 276 / CEPR `[H]`; Fisman & Wei (2004), "Tax rates and tax evasion: evidence from missing imports in China," *JPE* `[H]`; Javorcik et al. follow-ups on friend-shoring / rerouting (2023–24) `[M]`; Bown (2023) sanctions-and-trade commentary `[M]`.

---

### RQ5: What is the general-equilibrium welfare and GDP effect for Kazakhstan of the Middle Corridor coming fully online versus losing Russian transit? (Feasibility: Medium)

**Type:** Policy / counterfactual
**Paper type:** structural (quantitative trade model)

**Hypothesis:** Full Middle-Corridor build-out (time and cost parity with the Northern route) yields a modest but positive permanent GDP gain for KZ (order 0.5–2%), concentrated in transport services and containerisable manufactures; a permanent loss of Russian transit/route access is substantially more costly than the corridor upside is beneficial (asymmetry from limited substitutability and capacity constraints).

**Identification / approach:**
- Build a small multi-region, multi-sector quantitative trade model (Caliendo–Parro / Eaton–Kortum style, or a market-access reduced form à la Donaldson–Hornbeck) for KZ + its 10 partner regions.
- Discipline trade elasticities with **transparent re-estimation** of the folder model's equations on public data (report standard errors, specification checks — the spreadsheet gives point values only).
- Iceberg trade costs by corridor calibrated from RQ2 frictions + route time/cost (freight model, GIZ, route examples).
- Counterfactuals: (a) Middle Corridor at parity; (b) Northern route cost +50% / closed; (c) the "2X" logistics-cost package; propagate to domestic value added via the I-O block.

**Data requirements:**
- Everything from RQ1–RQ2, plus sectoral output/trade shares (KZ I-O, GTAP or OECD ICIO for partners), transport-cost data (freight model, CAREC corridor performance measurement, World Bank LPI).

**Potential pitfalls:**
1. "Consultancy model dressed as research" risk — mitigation: the paper's contribution must be the credible re-estimation + GE closure + uncertainty quantification, explicitly contrasted with the deterministic spreadsheet.
2. Region aggregation hides within-"RoW" heterogeneity — mitigation: sensitivity to disaggregating key partners (Iran, Azerbaijan, Georgia, EU sub-blocs).
3. Capacity constraints on the Middle Corridor are first-order and models with smooth substitution miss them — mitigation: add an explicit capacity/congestion term; report with and without.

**Related work:** Caliendo & Parro (2015), *REStud* `[H]`; Donaldson (2018), "Railroads of the Raj," *AER* `[H]`; Donaldson & Hornbeck (2016), "Railroads and American economic growth: a market-access approach," *QJE* `[H]`; Bird, Lebrand & Venables (2020), "The Belt and Road Initiative: reshaping economic geography in Central Asia?," *JDE* `[H]`; de Soyres, Mulabdic & Ruta (2020), "Common transport infrastructure," *JDE* `[M]`.

---

### RQ6 (stretch): Do procedural border frictions on specific value chains act as a hidden tax, and who bears it? (Feasibility: Low–Medium — needs new data)

**Type:** Mechanism
**Paper type:** descriptive / survey (firm-level)

**Hypothesis:** Specific procedural steps flagged in the folder's "customer journey" maps (e.g., a redundant second customs declaration on multimodal air cargo, phytosanitary re-inspection on grain, brokerage bottlenecks) each carry a measurable time-and-cost penalty that maps to a tariff-equivalent for that value chain, and the incidence falls mainly on importers/consumers.

**Approach:** Formalise the "customer journey" workbooks into process maps; attach time/cost from a small structured survey of freight forwarders and importers in 3–4 chains (electronics, pharma, grain, auto parts); convert to ad-valorem equivalents using time-as-a-trade-barrier estimates; compare to the statutory tariff.

**Data requirements:** New — a short forwarder/importer survey (design with `/interview-me` → `/preregister`); the folder workbooks as the sampling frame of steps. Overlaps your survey-methods toolkit from PhD paper 2.

**Potential pitfalls:** small-N, self-report bias, generalisability. Mitigation: preregister, triangulate with the GIZ observational timings, frame as measurement.

**Related work:** Hummels & Schaur (2013) `[H]`; Volpe Martincus et al. (2015) `[M]`; Carballo, Graziano, Schaur & Volpe Martincus on time and trade `[M]`.

---

## Ranking

| RQ | Feasibility | Contribution | Data in hand? | Priority |
|----|-------------|-------------|---------------|----------|
| **RQ1** Corridor reorientation, disaggregated | High | Medium (regional/policy journal) | Yes (public + folder crosswalk) | **1 — do first; it also builds the panel every other RQ needs** |
| **RQ4** 2022 re-export forensics + value-added test | High | High (timely, cited debate) | Yes (public Comtrade + I-O) | **2 — highest impact-per-effort; mind sensitivity** |
| **RQ2** Trade-cost equivalents + facilitation gravity | Med–High | High (methods + policy) | Partly (need friction time series) | 3 |
| **RQ5** Quantitative GE model of corridors | Medium | High (top-field potential) | Partly (big build) | 4 — natural "job-market paper" if RQ1–RQ2 land |
| **RQ3** 2010 Customs Union CET DiD | Med–High | Medium (extends existing work) | Yes (WITS + Comtrade) | 5 — clean identification, good second/robustness paper |
| **RQ6** Value-chain friction survey | Low–Med | Medium | No (new survey) | 6 — stretch; only if you want a survey component |

**Recommended arc:** RQ1 → RQ4 as a first paper (or a paper each), sharing one clean public bilateral panel; then RQ2 feeds RQ5 as the ambitious follow-up. RQ3 is a self-contained side paper.

---

## Suggested next steps

1. **Clear the provenance questions** (NDA / COI / AIFC expectations) before any writing — see the confidentiality note. This gates everything.
2. **Build the public panel now (RQ1 foundation):** pull BACI (CEPII) + KZ BNS trade, 2001–2023, HS6 → aggregate to the folder's 12 commodity groups × 10 partner regions; recreate the corridor crosswalk from `Модель грузоперевозок.xlsx` and validate against KTZ/EDB published throughput. All in R (`tradestatistics`/manual BACI import; Python unavailable on this machine).
3. **Run `/verify-claims` on this file** to check every `[M]`/`[L]` citation and the negative-space claim that RQ1/RQ4 at this disaggregation are not already published.
4. **Assemble the friction data (RQ2):** WB LPI, UNESCAP trade-cost database, WITS-TRAINS tariffs, EAEU CET schedules; log which GIZ BPA quantities are usable and whether repeat rounds exist.
5. **Pick one of RQ1 / RQ4** and take it to `/interview-me` to lock the RQ, sample, estimand, and identification into a spec before planning the analysis.
6. **Deeper literature:** Richard Pomfret (Central Asia trade), EDB/EEC integration studies, the post-2022 rerouting literature (Chupilkin–Javorcik–Plekhanov and follow-ups), the BRI-gravity literature (Baniya–Rocha–Ruta, Bird–Lebrand–Venables, de Soyres et al.).

---

*Generated by `/research-ideation`. Citations unverified — see status line at top. Confidential source material summarised for scoping only and must not be redistributed.*
