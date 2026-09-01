# Lens 7 — Citation Audit — ROUND 3

**Manuscript:** `Manuscript/corridor.tex` (982 lines)
**Bib:** `Manuscript/corridor.bib` (14 entries)
**Prior:** `_SYNTHESIS_round2.md` (Lens 7 scored 8/10; open items M3 de-Souza year, M16 Fisman fit, M18 missing circumvention lit / Vietnam-Mexico cite)
**Method:** manual structural pass + web verification (`/validate-bib` not available as an invokable skill in this thread; equivalent checks done by hand).

---

## 1. Structural check of `corridor.bib`

### 1a. Every `\cite` key resolves

14 distinct keys are cited in the text; all 14 resolve to a bib entry. Full list with call sites:

| Key | Call sites | In bib? |
|---|---|---|
| chupilkin2026roundabout | L83, L309 | yes |
| chupilkin2025intermediated | L86 | yes |
| desouza2024diffusion | L134, L246, L919 | yes |
| juhasz2018temporary | L148 | yes |
| bloom2016trade | L148 | yes |
| juhaszlanerodrik2024 | L148, L806 | yes |
| gopinathneiman2014 | L148, L244 | yes |
| dixitpindyck1994 | L150, L218 | yes |
| khanna1997 | L151, L261, L757 | yes |
| rajanzingales1998 | L151, L261, L757 | yes |
| arvis2010landlocked | L175, L837 | yes |
| fisman2004missing | L534, L577 | yes |
| koopman2014tracing | L553 | yes |
| johnson2012accounting | L553 | yes |

### 1b. Unused entries

**None.** The bib contains exactly the 14 entries that are cited. No leftover keys. (The round-2 header comment records that the mis-cited Alfaro–Chari–Kanczuk entry was removed — confirmed absent.)

### 1c. Required fields

All entries carry the fields their type requires.

- `@article` entries: author, title, journal, year, volume all present. `number` present where the journal uses issues; correctly omitted for chupilkin2026roundabout (EER "issue C" = article-number series), chupilkin2025intermediated (P&P), juhaszlanerodrik2024 (Annual Review numbers by volume). Pages present on all.
- `@book`: dixitpindyck1994, arvis2010landlocked — author, title, publisher, address, year all present.
- `@techreport`: desouza2024diffusion — author, title, institution, type, number, year present.
- Missing DOIs on johnson2012accounting, bloom2016trade, khanna1997, dixitpindyck1994, rajanzingales1998, arvis2010landlocked — all **optional**, not a defect. The DOIs that are present are all well-formed (`10.xxxx/...`).

### 1d. Verified against the published record (web)

| Key | Field check | Result |
|---|---|---|
| chupilkin2026roundabout | EER, 2026, **vol 187**, art **105340**, DOI 10.1016/j.euroecorev.2026.105340, 3 authors (Chupilkin, Javorcik, Plekhanov) | **exact match** (RePEc `v187y2026ics001429212600084x`) |
| chupilkin2025intermediated | AEA P&P, 2025, **vol 115**, **pp 568–572**, DOI 10.1257/pandp.20251083, 4 authors (adds Peeva) | **exact match** (RePEc `v115y2025p568-72`) |
| desouza2024diffusion | FRB Chicago WP **2024-20**, **2024** (Sept), DOI 10.21033/wp-2024-20, 3 authors | number/year/DOI **match**; see L7-2 on the `note` |
| gopinathneiman2014 | AER, 2014, **104(3):793–831**, DOI 10.1257/aer.104.3.793 | **exact match** |
| juhaszlanerodrik2024 | Annu. Rev. Econ., 2024, **vol 16**, **pp 213–242**, DOI 10.1146/annurev-economics-081023-024638 | **exact match** (RePEc `v16y2024p213-242`) |
| koopman2014tracing | AER, 2014, 104(2):459–494 | matches known record |
| rajanzingales1998 | AER, 1998, 88(3):559–586 | matches known record |
| juhasz2018temporary | AER, 2018, 108(11):3339–3376, DOI 10.1257/aer.20151730 | matches known record |
| khanna1997 | HBR, 1997, 75(4):41–51 (Khanna & Palepu) | matches known record; see L7-6 |
| dixitpindyck1994 | Princeton UP, 1994 | matches known record |

**Structural verdict: clean bill.** No undefined keys, no orphan entries, no missing required fields, DOIs well-formed and (where checked) correct.

---

## 2. `arvis2010landlocked` — was it cited in the round-2 revision?

**Yes — resolved.** The round-1/round-2 plan flagged it as "still uncited (in bib but unused)". Round 3 now cites it twice:

- **L175** (§Setting): "as a doubly landlocked economy its overland logistics costs are high and its supply-chain reliability limited \citep{arvis2010landlocked}"
- **L837** (§Where investment would pay off): "given the high overland logistics costs a landlocked transit economy faces \citep{arvis2010landlocked}"

Both uses are faithful: the World Bank volume's title and thesis are literally *logistics costs and supply-chain reliability for landlocked economies*. No inflation. **Prior flag closed.**

---

## 3. Directional fidelity of the ~10 load-bearing citations

| Cite | In-text claim | Cited work actually shows | Verdict |
|---|---|---|---|
| **chupilkin2026roundabout** (L83–86) | "sharp fall in EU exports to Russia alongside a matching rise in EU exports to Armenia, Kazakhstan and the Kyrgyz Republic, with product-level and mirror-statistics evidence of onward movement to Russia" | Exactly this: transshipment through non-sanctioning CCA states + goods declared for the neighbour that fail to reach declared destination (mirror gap); 2022–23 the two strategies offset ~⅓ of the fall in EU exports to Russia | **Match.** Year/vol/DOI correct. Text puts no number on this cite (magnitude is attributed to chupilkin2025intermediated), so no over-reach. |
| **chupilkin2026roundabout** (L309) | "the onward-movement bias that \citet{...} use to identify the reorientation" | The mirror discrepancy (declared-for-neighbour goods not arriving) is one of the paper's two identification strategies | **Match.** |
| **chupilkin2025intermediated** (L86) | "\citet{...} quantify the substitution" | P&P piece: aggregate offset <10% of the sanctions' impact, but product-level substitution ratios >50% for many sanctioned goods | **Match**, appropriately vague ("quantify"). No inflation. |
| **desouza2024diffusion** (L246–253) | foreign supplier facing a lower tariff shifts from *transferring* technology toward *exporting* goods; learning from imported goods less efficient than from a transfer; import liberalisation raises static welfare but slows diffusion/productivity | Brazilian firm-to-firm data: tariff cuts → fewer foreign→domestic technology transfers, fewer citations of foreign patents; "more trade, less diffusion" | **Match**, direction correct. |
| **desouza2024diffusion** (L134, L919) | an open market-access gate "forgoes the technology transfer a rules-of-origin regime **would have forced**" | The paper studies *tariff levels*, documents an *association* (lower tariff ↔ less transfer); it does not study rules of origin and does not establish compulsion | **Mild over-extension** — see L7-4. Framed as the manuscript's own limiting-case argument, so borderline, not fatal. |
| **gopinathneiman2014** (L244) | "the roundabout structure of \citet{...}" — domestic production leaning on imported components adds little over a pure re-export | The paper's model has roundabout production + trade in imported intermediates; import-price shock → productivity decline via input churning | **Match** — precise use. |
| **gopinathneiman2014** (L148) | in a cluster on "when trade shocks induce a domestic supply response and when they do not" | The paper is about import *collapse* and productivity in a crisis, not about supply-response conditions | **Loose fit** in this "speaks to" cluster; defensible but the weakest member of the L148 list. MINOR at most. |
| **juhaszlanerodrik2024** (L148) | industrial-policy literature on when trade shocks build capacity | Survey of the new empirical industrial-policy literature | **Match** (survey used as survey). |
| **juhaszlanerodrik2024** (L806) | "Vietnam and Mexico received China-plus-one and nearshoring reallocations widely read as *structural* \citep[e.g.][]{...}" | The survey discusses global reallocation broadly; it does not specifically establish that the Vietnam/Mexico nearshoring shift is "structural" | **Thin support** — see L7-3. The "[e.g.]" hedge softens it. |
| **dixitpindyck1994** (L150, L218) | option value of waiting rises with uncertainty, falls with persistence; irreversibility gate | Canonical real-options / investment-under-uncertainty result | **Match** — textbook-correct. |
| **khanna1997**, **rajanzingales1998** (L151, L261, L757) | institutional voids in the capital market; no growth equity / no functioning exit; captive capital allocated by non-return criteria | khanna1997 (Khanna–Palepu HBR): "institutional voids" concept. rajanzingales1998: industries more dependent on external finance grow faster where financial markets are deeper | khanna1997 **match**; rajanzingales1998 a **mild stretch** (it is about external-finance dependence and growth, not "voids"/"exit" specifically) but this pairing is standard in the literature. Acceptable. |
| **koopman2014tracing**, **johnson2012accounting** (L553) | domestic value added per dollar of gross flow = margin × VA multiplier; per dollar of domestic output = VA multiplier | Both are the canonical value-added-trade accounting decompositions | **Match** — exactly the right references. |
| **fisman2004missing** (L534, L577) | "outbound under-invoicing" (L534); "mirror-gap discrepancies typical in this literature" (L577) | Fisman–Wei: *importer-side* under-reporting of imports in China–HK trade rises with the tax rate (evasion gap) | L577 use **OK** (it is a trade-misreporting / mirror-gap paper). L534 "outbound under-invoicing" is a **loose mechanism match** — round-2 M16 flagged this and it persists. See L7-5. |
| **juhasz2018temporary**, **bloom2016trade** (L148) | trade shocks and technology adoption / induced technical change | juhasz2018: Napoleonic-blockade temporary protection → technology adoption. bloom2016: Chinese import competition → innovation/IT/productivity | **Match**. |

### EU legal instrument (L744)

"the EU's eleventh sanctions package, Council Regulation (EU) 2023/1214 of 23 June 2023, which introduced an anti-circumvention transit tool."

- **Instrument, number, date all correct.** The 11th package *was* Council Regulation (EU) 2023/1214 of 23 June 2023, and it *did* introduce an anti-circumvention mechanism plus a transit ban on listed goods/technology through Russia. Direction of the claim is accurate.
- Cited inline, not as a bib entry — acceptable form for an economics paper. A footnote with the Official Journal cite (OJ L 159I, 23.6.2023) would be tidier but is polish only.

---

## 4. Contemporary / competing work that should be cited but isn't

**The 2023–2026 empirical literature on sanctions circumvention / parallel imports / trade rerouting through third countries is entirely absent except for the two Chupilkin et al. papers.** Round-2 M18 explicitly asked for this and it was not added (bib is unchanged at 14 entries, all pre-existing). Missing, and a referee in this area will notice on the first read:

- **Simola (BOFIT)** — series of Bank of Finland Institute for Emerging Economies briefs/papers on Russia's import recovery and third-country intermediation (2023–2025).
- **Hilgenstock, Ribakova, et al. (KSE Institute / Bruegel)** — export-control leakage and circumvention through Central Asia / Caucasus / Turkey.
- **Kluge (SWP)** and similar on Russia's legalised "parallel imports" regime.
- Possibly **Sonnenfeld et al.**, **Efimova/Egel**, **Ferrantino–Liu–Wang** (the last is the better cite for the onward-transit mirror bias, cf. L7-5).

This does **not** threaten the paper's "first host-economy incidence analysis" novelty claim — that literature is about *aggregate* leakage, not what the transit economy *retains* — but it is the neighbourhood the paper must position against, and one paragraph in §1 or §Setting citing 2–3 of these would both discharge round-2 M18 and strengthen the contribution framing. **MAJOR** (persisting unaddressed prior-round request + core to the paper's positioning).

---

## 5. Cite-inflation (claim stronger than the cited work establishes)

- **L7-4** (desouza2024diffusion, L134/L919): "would have *forced*" technology transfer under rules of origin — de Souza et al. study tariff levels and document an association, not RoO and not compulsion. Verb over-reaches.
- **L7-3** (juhaszlanerodrik2024, L806): a broad survey cited "[e.g.]" to support the specific characterization that Vietnam/Mexico nearshoring is "structural."
- **L7-5** (fisman2004missing, L534): importer-side evasion paper cited for "outbound under-invoicing."

None rises to CRITICAL; all are localized verb/reference-fit issues on non-headline sentences. The load-bearing empirical cites (chupilkin ×2, the value-added accounting pair, dixit–pindyck) are all used at or below what they establish.

---

## Positives recorded this round

1. `arvis2010landlocked` now cited twice, faithfully — round-2 "uncited" flag **closed**.
2. `desouza2026diffusion` → `desouza2024diffusion`, `year=2024` — round-2 M3 ("de Souza et al. (2026)" rendering bug) **closed**; `\citet` now renders "de Souza et al. (2024)".
3. `gopinathneiman2014` added and used precisely for roundabout/imported-input intensity (L244).
4. `chupilkin2025intermediated` (AEA P&P 2025) verified exact.
5. Structural bill is clean: 14/14 keys resolve, 0 orphans, 0 missing required fields, DOIs well-formed and (5 spot-checked) correct.

---

```
findings:
  - id: L7-1
    severity: MAJOR
    location: "§1 / §2 (Setting) — bib coverage"
    finding: "The 2023–2026 sanctions-circumvention / parallel-imports literature (Simola/BOFIT, Hilgenstock–Ribakova/KSE, Kluge/SWP) is entirely uncited; round-2 M18 asked for it and it was not added."
    evidence: "Bib unchanged at 14 entries; only chupilkin2026roundabout + chupilkin2025intermediated represent this whole body of work. Paper's contribution claim ('first host-economy incidence analysis of post-2022 rerouting') is stated without positioning against the aggregate-leakage literature it extends."
    change_my_mind: "If the authors judge Chupilkin et al. to be a sufficient and canonical entry point and add one sentence saying so explicitly, this drops to MINOR. It is MAJOR only because it is an unaddressed prior-round request on the paper's core neighbourhood."
  - id: L7-2
    severity: MINOR
    location: "corridor.bib / desouza2024diffusion note field"
    finding: "note = {Revised 2026; SSRN 4972150} — the documented revision of FRB Chicago WP 2024-20 is March 2025, not 2026."
    evidence: "FRB Chicago listing + round-2 synthesis problem statement both say 'revised March 2025'. Round-2's own recommendation text contradictorily said 'March 2026'. Citation still renders correctly as 'de Souza et al. (2024)', so this is note-field hygiene only."
    change_my_mind: "If a genuine 2026 revision of SSRN 4972150 exists (plausible given the Aug-2026 draft date), the note is fine — just confirm the date against the SSRN version history."
  - id: L7-3
    severity: MINOR
    location: "§9 Moderators L806 / juhaszlanerodrik2024"
    finding: "juhaszlanerodrik2024 (a broad industrial-policy survey) is cited '[e.g.]' to support 'Vietnam and Mexico ... widely read as structural'; the survey does not establish that specific characterization."
    evidence: "L806: 'received China-plus-one and nearshoring reallocations widely read as structural \\citep[e.g.][]{juhaszlanerodrik2024}'. The survey discusses global reallocation generally, not the structural-vs-transitory status of the Vietnam/Mexico shift."
    change_my_mind: "Adding a targeted nearshoring cite (Freund et al. 2023 World Bank; Alfaro–Chor 2023; Fajgelbaum et al. on the trade war) alongside it resolves this; the '[e.g.]' hedge already makes it non-fatal."
  - id: L7-4
    severity: MINOR
    location: "§1 L134 and §11 L919 / desouza2024diffusion"
    finding: "'the technology transfer a rules-of-origin regime would have FORCED' over-extends de Souza et al., who study tariff levels (not RoO) and document association, not compulsion."
    evidence: "Cited work: lower tariff -> fewer foreign->domestic technology transfers (Brazilian firm data). Manuscript infers a counterfactual in which binding RoO 'would have forced' transfer."
    change_my_mind: "Softening the verb ('would have encouraged / drawn') or attaching a rules-of-origin-specific reference makes the sentence exactly supported. The idea is framed as the paper's own limiting-case argument, so it is a wording issue, not a misattribution."
  - id: L7-5
    severity: MINOR
    location: "§5.1 L534 / fisman2004missing"
    finding: "Fisman–Wei (importer-side under-reporting to evade tariffs) is a loose mechanism match for 'outbound under-invoicing'; round-2 M16 flagged this and it persists."
    evidence: "L534 attributes 'outbound under-invoicing' to fisman2004missing; the paper is about import under-reporting in China–HK trade. The L577 use ('mirror-gap discrepancies typical in this literature') is fine."
    change_my_mind: "Fisman–Wei is a defensible generic cite for trade-data misreporting; if the authors prefer, Ferrantino–Liu–Wang or Chupilkin et al. fit the onward-transit/outbound direction better. Not blocking either way."
  - id: L7-6
    severity: MINOR
    location: "§7 L744 (EU reg.) and khanna1997"
    finding: "Two polish items: (a) Council Regulation (EU) 2023/1214 cited inline without the Official Journal reference (OJ L 159I, 23.6.2023); (b) khanna1997 relies on the Harvard Business Review practitioner article rather than the peer-reviewed Khanna–Palepu literature."
    evidence: "L744 gives instrument+number+date (all correct) but no OJ cite. khanna1997 = HBR 75(4):41–51; the academically standard institutional-voids cites are Khanna–Palepu (2000, J. Finance) or Khanna–Palepu (2010, book)."
    change_my_mind: "Both are acceptable as-is for an economics working paper; flagged only as pre-submission tid_ying. No action required if the target journal permits HBR and inline legal cites."
```

```
scorecard:
  lens: "7. Citations"
  critical: 0
  major: 1
  minor: 5
  score_out_of_10: 8
  one_line: "Bib is structurally spotless (14/14 keys resolve, 0 orphans, fields complete, DOIs verified) and every load-bearing cite checks out directionally; two round-2 items (arvis uncited, de Souza year) are closed; the one real gap is the still-missing 2023–2026 sanctions-circumvention literature that round-2 M18 already requested."
```
