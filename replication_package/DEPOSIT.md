# openICPSR Deposit Record — "Corridor, Not Factory"

Paste-ready metadata for the openICPSR web deposit form (Elsevier / *Journal of International
Economics* data-editor pipeline). Fields follow the openICPSR "Create a New Project" schema;
bracketed `[FILL]` lines are the only ones the author must complete at upload.

---

## 1. Project-level metadata

| openICPSR field | Value |
|---|---|
| **Title** | Replication Package for: "Corridor, Not Factory: Trade Reorientation and the Missing Investment Response in Kazakhstan, 2022–2025" |
| **Principal investigator** | Zhanbolat Kakishev, Nazarbayev University |
| **PI email** | zhanbolat.kakishev@nu.edu.kz |
| **PI ORCID** | `[FILL — author ORCID iD]` |
| **Version** | V1 (initial submission deposit) |
| **Deposit / publisher** | openICPSR — *Journal of International Economics* collection |
| **Related publication** | Kakishev, Z. "Corridor, Not Factory: Trade Reorientation and the Missing Investment Response in Kazakhstan, 2022–2025." Submitted to the *Journal of International Economics*, 2026. `[FILL — DOI on acceptance]` |
| **Openness** | Public use, after the article is accepted. Delta (embargo) until acceptance. |

## 2. Summary (deposit abstract)

> A large, sector-specific rise in demand for a tradeable good is expected to induce domestic
> investment. After February 2022, with Russia's direct trade with its main partners
> disrupted, part of it was reallocated through neighbouring economies, Kazakhstan among them.
> Using product-level trade data (HS6, 2018–2025) this project measures the demand shock,
> calibrates what Kazakhstan retains (a wholesale-and-freight margin of 6–14% propagated
> through the OECD ICIO table implies 5–11 cents of domestic value added per rerouted dollar,
> against about three-quarters for a produced dollar), and tests for an investment response
> using three commercial deal databases. It finds none in the reoriented product lines, and
> reads the null through three gates: market access, irreversibility, and capital-market
> institutions. The package regenerates every table, figure, and load-bearing numeric claim
> in the manuscript from public data plus one academically-licensed deal extract. R only.

## 3. Subject terms (openICPSR keywords)

trade reorientation; re-export; entrepôt trade; demand shocks; investment under uncertainty;
irreversibility; industrial policy; value added; global value chains; input–output analysis;
institutional voids; transit economies; customs union; Eurasian Economic Union; Kazakhstan;
Russia; difference-in-differences; structural breaks

## 4. Coverage and collection

| openICPSR field | Value |
|---|---|
| **Geographic coverage** | Kazakhstan (primary); Russia, Armenia, the Kyrgyz Republic, Georgia, Türkiye, Belarus, China, EU-27, United Kingdom, United States, Japan, Korea, Switzerland, Norway (trade partners / comparators) |
| **Geographic unit** | Country; product line (HS 6-digit) |
| **Time period** | 2015-01-01 – 2025-12-31 (deal data); 2018–2025 annual and 2019m1–2024m2 + 2025 monthly (trade data); 2019 reference year (OECD ICIO); 2023 reference year (Kazakhstan BNS input–output) |
| **Collection date** | Trade / macro / input–output extracts pulled 2026-08 to 2026-09; deal extract delivered 2026-08-25 |
| **Unit of observation** | HS6 product line × period (trade panels); transaction (deal data); ISIC rev. 4 industry (input–output, sector-priority) |
| **Universe** | (a) 75 candidate HS6 lines — 50 from the EU/US/UK/JP List of Common High Priority Items (Feb 2024) plus 25 civilian control lines; the 29-line "surge basket" is selected from these. (b) All merger, acquisition, private-equity, and venture transactions with a Kazakhstan-domiciled target/issuer announced 2015–2025 (N ≈ 493 after de-duplication). |
| **Data type** | Aggregate administrative / official statistics (trade, macro, input–output); proprietary firm-transaction records (deal data, not redistributed); program source code |
| **Data format** | `.rds`, `.csv`, `.txt`, `.png` (provided); `.xlsx` (deal extract — pointer only) |

## 5. Funding

This research received no specific grant from any funding agency in the public, commercial, or
not-for-profit sectors.

## 6. Data availability statement (deposit form + article)

All trade, macro, and input–output data are public and are either shipped in derived form or
regenerable from the scripts. The deal-level data underlying the investment-response analysis
(Section 7, Table 3, Figure 4, and the minimum-detectable-effect calculation) are proprietary
(S&P Capital IQ, PitchBook, Preqin) and **cannot be redistributed**; the package provides the
complete query specification and the native source deal identifiers so that a researcher with
the same subscriptions can reconstruct the identical extract (`data/raw/access-restricted-data.md`).
State-fund investment figures are transcribed from a published report (QIC/AIFC/IFC, *Private
Equity in Kazakhstan*, 2026). No individual-level or personally identifying data are used.

Classification for the openICPSR "Data Availability" control:

| Source | openICPSR class | In deposit |
|---|---|---|
| UN Comtrade (HS6 annual + monthly, mirror flows) | Public, third-party | Derived panels shipped; raw pulls regenerated by `fetch_*.sh` |
| World Bank World Development Indicators | Public, third-party | Extracts shipped; regenerated live by `07_crosscountry.R`, `11_macro.R` |
| OECD Inter-Country Input–Output tables, 2023 ed. | Public, third-party, **redistribution not permitted** | Pointer only — replicator downloads `2019_SML.csv` from OECD |
| Kazakhstan Bureau of National Statistics I–O + resources tables | Public, third-party | Pinned copy shipped; auto-downloaded by `08b_kz_bns_io.R` |
| S&P Capital IQ / PitchBook / Preqin deal extract | **Proprietary, redistribution prohibited** | Pointer + query spec + identifiers only; aggregate counts (Table 3) shipped |
| QIC/AIFC/IFC, *Private Equity in Kazakhstan* (2026) | Published report, third-party | Not shipped; cited figures transcribed |

## 7. Terms of use

- **Code** (`code/`): MIT License, © 2026 Zhanbolat Kakishev (`LICENSE.md`).
- **Derived public data** (`data/analysis/`, `output/`): released under the originating
  providers' terms — UN Comtrade data-use terms (attribution, non-commercial research);
  World Bank WDI under CC-BY 4.0; Kazakhstan BNS as public-sector information.
- **Not included**: the OECD ICIO raw matrix and the Capital IQ / PitchBook / Preqin deal
  data. Replicators must obtain these under their own licences.

## 8. Related-materials cross-reference

| Item | Location |
|---|---|
| Manuscript | `Manuscript/corridor.pdf` (git tag `jie-submission-2026-09-03`) |
| Standard replication README (AEA template) | `replication_package/README.md` |
| DCAS compliance checklist | `replication_package/DCAS_checklist.md` |
| Reproducibility audit (numeric claims vs. outputs) | `quality_reports/reproducibility_audit_corridor.md` — PASS, 0 FAIL |
| Computational-requirements block | `replication_package/output/computational_requirements.md` |
| Access-restricted-data note | `replication_package/data/raw/access-restricted-data.md` |
| Environment lockfiles | `renv.lock`, `output/sessionInfo.txt` (×2) |

## 9. File manifest to upload

Build the upload tree with the commands in `README.md` §7, then upload:

```
README.md                         # AEA-template replication README (rename to "README.pdf"
                                  #   or keep .md per the JIE data editor's preference)
DCAS_checklist.md
LICENSE.md
data/
  analysis/  panel_hs_period.rds, surge_basket_stats.rds, hs_class.csv,
             kz_io.rds, deal_source_reconcile.csv, deal_ids.csv [FILL]
  raw/       kz_bns_io/io_2023_ru.xlsx
             access-restricted-data.md
             icio/  (pointer note — 2019_SML.csv NOT included)
             (deal .xlsx NOT included)
code/
  kz_passthrough/  00_run_all.R, 00_setup.R, 01–12*.R, fetch_*.sh
  kz_valueadd/     00_run_all.R, 00_setup.R, 01–08*.R, fetch_kz_imports_hs2.sh
output/
  kz_passthrough/  *.txt, *.rds, *.png, sessionInfo.txt
  kz_valueadd/     *.txt, *.rds, *.png, sessionInfo.txt
  renv.lock
  computational_requirements.md
```

Excluded from the deposit by design: `code/*/_data/` (~700 MB of raw Comtrade pull cache,
regenerated by `fetch_*.sh`); `20260825_Market size DA.xlsx` (licensed); OECD `2019_SML.csv`
(redistribution not permitted).

## 10. Author checklist before clicking "Publish"

1. `[FILL]` ORCID iD and (on acceptance) the article DOI.
2. Confirm with S&P, Morningstar/PitchBook, and Preqin that publishing **bare deal
   identifiers** (`data/analysis/deal_ids.csv`, source + id columns only, no deal-level
   fields) is permitted. If any vendor objects, omit that file and supply it on request to
   verified licence holders — note the change in `README.md` §2 and
   `data/raw/access-restricted-data.md`.
3. Run `code/kz_passthrough/00_run_all.R` then `code/kz_valueadd/00_run_all.R` once on a
   clean checkout and record the actual wall-clock runtime in
   `output/computational_requirements.md` (replace the estimate).
4. Verify the deposit against `DCAS_checklist.md` — every row PASS or a completed `[FILL]`.
5. Set the openICPSR embargo to lift on article acceptance.
