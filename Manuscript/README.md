# "Corridor, Not Factory" — paper & replication

**Primary manuscript:** `corridor.tex` (+ `corridor.bib`).
`passthrough.tex` is the earlier, narrower framing (trade + value capture only), superseded by
`corridor.tex` which adds the investment-response puzzle as the spine. Keep for reference.

## Framing

A **case study** in when a demand shock industrialises a country and when it does not.
Standard development logic: a large, sector-specific increase in demand for a country's
tradeable output should induce domestic investment. After the 2022 disruption of Russia's
trade with its principal partners, a set of trade flows was reallocated through neighbouring
economies; for Kazakhstan this was a ×10 rise in exports to Russia in ~29 technology-intensive
product lines, with imports rising in step and the goods passing through untransformed. It
produced **no investment response**. The paper measures the shock, shows Kazakhstan captures
~8% of the domestic value a producing economy would, documents the absent investment response
in multi-source deal data, and interprets it with a **framework** (§2): the response is the
product of three gates — irreversibility (Dixit–Pindyck), market access (a customs union makes
trade a substitute for production), and institutions (Khanna–Palepu / Rajan–Zingales). The
case identifies the market-access gate as open and rules out capital-market institutions as
the binding constraint for the shock-specific null (state capital did not build either);
whether the irreversibility gate independently binds it cannot settle. The moderators section
gives external validity — including a named intermediary population and a trade-side comparison
with non-customs-union routes (Georgia, Türkiye); "Where investment would raise
value capture" ranks the priority sectors; and the **Policy implications** section draws
the levers — for Kazakhstan (condition market access on domestic value-added; cut policy
uncertainty and sunk cost; QIC from lead investor to co-investor; invest in the logistics
platform first), Kazakhstan's rising **corridor leverage** as maritime chokepoints are
disrupted and the northern land route is closed, and a tentative subsection on what China
could change. Framing is deliberately neutral: this is a trade-reallocation case study, not a
circumvention paper.

**Structure:** Intro · Setting (incl. the corridor/chokepoint context) · Framework · Data ·
The demand shock · What Kazakhstan retains · The (non-)investment response · Which gate
binds? · Moderators & external validity · Where investment would pay off · **Policy
implications** (Kazakhstan · corridor leverage · China) · Discussion.
Appendices (for online publication): A deal-database query spec · B product-set construction ·
C DiD robustness battery · D value-capture input–output detail · E neighbour/comparator
structural breaks.

## JIE submission package

Target: **Journal of International Economics** (Elsevier; single-anonymized review; "Your Paper
Your Way" for the initial submission). Editorial Manager uploads:

| Item | File | Notes |
|---|---|---|
| Manuscript | `corridor.pdf` | author identified (single-anonymized); includes Appendices A–E and the declaration blocks |
| Title page | `title_page.pdf` | title, author, affiliation, corresponding-author details, abstract, keywords, JEL, acknowledgements (**author to complete**), all declarations |
| Highlights | `highlights.txt` | 5 bullets, each ≤ 85 characters |
| Cover letter | `cover_letter.pdf` | contribution, JIE fit, originality/exclusivity; **suggested referees to be filled in by the author** |
| Declaration of interest | on the title page and in the manuscript | names AIFC / AIX / QIC / IFC |
| Replication package | `scripts/R/kz_passthrough/`, `scripts/R/kz_valueadd/` | code + query specs; deal IDs pinned |

Submission fee: USD 190 (USD 95 if all authors are PhD students — confirm eligibility).
LaTeX: currently `\documentclass{article}` with `abbrvnat` references (YPYW-compatible); switch
to `elsarticle` + `model5-names` only if invited to revise.

## Data (all public or academically licensed — replicable)

| Source | Use | Access |
|---|---|---|
| UN Comtrade (HS6, annual + monthly) | trade reorientation, unit values, economy-wide imports | free API (`COMTRADE_PRIMARY` key) |
| OECD ICIO 2023 ed., Kazakhstan block | domestic value-added multipliers (Leontief) | free download |
| World Bank WDI | macro context | free |
| Kazakhstan Bureau of National Statistics | I-O robustness, customs revenue | free |
| Capital IQ, PitchBook, Preqin | deal-level M&A/PE/VC universe (493 deals, native per-source IDs) | commercial; academic licence. Consolidated list `20260825_Market size DA.xlsx` / `Deals_Preqin+Pitchbook+CapIQ`; query spec in `corridor.tex` Appendix A |
| QIC/AIFC/IFC *Private Equity in Kazakhstan* report (Sep 2026) | state-fund investment activity — aggregate + sector-by-year + named projects | public (joint QIC + AIFC + IFC report) |

The deal universe is the de-duplicated CapIQ + PitchBook + Preqin consolidation supplied by the
market-sizing team (the three databases the PE report draws on), each record carrying its
native source deal ID so a licence holder can reconstruct it.
`scripts/R/kz_valueadd/05_deal_source_reconcile.R` reports each source's coverage for Table
`tab:dealsource`. There is no project-level QIC register; all QIC facts in the paper come from
the published report.

## Reproduce

```
# trade + value capture + I-O + DiD robustness
scripts/R/kz_passthrough/00_run_all.R          # (fetch_*.sh first; needs COMTRADE_PRIMARY)
                                               #   ends with 12_did_robustness.R
# investment response + sector priority
scripts/R/kz_valueadd/01_read_deals.R          # interim deal source; refresh from a verifiable
                                               #   CapIQ/PitchBook/Preqin re-pull before submission
scripts/R/kz_valueadd/02_valueadd_analysis.R
scripts/R/kz_valueadd/fetch_kz_imports_hs2.sh  # needs COMTRADE_PRIMARY
scripts/R/kz_valueadd/03_fig.R
scripts/R/kz_valueadd/04_sector_priority.R     # re-pulls Comtrade HS2 imports live
scripts/R/kz_valueadd/05_deal_source_reconcile.R
scripts/R/kz_valueadd/06_mechanism_tests.R
scripts/R/kz_valueadd/07_crosscountry.R        # pulls World Bank WDI live
scripts/R/kz_valueadd/08_power_null.R          # power/MDE for the deal-count null
```

`04_sector_priority.R` and `07_crosscountry.R` pull Comtrade / World Bank data at run time, so
their outputs (`sector_priority*`, `crosscountry.txt`) drift by a few percent as those sources
revise; the replication package pins the extracts used for the tables. `12_did_robustness.R`
carries the §4.3 robustness battery: selection-rule-matched permutation (free and
trend-preserving cyclic-shift), size-decile×year FE, donut/drop-2022, Holm across the outcome
grid, leave-one-HS2-out, and alternative selection thresholds (1.5×/2.5×/3×).

Figures/tables referenced by `corridor.tex` are written to
`scripts/R/kz_passthrough/_outputs/` and `scripts/R/kz_valueadd/_outputs/`.

## Before submission

- Fill the two placeholders: acknowledgements on the title page; 3–4 suggested referees in the
  cover letter (trade-intermediation / entrepôt-margin / trade-policy-incidence area).
- `/verify-claims` on the intro citations (Chupilkin et al. year/volume; Juhász) **and on the
  now load-bearing `arvis2010landlocked` "single-digit c.i.f./f.o.b." claim** (the reproducibility
  audit lists it UNMATCHED).
- Optional round-2 TASTE items still open (not gating): Armenian GFCF decomposition; a
  route-level exit-count from the deal data for the "buy-back leading" claim; EAEU-integration
  literature positioning in §2–§3; a §9 paragraph on the continuum of the market-access gate
  (the Türkiye flow crosses a customs border yet still rose 3.6×); reconcile the
  `tab:priority` "combined score" caption with the body text.
- Refresh the deal universe from a verifiable CapIQ + PitchBook + Preqin re-pull; re-run
  `05_deal_source_reconcile.R`; pin each source's extraction date and earliest year of
  complete Kazakhstan coverage in the replication package.
- **QIC data — resolved.** No project-level QIC register will be published; the paper uses the
  QIC/AIFC/IFC *Private Equity in Kazakhstan* report (`qicaifcifc2026pe`) for aggregate +
  sector-timing + named-project evidence only. `tab:captive` has been removed; §7 Test D is
  now an illustrative comparison, not an identifying test. The replication package pins the
  report edition. Cite the published version once it is released.
- `/audit-reproducibility` on every headline number.
- ~~KZ national I-O table (68 products) as a robustness check on the ICIO multipliers.~~
  Done: `scripts/R/kz_passthrough/08b_kz_bns_io.R` (BNS 2023, `_data/kz_bns_io/io_2023_ru.xlsx`)
  → v_TT 0.89 / v_M 0.74 vs ICIO 0.79 / 0.76; qualitative result unchanged.
- ~~Widen the conflict-of-interest footnote if the paper leans further into policy prescription.~~
  Done: the footnote now flags that the Policy implications section is normative and the
  author's own, not representing the AIFC / QIC / IFC.
- `/capture-environment` (renv) + assemble the replication package.

## Related paper

The "no investment response" result is the empirical hook for the author's second paper on
private-equity market formation and institutional voids in Kazakhstan (SWF/DFI crowding-in vs
crowding-out). The two papers cite each other.
