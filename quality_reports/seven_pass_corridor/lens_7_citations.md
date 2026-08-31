# Lens 7 — Citation Audit

**Manuscript:** `Manuscript/corridor.tex`
**Bibliography:** `Manuscript/corridor.bib`
**Reviewer:** Lens 7 of 7 (adversarial seven-pass review)
**Date:** 2026-08-28
**Method:** structural cross-check (every `\cite` key ↔ bib entry) + web verification of every bib entry against the published record + semantic check of the 8 load-bearing in-text citations against what the cited works actually establish.

Extends the 2026-08-28 `/verify-claims` pass (which only covered intro citations, removed a mis-cited `alfaro2017`, and renamed `juhasz2023` → `juhaszlanerodrik2024`) to the whole paper and to the entries added since (`dixitpindyck1994`, `rajanzingales1998`, `khanna1997`).

---

## 1. Structural check

### 1.1 `\cite` keys in `corridor.tex` — all resolve

| Key | Used in | Resolves? |
|---|---|---|
| `chupilkin2026roundabout` | §1 | ✅ |
| `chupilkin2025intermediated` | §1 | ✅ |
| `dixitpindyck1994` | §1 (Contribution), §3 (eq. framework, ×2) | ✅ |
| `khanna1997` | §1, §3 (institutional gate), §7 (×1 as `\citet`) | ✅ |
| `rajanzingales1998` | §1, §3, §7 | ✅ |
| `juhasz2018temporary` | §1 | ✅ |
| `bloom2016trade` | §1 | ✅ |
| `juhaszlanerodrik2024` | §1 | ✅ |

**No dangling keys.** Every `\cite`/`\citep`/`\citet` in the manuscript points to a real entry in `corridor.bib`.

### 1.2 Orphan bib entries — 4 present but never cited

`corridor.bib` has 12 entries; only 8 are cited. **Uncited:**

- `koopman2014tracing` — Koopman, Wang & Wei, "Tracing value-added and double counting in gross exports," AER 2014.
- `johnson2012accounting` — Johnson & Noguera, "Accounting for intermediates," JIE 2012.
- `arvis2010landlocked` — Arvis, Raballand & Marteau, *The Cost of Being Landlocked*, World Bank 2010.
- `fisman2004missing` — Fisman & Wei, "Tax rates and tax evasion: … 'missing imports' in China," JPE 2004.

Under `\bibliographystyle{plainnat}` uncited entries are **silently dropped from the References list** — they will not appear in the compiled PDF at all. This is not cosmetic here: the four orphans are exactly the works the text's method and interpretation lean on (see L7-1). This looks like citations lost in editing, not deliberate.

---

## 2. Per-entry well-formedness (all 12 verified against the published record)

| Key | Verdict | Notes |
|---|---|---|
| `chupilkin2026roundabout` | ✅ correct | *European Economic Review* **187** (2026), art. 105340; RePEc `v187y2026i...s001429212600084x`. DOI `10.1016/j.euroecorev.2026.105340` plausible/consistent. Authors Chupilkin, Javorcik, Plekhanov — correct. WP lineage (EBRD WP 276, 2023; CEPR DP 20097) correctly noted. **Published version cited, not the WP.** |
| `chupilkin2025intermediated` | ✅ correct | *AEA Papers & Proceedings* **115** (2025) 568–572, DOI `10.1257/pandp.20251083`. 4 authors incl. Peeva — correct. |
| `koopman2014tracing` | ✅ well-formed | AER **104**(2) 459–494, DOI `10.1257/aer.104.2.459`. All fields present. (Uncited — see §1.2.) |
| `johnson2012accounting` | ⚠️ minor | JIE **86**(2) 224–236 — correct. **No DOI field** (`10.1016/j.jinteco.2011.10.003`). All required fields present. (Uncited.) |
| `bloom2016trade` | ✅ correct | *Review of Economic Studies* **83**(1) 87–117 (2016) — matches exactly. |
| `juhasz2018temporary` | ✅ correct | AER **108**(11) 3339–3376 (Nov 2018), DOI `10.1257/aer.20151730` — matches exactly. Name `Juh{\'a}sz` correct. |
| `juhaszlanerodrik2024` | ✅ correct | *Annual Review of Economics* **16** (2024) 213–242, DOI `10.1146/annurev-economics-081023-024638` — matches. NBER WP 31538 (2023) correctly noted; **ARE (published) version is the one cited.** |
| `khanna1997` | ✅ correct | *Harvard Business Review* **75**(4), Jul–Aug 1997, pp. 41–51 — matches the standard citation. |
| `dixitpindyck1994` | ✅ correct | *Investment under Uncertainty*, Princeton University Press, 1994. Book entry, all required fields. |
| `rajanzingales1998` | ⚠️ minor | AER **88**(3) 559–586 (June 1998) — matches exactly. No DOI (`10.3386/w5758` is the NBER WP; AER has no DOI for this vintage — acceptable to omit). |
| `arvis2010landlocked` | ✅ well-formed | World Bank, *Directions in Development – Trade*, 2010 — correct. (Uncited.) |
| `fisman2004missing` | ✅ correct | JPE **112**(2), Apr 2004, 471–496, DOI `10.1086/381476` — matches exactly. (Uncited — see L7-1.) |

**Nothing fabricated.** No implausible volume/issue/year/page combinations; every entry corresponds to a real, correctly-described publication.

---

## 3. Semantic check — do the in-text claims match the cited works?

### 3.1 `chupilkin2026roundabout` / `chupilkin2025intermediated` (§1) — ✅ direction correct

In-text: *"[they] document the pattern: a sharp fall in EU exports to Russia alongside a matching rise in EU exports to Armenia, Kazakhstan and the Kyrgyz Republic, with product-level and mirror-statistics evidence of onward movement to Russia; \citet{chupilkin2025intermediated} quantify the substitution."*

The Eurasian Roundabout paper documents precisely this: the fall in EU→Russia exports, the offsetting rise in EU exports to Armenia/Kazakhstan/Kyrgyz Republic, product-level and mirror-statistics ("goods nominally shipped to neighbours via Russia that fail to arrive") evidence, and quantifies that the two strategies offset ≈1/3 of the sanction-induced decline in EU exports to Russia in 2022–23. The P&P paper reports substitution ratios >50% for many sanctioned products (and <10% of total sanctions impact offset). "Quantify the substitution" is a fair description. **Correct use, correct direction.**

*Framing note (not a citation error):* both cited works frame this explicitly as **sanctions circumvention**; the manuscript deliberately neutralises to "redirection / onward movement." That is the author's stated positive-stance choice, and is defensible, but a referee may ask the paper to acknowledge that its own key sources use the stronger framing.

### 3.2 `dixitpindyck1994` (§1, §3) — ✅ correct

Invoked for the option value of waiting `Ω(σ,ρ)` — "increasing in the uncertainty σ … and decreasing in ρ" — and for the irreversibility/sunk-cost logic in eq. (1). This is the canonical and correct attribution for real-options / investment-under-irreversibility. No misuse.

### 3.3 `rajanzingales1998` (§1, §3, §7) — ⚠️ mild scope stretch (MINOR, L7-2)

In-text (§3 institutional gate): *"Where the capital market lacks growth equity and a functioning exit, projects that clear the irreversibility gate are not funded; the capital that does move is captive … allocated by criteria other than R \citep{khanna1997,rajanzingales1998}."*

Rajan–Zingales (1998) establishes that industries more dependent on external finance grow disproportionately faster in countries with **deeper financial markets** — a cross-country, cross-**industry growth** result. The manuscript stretches it to project-level selection, growth-equity availability, and PE **exit**. Directionally consistent (financial depth → real activity), and RZ is a standard shorthand for "the finance-dependence channel," so this is within normal citation practice — but it is not literally what RZ tests. Pairing it with `khanna1997` (which *is* about missing capital-market intermediaries in emerging economies) carries the load; RZ is the weaker of the two for this exact claim.

### 3.4 `khanna1997` (§1, §3, §7) — ✅ correct attribution

Khanna & Palepu (1997 HBR) is the origin of the "institutional voids" argument — that emerging markets lack the market intermediaries (including functioning capital markets) that advanced economies take for granted, which is why diversified business groups persist. The manuscript's use — "This is the institutional-voids configuration of \citet{khanna1997}" — is the correct primary citation. (The *term* "institutional voids" is most associated with the authors' later work / 2010 book *Winning in Emerging Markets*; citing the 1997 HBR piece for the concept is standard and accepted.)

### 3.5 `juhasz2018temporary`, `bloom2016trade`, `juhaszlanerodrik2024` (§1) — ✅ no directional misuse

Cited together as *"informative for the broader question of when trade shocks induce a domestic supply response and when they do not."* All three are correctly-described members of that literature:
- Juhász (2018): temporary trade protection → mechanised-spinning capacity adoption (a positive supply response, fading in the very long run).
- Bloom, Draca & Van Reenen (2016): Chinese import competition → higher patenting/IT/TFP in exposed European firms (a positive response).
- Juhász, Lane & Rodrik (2024): review of the modern industrial-policy evidence.

None is cited for a specific directional claim that it contradicts; the grouping is a literature signpost and is accurate.

---

## 4. Working-paper vs published — clean

No citation points to a working-paper version where a published one exists. `chupilkin2026roundabout` cites the *EER* 2026 article (WP lineage noted); `juhaszlanerodrik2024` cites the *Annual Review* article (NBER WP noted). Good practice throughout.

---

## 5. Contemporary / competing work (2023–2026)

The contribution claim — *"the first host-economy incidence analysis of the post-2022 trade rerouting … extending the existing literature … to what the intermediary retains"* — is **defensible**. Targeted searches surface no economics paper that measures the transit country's *retained value added* from the rerouting; existing work (the Chupilkin papers; Egorov, Korovkin, Makarin & Nigmatulina, "Trade Sanctions," CEPR DP 20601, 2025; Ghironi, Kim & Ozhan, NBER WP 32188, 2024; Global Sanctions Data Base Release 4, Yalcin et al., *The World Economy* 2025) is on the Russia side or on aggregate sanction effectiveness, not the intermediary's incidence. None displaces the contribution.

**MINOR (L7-4):** the paper engages only the Chupilkin pair from the 2023–2026 sanctions-trade literature. Adding a sentence situating it against Egorov et al. (2025) and the Global Sanctions Data Base R4 would strengthen the positioning and pre-empt a "you've missed the recent literature" referee reflex. Not required for correctness.

---

## 6. Summary

- **Structural integrity of citations that are present: clean.** No dangling keys, no fabrication, every one of the 8 in-text citations verified as correctly referenced *and* correctly used, direction included. This is a well-sourced paper.
- **The one real problem is the reverse:** four load-bearing works sit in `corridor.bib` uncited (`fisman2004missing`, `koopman2014tracing`, `johnson2012accounting`, `arvis2010landlocked`), so the under-invoicing interpretation (§5.1, §7), the value-added-accounting method (§1, §4.2) and the transit-cost/landlocked framing (§2, §9) currently rest on no citation at all, and `plainnat` will drop these entries from the References silently.
- Minor: one missing DOI, one mild scope-stretch on `rajanzingales1998`, and a thin engagement with 2023–2026 sanctions-trade work.

---

```
findings:
  - id: L7-1
    severity: MAJOR
    location: "§1 (¶2, ¶'Contribution' iii), §4.2 'Input–output propagation', §5.1 'The retained trade margin', §7 ¶'The institutional gate explains the residual' / bib keys fisman2004missing, koopman2014tracing, johnson2012accounting, arvis2010landlocked"
    issue: "Four bibliography entries are present in corridor.bib but never \\cite'd, and they are precisely the works the text's method and interpretation depend on. §5.1 interprets the unit-value wedge as 'consistent with ... under-invoicing on the outbound leg' and §7 repeats it, with no citation — the canonical missing-imports/tariff-evasion reference (Fisman & Wei 2004) is sitting uncited in the .bib. §1 invokes 'global-value-chain entry' and §4.2 builds a domestic-value-added / Leontief propagation, with no citation to the value-added-accounting literature (Koopman-Wang-Wei 2014, Johnson-Noguera 2012) that is likewise in the .bib. §2 ('land bridge') and §9 (logistics 'binding constraint') never cite Arvis et al. 2010. Because the bibliography style is plainnat, these entries are silently omitted from the compiled References, so the reader sees load-bearing claims with zero support."
    evidence: "In-text: 'This is consistent with heterogeneous within-HS6 product mix and with under-invoicing on the outbound leg' (§5.1) — no cite. 'combines public trade data, a national input--output table ... into a replicable measure of what a transit economy captures' (§1) — no cite to VA-accounting method. corridor.bib lines 27–46 (koopman2014tracing, johnson2012accounting), 108–126 (arvis2010landlocked, fisman2004missing) exist but grep of corridor.tex for each key returns nothing. Fisman & Wei (2004), JPE 112(2):471–496, https://www.journals.uchicago.edu/doi/abs/10.1086/381476 is the standard evasion-via-under-reported-trade reference. Koopman, Wang & Wei (2014), AER 104(2):459–494, https://www.aeaweb.org/articles?id=10.1257/aer.104.2.459 and Johnson & Noguera (2012), JIE 86(2):224–236 are the standard trade-in-value-added references."
    change_my_mind: "Show me the citations actually appearing in corridor.tex (a \\citep at the under-invoicing sentence and at the value-added-accounting method), or a deliberate decision to drop these four entries from the .bib. If the entries are removed and the claims are genuinely common-knowledge enough to stand uncited, downgrade to MINOR — but the under-invoicing interpretation in particular is an empirical inference that a referee will expect anchored to Fisman-Wei."
  - id: L7-2
    severity: MINOR
    location: "§3 ¶'(iv) The institutional gate', §7 ¶'The institutional gate explains the residual' / bib key rajanzingales1998"
    issue: "Rajan & Zingales (1998) is cited for project-level financing selection, growth-equity availability, and PE exit ('the capital market lacks growth equity and a functioning exit, projects that clear the irreversibility gate are not funded'). RZ actually establishes a cross-country, cross-industry growth result: externally-finance-dependent industries grow faster where financial markets are deeper. Directionally consistent and a standard shorthand for the finance-dependence channel, but it is not literally what the paper is claiming RZ shows; khanna1997 carries this claim better."
    evidence: "In-text §3(iv): 'Where the capital market lacks growth equity and a functioning exit ... allocated by criteria other than R \\citep{khanna1997,rajanzingales1998}.' RZ 1998, AER 88(3):559–586 (https://econpapers.repec.org/RePEc:aea:aecrev:v:88:y:1998:i:3:p:559-86) tests industry growth vs. financial development, not project selection or exit markets."
    change_my_mind: "If the intended reading is just 'financial depth matters for real investment outcomes' as a broad channel citation, this is acceptable practice and can be left as-is; flag only so the authors can consider a more exact cite (e.g. on PE exit / growth equity in emerging markets) alongside RZ."
  - id: L7-3
    severity: MINOR
    location: "bib key johnson2012accounting (also rajanzingales1998)"
    issue: "johnson2012accounting has no doi field (10.1016/j.jinteco.2011.10.003). rajanzingales1998 has no DOI (acceptable — no crossref DOI for that AER vintage). All required bibliographic fields are otherwise present in every entry."
    evidence: "corridor.bib lines 38–46: entry has author/title/journal/year/volume/number/pages but no doi=, unlike its siblings koopman2014tracing / fisman2004missing which do."
    change_my_mind: "Add the DOI, or accept that plainnat does not render DOIs anyway so it is immaterial for this submission."
  - id: L7-4
    severity: MINOR
    location: "§1 ¶2 and ¶'Contribution' (ii)"
    issue: "The paper engages only the Chupilkin pair from the 2023–2026 sanctions-trade literature. Recent adjacent work is not cited: Egorov, Korovkin, Makarin & Nigmatulina, 'Trade Sanctions' (CEPR DP 20601, 2025); Global Sanctions Data Base Release 4 (Yalcin et al., The World Economy, 2025); Ghironi, Kim & Ozhan, 'International Trade and Macroeconomic Dynamics with Sanctions' (NBER WP 32188, 2024). None displaces the 'first host-economy incidence analysis' claim — no paper found measures the intermediary's retained value added — but a one-sentence situating would pre-empt a 'missed the recent literature' referee reflex."
    evidence: "Searches for post-2022 third-country / trade-diversion sanctions work return these as the salient recent papers; corridor.tex cites none of them. The contribution claim itself ('the first host-economy incidence analysis of the post-2022 trade rerouting') is supported by the absence of a competing value-capture paper in the search results."
    change_my_mind: "If the authors judge these too far from the paper's question (they are Russia-side / aggregate-effectiveness, not intermediary incidence), a single footnote acknowledging them is enough; no substantive engagement required."
scorecard:
  lens: "7. Citations"
  critical: 0
  major: 1
  minor: 3
  score_out_of_10: 7
```
