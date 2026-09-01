# PE Report review — as a data source for "Corridor, Not Factory" §7 / Table 3 / §3

**Reviewed:** `PE Report_Draft_MasterFile_v2 clean.docx` (Trade-research folder, ~16 MB, draft
dated 2026-08-31). Publisher: **Qazaqstan Investment Corporation (QIC) + AIFC + IFC / World
Bank Group**. Forewords by the QIC Chairman (Didar Karimsakov), the AIFC Governor (Renat
Bekturov) and the IFC. Cites S&P Aug-2026, Fitch Jun-2026, AFSA consultation Jul-2026 — final
text lands ~Sept 2026, as expected.

**Question asked:** can this report be the public source for the QIC deal data (and platform
deals) that the corridor paper's §7 Test D / Table 3 need, and does it close the round-3
seven-pass CRITICAL **C3 / L3-3** (§7 Test D has no pre-2022 baseline, no denominator; §3
over-states the QIC register as already public)?

**Short answer:** it is a citable institutional source for QIC's **aggregate** footprint and
for the sector-timing narrative, and it **corroborates** several of the paper's caveats — but
it is **not** a project-level register, it does **not** resolve L3-3, and in two respects it
makes §7 harder to defend. Treat it as context + one citation, not as the Table 3 data source.

---

## What the report contains (QIC / deal side)

| Item | Figure in the report | Notes |
|---|---|---|
| QIC investments 2015–2025 | **98** (incl. follow-on tranches) | Figure 9 has this by year 2015–2025 (amounts + counts). Aggregate ≈ **USD 2.2 bn**. |
| 2025 QIC activity | ≈ USD 1.5 bn | Of which **USD 1.0 bn is a single Qarmet JSC bond** (two $500 m tranches); ex-Qarmet ≈ $0.5 bn, still 4× the 2024 level ($120 m). Funded by QIC bond issuance, not realisations. |
| Recorded PE transactions (Preqin + PitchBook + S&P Capital IQ) | **26** completed buyout/growth 2015–2025; 16 with disclosed value = **USD 137 m** (lower bound); **0 in 2023** | Narrow "later-stage PE, established revenue-generating businesses" perimeter — **excludes VC, excludes M&A**. |
| Combined PE + QIC, de-duplicated | **116** transactions/investments 2015–2025 (8 overlaps removed) | Explicitly "not a market-size measure." |
| Broader M&A market | **303** transactions, **USD 20.9 bn** disclosed, 2015–2025 (24 deals / $3.4 bn in 2025) | This is the aggregate comparable to the corridor paper's deal universe, not the "26". |
| Sector allocation | Figure 11 (count by sector-year) + Figure 12 (value by sector-year), **combined PE+QIC dataset, charts only** | Taxonomy is ISIC-style ("Manufacturing industry", "Transport and warehousing", "Agriculture, forestry and fisheries", "Supply of electricity, gas…"). |
| Named QIC projects | Appendix B ("Key players", 13 vehicles with portfolios) + 3 case studies | Almaty Int'l Airport (KIF, 2021, $30 m→$133 m realising), Aktau Energy Co. (Kokzhiyek Fund, 2025, 20% of a ~160 MW CCGT), Aitas KZ (Orken Capital Fund, entry 2019 / exit Feb 2025, poultry). Scattered: Qarmet bonds, Fincraft Energy bonds, KZ Truboprovodnye Sistemy, Sleipnir Technologies, Bilim Solutions, Resource R, BioOperations, several agri credit partnerships. |

**Data-source note:** the report's transaction data is **Preqin + PitchBook + S&P Capital IQ**
only. **No FactSet, no Dealroom.** It does nothing for the corridor paper's Table 2
`tab:dealsource` FactSet/Dealroom cross-validation columns.

---

## Does it close CRITICAL C3 (L3-3)? — No, not on its own

**1. It is not a project-level register.** The report gives aggregates, by-year totals, sector
*charts*, and ~20 named projects. It has no table of `project | company | sector | region |
financing year | committed amount | total project cost` for the ~98 QIC investments. The
corridor paper's Table 3 (`QIC {surge 1/$4m, corridor 2/$117m, vehicles 13/$1170m, unrelated
34/$453m}` = 50 industrial/logistics projects, each classified by relation to the
reorientation) **cannot be built from this report.** The `qic_data_fields_needed.md` request
to QIC is still required.

**2. No pre-2022 vs post-2022 split is presented, and the aggregate trend runs the wrong way
for "abstention."** QIC deployment *rose* sharply after 2022 — $2.2 bn cumulative, $1.5 bn in
2025, new captive funds (Kokzhiyek, Adal, QGDF) all established 2025. The report's narrative
emphasises a 2019 peak and a 2024–25 surge. "Captive capital abstained" must therefore be
scoped **very tightly to the reorientation sectors** (surge-basket components, corridor
logistics built *for* the flow), not QIC activity in general — and §7 must say so explicitly,
because a referee holding this QIC/AIFC/IFC report will see "$1.5 bn in 2025" and "manufacturing
industry particularly prominent from 2023 onwards" (Figure 11 narrative) and read it as capital
*responding*.

**3. No denominator.** The report does not give the sector-level deal-count base the paper
needs to say "1 of N projects in a $230 m-output sector is under-weight."

**Fix path (unchanged from the seven-pass synthesis):**
- **Best:** obtain the line-item QIC register (the `qic_data_fields_needed.md` fields), cite
  *this report* for the aggregate/context, add pre-2022 rows + a benchmark share to Table 3.
- **Fallback:** if QIC will only publish this aggregated report and never the register,
  **downgrade §7 Test D to "illustrative rather than a controlled test"** in the exact terms
  round 2 applied to Test F, and drop the identifying language ("captive state capital abstained
  too") from the abstract.

---

## Where it makes §7 harder — address these head-on

| Report says | Risk to the paper | Suggested handling |
|---|---|---|
| "Manufacturing industry particularly prominent from 2023 onwards" in PE+QIC deal activity | Reads as an investment response to the shock | The 2023+ named manufacturing projects are **agri/food (Aitas poultry, BioOperations bioethanol), energy (Aktau CCGT), domestic-market industrial** — not surge-basket electronics/components. State this: the post-2022 manufacturing deals are domestic-demand and food-security oriented, not reorientation-linked. |
| QIC 2025 = $1.5 bn (12× 2024) | Undercuts "captive capital abstained" | Note $1.0 bn is Qarmet steel bonds and the rest is bond-funded deployment into captive funds — none in the surge basket or corridor logistics. Scope the abstention claim to those sectors. |
| "Transport and warehousing activity was concentrated mainly in 2018–2021" | *Helps* the paper | Cite it — corridor logistics investment predates the reorientation, consistent with "no corridor-driven build". |
| 26 recorded PE / 116 combined / 303 M&A | Doesn't reconcile with the paper's "50 QIC industrial+logistics projects" and "7.3–7.5 deals/yr" | Add one sentence: the report's PE perimeter is narrow later-stage PE (excl. VC and M&A); this paper's deal universe is the broader M&A+PE+VC set (≈303 M&A in the same report). The counts are not comparable. |

---

## Where it corroborates the paper — cite it for these

- **Commercial databases badly under-capture Kazakh deal activity** — the report calls its own
  $137 m "a lower bound, not a measure of the full market" and repeatedly flags incomplete
  disclosure. Direct support for the corridor paper's §6/§10 disclosure caveats and the MDE
  discussion.
- **Transport & warehousing PE/investment concentrated 2018–2021** (pre-reorientation).
- **QIC / Samruk-Kazyna Invest model = minority ≤49%, ~7-yr hold, exit to private, no
  operational control, mandate-driven allocation** — supports the paper's "captive capital
  behaves like a passive, mandate-constrained minority co-investor" framing and the §7 caveat
  that QIC "allocates under statutory sectoral programmes rather than scanning the opportunity
  set."
- **~60% growth/expansion vs buyouts; exits are the binding constraint** (survey: exit
  opportunities the #1 priority, 22%) — consistent with the institutional-voids / no-functioning-exit
  argument in §7.
- **FDI:** net FDI turned negative in 2025 (−$861 m), gross up — completion of Tengiz-type oil
  projects. Useful for the §8 macro-aggregate-noise point.

---

## Practical instructions

1. **Cite the published version** (title; publisher "Qazaqstan Investment Corporation, AIFC and
   IFC"; month of publication). It is a legitimate institutional co-publication — citable.
2. Use it in **§3** as the public source for QIC's **aggregate** activity (98 investments,
   ≈ USD 2.2 bn, 2015–2025) and AIFC ecosystem context — **not** for project-level data.
   Rewrite §3 lines 344–346: name this report, its date, and that it reports QIC activity in
   aggregate + by sector-year; state plainly whether the line-item register is or is not public
   at submission.
3. **Still request the project-level QIC register** for Table 3, or downgrade Test D (see fix
   path above).
4. Add the **perimeter-reconciliation sentence** so the paper's deal counts don't appear to
   contradict a published QIC/AIFC/IFC report.
5. **COI footnote:** the QIC data source is a co-publication of the author's institution (AIFC).
   The corridor paper's conflict-of-interest note should say so.
6. FactSet/Dealroom columns are **unaffected** — the report doesn't use those sources; the
   user's own extracts are still needed.
7. Platform deals: only the **named** transactions (Almaty Airport, Aitas, Appendix B
   portfolios, the Chevron DIF list) are individually citable from the report; it is not a deal
   database.

---

## Caveats on this review

- Read from an XML-to-text extraction of the `.docx` (no pandoc on this machine); **all figures
  are chart images and were not visible** — Figures 7–12 (deal counts/values by year and
  sector) may contain the pre/post detail the text does not spell out. If the published report
  releases the Figure 7/9/11 underlying data, re-check whether a 2015–2021 vs 2022–2025 QIC
  split is directly readable.
- This is a **draft**; numbers and text may move before publication.
