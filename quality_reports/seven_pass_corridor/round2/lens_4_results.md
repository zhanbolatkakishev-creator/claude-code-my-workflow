# Lens 4 — Results Sections and Exhibits — ROUND 2

**Manuscript:** `Manuscript/corridor.tex` (read in full)
**Context:** `_SYNTHESIS_round1.md`; `reproducibility_audit_corridor.md` (PASS, 2026-08-31 — arithmetic not re-audited here; this pass is presentation + interpretation only)
**Scripts spot-checked for exhibit provenance:** `scripts/R/kz_passthrough/06m_monthly_profile.R`, `scripts/R/kz_valueadd/03_fig.R`

---

## 1. Round-1 items — verification

| Round-1 item (Lens 4 relevant) | Status in round 2 | Evidence |
|---|---|---|
| **M10** "EU+China" inbound label vs mirror definition without China | **RESOLVED** | §1 now "the inbound flow (West and China)"; §3 lists the Western partners "*and China*"; §4.1 + Table 1 row "West + China → Kazakhstan (mirror)" with an indented "of which Western" sub-row; abstract avoids the label entirely. Consistent throughout. |
| **M5** no regression table; no identification statement; selective inference | **LARGELY RESOLVED** | New `tab:did` spec grid (surge basket / priority list / placebo × 4 outcomes, SE in parens, stars). §4.3 "Specification and identifying assumptions" para gives the estimating equation, HS6 + year FE, clustering by HS6, N, parallel-trends joint pre-tests (p = 0.42 / 0.78), no-anticipation, SUTVA/contamination, selection-on-outcome disclosure, wild-cluster bootstrap + randomisation inference. Residuals below. |
| **C1** headline DiD run on the wrong (priority-list) basket; surge-basket DiD insignificant | **RESOLVED** | Path-B rebuild: §4.3 now leads with the surge basket, γ = 2.44 (p = 0.013), and the audit confirms 2.4408 (0.9594), p = 0.01304 from the regenerated `rq1_estimates`. Priority list is shown as row 2, framed as the pre-specified alternative. |
| **C3** central null has no power analysis; flips with the window | **RESOLVED** | §6 now reports the Poisson rate ratio 1.03 (95% CI 0.63–1.65), the 2023–25 window (9.0/yr, RR 1.24), and the MDE ("80% power only against ~80%+"), and reframes as "rule out a large response, not a modest one." |
| **C4** Figure 3 is not an event study; zero-width CIs | **PARTIALLY RESOLVED — new contradiction introduced.** Caption disclaims it ("not a difference-in-differences event study"), but the figure itself was **not regenerated** — see MAJOR M4-1. |
| **M8** mirror-gap DiD null unreported | **RESOLVED** | §4.3: "The mirror-gap outcome … does not move significantly (γ = 0.54, p = 0.81); we do not lean on it." |
| **M4 (r1)** unit-value wedge: CIF/FOB mechanical sub-unity unmentioned | **RESOLVED** | §5.1 now states the import price is "c.i.f., which includes freight into landlocked Kazakhstan," presents both bases (0.73 CIF / 1.6 FOB), and benchmarks the civilian control (0.59 / 0.94). |
| **M2 (r1)** ~8% value capture is the assumed margin, not an estimate | **SUBSTANTIALLY RESOLVED** | §5.2 now presents m as a bounded range (6–12%) with two independent anchors (national-accounts convention from below, freight-netted matched-cell ≈12% from above); headline is "5–9%, midpoint about 8%"; §10 limitations updated ("bounded … not estimated line by line"). Residual bridge issue below (MINOR). |
| **M11 (r1)** Table 3 two $ columns different bases; Table 4 "index" caption; Fig 1 units; Tables 1/4/moderators no notes | **MOSTLY RESOLVED**: Table 3 (`tab:captive`) now has a full note ("The two dollar columns are on different bases and are not comparable across the divider"); Table 4 renamed "Sector characteristics", full note, §9 text "rather than collapsing … into a single index"; Table 1 caption carries caveats. **RESIDUAL** → MAJOR M4-5: `tab:moderators` still has no note, and `rq1_fig_monthly` still has no y-axis unit. |
| **M3 (r1)** 57% of inbound flow unaccounted | **PARTIALLY** — §5.1 now names the components ("domestic use, onward flow to other destinations, and measurement in the import series, which we cannot separate"). Acknowledged, still not bounded. Non-blocking for this lens. |

Net: the structural round-1 asks for Lens 4 are addressed. What remains is exhibit-level — figure/caption integrity, table notes — plus one exposition gap in the value-capture chain.

---

## 2. `tab:did` — does it read standalone?

Mostly yes, and this is a real improvement over round 1.

- **Outcomes are asinh coefficients:** stated ("asinh outcomes" in the caption). Good.
- **N / FE / clustering:** all in the caption ("HS6 + year FE, SE clustered by HS6 (N = 600)"). 75 × 8 = 600 ties to §4.3 text. Good — round-1 "no N near the table" is fixed.
- **Estimating equation:** present in §4.3, immediately before the table. Good.
- **Two-row header renders sensibly:** yes. Row 1 `& Exports to & Inbound & Inbound & KZ-reported`, row 2 `Treated set & Russia & (W+China) & (Western) & imports`. Plain two-row stack above the `\midrule`; no `\cmidrule` grouping the two "Inbound" columns, so the reader must drop to row 2 to disambiguate, but there is no rendering fault. `\footnotesize` + `\tabcolsep=5pt`, 5 columns — fits the 1-in margin.
- **Stars:** defined in the note ("* p<0.05, ** p<0.01, *** p<0.001 (cluster-robust)").
- **Parentheses:** **NOT defined** → MAJOR M4-3. The note explains the stars and the Poisson gloss but never says the parenthetical is the standard error.
- **Placebo row:** only the "Inbound (W+China)" cell is populated (−0.95); the other three are dashes. Nothing states which outcome the placebo −0.95 belongs to or how many "largest civilian lines" it treats. §4.3 prose ("γ = −0.95") is also outcome-silent. → MINOR.

---

## 3. `tab:magnitudes` — headline table with a preliminary outlier and a collapsed cell

Caption states units (USD m/yr), that inbound is mirror, and flags "China's 2024 figure is large and preliminary; its 2025 figure is not yet reported, so the 2025 West+China total is the Western component only." So the caveats exist.

But the **table body gives the reader no signal**:

- The primary inbound row is **West + China** (394 / 427 / 483 / 470 / **837** / 1,373 / 2,360 / 363), with "of which Western" as an indented sub-row. §4.2 explicitly tells the reader this is the series *not* to read in aggregate — "the large pre-existing China flow swamps the 2022 movement … the reorientation is best seen in the outbound series and the Western inbound." The visual hierarchy (main row = the disavowed measure; bold on 2022) points the skimming reader at "$470m → $2,360m," which the text then walks back.
- The 2024 cell (2,360) and the 2025 cell (363) carry **no footnote markers** tying them to "preliminary" / "Western only." A reader who does not parse the caption sees a series that quintuples then collapses 85%.
- 2025: the West+China row (363) and the Western sub-row (363) are **identical**, with nothing in the body explaining why — it reads like a data-entry error until you reach the caption.

This is acceptable *only because* the caption is doing all the work. For the paper's first results table that is too fragile. → MAJOR M4-4.

Fix: superscript markers on the 2024 and 2025 West+China cells → short table notes; consider promoting "Western" to the primary row and demoting West+China, matching the guidance the text already gives.

---

## 4. Figures — provenance check against the generating scripts

### 4a. `rq1_fig_monthly_eventstudy` (fig:es) — image contradicts the manuscript caption → MAJOR M4-1

`06m_monthly_profile.R:44-85`: the figure is two **saturated** regressions —
`feols(asinh(mirWC) ~ i(mrel, ref = -1), es_dt)` and the same for `expRU`, on `es_dt <- ag[abs(mrel) <= 15]` = 31 monthly aggregate observations, one series, 30 event-time dummies + intercept → **zero residual degrees of freedom**. `se(m)` is therefore 0 / NaN, and the plotted `geom_pointrange(ymin = b - 1.96*se, …)` bands are zero-width or absent. Round-1 C4, unchanged in the code.

The script also still bakes into the PNG: title `"Event study around 2022m3 (monthly aggregate, frozen surge basket)"` and subtitle `"asinh(value) ~ i(month_rel), ref = -1; 95% CI"` (`03_fig.R`… actually `06m_monthly_profile.R:82-83`).

The manuscript caption (corridor.tex:407–412) now says the opposite: *"This is a single aggregate time series with no control group, **not a difference-in-differences event study** … the interval bands are correspondingly **wide**."*

So: (i) the figure image says "Event study" and "95% CI" while the caption says it is neither; (ii) "bands are correspondingly wide" is not what a zero-residual-df regression produces — the reader will see point estimates with no visible uncertainty. The round-1 fix was applied to the caption only.

Fix: regenerate the figure — retitle to "Normalised monthly profile", drop "95% CI"; if uncertainty bands are wanted, take them from a block bootstrap or a HAC fit on a non-saturated spec (e.g. wider window, or pool the series with series FE) — or drop the figure and keep Figure 1.

### 4b. `valueadd_fig_mismatch` (fig:mismatch) — trade line mislabeled / unreconcilable with Table 1 → MAJOR M4-2

`03_fig.R:11`: `trade <- p[surge == TRUE, .(trade_musd = sum(mirW_usd) / 1e6), …]` — the line plots **`mirW_usd`, Western-only** inbound (= Table 1's "of which Western" sub-row, 162 … 444 … 363).

But:
- the PNG's own y-axis label (`03_fig.R:26`) reads `"surge-basket imports from EU+China, USD m (line)"` — **"EU+China", stale**, a leftover of the pre-round-1 measure; the plotted data is Western-only.
- the manuscript caption (corridor.tex:582–584) names **no measure at all** — "Line: surge-basket inbound trade (mirror), USD million."

Consequence: a reader who cross-checks the figure line against Table 1 cannot reconcile it — Table 1's headline inbound row (West+China) runs 470 → 2,360, the figure line (Western) runs 184 → 444, and nothing says why. This is the paper's signature exhibit ("trade surged; the investment response did not").

Note: plotting the Western series is the *right* analytical choice (§4.2 says the reorientation "is best seen in … the Western inbound"). The defect is purely labeling. Fix: relabel the axis and the caption to "Western inbound (mirror)" and add one sentence: "the Table 1 'of which Western' series."

### 4c. `rq1_fig_monthly` (fig:monthly) — caption incomplete → folded into MAJOR M4-5

Caption (corridor.tex:399–401): "Surge-basket trade through Kazakhstan, monthly. 2024 omitted … Dashed line: March 2022." Round-1 M11 named this figure: **still no y-axis unit**. The script plots USD m for two named series (West+China → KZ, KZ → Russia); the caption should state both the unit and which two series appear (and that the Western series the text emphasises is *not* on this plot).

### 4d. `rq2a_fig_wedge_hist` (fig:wedge) — adequate, minor over-reach

Caption specifies the ratio construction ("Kazakhstan re-export price over the exporter-reported inbound price (f.o.b. basis)"), the sample ("same HS6, surge basket, post-2022"), and — usefully — pins it to the f.o.b. basis so the reader knows this is the 1.6 wedge, not the 0.73 one. Good. MINOR: "no systematic weight gain" is asserted in the caption of a *price-ratio* histogram (weight = value/kg is a different quantity, not shown here); and no n / source line.

### 4e. `sector_priority_fig` (fig:priority) — adequate

Axes and bubble size defined; "sit at the bottom" ties to `tab:priority` (0.69). MINOR: no source line (OECD ICIO + Comtrade), bubble count not stated.

---

## 5. Units / "incremental" vs "gross" — is the switch signposted?

Largely yes.

- §4 (Magnitudes, DiD) works in **West+China** and **Western** *totals*; §5 switches to the **incremental** flow. The switch **is** flagged at first use — §5.1: "We measure what Kazakhstan retains on the *incremental* flow — exports to Russia above the pre-2022 baseline, about \$479m cumulatively over 2022–2025 — since that is the part the reorientation drove." Repeated in §5.3. Round-1's "$562m / $618m / $716m" denominator drift is gone: the audit confirms the round-2 pair \$479m outbound / \$887m incremental Western inbound / ≈½ flow-through is internally consistent.
- asinh ↔ level: §4.2 gives both ("+3 asinh points (more than a tenfold rise in level)"); `tab:did` caption says "asinh outcomes"; fig captions say "asinh value". OK.
- **One residual friction (MINOR):** §5.2 formula is "per dollar of *gross* rerouted flow" (line 524) while §5.1/§5.3 speak of the "*incremental*" flow. They are the same quantity ("gross" here = before the retained margin m, applied to the \$479m), but the two words for one object could be reconciled in a clause.
- USD m vs bn: §4.1 mixes "\$440m … \$0.8–2.4bn" in one sentence but it is a range crossing the boundary; Table 1 is all in m; abstract "\$2,360m" matches the table. OK.

---

## 6. Magnitude interpreted, not just significance?

Strong in §5–§7 (5–9% vs 76%; \$23–45m retained; "one to five"; \$22m customs / "well under 1%"; 0.2–0.3% of GDP; 7.3 vs 7.5 deals/yr with CI; MDE 1.8×; 1 of 50 QIC projects). 

Gap (MINOR): in §4.3 the two headline DiD outcomes get level translations (Poisson 3.5× outbound, 2.4× inbound) but the two secondary outcomes (Western inbound γ = 1.73; KZ-reported imports γ = 1.88) are reported as asinh γ + p-value only, with no level gloss — inconsistent treatment within one paragraph and one table.

**Is "corridor, not factory" still earned?** Yes. It is a magnitude claim, and the magnitudes carry it: a well-identified ~3.5× outbound shock (surge basket now primary and significant, audit PASS), 5–9% domestic value added against 76%, flat deal counts with an explicit MDE, zero transactions in the surge-basket lines. The paper no longer over-claims the wedge — §5.1 opens "genuinely ambiguous" and the load-bearing statement is the weaker "what the wedge does *not* show … is the large mark-up or weight gain that domestic transformation would produce," which the FOB/FOB 1.6 (freight recovery, not transformation) supports. The conclusion rests on the I-O multiplier math and the deal nulls, not the wedge, and that is the right weight.

---

## 7. §5.1 wedge presented two ways (0.73 CIF / 1.6 FOB) — clear enough?

Adequate now, borderline. The paragraph names both comparisons, explains *why* they differ (CIF carries freight into a landlocked economy; FOB/FOB is like-for-like), gives the direction of each, reconciles the 1.6 as "an amount that includes the freight it paid to get them in" (i.e. not transformation), and benchmarks the civilian control. A reader can follow it. MINOR: a one-line bottom line ("the like-for-like comparison is the economically meaningful one, and the markup it shows is freight recovery") would stop the reader holding two numbers with no verdict.

**Separate exposition gap (MINOR, flagged prominently):** §5.1 reports the f.o.b. median ratio as **1.6** (a 60% markup); §5.2 then uses a matched-cell f.o.b. gross margin of **"about 34%"** (→ freight-netted ≈12% → m = 6–12%). Both are on the f.o.b. basis, both are audit-PASS as separate statistics, but the text gives **no bridge** between 1.6 and 34% (median-of-ratios vs mean, value-weighting, trimming?). This is the load-bearing chain to the 5–9% headline; one clause reconciling the two would close it.

---

## 8. Other tables — standalone check

- **`tab:dealsource`** — caption is thin ("Deal counts for the Kazakhstan universe, by source and period"): no period definitions (2015–21 / 2022–25 only in the row stubs), no source, no definition of "Kazakhstan universe." Two columns (FactSet, Dealroom) are **all dashes** and still sit in a numbered exhibit; the footnote says "pending (Appendix A)." Text is softened to "three commercial databases … with FactSet and Dealroom … for cross-validation in the final draft," so the overclaim is contained, but a 5-column table with 2 empty columns still visually promises a reconciliation that is not shown. MINOR (known tracked item).
- **`tab:captive`** — good note now (round-1 M11 resolved). Residual MINOR: the note attributes the private \$ column to "oil, mining and banking," but the matching row is labelled "Unrelated (agri, steel, chemicals, energy)" — categories don't line up. Also "\$0.8bn" in §6/§7 prose vs "\$767m" in this table for the same 2025 rail deal (within rounding, audit-blessed, but visible).
- **`tab:moderators`** — **no note at all** (round-1 M11 named it; unaddressed). The "R↑ when" column header is uninterpretable without one, and R (from eq. 2) is not defined near the table. → MAJOR M4-5 (with fig:monthly).
- **`tab:priority`** — full caption + note now, "index" language removed from caption and §9. Resolved. MINOR: import-data source not named in the note.

---

## 9. Abstract ↔ §1 ↔ results — headline trio cross-check

Consistent on every headline number:

| Quantity | Abstract | §1 | Results | 
|---|---|---|---|
| Level multiple | "roughly tenfold" | "roughly tenfold" / "order of magnitude" | §4.2 "more than a tenfold rise in level" |
| γ / level multiple (outbound DiD) | "about 3.5×" | "γ = 2.44 (3.5× in levels)" | §4.3 "γ = 2.44 … 3.5×"; `tab:did` note "3.5× outbound" |
| Value added per \$ rerouted | "about a tenth of a dollar … (5–9%)" vs "roughly three-quarters" | "about 5–9%" vs "roughly three-quarters" | §5.2 "5–9%, midpoint about 8%" vs "76%" |
| Deals/yr | qualitative ("same rate … 2022 the weakest year") | "7.3 … and 7.5" | §6 "7.3 … and 7.5"; `tab:dealsource` |
| Surge-basket transactions | "no transaction over 2015–2025" | "no transaction" | §6 "no transaction"; `tab:dealsource` "0 / 0 / 0" |
| sup-F / break date | "2022m5 (sup-F of 561)" | "2022m5 … sup-F of 561" | §4.2 "2022m5 … sup-F of 561" |
| Incremental flow | "\$479m over 2022–2025" | "about \$479m over 2022–2025" | §5.1/§5.3 "\$479m cumulatively" |

No number is stated differently across the three. This is a genuine round-2 improvement (round-1 M10 + audit fixes to \$107–145 → \$107–134, \$25–45m → \$23–45m). Credit.

Residual wording drift (MINOR): the deal-count bucket is "manufacturing, transport and logistics" in the abstract and §1, but "manufacturing … transport and logistics, and wholesale distribution" in §6, `fig:mismatch`, and `tab:dealsource` — the *same* 7.3 / 7.5 figure is attached to a 2-sector and a 3-sector description. Round-1 carryover; a reader can't tell what is inside the 7.3.

---

## 10. Estimating equation + full-spec table for the DiD?

Yes. §4.3 gives `asinh(y_it) = γ (treated_i × post_t) + μ_i + λ_t + ε_it`, HS6 + year FE, SE clustered by HS6, N = 600 (75 lines × 8 years), parallel-trends joint pre-tests, no-anticipation, contamination, selection-on-outcome, wild-cluster bootstrap + randomisation inference. `tab:did` shows the full basket × outcome grid (not just 2 of 8 as in round 1). N / clustering / FE are all in the table caption. Round-1 M5 substantially resolved. Residuals: caption doesn't label the parentheses (M4-3); no explicit multiple-testing adjustment across the ~10 grid cells (the estimates are all on the table, so the reader can judge — non-blocking); identification material is prose, not a set-off assumptions block (stylistic).

---

```findings
- id: M4-1
  severity: MAJOR
  location: "Figure fig:es (corridor.tex:404-413); scripts/R/kz_passthrough/06m_monthly_profile.R:44-85"
  finding: "The event-study figure image contradicts its manuscript caption. The PNG still bakes in the title 'Event study around 2022m3' and the subtitle 'asinh(value) ~ i(month_rel), ref=-1; 95% CI', while the caption now says it is 'not a difference-in-differences event study' and that 'the interval bands are correspondingly wide'. The generating regression is unchanged from round-1 C4 — feols(asinh(mirWC) ~ i(mrel, ref=-1)) on 31 monthly aggregate observations (window +/-15), one series, 30 event-time dummies + intercept = zero residual df, so se(m) is 0/NaN and the plotted geom_pointrange bands are zero-width/absent. 'Wide bands' is not what the spec produces; the round-1 fix was applied to the caption only."
  evidence: "06m_monthly_profile.R:45 `es_dt <- ag[abs(mrel) <= 15]` (31 obs); :46-47 two saturated feols; :82-83 title 'Event study…' / subtitle '…95% CI'; :81 `ymin = b - 1.96*se`. corridor.tex:407-412 caption text."
  change_my_mind: "Show that the deployed rq1_fig_monthly_eventstudy.png was regenerated from a non-saturated or bootstrap-band spec (script on disk stale). As shipped, the replication package produces degenerate intervals and an image whose title/subtitle contradict the manuscript caption."
- id: M4-2
  severity: MAJOR
  location: "Figure fig:mismatch (corridor.tex:579-586); scripts/R/kz_valueadd/03_fig.R:11,26,30"
  finding: "The paper's signature exhibit ('trade surged; investment did not') plots sum(mirW_usd) = Western-only inbound, but the PNG's own y-axis label reads 'surge-basket imports from EU+China, USD m' (stale pre-round-1 measure) and the manuscript caption names no inbound measure at all. A reader cross-checking the figure line against Table 1 cannot reconcile it: Table 1's headline inbound row (West+China) runs 470 -> 2,360; the figure line (Western sub-row) runs 184 -> 444, with nothing explaining the gap."
  evidence: "03_fig.R:11 `sum(mirW_usd)`; :26 `name = \"surge-basket imports from EU+China, USD m (line)\"`; :30 subtitle 'Line: surge-basket inbound trade (mirror)'. corridor.tex:582-584 caption. Table 1 rows (corridor.tex:365-366)."
  change_my_mind: "Plotting the Western series is analytically correct (Sec 4.2 says the reorientation 'is best seen in … the Western inbound'); the defect is purely labeling. Relabel the axis and caption to 'Western inbound (mirror)' and tie it to the Table 1 'of which Western' row and this clears."
- id: M4-3
  severity: MAJOR
  location: "Table tab:did caption/note (corridor.tex:451-472)"
  finding: "The results table never states that the parenthetical is the standard error. The note defines the stars ('* p<0.05 … (cluster-robust)') and the Poisson gloss, but a reader sees '2.44 (0.96)**' with no statement that (0.96) is the cluster-robust SE. Standard table-notes omission that a methods referee will require."
  evidence: "corridor.tex:459-472 — table body has `2.44 (0.96)$^{**}$` etc.; caption + note contain no 'standard errors in parentheses' line."
  change_my_mind: "One clause in the note. No analysis change. Listed MAJOR only because the rubric asks specifically and referees treat it as mandatory."
- id: M4-4
  severity: MAJOR
  location: "Table tab:magnitudes (corridor.tex:355-370) + Sec 4.1/4.2"
  finding: "The headline magnitudes table leads with the West+China inbound row (394…837…1,373…2,360…363) that Sec 4.2 tells the reader NOT to read in aggregate ('the large pre-existing China flow swamps the 2022 movement … best seen in the outbound series and the Western inbound'). The 2024 cell (2,360, 'large and preliminary') and the 2025 cell (363, China not reported -> collapses to the Western value, so the row and its sub-row print an identical 363) carry no footnote markers in the table body — all caveats live only in the caption. The visual hierarchy (bold 2022, primary row = the disavowed measure) points the skimming reader at a 5x surge the text then walks back."
  evidence: "corridor.tex:365 West+China row incl. 2,360 and 363; :366 Western sub-row also 363 for 2025; :357-359 caption caveats; :383-384 Sec 4.2 'best seen in … the Western inbound'."
  change_my_mind: "Add superscript markers on the 2024 and 2025 West+China cells tying to short table notes, and/or promote 'Western' to the primary row. If the cells are marked and the hierarchy reflects the text's own guidance, this drops to MINOR."
- id: M4-5
  severity: MAJOR
  location: "Table tab:moderators (corridor.tex:731-749); Figure fig:monthly caption (corridor.tex:399-401)"
  finding: "Round-1 M11 residual — two exhibits still do not stand alone. tab:moderators has NO note; its 'R↑ when' column header is uninterpretable without one and R (from eq. 2) is not defined near the table. rq1_fig_monthly's caption still gives no y-axis unit and does not say which series are plotted (script plots USD m for West+China->KZ and KZ->Russia; the Western series the text emphasises is not on this figure)."
  evidence: "corridor.tex:731-749 (tab:moderators, no `\\footnotesize`/Notes block, unlike tab:captive/tab:priority); :399-401 fig:monthly caption; 06m_monthly_profile.R:65-67 y = 'USD m', two series."
  change_my_mind: "Add a one-line note to tab:moderators defining R and 'R↑ when', and a y-axis unit + series list to the fig:monthly caption. Both are pure caption edits."
- id: m4-6
  severity: MINOR
  location: "Sec 5.1 (corridor.tex:504) vs Sec 5.2 (corridor.tex:534-537)"
  finding: "The f.o.b. median wedge is reported as 1.6 (a 60% markup) in Sec 5.1; Sec 5.2 then uses a matched-cell f.o.b. gross margin of 'about 34%'. Both on the f.o.b. basis, both audit-PASS as separate statistics, but no bridge is given (median-of-ratios vs mean, value-weighting, trimming). This is the load-bearing chain to the 5-9% headline; one reconciling clause is needed."
- id: m4-7
  severity: MINOR
  location: "Abstract / Sec 1 vs Sec 6 / fig:mismatch / tab:dealsource"
  finding: "The deal-count bucket is 'manufacturing, transport and logistics' in the abstract and Sec 1, but 'manufacturing … transport and logistics, and wholesale distribution' in Sec 6, fig:mismatch and tab:dealsource — the identical 7.3 / 7.5 per year figure attached to a 2-sector and a 3-sector description. Round-1 carryover."
- id: m4-8
  severity: MINOR
  location: "Sec 4.3 (corridor.tex:436-438) + tab:did"
  finding: "Magnitude interpretation is inconsistent within one paragraph: the two headline DiD outcomes get level translations (Poisson 3.5x outbound, 2.4x inbound) but the two secondary outcomes (Western inbound gamma=1.73; KZ-reported imports gamma=1.88) are given as asinh gamma + p-value only, with no level gloss."
- id: m4-9
  severity: MINOR
  location: "Table tab:did placebo row (corridor.tex:466)"
  finding: "Only the 'Inbound (W+China)' cell of the placebo row is populated (-0.95); the other three are dashes and nothing states which outcome the -0.95 is, or how many 'largest civilian lines' the placebo treats. Sec 4.3 prose is also outcome-silent."
- id: m4-10
  severity: MINOR
  location: "Table tab:dealsource (corridor.tex:598-620)"
  finding: "Caption lacks period definitions and source; two columns (FactSet, Dealroom) are all dashes yet remain in a numbered exhibit. Text is softened so the overclaim is contained, but a 5-column table with 2 empty columns still visually promises a reconciliation not shown. Known tracked item."
- id: m4-11
  severity: MINOR
  location: "Table tab:captive note (corridor.tex:676-684); Sec 6/7 vs table"
  finding: "The note attributes the private $ column to 'oil, mining and banking' but the matching row is labelled 'Unrelated (agri, steel, chemicals, energy)' — categories do not line up. Separately, '$0.8bn' (Sec 6/7 prose) vs '$767m' (table) for the same 2025 rail-freight deal (within rounding, audit-blessed, but visible side by side)."
- id: m4-12
  severity: MINOR
  location: "Figure captions fig:monthly, fig:es, fig:mismatch, fig:wedge, fig:priority"
  finding: "Systematic caption gaps: no source line (UN Comtrade / OECD ICIO) on any of the five; sample windows absent (fig:wedge n, fig:es window); fig:wedge caption asserts 'no systematic weight gain' for a price-ratio histogram (weight = value/kg is a different, unplotted quantity); fig:es caption says 'around 2022m3' and 'relative to 2022m2' in one sentence."
```

```scorecard
lens: "4. Results"
round: 2
critical: 0
major: 5
minor: 7
score_out_of_10: 7
summary: >
  Substantial round-2 progress on the structural items this lens raised: a real DiD spec
  grid (tab:did) with the estimating equation, N/FE/clustering, and an identification
  subsection; the surge basket is now the primary, significant, audit-PASS estimate (round-1
  C1 closed); the deal-count null carries a power/MDE statement and the 2023-25 window
  (C3 closed); the mirror-gap null is reported (M8 closed); "West+China" is consistent
  everywhere (M10 closed); Tables 3 and 4 have proper notes and the "index" language is
  gone (most of M11 closed); the abstract/Sec1/results headline trio is numerically
  consistent. The results prose (Sec 4.3, Sec 5, Sec 6) is now well-caveated and earns
  "corridor, not factory" on magnitudes rather than on the (honestly hedged) wedge.
  What remains is exhibit-level and fixable without new analysis: (M4-1) the event-study
  figure was never regenerated — its baked-in "Event study"/"95% CI" and the caption's
  "wide bands" both contradict the unchanged saturated 31-observation spec; (M4-2) the
  mismatch figure plots Western-only inbound but labels its own axis "EU+China" and the
  caption names no measure, so it cannot be reconciled with Table 1; (M4-3) tab:did never
  says the parenthetical is the SE; (M4-4) tab:magnitudes leads with the measure the text
  disavows and flags the preliminary 2024 / collapsed 2025 cells only in the caption;
  (M4-5) tab:moderators still has no note and fig:monthly still has no y-axis unit. Plus a
  MINOR exposition gap: Sec 5.1's f.o.b. wedge of 1.6 is never tied to Sec 5.2's 34% gross
  margin, the two ends of the load-bearing value-capture chain.
```
