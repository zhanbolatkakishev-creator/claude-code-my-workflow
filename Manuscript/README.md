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
| Capital IQ, PitchBook, Preqin, **FactSet**, **Dealroom** | deal-level M&A/PE/VC universe | commercial; academic licence. Query spec in `corridor.tex` Appendix A |
| Kazakhstan state investment corporation (QIC) transactions | state-fund industrial pipeline | public |

The deal universe is built from CapIQ + PitchBook + Preqin and **cross-validated** against
FactSet and Dealroom. Run `scripts/R/kz_valueadd/05_deal_source_reconcile.R` after exporting
FactSet/Dealroom to `scripts/R/kz_valueadd/_data/deals_factset.csv` and `deals_dealroom.csv`
(spec in the appendix) to populate Table `tab:dealsource`.

## Reproduce

```
# trade + value capture + I-O
scripts/R/kz_passthrough/00_run_all.R          # (fetch_*.sh first; needs COMTRADE_PRIMARY)
# investment response + sector priority
scripts/R/kz_valueadd/01_read_deals.R
scripts/R/kz_valueadd/01b_read_aggs_qic.R
scripts/R/kz_valueadd/02_valueadd_analysis.R
scripts/R/kz_valueadd/fetch_kz_imports_hs2.sh  # needs COMTRADE_PRIMARY
scripts/R/kz_valueadd/03_fig.R
scripts/R/kz_valueadd/04_sector_priority.R
scripts/R/kz_valueadd/05_deal_source_reconcile.R
scripts/R/kz_valueadd/06_mechanism_tests.R
scripts/R/kz_valueadd/08_power_null.R          # C3: power/MDE for the deal-count null
```

Seven-pass-review revision estimates (2026-08-28), feeding the §4 rewrite:
`scripts/R/kz_passthrough/12_review_revisions.R` (DiD specification grid, wild-cluster
bootstrap, randomisation inference over baskets, unpurged placebo, Bai–Perron break CIs) and
`13_corrected_inbound.R` (inbound measured as West + China, which is what the text claims;
PPML). Outputs `review_did_grid.txt`, `review_corrected_inbound.txt`, `power_null.txt`.

Figures/tables referenced by `corridor.tex` are written to
`scripts/R/kz_passthrough/_outputs/` and `scripts/R/kz_valueadd/_outputs/`.

## Before submission

- `/verify-claims` on the intro citations (Chupilkin et al. year/volume; Juhász).
- Run the FactSet + Dealroom extracts; complete Table `tab:dealsource`.
- **State investment corporation (QIC/Baiterek) project register — gate.** The register is
  not yet public (expected release: ~Sep 2026). Do **not** circulate the draft until: (1) the
  register is published, (2) the published fields (project, sector, region, financing year,
  cost) are verified to contain everything `tab:captive` / §7 rely on, and (3) the replication
  package pins the release date and the extracted fields. §3 wording already points to the
  published register; the §7 "captive capital abstained" identification claim depends on it.
- `/audit-reproducibility` on every headline number.
- KZ national I-O table (68 products) as a robustness check on the ICIO multipliers.
- Widen the conflict-of-interest footnote if the paper leans further into policy prescription.
- `/capture-environment` (renv) + assemble the replication package.

## Related paper

The "no investment response" result is the empirical hook for the author's second paper on
private-equity market formation and institutional voids in Kazakhstan (SWF/DFI crowding-in vs
crowding-out). The two papers cite each other.
