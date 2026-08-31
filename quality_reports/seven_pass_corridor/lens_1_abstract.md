# Lens 1 — Abstract Audit

**Manuscript:** `Manuscript/corridor.tex` ("Corridor, Not Factory", preliminary draft, Aug 2026)
**Scope:** the abstract only (lines 35–69), cross-checked against §2–§10 and `quality_reports/reproducibility_audit_corridor.md`.

---

## Rubric scorecard

| Criterion | Verdict |
|---|---|
| First sentence states the research question | **No** — opens on a background premise; RQ arrives in sentence 3 |
| Names method / data / identification | **Partial** — names HS6 Comtrade, structural-break stats, I–O propagation, deal databases; omits the identification that carries the causal claim (placebo basket, Armenia/Kyrgyzstan neighbours, political-calendar non-coincidence) |
| Quantifies the headline result | **Yes** — tenfold, ~tripled, sup-F 424/329, 8% vs 76%, 7–8 deals/yr, zero surge-basket transactions |
| States the contribution in one sentence | **No** — no explicit novelty sentence; the §1 "first host-economy incidence analysis" + unifying-framework claims never surface |
| Every abstract number/claim matches the body | **Mostly** — see L1-1 (five databases), L1-3/4/5/7 (qualifiers dropped) |
| Self-contained (no undefined jargon / dangling acronyms) | **Mostly** — bare `HS6` and `sup-F` unglossed; framework gates are glossed inline (good) |
| Length / density appropriate for general-interest econ | **No** — ~360–370 words; several 50–60-word run-on sentences |

---

## Findings

### L1-1 (MAJOR) — "assembled from five commercial databases" overstates the executed evidence base

The abstract (sentence 6) attributes all three deal-side findings — the 7–8/year rate, "2022 is the weakest year", and "not a single transaction … in the specific product lines" — to "deal-level data assembled from **five** commercial databases". The body says only three are actually analysed. §3: "The core extract combines Capital IQ, PitchBook and Preqin (n≈500) … As a reproducibility and robustness step we **reconstruct** the same universe from FactSet and Dealroom". Table 2 shows `---` in the FactSet and Dealroom columns; its footnote reads "FactSet and Dealroom columns pending (Appendix)". §6: "FactSet and Dealroom columns pending." Appendix A: both entries end "*[To run.]*". §10 Limitations: "The FactSet and Dealroom columns of Table 2 are pending." The reproducibility audit confirms: "The FactSet and Dealroom columns of Table 2 are marked pending in the manuscript and are not audited."

So the abstract claims a five-source foundation for numbers that rest on three. If the extracts are still un-run at submission this escalates toward CRITICAL.

- **evidence:** abstract: "in deal-level data assembled from five commercial databases, transactions in manufacturing of tradeables, transport and logistics run at the same rate after 2022 as before (7–8 per year)". Body (§6): "FactSet and Dealroom columns pending." Body (§10): "The FactSet and Dealroom columns of Table~\ref{tab:dealsource} are pending."
- **change_my_mind:** run the FactSet + Dealroom extracts and populate Table 2 (as the README "before submission" checklist requires), **or** soften the abstract to "three commercial deal databases (Capital IQ, PitchBook, Preqin), cross-validated against two further sources".

### L1-2 (MAJOR) — abstract length and sentence density exceed general-interest norms

The abstract runs ~360–370 words. AER caps the abstract at 150 words; QJE/JPE norms sit around 150–220. It is more than double the ceiling for the class of journal the framing targets. Density compounds this: sentence 6 is a ~62-word run-on chaining three findings across commas and a colon; sentences 7 and 8 are each ~52 words. The abstract tries to carry the full three-gate framework, both within-country tests, the durable/transitory contrast, *and* the external-validity gate — content that belongs in the introduction.

- **evidence:** abstract sentence 6: "And there is no investment response: in deal-level data assembled from five commercial databases, transactions in manufacturing of tradeables, transport and logistics run at the same rate after 2022 as before (7–8 per year), 2022 is the weakest year in the series, and there is not a single transaction over 2015--2025 in the specific product lines the reorientation flows through." (one sentence)
- **change_my_mind:** cut to ~200 words — keep shock magnitude, the 8%-vs-76% value-capture result, the null investment response, and the one-line "corridor, not factory" interpretation; move the three-gate mechanism and the within-country tests to the introduction.

### L1-3 (MINOR) — "re-exports … at a lower unit value than it imports them" drops the "median" qualifier

Sentence 5 states the unit-value result as a general fact. §5.1 is careful to bound it: "the median ratio of the re-export unit value to the import unit value is 0.75 (inter-quartile range 0.30–1.56)" and "in the median product, below". An IQR reaching 1.56 means a large minority of lines re-export *above* import unit value. The abstract's unqualified form is stronger than the body.

- **evidence:** abstract: "Kazakhstan re-exports these goods at a *lower* unit value than it imports them". Body §5.1: "the median ratio … is 0.75 (inter-quartile range 0.30--1.56)".
- **change_my_mind:** insert "in the median line" (mirrors the body and the §1 phrasing).

### L1-4 (MINOR) — no explicit contribution / novelty sentence

The rubric asks for a one-sentence contribution. The abstract has none. §1's "Contribution" paragraph stakes three specific claims — a framework unifying irreversibility and institutional-void explanations, "the first host-economy incidence analysis of the post-2022 trade rerouting", and a methodological combination of trade + I–O + multi-source deal data. None reaches the abstract; the closest line, "Kazakhstan operates as a corridor, not a factory", is a finding restatement. A general-interest editor screening the abstract cannot tell this from a descriptive rerouting note.

- **evidence:** abstract closes "the trade statistics move by an order of magnitude, the domestic economy barely registers it." §1: "It provides the first host-economy incidence analysis of the post-2022 trade rerouting".
- **change_my_mind:** add one sentence naming the novelty (first host-economy incidence analysis + the market-access gate as the new element in the framework).

### L1-5 (MINOR) — "national input–output table" mischaracterises the source

Sentence 5 says the margin is propagated "through the national input–output table". §3 and §5.2 use the **OECD Inter-Country Input–Output (ICIO)** tables, Kazakhstan block. §10 lists "the OECD ICIO's relatively high domestic-content shares for Kazakhstan" as a limitation, and the README flags "KZ national I-O table (68 products) as a robustness check on the ICIO multipliers" — i.e. the actual national table has *not* been used. Calling the ICIO "the national input–output table" is inaccurate and papers over a stated limitation.

- **evidence:** abstract: "propagating the retained trade margin through the national input--output table". Body §3: "OECD Inter-Country Input--Output tables, 2023 edition, Kazakhstan block". Body §10: "a single input--output vintage (2019) and the OECD ICIO's relatively high domestic-content shares".
- **change_my_mind:** "through Kazakhstan's block of the OECD input–output table".

### L1-6 (MINOR) — "state investment corporation … also did not invest in the reorientation" is stronger than §7

The abstract says the state fund "also did not invest in the reorientation". §7 and Table 3 show it financed 1 surge-basket-sector project ($4m) and 2 corridor-logistics projects ($117m) out of 50 — §7's own wording is "bypasses the reorientation **almost entirely**". The surge-basket entry is a flagged misclassification (Table 3 footnote a), but the $117m in corridor logistics is real. "Did not invest" is a rounding-to-zero of a small-but-nonzero figure.

- **evidence:** abstract: "which faces no financing constraint, also did not invest in the reorientation". Body §7: "of the state fund's 50 industrial and logistics projects financed in 2022--2025, one is in a surge-basket sector and two are in corridor logistics".
- **change_my_mind:** "invested almost nothing in the reorientation" (matches §7).

### L1-7 (MINOR) — causal attribution with no hint of the identification behind it

The abstract attributes the Q2-2022 break to the trade disruption and never signals that the obvious confound (the "New Kazakhstan" reform programme, §2) was addressed. The rule-outs — the civilian placebo basket, the Armenia/Kyrgyzstan neighbour breaks, non-coincidence with the June/November 2022 political calendar — are entirely absent from the abstract. For an abstract that makes a causal claim, one clause on identification is standard.

- **evidence:** abstract: "both breaking in the second quarter of 2022 (sup-$F$ of 424 and 329)" — nothing further. Body §4.3: "Armenia and the Kyrgyz Republic show the identical break with no domestic reform … and a civilian placebo basket shows nothing."
- **change_my_mind:** add "— absent from a civilian control basket and mirrored in Armenia and the Kyrgyz Republic" to the break sentence.

### L1-8 (MINOR) — miscellaneous slack: "roughly tripled", bare jargon, premise stated as fact

Three small items, none load-bearing on its own:
1. "imports … roughly tripled" sits at the top of the supported range: Table 1 gives 2022/baseline = 2.3×, the §4.2 event-study plateau is "about +1" log point ≈ 2.7×, and only the 2023 peak (584/182) reaches 3.2×. "Roughly 2.5–3×" would be safer. (low confidence)
2. Bare `HS6` and `sup-$F$` are unglossed in the abstract; the body at least expands "HS 6-digit". For a general-interest abstract, `HS6` should read "6-digit product lines".
3. "does anyone build for a shock this transitory and policy-contingent?" states transitoriness as a given. §7 ("The transitory condition is observed, not assumed") treats it as an empirical finding the paper has to earn. The abstract could signal this ("a shock that proves transitory and policy-contingent").

- **evidence:** abstract: "its imports from the EU and China roughly tripled"; Table 1 inbound row: 196 (2021) → 413 (2022) → 584 (2023). Abstract: "a shock this transitory and policy-contingent"; §7 heading logic: "observed, not assumed".
- **change_my_mind:** n/a (MINOR housekeeping).

---

## What the abstract gets right

- Headline magnitudes all reproduce within tolerance (audit: sup-F 423.6/329.3, wedge median 0.748, VA 8% midpoint, 76.4% mfg, 7.29/7.5 deals/yr).
- The three-gate framework terms are each glossed inline — no undefined framework jargon.
- The "corridor, not factory" interpretation is falsifiable and directly supported by §5.3–5.4 and §6; the neutral framing does not make it evasive.
- Structure (premise → shock → retention → null → mechanism → interpretation) is logical; the problem is length, not order.

---

```
findings:
  - id: L1-1
    severity: MAJOR
    location: "Abstract, sentence 6"
    issue: "Abstract says the deal evidence is 'assembled from five commercial databases'; the body analyses three (Capital IQ, PitchBook, Preqin) and marks FactSet and Dealroom as pending / '[To run.]'. The 7-8/year rate, 'weakest year', and zero-surge-basket claims all rest on three databases, not five."
    evidence: "Abstract: 'in deal-level data assembled from five commercial databases, transactions in manufacturing of tradeables, transport and logistics run at the same rate after 2022 as before (7--8 per year)'. Body sec 6: 'FactSet and Dealroom columns pending.' Body sec 10: 'The FactSet and Dealroom columns of Table 2 are pending.' Appendix A: FactSet and Dealroom entries both end '[To run.]'. Reproducibility audit: 'marked pending in the manuscript and are not audited.'"
    change_my_mind: "Run the FactSet + Dealroom extracts and populate Table 2, or reword to 'three commercial deal databases, cross-validated against two further sources.'"
  - id: L1-2
    severity: MAJOR
    location: "Abstract, sentences 6-9 (whole abstract ~360-370 words)"
    issue: "Abstract is more than double the general-interest ceiling (AER 150 words; QJE/JPE ~150-220) and contains three ~52-62 word run-on sentences. It carries the full three-gate framework, both within-country tests, the durable/transitory contrast, and the external-validity gate — introduction material."
    evidence: "Sentence 6 is a single ~62-word sentence: 'And there is no investment response: in deal-level data assembled from five commercial databases, transactions ... run at the same rate after 2022 as before (7--8 per year), 2022 is the weakest year in the series, and there is not a single transaction over 2015--2025 in the specific product lines the reorientation flows through.' Sentences 7 and 8 are each ~52 words."
    change_my_mind: "Cut to ~200 words: keep shock magnitude, the 8%-vs-76% capture result, the null response, and the one-line interpretation; move the mechanism and within-country tests to the introduction."
  - id: L1-3
    severity: MINOR
    location: "Abstract, sentence 5"
    issue: "'re-exports these goods at a lower unit value than it imports them' drops the 'median line' qualifier the body carries; a large minority of lines are re-exported above import unit value."
    evidence: "Abstract: 'Kazakhstan re-exports these goods at a lower unit value than it imports them'. Body sec 5.1: 'the median ratio of the re-export unit value to the import unit value is 0.75 (inter-quartile range 0.30--1.56)' and 'in the median product, below'."
    change_my_mind: "Insert 'in the median line'."
  - id: L1-4
    severity: MINOR
    location: "Abstract, sentence 10 (and absent throughout)"
    issue: "No explicit one-sentence contribution/novelty claim. The three contributions stated in the sec 1 'Contribution' paragraph (unifying framework with a new market-access gate; first host-economy incidence analysis; methodological combination) never reach the abstract."
    evidence: "Abstract closes on a finding restatement: 'the trade statistics move by an order of magnitude, the domestic economy barely registers it.' Body sec 1: 'It provides the first host-economy incidence analysis of the post-2022 trade rerouting'."
    change_my_mind: "Add one sentence naming the contribution."
  - id: L1-5
    severity: MINOR
    location: "Abstract, sentence 5"
    issue: "'the national input--output table' mischaracterises the source, which is the OECD ICIO (inter-country) Kazakhstan block; the actual national I-O table is flagged as unused future robustness work."
    evidence: "Abstract: 'propagating the retained trade margin through the national input--output table'. Body sec 3: 'OECD Inter-Country Input--Output tables, 2023 edition, Kazakhstan block'. Body sec 10 lists 'the OECD ICIO's relatively high domestic-content shares for Kazakhstan' as a limitation."
    change_my_mind: "Reword to 'Kazakhstan's block of the OECD input--output table'."
  - id: L1-6
    severity: MINOR
    location: "Abstract, sentence 8"
    issue: "'also did not invest in the reorientation' is stronger than the body, which reports 1 surge-basket + 2 corridor-logistics projects ($121m) out of 50 and phrases it as 'bypasses the reorientation almost entirely'."
    evidence: "Abstract: 'which faces no financing constraint, also did not invest in the reorientation'. Body sec 7: 'of the state fund's 50 industrial and logistics projects financed in 2022--2025, one is in a surge-basket sector and two are in corridor logistics'."
    change_my_mind: "Reword to 'invested almost nothing in the reorientation'."
  - id: L1-7
    severity: MINOR
    location: "Abstract, sentence 4"
    issue: "Causal attribution of the Q2-2022 break with no mention of the identification that rules out the 'New Kazakhstan' reform confound (civilian placebo basket, Armenia/Kyrgyzstan neighbour breaks, political-calendar non-coincidence)."
    evidence: "Abstract: 'both breaking in the second quarter of 2022 (sup-F of 424 and 329)'. Body sec 4.3: 'Armenia and the Kyrgyz Republic show the identical break with no domestic reform to which it could be attributed, and a civilian placebo basket shows nothing.'"
    change_my_mind: "Append '— absent from a civilian control basket and mirrored in Armenia and the Kyrgyz Republic'."
  - id: L1-8
    severity: MINOR
    location: "Abstract, sentences 3, 4, 7"
    issue: "Housekeeping: (a) 'roughly tripled' is at the top of the supported range (break-year 2.3x; event-study plateau ~2.7x; only the 2023 peak is 3.2x); (b) bare 'HS6' and 'sup-F' unglossed for a general-interest abstract; (c) 'a shock this transitory and policy-contingent' states as premise what sec 7 defends as an empirical finding ('observed, not assumed')."
    evidence: "Abstract: 'its imports from the EU and China roughly tripled'. Table 1 inbound row: 196 (2021) -> 413 (2022) -> 584 (2023); sec 4.2 event study plateau 'at about +1' log point. Abstract: 'does anyone build for a shock this transitory and policy-contingent?'; sec 7: 'The transitory condition is observed, not assumed.'"
    change_my_mind: "n/a — minor wording."
scorecard:
  lens: "1. Abstract"
  critical: 0
  major: 2
  minor: 6
  score_out_of_10: 6
```
