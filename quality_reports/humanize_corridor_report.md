# Humanize Audit: corridor.tex

**File:** `Manuscript/corridor.tex` · **Date:** 2026-09-02
**Word count:** ~11,000 (body prose ≈ 10,600 excluding tables, math, appendix tables)
**Findings:** 40 (6 HIGH, 18 MED, 16 LOW)
**Discipline calibration:** international trade / applied econ (JIE). Roadmap paragraphs,
"The paper makes three contributions", numbered robustness enumerations, and hedged priority
claims are discipline-legitimate and scored down accordingly.

**Headline:** the earlier mechanical pass worked. Categories 1 (classic connectives), 2
(cliché lexicon), 6 (hedge stacking) and 7 (not only / but also) return **zero** standard
hits, and there are **no em-dashes in the prose** (the five `---` are the declared "not
applicable" table markers, not flagged). What survives is structural, not lexical: a
paper-wide **antithesis reflex** ("X, not Y" / "rather than"), an **enumerate-then-
First/Second/Third** paragraph template, an **italic run-in-lede** architecture in blocks of
exactly four, a **seven-fold restatement of the same verdict sentence**, and heavy
**semicolon** density.

## Per-category summary

| Category | HIGH | MED | LOW |
|---|---:|---:|---:|
| 1. Boilerplate transitions | 0 | 2 | 2 |
| 2. AI-cliché lexicon | 0 | 1 | 1 |
| 3. Em-dash / punctuation / parallel cadence | 3 | 4 | 1 |
| 4. Symmetric paragraph shapes | 3 | 2 | 0 |
| 5. Tricolon abuse | 0 | 2 | 3 |
| 6. Hedging stacking | 0 | 0 | 0 |
| 7. "Not only X but also Y" | 0 | 0 | 0 |
| 8. Formulaic openers | 0 | 3 | 3 |
| 9. Hyphenation excess | 0 | 1 | 3 |
| 10. Sycophancy | 0 | 3 | 3 |

---

## Findings

### Category 3 — punctuation and repeated parallel cadence

| Line | Sev | Current text | Suggested |
|---:|---|---|---|
| paper-wide (~65×) | **HIGH** | "a band we choose rather than estimate" (46, 107, 1255); "an organising device, not an estimated model" (161); "illustrative rather than a controlled test" (865, 875); "suggestive rather than dispositive" (720); "indicative, not precise" (611); "evidence of a break, not a cardinal magnitude" (1501); "the paper's point, not a challenge to it" (1244) | The antithesis frame ("X, not Y" / "X rather than Y") runs ~65 times ≈ 6 per 1000 words, plus the title. Budget ~20; convert the rest to plain assertion. Densest clusters: 875–887 (4×), 1086–1101 (3×), 1225–1244 (3×), 1246–1266 (3×) |
| 489–509 | **HIGH** | 8 semicolons in one DiD-results paragraph | Split after "…Holm $p = 0.016$" (495); convert clause-joining semicolons at 493, 504, 508 to full stops |
| 420–443 | **HIGH** | 6 semicolons in the break-timing paragraph | Split at "Figure~\ref{fig:monthly} plots the monthly series" (432); demote three semicolons to periods |
| 618–656 | MED | 4 semicolons across a ~500-word unit-value paragraph | Split at "Two features cut against domestic transformation" (627) |
| 511–536 | MED | 4 semicolons in the "Three qualifications" paragraph | Convert two to full stops; parenthetical statistical semicolons at 520 are fine |
| 705–721 | MED | 4 semicolons in the m-sensitivity paragraph | Convert the two clause-joining semicolons (716, 720) to periods |
| paper-wide | MED | ~150 semicolons ≈ 14 per 1000 words (econ baseline 3–5) | Target ~50% reduction, mostly by sentence-splitting |
| 167–174 | LOW | 10 semicolons in the roadmap sentence | Discipline-conventional; leave or break the 11-clause sentence in two |

### Category 4 — symmetric paragraph shapes

| Line | Sev | Current text | Suggested |
|---:|---|---|---|
| 245–288, 855–917, 949–1001, 1086–1128 | **HIGH** | Four blocks of **exactly four** italic run-in-lede paragraphs (`\emph{(i) …}`…`\emph{(iv) …}`; `\emph{The state fund's disclosed pipeline…}`…; `\emph{Within the reorientation group.}`…; `\emph{Market access.}`…`\emph{The platform first.}`) — 19 run-in ledes total in near-identical 4-item blocks | Keep the device where the four items *are* the framework (245–288, 1086–1128); dissolve the ledes in §6 (855–917) and §9 (949–1001) into ordinary prose |
| 511, 761, 875, 1230, 1246, 1268 (+7 more) | **HIGH** | 13 paragraphs open by announcing a count then walking First/Second/Third to a closing summary clause ("Three qualifications keep us…"; "Three features of the data say more than the count"; "…for three reasons"; "Four limitations are central"; "Five measurement caveats bear on the estimates") | Dissolve the numbering in ≥ half — 627, 761, 953, 1159, 1230 read fine as continuous prose. 1246 and 1268 are **consecutive** count-announcing paragraphs; merge or reshape one |
| 50–54, 132–144, 158–161, 306–312, 838–853, 1199–1211, 1246–1252 | **HIGH** | Near-verbatim ×7: "…rules out capital-market institutions as the binding constraint; whether irreversibility independently binds cannot be settled here." | State the three-gate verdict in full **twice** (abstract + discussion); elsewhere replace with a cross-reference or one-clause variant. "the durable adjacent opportunities the shock reveals" recurs 5× (143, 311, 908, 1117, 1208) — cut to 2 |
| 192–199 ≡ 1132–1138 | MED | ~60 words on the Panama/Red Sea/Hormuz chokepoints duplicated **verbatim** in §2 and §11.2 | Delete one; §2 already forward-references §11 |
| 1193–1223 | MED | ~450-word discussion paragraph that re-narrates the abstract and the intro's gate paragraph claim-for-claim | Split at "The static value Kazakhstan misses" (1215); cut the first half to the claims not already made verbatim in §1 |

### Category 5 — tricolon abuse

| Line | Sev | Current text | Suggested |
|---:|---|---|---|
| 114–126 | MED | Four "X, Y, and Z" lists in one paragraph (deal types; three databases; three sectors; three confounds) | Render one as a colon-list, one as a parenthetical, or split the paragraph |
| 39, 86–87, 150–151 | MED | "A large, sector-specific rise in demand" / "a large, sector-specific, well-identified demand shock" / "a large, sector-specific tradeable-demand shock" — same adjective stack 3× in the first two pages | Vary two of the three |
| 869 | LOW | "\emph{A durable shock, the same institutions, a different outcome.}" | Three-part parallel fragment as a heading — the most conspicuously "written" lede. Consider "\emph{The vehicle shock drew capacity; the re-export shock did not.}" |
| 1106–1110 | LOW | Two stacked tricolons in adjacent sentences (offtake contracts / demand aggregation / stable rule; pilot-line infra / SEZ tenancy / co-financing) | Make one a two- or four-item list |
| 1079 | LOW | "…takes each in turn for Kazakhstan, then asks what its position…adds, and what its principal supplier could do." | Tricolon-of-clauses in a section preview (see Cat 8) |

### Category 8 — formulaic openers

| Line | Sev | Current text | Suggested |
|---:|---|---|---|
| 89 | MED | "This paper asks what Kazakhstan did with that signal. We proceed in three steps." | Redundant with 86–87. Delete the first sentence, keep "We proceed in three steps." |
| 838, 1076, 1194 | MED | "The framework of Section~\ref{sec:framework} attributes the null…" / "…is also a menu of levers." / "…gives a three-part answer." — identical stock cross-reference opener 3× | Vary two |
| 1079 | MED | "This section takes each in turn for Kazakhstan…" | Remove — the three subsection headings already do this |
| 167 | LOW | "The rest of the paper is organised as follows." | Conventional for JIE; leave |
| 146 | LOW | "\paragraph{Contribution.} The paper makes three contributions." | Conventional; leave |
| 42–43 | LOW | Abstract's "…we measure the demand shock, estimate what Kazakhstan retains, and ask whether it induced investment." | Standard; abstract correctly avoids "In this paper, we…". Leave |

### Category 10 — sycophancy / self-important framing

| Line | Sev | Current text | Suggested |
|---:|---|---|---|
| 496–497 | MED | "The outbound effect survives two **demanding** checks" | Delete "demanding" — "survives two further checks" |
| 771 | MED | "Our adjudication rule is **deliberately generous**: we would have coded…" | State the rule; let the referee judge its generosity |
| 146–148 | MED | "Its primary contribution is empirical: to our knowledge it is **the first**…" — two priority signals stacked | "To our knowledge this is the first host-economy analysis of…" |
| 393–394 | LOW | "a rise of roughly an order of magnitude and **the sharpest, cleanest part of the picture**" | "…a rise of roughly an order of magnitude." |
| 716–718 | LOW | "The qualitative conclusion is thus **robust to any margin**…" | "holds across the full wholesale-plus-freight range" |
| 1244 | LOW | "The contrast is the paper's point, not a challenge to it." | Reads pre-emptively defensive; the preceding sentences establish it. Consider deleting |

### Category 1 — boilerplate transitions (0 standard hits; two in-house formulas)

| Line | Sev | Current text | Suggested |
|---:|---|---|---|
| 100, 430, 438, 522, 531 (+3) | MED | "we (do not) read X as Y" caveat formula 8× | Epistemics are correct; vary the wording in 4 of 8 |
| 443, 481, 531, 1000, 1155, 1199 (+1) | MED | pseudo-cleft emphasis ("X is what Y" / "What X is, is Y") 7× | Convert half to direct predication |
| 121, 843, 973, 997 | LOW | "in any case" ×4 as a concessive connector | Drop two |
| 119, 478, 653 | LOW | "if anything" ×3 | Drop one |

### Category 2 — AI-cliché lexicon (0 standard hits)

| Line | Sev | Current text | Suggested |
|---:|---|---|---|
| 75, 159, 217, 394, 477, 641, 852, 886, 971, 990, 1251 | MED | clean/cleanly/cleaner/cleanest ×11 and sharp/sharply/sharper/sharpest ×11 — a two-adjective pool doing all the evaluative work | Substitute "well-identified", "uncontaminated", "decisive", "abrupt", "discontinuous" in about half |
| 519, 839 | LOW | "sits **squarely** inside the rule-matched null distribution"; "The market-access gate is **plainly** open" | Drop one intensifier |

### Category 9 — hyphenation excess

| Line | Sev | Current text | Suggested |
|---:|---|---|---|
| 1103–1115 | MED | ~12 compound modifiers in a ~180-word paragraph | Unpack four ("infrastructure for shared pilot lines and testing"; "a guarantee that is capped, time-limited and partial") |
| 114–126 | LOW | 7 compounds in one paragraph | Unpack one or two |
| 1143–1149 | LOW | 7 compounds in a 7-line paragraph | — |
| 1229–1240 | LOW | 6 compounds in one paragraph | — |

### Categories 6 and 7 — clean

- **Cat 6 (hedge stacking): 0.** No "might potentially" / "could possibly" / "may arguably".
  The paper hedges heavily but each hedge is single-layered and specifies *what* is uncertain
  — correct econ practice. Repetition of hedge formulas is captured under Cat 1.
- **Cat 7 ("not only X but also Y"): 0.** Two "not just" (252, 526), both genuine contrastive.

---

## Concentration — top 3 paragraphs

1. **¶ 869–887** ("A durable shock, the same institutions, a different outcome") — **6 findings**
   (2 HIGH + 2 MED + 2 LOW). Italic run-in lede that is itself a three-part parallel fragment;
   "for three reasons. First,…Second,…Third,…"; four "not / rather than" antitheses in 18 lines;
   a closing summary clause. The single most template-shaped paragraph. **Rewrite from scratch
   as continuous prose.**
2. **¶ 489–536** (DiD Results + "Three qualifications") — **6 findings** (2 HIGH + 3 MED + 1 LOW).
   8 semicolons then 4; "Three qualifications…First/Second/Third"; "we do not read" ×2; "is what
   speaks to / is what addresses" ×2; "two demanding checks". Split into four paragraphs and
   de-template.
3. **¶ 1246–1280** (Limitations + measurement caveats) — **5 findings** (2 HIGH + 2 MED + 1 LOW).
   Two *consecutive* count-announcing paragraphs; the seventh restatement of the three-gate
   verdict; three "rather than / not" antitheses. Merge the two enumerations or convert the
   second to prose.

Runners-up: ¶ 114–126 (4 tricolons + 7 compounds); ¶ 1193–1223 (450 words re-narrating the
abstract); ¶ 1103–1115 (12 compound modifiers + 2 stacked tricolons).

---

## Recommendation

**0.55 HIGH findings per 1000 words → strip the tells in place; do not rewrite sections.**

On the lexical categories the manuscript is genuinely clean — the manual pass did its job. But
the six HIGH findings are paper-wide habits a line-by-line edit will not catch. Work them as
four targeted sweeps rather than a front-to-back read:

1. **Antithesis sweep** — grep `rather than` and `, not ` (≈65 hits); convert ~40 to plain
   assertion. Biggest single win.
2. **Verdict de-duplication** — keep the three-gate statement at lines 50–54 and 1199–1211;
   compress the five other instances to cross-references. Delete the duplicated chokepoint
   passage at 1132–1138.
3. **Enumeration sweep** — dissolve the "announce N → First/Second/Third" frame in ≥ 6 of the
   13 paragraphs; un-italicise the ledes in §6 and §9 so the four-item block stops recurring.
4. **Semicolon halving** — target ¶¶ 420–443, 489–509, 511–536, 618–656, 705–721;
   sentence-splitting here also fixes the two 450–500-word paragraphs.

Then a short pass on the six Cat-10 items (delete "demanding", "deliberately generous",
"sharpest, cleanest") and the clean/sharp adjective pool. Estimated effort: one focused
editing session. No section requires reconstruction except ¶ 869–887.
