# Lens 4 — Results Sections and Tables/Figures

**Manuscript:** `Manuscript/corridor.tex`
**Reviewer lens:** Results narrative + every table and figure, read standalone and cross-checked.
**Given:** the numeric audit (`quality_reports/reproducibility_audit_corridor.md`) is PASS. This review does **not** re-check arithmetic. It checks whether a referee can *read* the results — captions, notes, units, labels — and whether the numbers are *interpreted* rather than merely reported.

---

## 1. Overall read

The paper is genuinely narrative-driven, not a table walk. Each of §4–§9 has prose that interprets magnitudes, not just significance: "8% vs 76%", "one to five even at v̄ᴹ = 0.40", "$44m of $560m", "customs duty under a percent of revenue", "0.2–0.3% of GDP", "7.3 → 7.5 per year", "zero transactions in the product lines". The "corridor, not factory" claim is earned by a stack of quantitative facts, not a single coefficient. That is the strength of the results presentation and it should be preserved.

The weakness is **presentation debt in the exhibits**. Every one of the five tables is missing a complete note; two tables (1, 4) and the moderators table have **no note at all**. There is **no estimation table anywhere** — the DiD and the pass-through regression live only in running text, with no SEs, N, fixed-effect rows, or clustering shown in a tabular form. One table (4) does not display the quantity its caption and text say it displays. One headline inbound measure is labelled two incompatible ways ("EU+China" vs a "mirror" list that excludes China). The primary descriptive figure (Fig. 1) has no y-axis unit in its caption. None of this is fatal and none of it contradicts the audit, but collectively it is a reject-and-resubmit risk at any economics journal, and all of it is fixable.

Score: **5/10** — sound analysis, exhibits need a full rebuild pass before submission.

---

## 2. Table-by-table

### Table 1 — `tab:magnitudes` (Surge-basket trade, USD million per year)

- **No note whatsoever.** Missing: data source (UN Comtrade HS6), that values are nominal USD, the definition of "surge basket" (31 HS6 lines — the reader must have read §3), the definition of "mirror", and whether 2024–2025 annual figures are final or partial. §4 says Kazakhstan stopped monthly reporting after Feb 2024 and 2024 is "covered by the annual data and by mirror flows" — a reader of Table 1 alone cannot tell that the 2024 (and possibly 2025) cells are constructed differently from 2018–2023.
- **"EU+China → Kazakhstan (mirror)" row label contradicts the §4 data definition.** §4 defines the inbound "mirror" as "the sum of EU-27, United Kingdom, United States, Japan, Korea, Switzerland and Norway reported exports to Kazakhstan" — **China is not in that list**. Yet the row label here, the abstract ("its imports from the EU and China roughly tripled"), §3 ("the mean inflow from the EU and China"), and §4.1 ("The inbound flow from the EU and China rose…") all say EU **and China**. Either the §4 list is incomplete (China-origin Comtrade flows are in the series and the sentence omits them) or the series genuinely excludes China and the "EU+China" labelling is wrong. Given Kazakhstan's role as "the land bridge between China and Russia" (§2), whether Chinese-origin goods are in the headline inbound number is first-order and cannot be left ambiguous. See finding **L4-1**.
- Bold **2022** column is never explained (presumably the break year).
- "Nominal vs real" is not stated here or anywhere in the paper; over an 2018–2025 window that spans the 2021–2023 inflation spike this matters for the "rose tenfold / tripled" framing.

### Table 2 — `tab:dealsource` (Deal counts for the Kazakhstan universe, by source and period)

- **Two of five columns (FactSet, Dealroom) are entirely "---".** It is flagged consistently — table note ("columns pending"), §5's data section ("As a reproducibility and robustness step we reconstruct…"), and the Limitations paragraph. So the flagging is honest. But ten em-dashes make the table look broken and invite distrust of the rest. For a "Preliminary draft — please do not cite" it is tolerable; the cleaner fix is to drop the two columns and add one sentence that extraction is in progress.
- **The text over-relies on it.** §6: "The result holds **across databases**." and Contribution (iii): "reports the divergence **across deal databases** rather than relying on one." Both promise a five-source cross-check the paper cannot yet deliver — only three sources have data, and the "divergence" among those three is shown only as a level difference (24 / 14 / 3.1 all-deals per year), never analysed. See finding **L4-2**.
- Note is incomplete: no extraction dates for the completed sources (the appendix says they are "recorded in the replication file" but the table should point there), no statement that counts are de-duplicated, no source line.
- "Deals per year (unless noted)" — only the last row is "noted" ("(total)"). Works, but terse.
- PitchBook "All deals" rises 14.0 → 24.0 (a 70% increase in total dealmaking) and is never commented on; a reader will wonder why the aggregate rose while the sector cut is flat.

### Table 3 — `tab:captive` (Investment 2022–2025 by relation to the reorientation)

- **The two "$m" columns are not the same quantity and this is not disclosed.** The state-fund column header is "$m (fund)" (the fund's own commitment) while the private column is "$m" (total deal value — the note itself says "the $767m in corridor logistics is a single 2025 rail-freight consolidation", i.e. transaction value, not an equity ticket). A reader comparing "Vehicles/machinery: 1,170 (fund) vs 138 (private)" will draw the wrong conclusion because the bases differ. Needs an explicit note. See finding **L4-3**.
- No units line in the caption ($m = USD millions), no source (QIC public record + the three-database extract), no statement that "projects" (state) and "deals" (private) are counted on different bases.
- Otherwise the row structure is clear and the footnote-a misclassification disclosure is good practice.

### Table 4 — `tab:priority` (Sector priority for value-adding investment)

- **Caption/content mismatch.** Caption: "index within Kazakhstan". §9 text: "We rank sectors on an **index combining** the domestic value-added multiplier, the import-substitution gap, the post-2022 growth in import demand, **and the existing deal base**." The table shows four raw component columns (VA mult., Output $m, Imp./output, Imp. growth) — **no composite index column, and the "existing deal base" component does not appear at all**. The table cannot be read as the object the caption and text describe. See finding **L4-4**.
- **No note.** "Imp. growth" (values 1.27, 1.22, 1.52, 2.55) is undefined — ratio? index? which base year? "Output $m" — which year (2019 IO vintage, or 2023 as the figure caption implies for imports)? The "---" cells for Platform and Avoid-electronics rows are unexplained (services have no import ratio; electronics "---" is odd given §9 stresses electronics' "near-zero domestic base", which should produce a very high import/output ratio, not a blank).
- "VA mult. 0.69" appears for **both** computer/electronic/optical and motor vehicles, but §9 says electronics "has the **lowest** value-added multiplier in the economy (0.69)" — it is tied, not uniquely lowest.

### `tab:moderators` (Table 5 — Moderators of the investment response)

- **No note.** The column "R↑ when" uses `R` without the table defining it (R is the investment response from `eq:gates`, §3). A reader coming to the table cold has no anchor.
- "Kazakhstan, 2022" — several rows are time-invariant (financial depth, exit availability); pinning the column to 2022 is slightly misleading.
- The seven rows are meant to be the seven arguments of `eq:gates`, but `g(·)` in `eq:gates` lists "financial depth, exit, private/state mix" (three) while the table's institutional block is "financial depth/exit", "private vs state mix", **and** "existing productive base / absorptive capacity" — the last is not an argument of `g` as written. Minor structural drift between the equation and its own summary table.
- This is the most readable of the five tables as a conceptual summary; it still needs a one-line note defining R and giving the source.

---

## 3. Figure-by-figure

### Fig. 1 — `fig:monthly` (`rq1_fig_monthly.png`)

- **Caption gives no y-axis unit.** The paper uses both levels (USD m) and asinh transforms; the reader cannot tell which this figure is in. Caption also does not say there are two series or which is which (it says "trade" singular), gives no time range, no source, no n. Caption is currently: what happened + one annotation ("Dashed line: March 2022") and nothing else. See finding **L4-5**.

### Fig. 2 — `fig:es` (`rq1_fig_monthly_eventstudy.png`)

- Better — states the event date, "95% confidence intervals". But no y-axis unit (asinh coefficient / "log points"), no event window (k range), no n.
- "monthly **aggregate**" (singular) conflicts with §4.2's "**Both series** are flat … climb … plateau — exports to Russia at about +3.2 log points, the inbound flow at about +1", which describes two event-study paths. Caption should say whether the figure shows one pooled series or two.
- **"+3.2 log points" is not reconciled with "roughly tenfold".** e^3.2 ≈ 24×, not 10×; the gap is the asinh-at-small-values inflation. The audit confirms the *level* ratio is ×10.01. A careful referee will flag +3.2 ≠ ln(10) = 2.3. One footnote on asinh interpretation would close this.

### Fig. 3 — `fig:wedge` (`rq2a_fig_wedge_hist.png`)

- Caption states what, sample (surge basket, post-2022, same HS6), and an interpretation ("Mass near and below 1"). Missing: n (the text's n = 647 cells), x-axis binning/range, whether it is the ratio or log ratio. Minor.

### Fig. 4 — `fig:mismatch` (`valueadd_fig_mismatch.png`)

- Best-captioned figure: dual-axis explicitly described, units on both (USD million for the line, count for the bars), and the sector definition spelled out. Missing only: time range and source. The dual-axis construction invites a "correlation-by-scaling" objection but that is a substance point, not a caption defect.
- Note the sector list here ("manufacturing of tradeables, transport and logistics, and distribution") is the four-bucket version; §1 gives a three-bucket version (see L4-8).

### Fig. 5 — `fig:priority` (`sector_priority_fig.png`)

- Good: both axes described, log scale flagged, bubble encoding given, an interpretation ("sit at the bottom"). Missing: number of sectors plotted, source. Minor.

---

## 4. Cross-checks — is any number stated three times with drift?

| Claim | Abstract | Intro §1 | Results | Discussion §10 | Verdict |
|---|---|---|---|---|---|
| VA per $ rerouted vs domestic mfg | ~8% vs ~76% | ~8% vs ~76% | 5–11% (mid 8%) vs 76% | "around a tenth of the manufacturing equivalent" (8/76 ≈ 0.105) | **Consistent** |
| Exports to Russia multiple | "roughly tenfold" | "at the monthly level … roughly tenfold" | annual $12–37m → $158m → $170–214m | "order of magnitude" | Consistent, but the abstract drops the "monthly-level" qualifier the body is careful to apply (annual ratio is ~6–13× depending on base) |
| Inbound multiple | "roughly tripled" | (not restated) | $180m → $413m (2022) → $584m (2023) | "order of magnitude" | 413/180 = 2.3×; "tripled" fits 2023 ($584m), not 2022 — abstract omits the year qualifier |
| Deal rate | "7–8 per year" | 7.3 (2015–21), 7.5 (2022–25) | 7.3, 7.5 | — | Numbers consistent; **bucket description drifts** (see L4-8) |
| Zero deals in the product lines | "not a single transaction over 2015–2025" | "no transaction" | "no transaction" + Table 2 row = 0/0/0 | — | Consistent |

**One genuine numeric drift:** §5.2 says "roughly **$560m** rerouted to Russia in the surge basket after 2022" and §5.3 says "incremental exports to Russia over the pre-2022 baseline — is about **$618m** cumulatively over 2022–2025." These are adjacent, similar-sounding quantities (post-2022 rerouted vs incremental-over-baseline) with no sentence reconciling them for the reader. The audit validates both against source ("44 of 562"; "618"), so this is a *presentation* gap, not an error — but it reads as sloppiness. See **L4-7**.

**Minor multiplier inconsistency:** §5.2 uses v̄ᵀᵀ = **0.79** for "trade, transport and warehousing"; §7 and §9 use **0.82** for "warehousing and transport support". Table 4 shows 0.82 for both platform rows. The 0.79 is presumably a broader blend; the reader is not told why the platform multiplier is quoted two ways.

**Comparator choice worth a sentence:** the headline "8% vs 76%" compares rerouting value added to *economy-wide manufacturing* (v̄ᴹ = 0.76). The rerouted goods are electronics, whose own multiplier is **0.69** (Table 4, "lowest in the economy"). The like-for-like contrast is 8% vs 69%. Still overwhelming, but the paper picks the comparator that makes the gap marginally larger without noting the choice.

---

## 5. Equation labels `eq:build` and `eq:gates`

- **`eq:build`** (§3): referenced and explained at point of use — §3(ii)/(iii), §6 ("building is dominated in \eqref{eq:build} before the option value is added"), §7 ("raising ρ flips the sign of \eqref{eq:build}", "large and durable enough to clear \eqref{eq:build}"). Fine.
- **`eq:gates`** (§3): referenced in §3 and §8 ("Equation~\eqref{eq:gates} makes the response a function of seven moderators"). The "seven" maps to 3 irreversibility + 1 market-access + 3 institutional arguments and to Table 5's seven rows — internally consistent, with the minor caveat that Table 5's seventh row ("existing productive base") is not an argument of `g(·)` as the equation is written (see moderators-table note above).
- Both equations are used, not decorative. No action needed beyond the Table 5 / `g(·)` alignment nitpick.

---

## 6. Missing: an estimation table

For an empirical paper that reports a DiD (γ = 2.88, p = 2×10⁻⁴; γ = 2.94, p = 5×10⁻⁷), a placebo DiD (−0.28, p = 0.34), and a pass-through regression (slope 0.27, p = 0.004), **none of these appear in a table**. There is no exhibit showing coefficients with standard errors, N, the fixed-effect structure, the clustering level, or the control group. The rubric question "what do the parentheses / stars mean?" cannot even be asked because there are no parenthesised SEs anywhere in the paper. A methods referee will require at least one regression table (DiD main + robustness) and one for the unit-value regression. This is squarely a results-presentation deficit. See **L4-6**.

---

## 7. Is "pending" acceptable in a review draft?

Marginally yes, given the "please do not cite" banner and the consistent flagging (table note + data section + Limitations). But:
1. The presentation should be **subtractive** — drop the FactSet/Dealroom columns, keep a sentence — rather than printing ten "---" cells.
2. The **text must be trimmed to match**: "The result holds across databases" → "holds across the three sources extracted so far"; Contribution (iii)'s "reports the divergence across deal databases" is a promise the current draft cannot keep and should be softened until the two extractions land.

---

```
findings:
  - id: L4-1
    severity: MAJOR
    location: "Table 1 (tab:magnitudes) row label / §4 Data (Trade) / abstract / §4.1"
    issue: "The headline inbound series is labelled 'EU+China -> Kazakhstan (mirror)' and described everywhere as 'imports from the EU and China', but §4 defines the 'mirror' inbound flow as EU-27 + UK + US + JP + KR + CH + NO -- a list that does not contain China. A reader cannot tell whether Chinese-origin trade is in the headline number, which is first-order for a China-Russia land-bridge economy."
    evidence: "§4: 'the sum of EU-27, United Kingdom, United States, Japan, Korea, Switzerland and Norway reported exports to Kazakhstan (\"mirror\")'; Table 1 row: 'EU+China $\\to$ Kazakhstan (mirror)'; abstract: 'its imports from the EU and China roughly tripled'."
    change_my_mind: "Show that the plotted/tabulated inbound series actually includes Comtrade China->Kazakhstan exports and that §4's list is merely an incomplete sentence (a one-line fix). If China is genuinely in the series, this drops to MINOR; if it is genuinely excluded, the 'EU and China' language throughout is wrong and must change."
  - id: L4-2
    severity: MAJOR
    location: "Table 2 (tab:dealsource) / §6 / Contribution (iii) in §1"
    issue: "Two of five database columns are empty ('pending'), yet the text claims 'The result holds across databases' and sells 'reports the divergence across deal databases rather than relying on one' as a methodological contribution. The table backs a three-source comparison at best, and the divergence among the three is shown only as an unanalysed level difference."
    evidence: "Table 2 note: 'FactSet and Dealroom columns pending'; §6: 'The result holds across databases.'; §1(iii): 'reports the divergence across deal databases rather than relying on one.'"
    change_my_mind: "Either populate the FactSet/Dealroom columns, or drop them and rewrite the two sentences to claim only what three sources support. If the authors consider a 3-of-5 table sufficient for a 'comments welcome' draft AND soften the text, this becomes MINOR."
  - id: L4-3
    severity: MAJOR
    location: "Table 3 (tab:captive), columns '$m (fund)' and '$m'"
    issue: "The state-fund dollar column reports the fund's own commitment; the private column reports total transaction value (the note itself describes the $767m as a whole consolidation, not an equity ticket). The two money columns sit side by side with no disclosure that they are different quantities, so any cross-column dollar comparison is invalid."
    evidence: "Column headers: 'projects | \\$m (fund) | deals | \\$m'; note: 'the \\$767m in corridor logistics is a single 2025 rail-freight consolidation of existing assets.'"
    change_my_mind: "Add a table note stating explicitly that '$m (fund)' is the state fund's committed capital and '$m' is aggregate deal value, and that the two are not comparable. With that note the table is fine and this drops to MINOR."
  - id: L4-4
    severity: MAJOR
    location: "Table 4 (tab:priority) caption vs content / §9"
    issue: "Caption promises an 'index within Kazakhstan' and §9 says sectors are ranked on 'an index combining' four inputs including 'the existing deal base'. The table shows four raw component columns, no composite index column, and the deal-base component is absent entirely. The table does not display the object it claims to display, and the reader cannot reproduce the ranking."
    evidence: "Caption: 'Sector priority for value-adding investment (index within Kazakhstan)'; §9: 'We rank sectors on an index combining the domestic value-added multiplier, the import-substitution gap ..., the post-2022 growth in import demand, and the existing deal base'."
    change_my_mind: "Add the composite index column (and a deal-base column, or drop it from the §9 description), or relabel the table as 'components of the sector-priority ranking' and move the index formula + values into the text/appendix. Either resolves it."
  - id: L4-5
    severity: MAJOR
    location: "Figure 1 (fig:monthly) caption; also Figures 2-5 to a lesser degree"
    issue: "The primary descriptive figure's caption states no y-axis unit. Because the paper reports both levels (USD m) and asinh transforms, the reader cannot tell what Fig. 1 shows. Caption also omits: that there are two series and which is which, the time range, sample/n, and source. Figs 2, 3, 5 similarly lack n and/or window/time-range."
    evidence: "Fig. 1 caption in full: 'Surge-basket trade through Kazakhstan, monthly. 2024 omitted (no Kazakhstan monthly reporting). Dashed line: March 2022.'"
    change_my_mind: "Add y-axis units, series identification, time range, and source to every figure caption. If the y-axis is already legibly labelled in the PNG itself and the caption just needs the series/time-range/source additions, this is MINOR rather than MAJOR."
  - id: L4-6
    severity: MAJOR
    location: "§4.3 (DiD), §5.1 (pass-through regression) -- no estimation table anywhere in the paper"
    issue: "All regression results (DiD gamma and p, placebo DiD, unit-value slope and p) are reported only in running prose. There is no table with coefficients, standard errors, N, fixed-effect rows, control-group definition, or clustering level -- and therefore no parentheses or stars to interpret. An empirical economics referee will require at least one DiD table and one unit-value-regression table."
    evidence: "§4.3: 'gives $\\gamma = 2.88$ ($p = 2\\times10^{-4}$) for exports to Russia and $2.94$ ($p = 5\\times10^{-7}$)'; §5.1: 'gives a slope of \\textbf{0.27} ($p = 0.004$)'. No \\begin{table} contains any of these."
    change_my_mind: "Add a regression table for the DiD (main + placebo + neighbour breaks) and one for the unit-value regression, each with SEs, N, FE, and clustering. If the authors intend these as appendix tables and add a forward reference, that is acceptable and this drops to MINOR."
  - id: L4-7
    severity: MINOR
    location: "§5.2 vs §5.3"
    issue: "'roughly $560m rerouted to Russia in the surge basket after 2022' (§5.2) and 'incremental exports to Russia over the pre-2022 baseline ... about $618m cumulatively over 2022-2025' (§5.3) are adjacent, similar-sounding magnitudes with no sentence reconciling gross-post-2022 vs incremental-over-baseline. Both reproduce against source per the audit; the issue is that the reader is left to guess why they differ."
    evidence: "§5.2: 'Of roughly \\$560m rerouted to Russia in the surge basket after 2022'; §5.3: 'is about \\$618m cumulatively over 2022--2025'."
    change_my_mind: "Not required for CRITICAL/MAJOR; one clause distinguishing the two bases fixes it."
  - id: L4-8
    severity: MINOR
    location: "§1 vs §6 vs Fig. 4 vs Table 2"
    issue: "The deal aggregate carrying the 7.3/7.5-per-year result is described with a three-bucket list in §1 ('manufacturing of tradeable goods, transport and logistics') and a four-bucket list everywhere else ('... and wholesale distribution' / 'and distribution'). The audit confirms the number includes distribution, so the §1 prose understates the scope of its own headline statistic."
    evidence: "§1: 'Transactions in manufacturing of tradeable goods, transport and logistics run at 7.3 per year'; §6: '... transport and logistics, and wholesale distribution run at \\textbf{7.3 per year}'; Table 2 rows: 'Mfg + transport + distrib.'"
    change_my_mind: "N/A (MINOR) -- align the §1 list with the rest."
  - id: L4-9
    severity: MINOR
    location: "Whole paper -- nominal vs real; §4.2 asinh interpretation"
    issue: "Trade values (2018-2025) are never stated to be nominal USD, and no deflator or inflation caveat is given despite the window spanning the 2021-2023 price spike. Separately, §4.2's event-study plateau of '+3.2 log points' for exports to Russia is not reconciled with the 'roughly tenfold' headline (e^3.2 approx 24x); the discrepancy is the asinh-at-small-values effect and needs one footnote."
    evidence: "§4.2: 'plateau---exports to Russia at about $+3.2$ log points'; abstract: 'rose roughly tenfold'; audit confirms level ratio x10.01."
    change_my_mind: "N/A (MINOR) -- state 'nominal USD' once in §4, add an asinh-interpretation footnote to Fig. 2 / §4.2."
  - id: L4-10
    severity: MINOR
    location: "Tables 1-5 -- table notes"
    issue: "No table has a complete note. Tables 1 and 4 and tab:moderators have no note at all. None state data source, that money figures are nominal USD millions, the sample/universe definition, or (for Table 4) the base year of the 'Output $m' and the definition of 'Imp. growth'. 'R' in tab:moderators and 'surge basket'/'mirror' in Table 1 are undefined at the point of the table."
    evidence: "Table 1 and Table 4 end at \\bottomrule with no \\vspace/note block; tab:moderators likewise. Table 4 column 'Imp. growth' values (1.27, 1.22, 1.52, 2.55) have no defined unit."
    change_my_mind: "N/A (MINOR individually, but collectively this is the single biggest standalone-readability problem in the paper). Add a source + units + key-terms note to every table."
scorecard:
  lens: "4. Results"
  critical: 0
  major: 6
  minor: 4
  score_out_of_10: 5
```
