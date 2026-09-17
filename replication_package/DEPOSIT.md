# Mendeley Data Deposit Record — "Corridor, Not Factory"

Paste-ready metadata for the Mendeley Data submission form (`data.mendeley.com`), which is the
repository the *Journal of International Economics* Guide for Authors specifically requests
("This journal requests that you use Mendeley Data to deposit any research data associated
with your manuscript"). Mendeley Data's metadata schema is deliberately light — title,
description, per-file description, steps to reproduce, license, and administrative
category/institution fields — so this record is shorter than a DDI-style (openICPSR) deposit
would be; it folds the coverage/universe/collection detail that a heavier schema would break
into separate fields directly into the Description and Steps-to-reproduce prose instead.
Bracketed `[FILL]` lines are the only ones the author must complete at upload.

---

## 1. Dataset-level metadata

| Mendeley Data field | Value |
|---|---|
| **Title** | Replication data and code for: "Corridor, Not Factory: Trade Reorientation and the Missing Investment Response in Kazakhstan, 2022–2025" |
| **Author** | Zhanbolat Kakishev, Nazarbayev University |
| **Author email** | zhanbolat.kakishev@nu.edu.kz |
| **Author ORCID** | `[FILL — author ORCID iD]` |
| **Institution / affiliation** | Nazarbayev University |
| **Category** | Economics (International Trade; Applied Econometrics) |
| **Version** | V1 (initial submission deposit) |
| **License** | Code: MIT (`LICENSE.md`). Derived public data: per-source terms (§6 below). Not all files are openly licensed — see §5 (Access type). |
| **Related publication** | Kakishev, Z. "Corridor, Not Factory: Trade Reorientation and the Missing Investment Response in Kazakhstan, 2022–2025." Submitted to the *Journal of International Economics*, 2026. Link to the manuscript's Editorial Manager entry / DOI added `[FILL — on acceptance]`, using Mendeley Data's "Research Data" item type in the JIE submission system so the dataset DOI is linked to the article record. |
| **Publication status** | Draft / private until linked to the JIE submission; DOI reserved on creation, activated on publication (Mendeley Data convention — no embargo mechanism is needed the way openICPSR's "Delta until acceptance" required, since a Mendeley Data draft can simply be kept unpublished until the author chooses). |

## 2. Description (Mendeley Data "Description" field)

> A large, sector-specific rise in demand for a tradeable good is expected to induce domestic
> investment. After February 2022, with Russia's direct trade with its main partners
> disrupted, part of it was reallocated through neighbouring economies, Kazakhstan among them.
> Using product-level trade data (HS6, 2018–2025; UN Comtrade), this dataset and code measure
> the demand shock, calibrate what Kazakhstan retains (a wholesale-and-freight margin of
> 6–14% propagated through the OECD Inter-Country Input–Output table implies 5–11 cents of
> domestic value added per rerouted dollar, against about three-quarters for a produced
> dollar), and test for an investment response using three commercial deal databases
> (S&P Capital IQ, PitchBook, Preqin). It finds none in the reoriented product lines and reads
> the null through three gates: market access, irreversibility, and capital-market
> institutions.
>
> **Coverage.** Geographic: Kazakhstan (primary); Russia, Armenia, the Kyrgyz Republic,
> Georgia, Türkiye, Belarus, China, EU-27, United Kingdom, United States, Japan, Korea,
> Switzerland, Norway (trade partners/comparators). Temporal: trade data 2018–2025 annual and
> 2019m1–2024m2 plus 2025 monthly; deal data 2015–2025; OECD ICIO 2019 reference year;
> Kazakhstan Bureau of National Statistics input–output 2023 reference year. Unit of
> observation: HS6 product line × period (trade panels); transaction (deal data); ISIC rev. 4
> industry (input–output, sector-priority tables). Universe: 75 candidate HS6 lines (50 from
> the EU/US/UK/JP List of Common High Priority Items, Feb 2024, plus 25 civilian control
> lines), from which the 29-line "surge basket" is data-selected; all merger, acquisition,
> private-equity, and venture transactions with a Kazakhstan-domiciled target/issuer announced
> 2015–2025 (N ≈ 493 after de-duplication).
>
> This dataset regenerates every table, figure, and load-bearing numeric claim in the
> manuscript from public data plus one academically-licensed deal extract (not itself
> redistributed — see §5). R only.

## 3. Steps to reproduce (Mendeley Data "Steps to reproduce" field)

1. Restore the R environment from the repo root: `R -e 'renv::restore()'` (R 4.5.3; full
   package list in `output/renv.lock` and `output/sessionInfo.txt` ×2).
2. Set `COMTRADE_PRIMARY=<key>` in `~/.Renviron` for the authenticated monthly Comtrade pulls.
3. Place the two pointer inputs the licenses do not permit redistributing: OECD ICIO
   `2019_SML.csv` at `code/kz_passthrough/_data/icio/icio_ex/`, and (licence holders only) the
   Capital IQ/PitchBook/Preqin deal extract at `code/kz_valueadd/_data/` (see
   `data/raw/access-restricted-data.md` to reconstruct it from the query specification and
   source deal identifiers if you do not already hold it).
4. Fetch raw trade data: `bash fetch_annual.sh`, `bash fetch_keyed.sh`,
   `bash fetch_neighbors.sh` in `code/kz_passthrough/`; `bash fetch_kz_imports_hs2.sh` in
   `code/kz_valueadd/`.
5. Run `Rscript 00_run_all.R` in `code/kz_passthrough/` (trade shock, value capture, DiD,
   structural breaks), then in `code/kz_valueadd/` (investment response, sector priority —
   requires the deal extract from step 3).
6. Outputs land in each pipeline's `_outputs/`; the Table/Figure → script:line map in
   `README.md` §6 traces every manuscript exhibit to its producing file.

Full detail, including expected runtime (~12–18 minutes analysis-only, single-core, <4 GB
RAM, plus 15–30 minutes for the live API pulls; `[FILL]` — replace with a measured
clean-machine run) is in `README.md` §4–§6.

## 4. Funding

This research received no specific grant from any funding agency in the public, commercial, or
not-for-profit sectors.

## 5. Access type, by component

Mendeley Data supports three access levels per file: **Open**, **Restricted-Access** (files
withheld, released only if the author approves a reader's request), and **Metadata-Only** (no
files deposited, described only). None of this project's inputs fit "Restricted-Access" in the
literal sense, because the licensed deal data cannot be redistributed to *any* third party,
approved-request or not — the vendor agreements prohibit it outright, not merely gate it
behind author approval. The deposit is therefore split as follows, and the manuscript's cover
letter carries the corresponding data-exemption request the journal's replication policy asks
for when data cannot be shared:

| Component | Access type | Rationale |
|---|---|---|
| All code (`code/`) | **Open** | MIT-licensed, no restriction |
| Derived public data (`data/analysis/*.rds`, `.csv`) | **Open** | Built from public sources; redistribution permitted under those sources' terms |
| Kazakhstan BNS input–output pinned copy | **Open** | Public-sector information |
| Aggregate deal counts (`deal_source_reconcile.csv`) | **Open** | Aggregate only, no deal-level fields |
| OECD ICIO raw matrix (`2019_SML.csv`) | **Metadata-only** (pointer) | Free to download for research, redistribution not permitted — link to the OECD source instead of depositing the file |
| Capital IQ / PitchBook / Preqin deal extract | **Not deposited** (pointer + query spec + identifiers only, per the cover-letter exemption request) | Redistribution prohibited by all three vendor agreements at any access tier |
| QIC/AIFC/IFC report figures | **Not applicable** | Third-party publication, cited not deposited |

## 6. Data availability statement (dataset + article, same wording)

All trade, macro, and input–output data are public and are either shipped in derived form or
regenerable from the scripts. The deal-level data underlying the investment-response analysis
(Section 7, Table 3, Figure 4, and the minimum-detectable-effect calculation) are proprietary
(S&P Capital IQ, PitchBook, Preqin) and **cannot be redistributed**; the package provides the
complete query specification and the native source deal identifiers so that a researcher with
the same subscriptions can reconstruct the identical extract
(`data/raw/access-restricted-data.md`). State-fund investment figures are transcribed from a
published report (QIC/AIFC/IFC, *Private Equity Market in Kazakhstan*, 2026). No
individual-level or personally identifying data are used.

| Source | Class | In deposit |
|---|---|---|
| UN Comtrade (HS6 annual + monthly, mirror flows) | Public, third-party | Derived panels shipped; raw pulls regenerated by `fetch_*.sh` |
| World Bank World Development Indicators | Public, third-party | Extracts shipped; regenerated live by `07_crosscountry.R`, `11_macro.R` |
| OECD Inter-Country Input–Output tables, 2023 ed. | Public, third-party, **redistribution not permitted** | Pointer only — replicator downloads `2019_SML.csv` from OECD |
| Kazakhstan Bureau of National Statistics I–O + resources tables | Public, third-party | Pinned copy shipped; auto-downloaded by `08b_kz_bns_io.R` |
| S&P Capital IQ / PitchBook / Preqin deal extract | **Proprietary, redistribution prohibited** | Pointer + query spec + identifiers only; aggregate counts (Table 3) shipped |
| QIC/AIFC/IFC, *Private Equity Market in Kazakhstan* (2026) | Published report, third-party | Not shipped; cited figures transcribed |

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
| Manuscript | `Manuscript/corridor.pdf` |
| Cover letter (carries the data-exemption request) | `Manuscript/cover_letter.md` |
| Standard replication README (AEA template) | `replication_package/README.md` |
| Cover note to the Data Editor | `replication_package/data_editor_note.md` |
| DCAS compliance checklist | `replication_package/DCAS_checklist.md` |
| Reproducibility audit (numeric claims vs. outputs) | `quality_reports/reproducibility_audit_corridor.md` — PASS, 0 FAIL |
| Computational-requirements block | `replication_package/output/computational_requirements.md` |
| Access-restricted-data note | `replication_package/data/raw/access-restricted-data.md` |
| Environment lockfiles | `renv.lock`, `output/sessionInfo.txt` (×2) |

## 9. File manifest to upload

Build the upload tree with the commands in `README.md` §7, then upload as the Mendeley Data
dataset's files (each file gets its own short description field in the Mendeley Data form —
one line per top-level item is enough; the README documents each file in full):

```
README.md                         # AEA-template replication README
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

## 10. Author checklist before clicking "Publish" on Mendeley Data

1. `[FILL]` ORCID iD and (on acceptance) the article DOI, added to the "Related publication"
   link so the dataset and article cross-reference each other.
2. Confirm with S&P, Morningstar/PitchBook, and Preqin that publishing **bare deal
   identifiers** (`data/analysis/deal_ids.csv`, source + id columns only, no deal-level
   fields) is permitted. If any vendor objects, omit that file and supply it on request to
   verified licence holders — note the change in `README.md` §2 and
   `data/raw/access-restricted-data.md`.
3. Run `code/kz_passthrough/00_run_all.R` then `code/kz_valueadd/00_run_all.R` once on a
   clean checkout and record the actual wall-clock runtime in
   `output/computational_requirements.md` (replace the estimate).
4. Verify the deposit against `DCAS_checklist.md` — every row PASS or a completed `[FILL]`.
5. In the JIE Editorial Manager submission, select item type **"Research Data"** and paste
   the Mendeley Data DOI, per the Guide for Authors' "Data Linking" instructions — do this
   only prior to final acceptance, per journal policy (not required at initial submission).
6. Keep the Mendeley Data dataset unpublished/private until ready to link it; there is no
   embargo field to set the way openICPSR required — publishing the dataset is a one-time,
   author-controlled action.
