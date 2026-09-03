# Proofreading Report — `Manuscript/corridor.tex`

**Date:** 2026-09-02 · **Scope:** ~11,000 words, LaTeX article, JIE submission
**Bibliography:** all 28 keys defined and used; no orphaned or undefined citations.
**No trial compile available** (proofreader agent has no shell) — overflow findings in §G are
static width estimates, confirm against the `.log`.
**No source files edited.**

**Clean checks:** no doubled words; balanced quote pairs; no unescaped `%` after digits; no
unbalanced parentheses; no American `-ize`/`-ization`; the 5 remaining `---` are the intended
table "not applicable" markers.

---

## A. CRITICAL / STRUCTURAL LOGIC

| # | Line(s) | Sev | Issue |
|---|---|---|---|
| A1 | 843–844, 927 | **CRITICAL** | Gate-polarity contradiction. Line 843 "attributes the null to at least one **closed** gate" is immediately followed by "The market-access gate is **open**". Line 927 "$R$ is positive only when the market-access and irreversibility gates are both open" inverts the paper's headline result. **Fix 843:** "attributes the null to at least one factor near zero." **Fix 927:** "$R$ is positive only when the market-access gate is closed and the irreversibility gate is open, and large only when the institutional gate is open as well." |
| A2 | 718–719, 1452 | **CRITICAL** | "reaches parity only at $m \approx 49\%$" — Table D.1 gives ratio 0.505 there, i.e. about a **half**. The rest of the ladder (tenth/fifth/third) is exact. **Fix:** "reaches about a half only at $m \approx 49\%$" (main text and the Table D.1 note). |
| A3 | 647–655, 667–669, 1460–1462 | **CRITICAL** | Scarcity-markup claim refuted by the paper's own tier numbers: "a median near four in the highest priority tiers" / "concentrated in the most sensitive tiers" vs Tier 1 = **0.47** (lowest) and Tier 4A = **3.94** (highest, least sensitive). **Fix:** "medians near four in Tiers 2 and 4A, against 0.47 in Tier 1 … fall largely, though not uniformly, in lines where scarcity markups would be expected." Revise `fig:wedge` caption and Appendix D to match. |
| A4 | 760–763 vs 790 | MAJOR | Figure caption: 2015 is "an observed zero"; text: "2022 is the weakest in the series" and calls 2015 merely "soft". Also 8.7/yr pre-rate implies 52 deals over 2016–21, but `tab:dealsource` has 53. **Fix:** reconcile — "2015 is an observed zero (a coverage ramp-up) and 2022 the weakest year with any deal flow; excluding 2015 the pre-2022 rate is 8.8 per year." |
| A5 | 1476–1477 vs `tab:appe` | MAJOR | Belarus named in the Appendix E text and the population (967) but has no row in Table E.1. **Fix:** add the row, or "Belarus is in the population but excluded here: it has not reported to Comtrade since 2022." |
| A6 | 477–478 | MAJOR | `\ref{sec:did}` cited from *inside* `\subsection{...}\label{sec:did}` — a dead self-pointer. **Fix:** "(see ``The reform confound'' below)" or point to `\ref{sec:shock}`. |
| A7 | 799–800 vs `tab:dealsource` | MAJOR | "none shows a post-2022 increase" contradicted by the table: Cap IQ 5.1→5.2, Preqin 0.4→0.5. **Fix:** "none shows more than a flat rate (5.1 to 5.2, 2.0 to 1.5, 0.4 to 0.5 per year)." |
| A8 | 332–334, 899–901 | MAJOR | "stopped reporting monthly … after February 2024, so the monthly series uses 2019–2023 **and 2025**" then "the only monthly evidence covers a single half-year". Contradictory. **Fix:** "suspended monthly reporting after February 2024 and resumed in 2025" (align line 900). |
| A9 | 325–327 vs 618–619, 660–661 | MAJOR | §3 calls the unit-value wedge "a rough estimate of the margin"; §5 says it "does not identify a retained margin". Also "the margin … is no higher than the cost of the input" compares a margin to a cost. **Fix:** "the unit-value evidence of Section~\ref{sec:capture}, though it does not identify the margin, is consistent with a re-export price no higher than the delivered cost of the input, so little is left for the direct path". |

---

## B. PUNCTUATION — em-dash-conversion artifacts

| # | Line(s) | Sev | Issue / fix |
|---|---|---|---|
| B1 | 755–756 | MAJOR | Comma splice + missing "only": "We find none, though, with only four post-2022 years, the deal-count test can rule out a large response, not a modest one." → "We find none; though, with only four post-2022 years, the deal-count test can rule out only a large response, not a modest one." |
| B2 | 525–527 | MAJOR | Orphan appositive: "…not just on the outflow to Russia, a partial check against selecting the basket…" → "…not just on the outflow to Russia; this is a partial check against selecting the basket purely on the outbound outcome that the difference-in-differences then uses." |
| B3 | 989–990 | MAJOR | Comma splice to a bare noun phrase: "…financial markets that are not uniformly deep, the pattern the framework predicts:" → "…not uniformly deep. This is the pattern the framework predicts:" |
| B4 | 588–589 | MAJOR | Verbless fragment + wrong word: "The direction is also asymmetric: inbound from Western reporters, onward to Russia." → "The direction is also the right one: the goods come in from Western reporters and go onward to Russia, not the reverse." |
| B5 | 1021–1025 | MAJOR | Verbless second parallel group (paragraph split broke parallelism with the "logistics platform … has …" sentence). → "\textbf{Import substitution} … is the second: Kazakhstan imports six to eight times what it produces…" |
| B6 | 1212–1213, 1214–1215, 1226–1228 | MEDIUM | Comma-appositive strings that were em-dashes and now read ambiguously — restore parentheses or dashes (e.g. "…against 46\% for mining (the second year in which manufacturing has run ahead), with manufacturing up about 9\%…"). |
| B7 | 141 | MINOR | Missing comma after fronted clause: "because the re-export flow persisted through 2025 a 2022 entrant faced…" → "…through 2025, a 2022 entrant faced…" |
| B8 | 45 (abstract) | MINOR | "an externally compiled product list not selected on Kazakh outcomes shows the same break" → add commas around the participial. |
| B9 | 1230 | MINOR | "Read against this paper the expansion sits with the framework." → "Read against this paper, the expansion is consistent with the framework." |
| B10 | 337 | MINOR | Missing "and" in the Western-reporters serial list before "Norway". |

---

## C. GRAMMAR

| # | Line(s) | Sev | Issue / fix |
|---|---|---|---|
| C1 | 639–642 | MEDIUM | Dangling "Restricting to…": → "If we restrict to the six near-pure-transit … cells …, the median weight ratio is $0.74$…" |
| C2 | 133–135 | MEDIUM | "the market-access gate … which also forgoes the technology transfer" — a gate cannot forgo. → "…which also means Kazakhstan forgoes the technology transfer…" (cf. line 278). |
| C3 | 994–995 | MEDIUM | "Doing so would regress …" — a procedure cannot regress. → "Doing so would require regressing …" |
| C4 | 1268 | MEDIUM | "(mirror) data, which **overstates**" — vs line 341 "Mirror data **overstate**". → "which overstate". |
| C5 | 1169–1171 | MINOR | "rules, **a major instrument**" (plural head). → "major instruments". |
| C6 | 969–971 | MINOR | "a non-member … its market-access gate … the more likely of the two groups". → "non-members … their market-access gate … they are the more likely…". |
| C7 | 966–968 | MEDIUM | "Outside the customs union, the named population … is {…} inside the Eurasian Economic Union and {…} outside it" — the fronting contradicts the list order. **Fix:** drop the fronted "Outside the customs union,". |
| C8 | 166–173 | MEDIUM | Roadmap verb-gapping: gapped clauses inherit "asks" ("Section 8 asks the moderators"). Give each clause an overt verb; also fix the title mismatch ("where investment would pay off" → "where investment would raise value capture"). |
| C9 | 1165 | MINOR | Fused participle in the heading: "China: lowering barriers to Kazakhstan capturing more value" → "…to Kazakhstan's capturing more value" or "…to greater Kazakh value capture". |
| C10 | 1181–1183 | MEDIUM | "a precondition for private capital to act once they are." — no recoverable predicate. → "…once those two have been pulled." |
| C11 | 1162–1163 | MEDIUM | Zeugma: "the chokepoint disruptions and China's route diversification remain incomplete" → "…disruptions persist and China's route diversification remains incomplete." |
| C12 | 148–150 | MEDIUM | Zeugma / severed "extending … to": "establishes that … happened and its scale". → "extending a literature that establishes the fact and the scale of the reallocation to what the intermediary retains from it, and to 2025." |
| C13 | 1246 | MINOR | "a single configuration **on** which the three gates are not separately identified" → "**in** which". |

---

## D. ACADEMIC QUALITY

| # | Line(s) | Sev | Issue / fix |
|---|---|---|---|
| D1 | 255–257 | MAJOR | The gloss on $\mu_P \le \mu_T$ describes a price vs an input cost, not two margins. → "(a domestic plant's per-unit transformation margin is no larger than the margin a re-exporter already earns)". |
| D2 | 289–292 | MEDIUM | "Each observation above identifies a factor …" — four observations, three factors; (ii) identifies no gate. → "Three of the four observations above identify a factor …". |
| D3 | 1013–1014 vs `tab:priority` note | MEDIUM | "we read them jointly rather than collapsing them into a single index" vs the caption's "combined score … ranked". → "we read them jointly, and use a simple combined score only to order the candidates, not to rate them." |
| D4 | 530–532 vs 584 | MEDIUM | Placebo disowned in §4.3 ("we do not read the placebo as corroboration") then used in §4.4 ("the cross-sectional placebo runs the wrong way"). → downgrade the §4.4 mention. |
| D5 | 580–581 | MEDIUM | "the civilian control basket tells the story a broad reform cannot" — opaque. → "behaves in a way a broad reform cannot explain". |
| D6 | 956–964 | MEDIUM | "Two features are informative" — only one feature follows; the second item is a data limitation (no deal data for ARM/KGZ). → renumber or make the second a genuine feature. |
| D7 | 141–142, 1203–1205 | MEDIUM | Non-sequitur "because": ex-post persistence does not cause ex-ante uncertainty. → "because the re-export flow in fact persisted through 2025, the null cannot be read as a response to an observed transitory shock: what a 2022 entrant faced was uncertainty about its duration, not evidence of a short one." |
| D8 | 1245–1249 | MEDIUM | Faulty "so": the single configuration is why the case *cannot* separate the gates, not why it *can* identify two. → "…observes a single configuration, in which the three gates are not separately identified. It can still identify the market-access gate as open and rule the institutional gate out …; what it cannot establish is that irreversibility independently binds." |
| D9 | 695–699 | MEDIUM | Colon introduces a consequence, not a reason; leftover line break "an estimate:" / "because". → "…treat it as a calibration, not an estimate, because no line-by-line margin is identified in our data. Since $\bar v^{TT} \approx \bar v^{M}$ …". |
| D10 | 632–636 | MEDIUM | "the same statistic on different units and coincide here" — cannot be both. → "the same construction on different units, and here they coincide at $0.11$". (Appendix D wording "equals" is fine.) |
| D11 | 733–735 | MEDIUM | "a looser benchmark" is the tighter one: one-fifth of the gross flow needs $m\approx 25\%$ vs $m\approx 19\%$ for a produced dollar. → "a more demanding benchmark than one-fifth of a produced dollar, which $m \approx 19\%$ already reaches". |
| D12 | 181–182 | MEDIUM | "aligned … with Russia's, mainly on the Russian duties" — circular; collapsed aside. → "aligned … with Russia's, largely at the Russian duty levels prevailing at the time, and measurably shifted…". |
| D13 | 1095 | MINOR | "the ``Avoid'' row" — the table has two. → "rows". |
| D14 | 626 vs 1458–1459 | MEDIUM | Main text "a slope of $0.06$–$0.48$"; Appendix D reports only 0.48 and 0.20. No 0.06 anywhere. → add the missing (monthly?) slope in Appendix D, or restate as "slopes of 0.20 and 0.48". |
| D15 | 475–476 vs 498 | MINOR | "leaves $\gamma$ essentially unchanged" vs "dropping 2022 raises it to 2.71" (an 11% rise). → "moves $\gamma$ only modestly (to 2.71)". |
| D16 | 689 vs 695 | MINOR | "lower part" vs "lower half" of the 1–49% bracket for the 6–14% band. → "lower part" in both. |
| D17 | 920, 1075 | MINOR | Two unreferenced forward pointers to "related work" — add a citation or "(companion paper, available on request)". |
| D18 | 112, 748 | MEDIUM | "0.2–0.3\% of GDP" — the annual flow ($107–134m) against ~$220–260bn GDP is ~0.05%; the figure only reconciles if cumulative $479m is set against one year's GDP. → state the base. **Verify against the source computation.** |
| D19 | 772, 885, 961, 1162, 1177, 1235; 1072–75 ≈ 1122–26; 1016–21 ≈ 1128–31 | MINOR | Sentence-initial "And" ×6; the co-investor/exit recommendation and the logistics-platform point each stated near-verbatim twice. |

---

## E. TYPOS & FORMATTING

| # | Line(s) | Sev | Issue / fix |
|---|---|---|---|
| E1 | 1303–1304 | MEDIUM | `Accelerator\slash{}` + line break renders "Accelerator/ Incubator" (visible space). → put on one line or end line with `%`. |
| E2 | 1091 | MINOR | "make some domestic **value-added** a condition" — nominal, so "value added" (no hyphen). |
| E3 | 1486 | MINOR | `\begin{tabular}{@{}lrrrrrrrrr r@{}}` — stray space in the column spec. → `lrrrrrrrrrr`. |
| E4 | 91, 104, 114 | MINOR | `\emph{}` scope: the third step "…induced investment}, and find no response…" doesn't match the first two. → "\emph{Third, we ask whether the shock induced investment.} We find no response…". |
| E5 | 260 vs 947 | MINOR | `$\approx$\$230m` (no space) vs `$\approx$ \$230m` (space). |

---

## F. CONSISTENCY

| # | Sev | Issue |
|---|---|---|
| F1 | MEDIUM | "percent" (1155, 1189, 1190) vs British "per cent" (636–637, 1465). Paper is otherwise British throughout — standardise on "per cent". |
| F2 | MEDIUM | `$R$` used at lines 247, 287 before it is defined at eq. (2), line 295. → gloss at first use: "(the investment response $R \approx 0$)". |
| F3 | MEDIUM | Line 845 "$V_T > 0$" where the argument needs $V_T$ *large* (cf. 265, 292). → "$V_T$ is large". |
| F4 | MINOR | One margin, four names: "wholesale-and-freight" (46, 106), "trade-and-freight" (675), "wholesale-plus-freight" (689, 722), "freight-plus-wholesale" (1421). Standardise on "wholesale-and-freight margin". |
| F5 | MINOR | "externally compiled" (101, 348, 1319) vs "externally defined" (489, 495, 545, 1272, 1380). Standardise on "compiled". |
| F6 | MINOR | Abbreviated year ranges in prose ("2018--21", "2022--25" at 470, 598, 606) vs full four-digit elsewhere. Use full form in prose. |
| F7 | MINOR | Line 598 "\$11m/yr" slash notation vs "\$11m per year" elsewhere. |
| F8 | MINOR | 6–14% band alternates text `6--14\%` and math `$6$--$14\%$` (715, 1421). |
| F9 | MINOR | Spelled fractions inconsistently hyphenated: "one half"/"one sixth" (602–603) vs "one-fifth", "one-in-ten". |
| F10 | MINOR | Sample-size symbol alternates $n$ / $N$ (373, 621, 641 vs 543, 809, 1038). |
| F11 | MINOR | "Capital~IQ" vs "Capital IQ (S\&P)" (1299). |
| F12 | MINOR | Oxford comma applied inconsistently — pick one (British house style: none) and apply. |
| F13 | MINOR | Line 1240 "the **model** predicts a supply response" vs "organising device / not a model we estimate" (160–161, 313–314). → "the framework predicts". |
| F14 | MINOR | `\ref{tab:appb}` and `\ref{tab:appd}` are never cited in the text (only the appendix *sections* are). Add pointers. |
| F15 | MINOR | Placebo "runs the other way" (102) vs "runs the wrong way" (584). |
| F16 | MINOR | `` ``avoid'' `` (1039) vs `` ``Avoid'' `` (1095) vs row label `Avoid` (1056). |

---

## G. OVERFLOW (static estimates — no trial compile; confirm against the `.log`)

| # | Table | Sev / confidence | Issue / fix |
|---|---|---|---|
| G1 | `tab:magnitudes` (399–414) | **MAJOR, high** | The only table with **no font-size reduction**. At 12pt, ≈ 19.7 cm vs 16.51 cm available (~3 cm overfull). → add `\small` after `\centering` and/or `\setlength{\tabcolsep}{4pt}`, or shorten the row label to "West + China $\to$ KZ (mirror)". |
| G2 | `tab:did` body (549–566) | MEDIUM, medium | "Priority list, external (50 HS6)" stub + four `2.88 (0.74)$^{***}$` cells ≈ 17.4 cm, ~0.9 cm over. → shorten stub to "Priority list (50 HS6)" and/or `\tabcolsep` 4pt. |
| G3 | `tab:did` Panel C `\multicolumn` (563) | MEDIUM, medium | An `l` column can't wrap; the rule-matched-null line may exceed table width. → `\multicolumn{5}{@{}p{15.5cm}}{...}` or split across two rows. |
| G4 | `tab:appe` (1486–1496) | MINOR, low | 11 columns at `\footnotesize` ≈ 16.1 cm; likely fits, no slack. → `\tabcolsep` 4pt for safety. |
| G5 | — | — | No long unbreakable strings; `\texttt{scripts/...}` already `\allowbreak`-protected; equations well under width. |

---

## The 5 most critical

| # | Line(s) | Issue | Sev |
|---|---|---|---|
| 1 | 843–844, 927 | Gate-polarity contradiction — "closed gate" then "market-access gate is open"; line 927 inverts the headline result | CRITICAL |
| 2 | 718–719, 1452 | "reaches parity at $m \approx 49\%$" — Table D.1 gives 0.505 (about a half) | CRITICAL |
| 3 | 647–655, 668–669, 1461–1462 | Scarcity-markup claim refuted by the paper's own tier wedges (Tier 1 = 0.47, Tier 4A = 3.94) | CRITICAL |
| 4 | 755–756 | Comma splice + missing "only" in the opening sentence of the central null result | MAJOR |
| 5 | 760–763 vs 790 | 2015 "observed zero" vs "2022 is the weakest"; 8.7/yr implies 52 not 53 deals | MAJOR |

Runners-up: A5 (Belarus in App E text, not in Table E.1), A6 (`\ref{sec:did}` dead self-pointer),
A7 ("none shows an increase" contradicted by 2 of 3 rows), A8 (monthly coverage), G1
(`tab:magnitudes` ~3 cm too wide).
