# Access-Restricted Data — the deal-level extract

The investment-response analysis (manuscript Section 6, Table 3, Figure 4, and the
minimum-detectable-effect calculation) uses a firm-transaction dataset that **cannot be
redistributed** under the terms of the three source subscriptions. This note is what a
replicator follows to obtain the identical inputs.

## What the data are

A consolidated, de-duplicated universe of merger, acquisition, private-equity, and venture
transactions with a Kazakhstan-domiciled target or issuer, announced 1 January 2015 –
31 December 2025. After de-duplication the universe is **N ≈ 493** transactions; the
manufacturing-of-tradeables + transport/logistics + wholesale-distribution subset used for
the rate test is **N = 82** (53 pre-2022, 29 post-2022).

Delivered as `20260825_Market size DA.xlsx`, sheet `Deals_Preqin+Pitchbook+CapIQ`, 11 columns:
`Source · Deal ID · Company · Date · Year · Deal Type–Status · Value ($M) · Investor ·
Industry (raw) · Industry Group · Category`. Each row carries its **native source deal
identifier** in `Deal ID`, so a licence holder can pull the same record from the originating
platform.

## Sources and access

| Platform | Provider | Access | Typical cost / route |
|---|---|---|---|
| **Capital IQ** | S&P Global Market Intelligence | Institutional subscription; many universities have campus access | University library or a paid seat |
| **PitchBook** | Morningstar / PitchBook Data | Institutional subscription; academic programme available | PitchBook for academics, or an institutional seat |
| **Preqin** | Preqin / BlackRock | Institutional subscription; academic access on request | Preqin academic enquiry |

Expected wait: immediate if your institution already subscribes; days to a few weeks for a new
academic-access request.

## Query specification (reproduce the extract)

Common parameters across all three: target/issuer **geography = Kazakhstan** (country of
incorporation or primary operations); **announced date 2015-01-01 to 2025-12-31**;
**deal types** = merger/acquisition, majority & minority stake, private-equity buyout and
growth, venture (all stages), joint venture, PIPE / private placement; **status** = completed
or announced (pending and withdrawn recorded separately); financials in USD at announcement.

- **Capital IQ:** Screening → Transactions; Target Company Location = Kazakhstan; Transaction
  Types as above; Announced Date range as above; export all columns.
- **PitchBook:** Advanced Search → Deals; Company HQ Location = Kazakhstan; Deal Types = M&A,
  Buyout/LBO, PE Growth/Expansion, all VC stages, Angel, Accelerator/Incubator; Deal Date
  range as above.
- **Preqin:** Private Equity → Deals & Exits; Portfolio Company Country = Kazakhstan; Deal
  Date range as above.

De-duplication rule: match on target name, announced date (±30 days), and deal type. Sector
classification is harmonised to ISIC rev. 4 divisions from each platform's native taxonomy via
the crosswalk in `code/kz_valueadd/` (documented in `05_deal_source_reconcile.R`).

## Deal identifiers

`data/analysis/deal_ids.csv` **[FILL — author to export]** should contain two columns,
`source` and `deal_id`, for all ≈493 records — identifiers only, no deal-level fields — so a
licence holder can confirm they have reconstructed the same set. Confirm with the three
vendors that publishing bare identifiers is permitted; if not, this file stays out of the
public deposit and is supplied on request to verified licence holders.

## What runs without the data

Everything in `code/kz_passthrough/` (the entire trade-shock, value-capture, DiD, and
structural-break analysis — Sections 3–5, 8–10, Tables 1–2 and 5–6, Figures 1–3, Appendix
Tables B–E) runs with **no** access to the deal data. Only `code/kz_valueadd/` steps
`01`, `02`, `03`, `05`, `06`, `08` require the xlsx. Once it is placed at
`code/kz_valueadd/_data/20260825_Market size DA.xlsx` (after the path fix noted in the DCAS
checklist), those steps run unchanged.

## State-fund figures

The QIC investment aggregates in Sections 6–8 are **not** from these platforms. They are
transcribed from the published report *Private Equity in Kazakhstan* (QIC, AIFC, IFC,
September 2026); there is no project-level QIC register, public or licensed. The report is the
citable source; nothing from it is redistributed here.
