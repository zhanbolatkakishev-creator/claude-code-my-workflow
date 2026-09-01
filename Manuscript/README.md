# "Corridor, Not Factory" — paper & replication

**Primary manuscript:** `corridor.tex` (+ `corridor.bib`).
`passthrough.tex` is the earlier, narrower framing (trade + value capture only), superseded by
`corridor.tex` which adds the investment-response puzzle as the spine. Keep for reference.

## Framing

Standard development logic: a large, sector-specific increase in demand for tradeable goods
should induce domestic investment. Kazakhstan got such a shock after 2022 (trade rerouting,
×10 in 31 product lines). It produced **no investment response**. The paper measures the
shock, shows Kazakhstan captures ~8% of the domestic value a producing economy would, documents
the absent investment response in multi-source deal data, and interprets it with a **framework**
(§2) in which the response is the product of three gates — irreversibility (Dixit–Pindyck),
market access (a customs-union gate that makes trade a substitute for production, stated as a
complete-mediation result), and institutions (Khanna–Palepu / Rajan–Zingales). Two
within-country tests (§7) identify the irreversibility gate as binding: captive state capital
also abstained, and the same institutions produced capacity for a *durable* shock (autos) but
not the transitory one. §8 gives seven moderators + external validity; §9 ranks where
investment *would* raise value capture.

**Structure:** Intro · §2 Framework (2-period threshold model, eq. 1–2; mediation/moderated-
mediation) · §3 Data · §4 The demand shock · §5 What Kazakhstan retains · §6 The (non-)
investment response · §7 Which gate binds? · §8 Moderators & external validity · §9 Where
investment would pay off · §10 Discussion · App. A deal-database query spec. 20 pp.

## Data (all public or academically licensed — replicable)

| Source | Use | Access |
|---|---|---|
| UN Comtrade (HS6, annual + monthly) | trade reorientation, unit values, economy-wide imports | free API (`COMTRADE_PRIMARY` key) |
| OECD ICIO 2023 ed., Kazakhstan block | domestic value-added multipliers (Leontief) | free download |
| World Bank WDI | macro context | free |
| Kazakhstan Bureau of National Statistics | I-O robustness, customs revenue | free |
| Capital IQ, PitchBook, Preqin | deal-level M&A/PE/VC universe | commercial; academic licence. Query spec in `corridor.tex` Appendix A |
| QIC/AIFC/IFC *Private Equity in Kazakhstan* report (Sep 2026) | state-fund investment activity — aggregate + sector-by-year + named projects | public (joint QIC + AIFC + IFC report) |

The deal universe is built from CapIQ + PitchBook + Preqin (the three databases the PE report
draws on). `scripts/R/kz_valueadd/05_deal_source_reconcile.R` reports each source's coverage
for Table `tab:dealsource`. There is no project-level QIC register; all QIC facts in the paper
come from the published report.

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

- `/verify-claims` on the intro citations (Chupilkin et al. year/volume; Juhász).
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
- Widen the conflict-of-interest footnote if the paper leans further into policy prescription.
- `/capture-environment` (renv) + assemble the replication package.

## Related paper

The "no investment response" result is the empirical hook for the author's second paper on
private-equity market formation and institutional voids in Kazakhstan (SWF/DFI crowding-in vs
crowding-out). The two papers cite each other.
