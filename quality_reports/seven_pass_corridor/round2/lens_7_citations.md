# Lens 7 — Citation Audit — ROUND 2

Manuscript: `corridor.tex` · Bib: `corridor.bib` · Round-1 score: 7/10 (1 MAJOR: 4 orphan bib entries)

---

## 1. Structural check (resolve + orphan) — PASS

**14 distinct cite keys in the text, 14 bib entries, exact 1:1 match. No unresolved `\cite`, no orphan, no dangling entry.**

| Key | In-text locations | Bib | Status |
|---|---|---|---|
| chupilkin2026roundabout | §1 | ✓ | ok |
| chupilkin2025intermediated | §1 | ✓ | ok |
| juhasz2018temporary | §1 | ✓ | ok |
| bloom2016trade | §1 | ✓ | ok |
| juhaszlanerodrik2024 | §1 | ✓ | ok |
| gopinathneiman2014 | §1, §3(iii) | ✓ | **round-1 new — now cited 2×** |
| dixitpindyck1994 | §3(intro), §3(i) | ✓ | ok |
| khanna1997 | §1, §3(iv), §7 | ✓ | ok |
| rajanzingales1998 | §1, §3(iv), §7 | ✓ | ok |
| arvis2010landlocked | §2, §9 | ✓ | **round-1 orphan — RESOLVED** |
| fisman2004missing | §4 (Data) | ✓ | **round-1 orphan — RESOLVED (1 use, see §3)** |
| koopman2014tracing | §5.2 | ✓ | **round-1 orphan — RESOLVED** |
| johnson2012accounting | §5.2 | ✓ | **round-1 orphan — RESOLVED** |
| desouza2026diffusion | §3(iii), §10 | ✓ | **round-1 new — cited 2×; year defect, see §2** |

**Round-1 MAJOR (4 orphans) is fully resolved.** `fisman2004missing`, `koopman2014tracing`, `johnson2012accounting`, `arvis2010landlocked` are all now load-bearing in the text. The two new entries (`gopinathneiman2014`, `desouza2026diffusion`) are both cited. JEL O33 added — consistent with the new diffusion/technology-transfer material.

Note: the round-1 synthesis brief said `fisman2004missing` would land "in §3 + §5.1 for under-invoicing on the outbound leg." That is **not** what the manuscript does — it is cited once, in §4 (Data), only for "mirror data overstate Kazakh absorption for goods declared for Kazakhstan and then moved onward." The narrower actual use is easier to defend than the brief's description (see §3).

---

## 2. Well-formedness — one MAJOR defect

Every entry has all BibTeX-required fields for its type and renders under `plainnat`. Spot-verified against the published record:

- `chupilkin2026roundabout` — European Economic Review **187**, art. 105340, 2026, doi 10.1016/j.euroecorev.2026.105340. **Verified exact** (RePEc `v187y2026ics001429212600084x`). Correctly cites the *published* version, not the EBRD WP — good.
- `chupilkin2025intermediated` — AEA P&P **115**, 568–572, 2025, doi 10.1257/pandp.20251083. **Verified exact.**
- `juhaszlanerodrik2024` — Annual Review of Economics **16**, 213–242, 2024, doi 10.1146/annurev-economics-081023-024638. **Verified exact** (RePEc `v16y2024p213-242`).
- `koopman2014tracing` — AER **104**(2), 459–494, 2014. Verified. `johnson2012accounting` — JIE **86**(2), 224–236, 2012. Verified.
- `gopinathneiman2014` — AER **104**(3), 793–831, 2014, doi 10.1257/aer.104.3.793. Verified.
- `fisman2004missing` — JPE **112**(2), 471–496, 2004, doi 10.1086/381476. Verified.
- `arvis2010landlocked` — *The Cost of Being Landlocked*, World Bank (Directions in Development – Trade), 2010. Verified (the 2010 book, distinct from the 2007 Policy Research WP 4258 by the same authors). Correct.
- `dixitpindyck1994`, `khanna1997`, `rajanzingales1998`, `bloom2016trade` — fields match the standard record.

### MAJOR — `desouza2026diffusion` carries an unsupported publication year

Bib says `year = {2026}`, `month = {March}`, `note = {Revised March 2026}`. Every source located says otherwise:

- FRB Chicago **Working Paper 2024-20**, original **September 2024** (RePEc `fipfedhwp/99305`, "Page updated August 26, 2026"; author's own site `gustavodesouza.net/research` — checked live — lists it as "September 2024, Working Paper Series No. WP 2024-20").
- Revised version circulated **March 2025** (SSRN 4972150 "March 31, 2025"; Princeton IES hosts `dgm_mar2025.pdf`).
- No "March 2026" revision found anywhere.

The paper, authors, title, institution/number, and DOI (`10.21033/wp-2024-20`) are all **correct** — this is not a fabricated reference. But `\citet{desouza2026diffusion}` renders "de Souza, Gaetani, and Mestieri (2026)", a year that matches no release. A referee or copy-editor will catch it, and a reader chasing the 2026 cite finds a 2024/2025 WP. Fix: `year = {2024}` (or `{2025}` for the revised version the text actually draws on — see §3), and rename the key to `desouza2024diffusion` / `desouza2025diffusion` for honesty. Drop the "Revised March 2026" note unless a March 2026 stamp is produced.

- **change_my_mind:** a dated **March 2026** revision of WP 2024-20 exists on chicagofed.org or SSRN with that version stamp on the title page.

---

## 3. Semantic check of load-bearing citations

### `desouza2026diffusion` (§3(iii), §10) — direction VERIFIED CORRECT, use fair

Manuscript: "a foreign supplier facing a lower tariff shifts from *transferring* technology into the market toward *exporting* goods to it … learning from imported goods is less efficient than learning from a transfer — so import liberalisation raises static welfare but slows diffusion and productivity growth." §10: an open market-access gate "forgoes the technology transfer and learning that a rules-of-origin regime would have forced."

Against the paper (Chicago Fed WP 2024-20 abstract, verified): "When tariffs in Brazil rise, foreign firms transfer their technology rather than export their products, boosting the diffusion of foreign knowledge" — i.e. tariff **down** → transfer **down** → diffusion **down**. **Direction matches.** The SSRN/March-2025 summary confirms the welfare split: "full liberalization … welfare gains of 0.29% per period … accounting for diffusion via technology transfers reduc[es] the overall welfare gains from trade liberalization by more than three-fourths" — i.e. positive static gain, large dynamic-diffusion offset. The manuscript's "raises static welfare but slows diffusion and productivity growth" is a fair compression. The "learning from imports < learning from a transfer" clause is not a verbatim abstract line but is the paper's core mechanism (patent-citation drop when transfers fall). **No misuse.** Only the citation *year* is wrong (§2). Note the text is drawing on the **March 2025 revision's** framing ("trade liberalization can reduce diffusion"), not the Sept 2024 original (framed around tariff *increases*) — another reason to date it 2025.

### `gopinathneiman2014` (§3(iii)) — fair, mild stretch in the §1 cluster

§3(iii): "the roundabout structure of \citet{gopinathneiman2014}" — invoked for imported-input intensity lowering the value a local plant adds. Gopinath–Neiman (2014) explicitly "build a model of trade in intermediate inputs with heterogeneous firms, fixed import costs, and **roundabout production**" (verified). Attributing the *concept* of roundabout production to them via "\citet{...}—the value a local plant adds … is smaller still" is legitimate concept-borrowing; the phrasing is careful and does not claim G–N measured value-added-over-re-export. **OK.**
- MINOR: at line 145 `gopinathneiman2014` sits in the cluster "speaks to when trade shocks induce a domestic supply response and when they do not `\citep{juhasz2018temporary,bloom2016trade,juhaszlanerodrik2024,gopinathneiman2014}`." G–N is about productivity losses from *losing* imported inputs in a crisis, not a supply/investment response to a demand shock — a loose fit in that particular list. Harmless (it is aptly cited three lines of argument later), but the cluster would be tighter without it.

### `fisman2004missing` (§4) — defensible but the mechanism is off-target — MINOR

Manuscript: "Mirror data overstate Kazakh absorption for goods declared for Kazakhstan and then moved onward, a bias we return to … \citep{fisman2004missing}."

Fisman–Wei (2004) established the *evasion-gap method* — partner-reported exports minus own-reported imports — and attributed the gap to **importers under-invoicing / mis-classifying to evade tariffs** (Hong Kong → China; +1pp tariff → +3% gap). The manuscript's bias is different in kind: goods genuinely declared for Kazakhstan that **transit onward** to Russia, inflating apparent Kazakh absorption in mirror data — a transshipment/re-export artefact, not duty evasion by the Kazakh importer. Fisman–Wei is a reasonable *methodological* anchor for "mirror gaps are informative about trade misreporting," and this is within common citation practice, but it is not a precise match for the onward-movement mechanism. A closer cite would be Ferrantino, Liu & Wang (2012, *J. Int. Econ.* on China's trade-data discrepancies) or Kellenberg & Levinson (2019, *J. Int. Econ.* on systematic trade misreporting), or simply Chupilkin et al. (already in the bib), whose "goods failing to reach their declared final destination" is exactly this bias. Not directionally wrong in a way that damages a claim → **MINOR** (consider adding a more apt companion cite).

### `koopman2014tracing` / `johnson2012accounting` (§5.2) — fair

Cited for "domestic value added per dollar of gross rerouted flow is $m\,\bar v^{TT}$ … per dollar of domestic manufacturing output it is $\bar v^{M}$." These are the two canonical value-added-trade / VAX references (Leontief-inverse decomposition of gross trade into domestic value added). Using them as the authority for the IO-propagation step is exactly on point. **No issue.**

### `chupilkin2026roundabout` / `chupilkin2025intermediated` (§1) — characterization holds

Manuscript: "\citet{chupilkin2026roundabout} document the pattern: a sharp fall in EU exports to Russia alongside a matching rise in EU exports to Armenia, Kazakhstan and the Kyrgyz Republic, with product-level and mirror-statistics evidence of onward movement … \citet{chupilkin2025intermediated} quantify the substitution." §1 contribution: "the existing literature — which establishes that rerouting happened and its scale."

Verified abstracts: the EER paper documents transshipment + "goods nominally shipped … failing to reach their declared final destination," offsetting "roughly one third of the decline in European exports to Russia"; the AEA P&P paper gives the substitution ratios (">50 percent for numerous sanctioned products", "<10 percent" of the aggregate sanctions impact). The manuscript's "establishes that rerouting happened and its scale" is an accurate, appropriately modest characterization. **OK.**

### `arvis2010landlocked` (§2, §9) — fair

§2: "as a doubly landlocked economy its overland logistics costs are high and its supply-chain reliability limited"; §9: "the high overland logistics costs a landlocked transit economy faces." The Arvis–Raballand–Marteau volume is titled *…Logistics Costs and Supply Chain Reliability* and is *the* World Bank reference on exactly this. **Textbook-correct use.**

### Directional re-check of the framework cites — all OK

- `dixitpindyck1994` — option value of waiting "increasing in the uncertainty $\sigma$ … and decreasing in $\rho$." Core Dixit–Pindyck result (irreversibility + uncertainty raises the investment hurdle). Direction correct.
- `khanna1997` (Khanna & Palepu, HBR 1997) — "institutional voids in the capital market." Khanna–Palepu are the originators of "institutional voids." Correct.
- `rajanzingales1998` — "where the capital market lacks growth equity … projects … are not funded." R–Z: externally-finance-dependent industries grow faster where financial markets are deep; contrapositive use here is correct.
- `juhasz2018temporary` — cited for "when trade shocks induce a domestic supply response and when they do not." Juhász is the canonical "temporary protection *can* induce technology adoption / industrialization" result; used here as the affirmative contrast to this paper's null. Correct.
- `bloom2016trade` — import competition from China → within-firm innovation/IT/TFP rise. In the §1 cluster about trade shocks and domestic technology response it is a reasonable member; the flavour (import competition, not export demand) differs slightly. MINOR, not flagged separately.

---

## 4. Contemporary / competing work (2024–2026)

The two central academic treatments of post-2022 rerouting through the Caucasus/Central Asia — **Chupilkin, Javorcik, (Peeva,) Plekhanov** (EER 2026; AEA P&P 2025) — are both cited. No fatal omission.

Worth *considering* (MINOR, not blocking — mostly policy/technical, not journal-refereed):
- **Simola, H.** (BOFIT, Bank of Finland) — several 2023–2024 policy papers quantifying Russia's import recovery and third-country circumvention; the closest complement to the trade-measurement half of this paper.
- **Chupilkin, Javorcik, Plekhanov, "Exorbitant Privilege and Economic Sanctions"** (2024 wp) — financial-channel companion to the roundabout paper; relevant to the secondary-sanctions/compliance discussion in §2 and §7.
- Kiel Institute / Hilgenstock–Ribakova–Snegovaya work on export-control leakage — useful for the enforcement-timeline claim in §7 (EU 11th package, June 2023) if a citation is wanted there (currently unsourced).

## 5. Working-paper vs published

- `desouza2026diffusion` — still WP only; no published version exists, so citing the WP is correct — but the **year is wrong** (§2).
- `chupilkin2026roundabout` — correctly upgraded to the published EER version. Good.
- `juhaszlanerodrik2024` — cites the published Annual Review version (note records the NBER WP). Good.
- All others are published and cited as such.

---

## Verdict

Structural layer is now **clean** — the round-1 MAJOR (4 orphans) is fully resolved, and the two new entries are properly integrated. Semantic checks pass: `desouza2026diffusion`'s direction is **verified correct** (tariff down → transfers down → diffusion down) and its use in §3(iii)/§10 is fair; the Chupilkin, Gopinath–Neiman, Koopman/Johnson, and Arvis uses are sound. One MAJOR remains — an **unsupported 2026 publication year** on the de Souza working paper (real paper, correct DOI, wrong date → a citability bug, not a fabrication). Two MINORs: the Fisman–Wei mechanism is off-target for the onward-movement bias it is attached to, and Gopinath–Neiman is a loose fit in the §1 cluster.

```
findings:
- id: L7-R2-01
  severity: MAJOR
  location: corridor.bib lines 139-149 (desouza2026diffusion); rendered at corridor.tex §3(iii) L243 and §10 L875
  finding: >
    Bib entry dates de Souza, Gaetani & Mestieri as year=2026 / "Revised March 2026".
    No such revision exists. FRB Chicago WP 2024-20 is original September 2024
    (author's own site + RePEc), revised March 2025 (SSRN 4972150 "March 31, 2025";
    Princeton-hosted dgm_mar2025.pdf). \citet renders "de Souza et al. (2026)", a year
    matching no release. Paper, authors, title, institution/number and DOI
    (10.21033/wp-2024-20) are all correct — this is a wrong-year citability defect,
    not a fabricated reference, hence MAJOR not CRITICAL. Fix: year=2025 (the revision
    the text's framing draws on) or 2024; rename key accordingly; drop the 2026 note.
  evidence:
    - "RePEc/EconPapers, WP 2024-20, 'September 2024', page updated 26 Aug 2026: https://econpapers.repec.org/paper/fipfedhwp/99305.htm"
    - "Author site (checked live): 'September 2024, Working Paper Series No. WP 2024-20': https://gustavodesouza.net/research/"
    - "SSRN 4972150, revision 'March 31, 2025': https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4972150"
    - "Princeton IES hosts the March 2025 version: https://ies.princeton.edu/wp-content/uploads/2025/10/dgm_mar2025.pdf"
  change_my_mind: >
    A dated March 2026 revision of Chicago Fed WP 2024-20 with that version stamp on
    its title page is live on chicagofed.org or SSRN.
- id: L7-R2-02
  severity: MINOR
  location: corridor.tex §4 (Data), L306-307
  finding: >
    fisman2004missing cited for "mirror data overstate Kazakh absorption for goods
    declared for Kazakhstan and then moved onward". Fisman-Wei's evasion gap is driven
    by the IMPORTER under-invoicing / mis-classifying to evade tariffs, not by
    onward-transit of genuinely-declared goods. Defensible as the methodological
    anchor for "mirror gaps reveal misreporting", but not a precise mechanism match.
    Consider adding Ferrantino-Liu-Wang (2012) or Kellenberg-Levinson (2019), or
    leaning on Chupilkin et al. (already in bib), whose "goods failing to reach their
    declared final destination" is exactly this bias.
  evidence:
    - "Fisman & Wei 2004, JPE 112(2): gap = HK-reported exports minus China-reported imports, driven by tariff-evasion under-reporting: https://www.journals.uchicago.edu/doi/abs/10.1086/381476"
  change_my_mind: n/a (minor)
- id: L7-R2-03
  severity: MINOR
  location: corridor.tex §1, L145
  finding: >
    gopinathneiman2014 included in the \citep cluster on "when trade shocks induce a
    domestic supply response and when they do not". G-N is about productivity losses
    from losing access to imported inputs in a crisis, not a supply/investment
    response to a demand shock — loose fit in that list. The §3(iii) use of the same
    cite ("the roundabout structure of") is apt; the L145 cluster would be tighter
    without it.
  evidence:
    - "Gopinath & Neiman 2014, AER 104(3): model with 'roundabout production'; import price shock -> productivity decline: https://www.aeaweb.org/articles?id=10.1257/aer.104.3.793"
  change_my_mind: n/a (minor)
- id: L7-R2-04
  severity: MINOR
  location: whole manuscript (literature engagement)
  finding: >
    Central academic references (Chupilkin et al. x2) are cited. Consider engaging
    Simola/BOFIT on Russia's import recovery via third countries, and Kiel/
    Hilgenstock-Ribakova on export-control leakage — the latter would also give §7 a
    citation for the "EU 11th package, June 2023" enforcement-timeline claim, which is
    currently unsourced.
  evidence:
    - "FPRI/Eurasianet/KIAR 2024-2025 coverage confirms an active policy literature; no refereed competitor to Chupilkin et al. found: https://www.fpri.org/article/2024/12/the-impact-of-russia-sanctions-on-central-asia/"
  change_my_mind: n/a (minor)
- id: L7-R2-RESOLVED
  severity: INFO
  location: corridor.bib / corridor.tex
  finding: >
    Round-1 MAJOR resolved. fisman2004missing, koopman2014tracing,
    johnson2012accounting, arvis2010landlocked all now cited and load-bearing. Two new
    entries (gopinathneiman2014, desouza2026diffusion) both cited. 14 keys / 14
    entries, exact 1:1, no orphan, no dangling. chupilkin2026roundabout correctly
    cites the published EER 2026 version. juhaszlanerodrik2024 verified exact
    (ARE 16:213-242).
  evidence:
    - "grep of \\cite* in corridor.tex: 14 distinct keys, all resolve"
  change_my_mind: n/a
```

```
scorecard:
  lens: "7. Citations"
  round: 2
  critical: 0
  major: 1
  minor: 3
  resolved_from_round1: 1   # the 4-orphan MAJOR
  score_out_of_10: 8
  notes: >
    Structural layer clean; round-1 orphan MAJOR fully resolved; both new entries
    integrated and directionally verified (desouza diffusion direction confirmed
    against the source). Held below 9 by one MAJOR: desouza2026diffusion carries an
    unsupported 2026 year on a real WP (fix the year, not the reference). Minors:
    Fisman-Wei mechanism off-target, Gopinath-Neiman loose in the L145 cluster,
    optional BOFIT/Kiel engagement + an unsourced §7 sanctions-timeline claim.
```
