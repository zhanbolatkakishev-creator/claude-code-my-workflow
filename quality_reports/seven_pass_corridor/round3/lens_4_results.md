# Lens 4 — Results, Tables & Figures — ROUND 3

**Manuscript:** `Manuscript/corridor.tex` (982 lines) + `corridor.pdf`
**Prior:** `_SYNTHESIS_round2.md` (Lens 4 scored 7/10; round-2 Lens-4 MAJORs were M1 table stars, M2 stale figure labels)
**Method:** PDF rendered to text (`pdftotext -layout`; no image rasteriser available on this machine, so table *visual* alignment could not be eyeballed — flagged where relevant); all five figure PNGs read directly; every reported number cross-checked against `scripts/R/kz_passthrough/_outputs/` and `scripts/R/kz_valueadd/_outputs/`.

---

## What round 2 fixed (verified, do not re-litigate)

- **Table 2 (`tab:did`) stars are now all correct.** Checked cell-by-cell against `rq1_estimates.txt`:
  surge/exports-to-Russia 2.44 (p=0.0130) → `*`; surge/inbound-W+China 2.10 (p=0.0509) → unstarred;
  surge/KZ-imports 1.88 (p=0.0040) → `**`; placebo −0.95 (p=0.00103) → `**`; priority-list row `*** / ** / ** / ***` all match. Round-2 M1 fully resolved.
- **Table 2 caption** now states "cluster-robust standard errors (by HS6) in parentheses" and "the placebo row has N = 200 (the 25 civilian lines)". SE-note and split-N both present.
- **Table 1 (`tab:magnitudes`) nests and matches §5.1.** "of which Western" ≤ "West + China" every year; 2025 equality is flagged in the caption; every §5.1 figure ($7–17m→$128m; ~$440m; $0.8–2.4bn; $170m→$340–440m, ×2.3) traces to the table.
- **Figure 2 (`fig:es` = `rq1_fig_eventstudy.png`) is now a genuine event study** — leads/lags in event time, reference period (t=−1) pinned to zero with no whisker, 95% CIs shown, plot subtitle "95% CI clustered by HS6" consistent with the LaTeX caption. Round-2 C4 resolved.
- **Table 4 (`tab:captive`)** dual-`$m` bases disclaimer present; every cell matches `mechanism_tests.txt` TEST D.
- **Deal-rate ratios (§7)** now carry CIs (RR 1.03 [0.63–1.65]; RR 1.24 [0.74–2.01]); MDE ("≈80% or more") matches `power_null.txt`.
- **Neighbour series (§9)** now full 2022–2025 for ARM/KGZ and matches `rq1_robustness.txt`; the ARM-GFCF +3.3pp and "no deal data for ARM/KGZ" concessions are in. Round-2 C6/M12 resolved.
- **§6 value-capture chain** — freight-netting derivation dropped; both flow-through bases reported ($479m/$887m=0.54 Western; /$3.2bn=0.15 W+China); BNS I-O cross-check (0.89/0.74) added. Round-2 C3 (arithmetic)/M5/M10 resolved *except the citation* — see L4-2.
- **Table 3 (`tab:dealsource`)** FactSet/Dealroom "[To run.]" / "---" is flagged in the table note, §4, §7 and Appendix A. Known-pending, correctly disclosed in place.

---

## MAJOR

### L4-1  Figure 1 caption names colours that do not exist in the figure
`fig:monthly` caption: "blue = West + China mirrored exports to Kazakhstan, orange = Kazakhstan's
exports to Russia." The shipped `rq1_fig_monthly.png` has **no blue or orange line** — West+China is
salmon/red, KZ→Russia is cyan/teal. The on-figure legend is correct and self-consistent, so a reader
looking at the plot is fine; a reader following the caption's colour key cannot map it and, if they
guess, will read the two series backwards (the line that spikes to ~$235m is West+China, not
KZ→Russia). Regression from the round-2 label sweep, which fixed the other two figures but not this
caption.

### L4-2  The load-bearing "6–14% national-accounts convention" is still uncited
Appears 5× (`corridor.tex:46, 107, 557, 574, 940`) and is the *sole* quantitative input to the
headline "5–11 cents / \$23–53m retained" result. `rq2b_io_propagation.txt` also states it with no
source. Round-2 C3's fix instruction was explicit: "bound the retained margin only by the KZ
national-accounts trade-insurance-freight convention (6–14%), **cited to a source**." The bound is
in; the citation is not. A referee will not accept a headline number resting on an unsourced
convention. (Qualitative "8% ≪ 76%" survives any value in a 5–20% band, so not CRITICAL — but close.)

### L4-3  Figure 4 (`fig:mismatch`) — subtitle truncated, and the deal-count window disagrees with the figure
Two problems in the figure the (non-)investment null rests on:
1. **The embedded subtitle is clipped at the right margin:** "…Bars: M&A/PE deals in manufacturing of
   tradeables, transport and" — sentence cut off mid-phrase. Included at `width=\textwidth`, so the
   truncation is visible in the PDF.
2. **Bars start at 2016; the text reports a "2015–2021" pre-period.** §7: "runs at **7.3 per year in
   2015–2021**." `power_null.txt` gets 7.3 only by treating 2015 as a zero
   (`counts = 0,6,15,10,8,6,6`), but `valueadd_findings.txt` table (3) — the bucketed value-add-relevant
   series — has **no 2015 row at all** (starts 2016), while table (1) shows **31 total deals in 2015**.
   So "2015 = observed zero" is unverified and possibly an artefact of the bucket panel starting in
   2016 (exactly round-2 M4, still unresolved). On 2016–2021 the pre-mean is **8.5/yr**, which makes
   the post period (7.5/yr) a slight *decline*, not "essentially its pre-2022 rate." Figure 4 starting
   at 2016 hides the number that does the work. Either show 2015 in the figure (as a genuine zero) or
   report the 2016–2021 rate and soften "runs at essentially its pre-2022 rate."

### L4-4  Figure 3 / §6.1: "no mass at the high multiples" contradicts the histogram it captions
`fig:wedge` caption and §6.1 (line 535) both say "wide dispersion; **no mass at the high multiples**
a mark-up would produce." But `rq2a_unit_value_wedge.txt`: **p75 of the f.o.b. wedge = 4.40** (annual;
4.30 monthly) — a full quarter of matched cells sit above 4.4× — and the CHPL-tier medians are 3.83
(tier 2, \$150.8m gross) and 3.94 (tier 4A). The shipped histogram visibly shows a secondary cluster
around 2.2× and cells out to 4.8×. This is round-2 M7 recurring, now baked into a figure caption. The
honest statement is "most mass below ~2×; a thin right tail whose cells carry little inbound value"
(the value-weighting is the real defence, and the paper should lean on it explicitly). Also: neither
the caption nor §6.1 gives the median's IQR or the figure's n (=112).

### L4-5  Figure 5 and Table 6 (`tab:priority`) are not the same object, and the highest-ranked sector is in neither
- **Table 6 lists 7 sectors** (2 platform + 3 substitution + 2 avoid). **Figure 5 plots ~16** manufacturing
  sectors and **omits both platform rows** (Warehousing, Wholesale) — i.e. the figure captioned as the
  companion to "where investment would raise value capture" does not show the logistics platform, which
  §10 names as the *first* of the "two groups [that] stand out."
- **`sector_priority.txt` ranks Electrical equipment (C27) #1** among substitution candidates
  (priority score 0.823; VA mult 0.813, imp-intens 5.60) and Figure 5 shows it sitting in the
  best quadrant — but it appears in **neither Table 6 nor the §10 text**, which jump straight to
  Machinery (rank 2). §10 says the sectors are "read jointly rather than collapsing them into a single
  index," yet the replication output *is* a single index and the paper silently drops its top entry.
- Table 6's sector selection ("the candidate sectors") has no stated inclusion rule.
Net: a reader cannot reconcile the figure, the table and the ranked output.

### L4-6  §10 superlative contradicted by the paper's own data
§10 (line 843): "computer, electronic and optical manufacturing has **the lowest value-added
multiplier in the economy** (0.69)." `sector_priority.txt` `va_mult`: C26 = **0.694**; but
C29 Motor vehicles = **0.688** and C22 Rubber & plastics = **0.688** — both strictly lower. At the
displayed precision (0.69) it is tied, not "the lowest." Fix to "among the lowest" / "tied for the
lowest, with motor-vehicle kit assembly."

### L4-7  §5.2 calls the DiD event-study coefficient "roughly a tenfold rise" — the abstract calls the same object "threefold"
§5.2 (line 399): "the outbound coefficient … reaching about +2.4 asinh points **(roughly a tenfold
rise in level)**." The abstract and §1: the raw increase is "roughly tenfold," but "a
difference-in-differences … leaves a **roughly threefold** increase," and Table 2's note reports the
PPML level effect as **3.5×**. The +2.4 event-study coefficient *is* the DiD object (average of the
post dummies ≈ γ = 2.44), so §5.2's "tenfold" gloss both contradicts the abstract and is the wrong
translation — a naive `exp(2.4)` on an asinh coefficient, which the paper elsewhere correctly avoids
by quoting PPML. §5.2 should say "≈ 3.5× in levels (PPML; Table 2)."

---

## MINOR

- **L4-8  Figure 2 caption omits the pre-trend Wald p.** The joint pre-trend test (p = 0.78 outbound,
  0.42 inbound) is in the §5.2 text but not the caption, so the figure is not standalone on the one
  quantity a reader checks in an event-study plot. Add "pre-trend joint test p = 0.78 (outbound),
  0.42 (inbound)."
- **L4-9  Figure 3 x-axis shows raw R variable names** — `uv_expRU / uv_mirWC  (f.o.b. / f.o.b.)`.
  Replace with "KZ re-export unit value ÷ exporter-reported inbound unit value."
- **L4-10  Tables 5 and 6 — verify vertical alignment in the compiled PDF.** `pdftotext` extraction of
  both is badly scrambled (multirow group labels + `p{}` columns with 3–4-line cells such as
  "near-zero (electronics output ≈ \$230m)"). Column-width arithmetic says neither overflows, so this
  is likely an extraction artefact — but the "Avoid" multirow label in Table 6 spans a row whose
  sector cell ("Computer, electronic & optical (surge basket)") wraps to two lines, which is exactly
  where multirow centring drifts. Needs an eyeball.
- **L4-11  Table 5 (`tab:moderators`) is not standalone** — the column header "$R\!\uparrow$ when" and
  the "Gate" column both require §3; the caption defines neither "R" nor the gate concept.
- **L4-12  Table 2 placebo row has only one populated cell** (`--- | −0.95** | --- | ---`) and neither
  caption nor note tells the reader the placebo outcome is the W+China inbound flow (the moment the
  fake treatment was selected on). A reader cannot tell whether the three dashes mean "not run" or
  "zero." One sentence in the note fixes it.
- **L4-13  Figure 1 does not mark the Bai–Perron breaks.** The dashed line is at 2022-03 (the
  sanctions date), not the estimated break 2022m5, and neither the 2022m5 break CI nor the late-2023
  second break (`rq1_monthly.txt`: 2023-12 [2023-11, 2025-01], a 14-month CI) is drawn. The figure the
  §5.2 break discussion points to shows none of the breaks. Add v-lines + CI shading, or note in the
  caption that break estimation is in the text.
- **L4-14  Baseline windows still don't match.** Basket selection (§4) compares 2019–2021 vs
  2022–2024; the retained-value and fiscal calculations (§6, `rq2b`/`rq2c`) use a 2018–2021 baseline
  vs 2022–2025. Both are "pre vs post," but the mismatch is visible and unexplained (round-2 M5 tail).
- **L4-15  QIC project count disagrees between outputs.** `mechanism_tests.txt` TEST D (Table 4's
  source) = 50 projects; `valueadd_findings.txt` (6) = 28. The paper uses 50, which matches its cited
  source, but a replicator hits both numbers.
- **L4-16  Same deal quoted two ways.** §7 "a \$0.8bn 2025 consolidation of rail-freight" vs Table 4
  note "\$767m in corridor logistics … a single 2025 rail-freight consolidation" (`valueadd_findings`
  (5): 766.77). Pick one rounding.
- **L4-17  Two text-only robustness numbers with no table.** §5.3 reports size-decile×year FE
  γ = 2.29 (p = 0.003) and drop-2022 γ = 2.71 (p = 0.012); round-2 C7 asked for these in Table 2.
  They are stated but untabulated — a two-row "robustness" panel under Table 2 would close it.
- **L4-18  Figure 5 title says "Where PE money buys…"** where the LaTeX caption and §10 say
  "Where investment buys…". "PE money" is narrower than the paper's framing; also the top-right sector
  in that plot (Electrical equipment) is never named in text (see L4-5).
- **L4-19  Figure 4 line starts 2018, bars start 2016**, with no caption note explaining the trade
  series' shorter span.

---

## Items checked and OK

- Every table/figure is referenced in text and discussed; no orphans, no dangling `\ref`.
- Units are consistent: USD m throughout the trade tables; asinh-points vs PPML-levels are (mostly — see L4-7) kept distinct; QIC "\$m (fund)" vs total "\$m" explicitly separated in Table 4.
- Table 1, Table 2, Table 3, Table 4 numbers all trace to `_outputs/`.
- §6.1/§6.2/§6.3 numbers (0.73, 1.6, 0.70/1.5 monthly, slope 0.06–0.48, weight ratio 0.08, v̄ᵀᵀ=0.79, v̄ᴹ=0.76, BNS 0.89/0.74, \$479m, \$107–134m/yr, ~\$22m duty, 0.2–0.3% GDP) all trace.
- §9 cross-country numbers (findev 24–66% of GDP, ARM d_gfcf +3.3) trace to `crosscountry.txt`.
- Structural-break stats (supF 561 / 24 / 241 outbound/W+China/Western monthly; 151 / 142 / 4 annual) all trace to `rq1_monthly.txt` and `rq1_estimates.txt`.

---

```
findings:
  - id: L4-1
    severity: MAJOR
    location: "Figure 1 (fig:monthly) caption"
    finding: "Caption's colour key ('blue = West+China, orange = KZ->Russia') names colours absent from the figure (salmon / cyan); a caption-led reader maps the two series backwards."
    evidence: "Caption: 'blue = West + China mirrored exports to Kazakhstan, orange = Kazakhstan's exports to Russia.' PNG lines are red/salmon and cyan; on-figure legend is correct."
    change_my_mind: "If the compiled PDF actually renders the lines blue and orange (colour-profile difference from the PNG I read), this drops to nil."
  - id: L4-2
    severity: MAJOR
    location: "§6.2 (corridor.tex:557) + abstract + §1 + §11"
    finding: "The 6-14% national-accounts trade/insurance/freight margin — the sole input to the headline 5-11c / $23-53m retained-value result — is stated 5 times with no citation; round-2 C3 required it be sourced."
    evidence: "'We take m from the Kazakhstan national-accounts convention for trade, insurance and freight on goods trade, 6--14%.' No \\cite anywhere near any of the 5 occurrences; rq2b_io_propagation.txt also unsourced."
    change_my_mind: "A citation to the KZ BNS methodology / a Comtrade CIF-FOB margin study attached to one occurrence resolves it; the qualitative 8%<<76% conclusion is not at stake."
  - id: L4-3
    severity: MAJOR
    location: "Figure 4 (fig:mismatch) + §7"
    finding: "Figure subtitle is truncated mid-sentence in the shipped PNG; and bars start 2016 while §7 reports a '2015-2021' pre-rate of 7.3/yr that depends on an unverified 2015=0 (bucket series in valueadd_findings.txt starts 2016; 2016-2021 mean is 8.5/yr, which would make the post period a slight decline)."
    evidence: "PNG subtitle ends '...transport and'. power_null.txt: 'counts = 0,6,15,10,8,6,6 (2015 = observed zero)'; valueadd_findings.txt table (3) has no 2015 row; table (1) shows 31 total deals in 2015."
    change_my_mind: "If deals_classified.rds genuinely has zero mfg/transport/distribution deals in 2015, show that year in the figure and the finding is just the truncated subtitle (still MAJOR-visible, downgrade to MINOR)."
  - id: L4-4
    severity: MAJOR
    location: "Figure 3 (fig:wedge) caption + §6.1 (corridor.tex:535,542)"
    finding: "'No mass at the high multiples a mark-up would produce' contradicts the paper's own p75 f.o.b. wedge of 4.40 and tier medians of 3.83 / 3.94; the histogram visibly has a secondary mode near 2.2x and cells to 4.8x."
    evidence: "rq2a_unit_value_wedge.txt: p75_uv_wedge = 4.399; tier 2 med_wedge 3.834 ($150.8m gross), tier 4A 3.936. Round-2 M7 flagged the same, unresolved."
    change_my_mind: "Rephrase to 'most mass below 2x; a thin right tail carrying little inbound value' and lean on the value-weighted aggregate (<1) — then it is defensible."
  - id: L4-5
    severity: MAJOR
    location: "Figure 5 (fig:priority) vs Table 6 (tab:priority) vs §10"
    finding: "Figure 5 plots ~16 sectors and omits the two platform sectors that §10 names as the first priority; Table 6 lists 7 and omits Electrical equipment, which sector_priority.txt ranks #1 among substitution candidates. The three views do not reconcile and Table 6's inclusion rule is unstated."
    evidence: "sector_priority.txt rank 1: 'C27 Electrical equipment ... priority 0.823'; sector_priority_platform.txt lists Warehousing/Wholesale (in Table 6, absent from Figure 5). §10: 'we read them jointly rather than collapsing them into a single index' (the output is an index)."
    change_my_mind: "If Table 6 and Figure 5 are meant as deliberately different cuts, a one-line rationale in each caption plus a mention of Electrical equipment in §10 would resolve it."
  - id: L4-6
    severity: MAJOR
    location: "§10 (corridor.tex:843)"
    finding: "'computer, electronic and optical manufacturing has the lowest value-added multiplier in the economy (0.69)' — Motor vehicles (0.688) and Rubber & plastics (0.688) are strictly lower in the paper's own sector table."
    evidence: "sector_priority.txt va_mult: C26 = 0.694, C29 = 0.688, C22 = 0.688."
    change_my_mind: "Nothing — change 'the lowest' to 'among the lowest / tied for the lowest with motor-vehicle kit assembly'."
  - id: L4-7
    severity: MAJOR
    location: "§5.2 (corridor.tex:399) vs abstract / Table 2 note"
    finding: "The +2.4 asinh DiD event-study coefficient is glossed as 'roughly a tenfold rise in level', but the abstract calls the same DiD object 'roughly threefold' and Table 2's PPML note says 3.5x. Naive exp() of an asinh coefficient, which the paper elsewhere avoids."
    evidence: "§5.2: 'reaching about +2.4 asinh points (roughly a tenfold rise in level)'. Abstract: 'a difference-in-differences ... leaves a roughly threefold increase.' Table 2 note: 'surge basket 3.5x outbound'."
    change_my_mind: "If §5.2's 'tenfold' is meant to describe the raw series and not the coefficient, reword so that is unambiguous; as written it modifies '+2.4 asinh points'."
  - id: L4-8
    severity: MINOR
    location: "Figure 2 (fig:es) caption"
    finding: "Caption omits the pre-trend joint Wald p (0.78 outbound / 0.42 inbound); it is only in the §5.2 text, so the event-study figure is not standalone on its key diagnostic."
    evidence: "Caption ends '...reference year 2021. Source: UN Comtrade.' rq1_estimates.txt has the Wald test."
    change_my_mind: "n/a — pure addition."
  - id: L4-9
    severity: MINOR
    location: "Figure 3 (fig:wedge) x-axis"
    finding: "Axis label exposes raw R variable names: 'uv_expRU / uv_mirWC (f.o.b. / f.o.b.)'."
    evidence: "Shipped PNG x-axis title."
    change_my_mind: "n/a."
  - id: L4-10
    severity: MINOR
    location: "Tables 5 and 6"
    finding: "pdftotext extraction of both tables is badly scrambled (multirow labels + multi-line p{} cells); column arithmetic says no overflow, but Table 6's 'Avoid' multirow label spans a two-line sector cell where centring tends to drift. Needs a visual check in the compiled PDF."
    evidence: "Extraction shows numeric columns offset by one row against sector labels in tab:priority; 'Kazakhstan, 2022' column in tab:moderators wraps to 3-4 lines."
    change_my_mind: "A screenshot of pp. 20-21 showing clean alignment closes this."
  - id: L4-11
    severity: MINOR
    location: "Table 5 (tab:moderators) caption"
    finding: "Not standalone: 'R up when' header and the 'Gate' column both require §3; caption defines neither."
    evidence: "Caption: 'Moderators of the investment response, and Kazakhstan's values.'"
    change_my_mind: "n/a."
  - id: L4-12
    severity: MINOR
    location: "Table 2 (tab:did) placebo row / note"
    finding: "Placebo row has one populated cell (Inbound W+China) and three dashes; nothing tells the reader the placebo outcome is the W+China flow or whether the dashes mean 'not run'."
    evidence: "Row: 'Placebo (largest civilian lines) & --- & -0.95 (0.25)** & --- & ---'."
    change_my_mind: "n/a — one sentence in the note."
  - id: L4-13
    severity: MINOR
    location: "Figure 1 (fig:monthly)"
    finding: "Bai-Perron breaks and CIs from §5.2 (2022m5 [m4-m6]; late-2023 second break) are not marked; the only vertical line is 2022-03. The figure the break discussion cites shows no breaks."
    evidence: "rq1_monthly.txt: mirWC breaks 2022-05 [2022-04,2022-06] and 2023-12 [2023-11,2025-01]; PNG has a single dashed line labelled 'Dashed = 2022-03'."
    change_my_mind: "n/a."
  - id: L4-14
    severity: MINOR
    location: "§4 vs §6 / §6.3"
    finding: "Basket selection uses a 2019-2021 vs 2022-2024 comparison; retained-value and fiscal calculations use a 2018-2021 baseline vs 2022-2025. Unexplained window mismatch (round-2 M5 tail)."
    evidence: "§4: 'each at least doubled from 2019--2021 to 2022--2024.' rq2b: 'baseline 2018-21'."
    change_my_mind: "One clause noting the baseline choice differs and why."
  - id: L4-15
    severity: MINOR
    location: "Table 4 (tab:captive) / replication outputs"
    finding: "QIC project count is 50 in mechanism_tests.txt (Table 4's source) but 28 in valueadd_findings.txt (6); the paper uses 50."
    evidence: "mechanism_tests.txt TEST D sums 34+13+2+1=50; valueadd_findings.txt (6): 'QIC 2022+ industry/logistics: 28 projects'."
    change_my_mind: "If the two counts use different sector filters (industry/logistics vs all), a note reconciling them is enough."
  - id: L4-16
    severity: MINOR
    location: "§7 vs Table 4 note"
    finding: "The 2025 rail-freight deal is '$0.8bn' in §7 and '$767m' in the Table 4 note (actual 766.77)."
    evidence: "valueadd_findings.txt (5): 766.77. corridor.tex:608 '$0.8bn'; tab:captive note '$767m'."
    change_my_mind: "n/a — pick one."
  - id: L4-17
    severity: MINOR
    location: "§5.3 / Table 2"
    finding: "Size-decile x year FE (gamma=2.29) and drop-2022 (gamma=2.71) robustness results are text-only; round-2 C7 asked for them in Table 2."
    evidence: "corridor.tex:446-447; rq1_did_robustness.txt (b),(c)."
    change_my_mind: "A small robustness panel appended to Table 2."
  - id: L4-18
    severity: MINOR
    location: "Figure 5 (fig:priority) title"
    finding: "Figure title 'Where PE money buys the most domestic value added' vs LaTeX caption / §10 'Where investment buys...'; narrower framing, and the plot's top-right sector (Electrical equipment) is unnamed in text."
    evidence: "PNG title vs corridor.tex:877 caption."
    change_my_mind: "n/a."
  - id: L4-19
    severity: MINOR
    location: "Figure 4 (fig:mismatch)"
    finding: "Trade line starts 2018, bars start 2016, with no caption note on the shorter trade span."
    evidence: "Shipped PNG; §4 trade data is 2018-2025 annual."
    change_my_mind: "One caption clause."
```

```
scorecard:
  lens: "4. Results"
  critical: 0
  major: 7
  minor: 12
  score_out_of_10: 7
  one_line: "REVISE — table hygiene is materially better (Table 2 clean, Table 1 nests, deal-count CIs in), but figures carry a caption regression (Fig 1 colours, Fig 4 truncated subtitle), the §10/Table 6/Figure 5 priority material does not reconcile with itself or the ranked output, and the headline 6–14% margin is still uncited."
```
