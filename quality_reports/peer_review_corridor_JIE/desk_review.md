# Desk Review: "Corridor, Not Factory" — `/review-paper --peer JIE`

**Calibrated to:** Journal of International Economics (JIE)
**Date:** 2026-09-15 · **Paper:** `Manuscript/corridor.tex` (42pp, commit `91ae253`) · **Novelty check:** ON (3 probes)
**Prior history:** internal round-2 peer review (both referees Minor revision, JCE calibration — `quality_reports/peer_review_corridor/`), a `/proofread` pass, and a same-day fix of two citation errors against the just-published QIC/AIFC/IFC report.

## Verdict: **SEND OUT**

## Contribution statement (editor's reading)

A large, sector-specific, sharply dated demand shock — the post-2022 reallocation of Western exports to Russia through Kazakhstan — is measured at HS6 (29-line "surge basket", 2022m5 break, sup-F 561, replicated on an externally compiled priority list and in Armenia/Kyrgyzstan). The paper then asks what the intermediary *retains* (5–11 cents of domestic value added per rerouted dollar, from a chosen 6–14% wholesale-and-freight margin propagated through the OECD ICIO, vs ~76% for a produced dollar) and whether the shock induced domestic capacity (no: deal rates 7.6→7.2/yr across three commercial databases, powered only against ~+80%). The null is read through a three-gate decomposition — irreversibility × market access × capital-market institutions — which the case uses to establish an *open* market-access gate (customs union makes trade a close substitute for production) and to rule out capital-market institutions as binding (the least capital-constrained investor, the state fund, did not build either), while conceding irreversibility is not separately identified.

## Desk-reject analysis

None of the six criteria fire.

- **Fit (10→10, no adjustment).** Trade reallocation, entrepôt/re-export value capture, and the investment response to a trade shock are squarely JIE scope. §5 (GVC/value-added accounting via Koopman–Johnson), §3's de Souza technology-diffusion channel and the Feenstra–Hanson entrepôt benchmark place it in the trade literature, not in area studies.
- **Contribution.** Statable in one sentence (above), and stated by the authors in three parts with the primary one flagged as empirical.
- **Fatal design flaw.** No. The obvious candidate — a basket selected on the post-period outcome — is *diagnosed by the authors themselves* via a selection-rule-matched permutation, and they explicitly decline to read γ=2.44 as an identified magnitude, resting identification instead on the structural breaks, the externally compiled list, and the neighbour comparison. That is the honest treatment JIE's criterion (c) asks for. Disclosure is complete, including the author's AIFC affiliation and the QIC report's provenance.
- **Below the bar.** No, but it is **close on the JIE-specific margin**, and the referees should be told where: JIE's domain weights push Contribution 30→32, Lit positioning 25→28 and External validity 15→20. The paper's own §9 concedes the investment null is established *only* for Kazakhstan, and that the intermediary population's other members (Türkiye, Georgia, Armenia, Kyrgyzstan) cannot be tested because the deal data are Kazakhstan-only. Under JIE's "why should I, working on Vietnam or Mexico, care" test that narrow claim is the live risk — not a desk-reject, but the thing most likely to decide the case. §9's Vietnam/Mexico/USMCA-rules-of-origin contrast is the right move and needs to carry more weight than it currently does.
- **Already done.** No (see probes).
- **Reproducibility FAIL.** No — Phase 0 (from the prior round, unchanged since) was PASS, 0 FAIL.

**Editorial flag (not a desk-reject, for the domain referee):** §11 *Policy implications*, especially §11.3 "China: lowering barriers to greater Kazakh value capture," reads as policy commentary, which the JIE profile says the journal does not publish. Recommend it be compressed and subordinated to the framework before submission; the referee should rule on whether each recommendation maps to a named gate and a quantity estimated in §5–§8.

**Second flag (domain):** the claim that the case "rules out capital-market institutions" rests entirely on `qicaifcifc2026pe`, a report co-published by the author's employer, with no pre-2022 baseline, no sector denominator, and no project-level register. Disclosed, and the paper calls it "illustrative rather than a controlled test" — but it is load-bearing for one of the two things the case claims to settle.

## Novelty probes

| # | Query | Result |
|---|---|---|
| 1 | Kazakhstan re-export to Russia — value added / domestic investment response, 2024–25 | Only policy/IFI and press material (State Dept ICS 2024/2025, BOFIT/KSE-type monitoring, Baker McKenzie sanctions notes, KIAR evasion report). No academic paper on host-economy *retention* or the *investment* response. |
| 2 | Sanctions circumvention / intermediated trade — Armenia, Kyrgyzstan, Kazakhstan, value capture | Two close items, **both already cited**: "The Eurasian roundabout" (ScienceDirect, `S001429212600084X` = `chupilkin2026roundabout`) and "Economic Sanctions and Intermediated Trade" (AEA P&P, `10.1257/pandp.20251083` = `chupilkin2025intermediated`). Both take the *sanctioned* economy's import replacement as the object; neither estimates what the intermediary retains or its investment response. The manuscript's positioning against them is accurate. |
| 3 | Demand shock → investment under irreversibility × market access × customs union | No matching paper. Only the generic components the paper already cites (Dixit–Pindyck, Bloom; rules-of-origin/FDI work — Estevadeordal, Head–Mayer–Melitz Laffer-curve RoO, IADB Mexico) and 2025 trade-policy-uncertainty macro commentary. The *combination* as a decomposition appears unoccupied. |

**Novelty assessment: Clear.** Caveat per `.claude/rules/post-flight-verification.md`: WebSearch returned no paywalled-repository or working-paper-series sweep (no NBER/CEPR/SSRN/RePEc direct hits surfaced), and one probe returned partly fabricated-looking summaries. **Editor could not fully verify — recommend author double-check** against RePEc/NBER/CEPR for post-2025 working papers on intermediary value capture, and re-check whether any Georgia- or Türkiye-focused host-economy paper has appeared. No desk decision here rests on the probes.

## Referee selection

Pool (JIE): CREDIBILITY 0.28 / STRUCTURAL 0.18 / THEORY 0.16 / MEASUREMENT 0.16 / POLICY 0.14 / SKEPTIC 0.08.
Draw 1 → **CREDIBILITY** (0.28, the modal JIE disposition and the one the profile's first "typical concern" is written in). Remove, renormalise (STRUCTURAL .25 / THEORY .22 / MEASUREMENT .22 / POLICY .19 / SKEPTIC .11) → Draw 2 → **THEORY**. Different dispositions, as required; also deliberately disjoint from the prior JCE round's POLICY/MEASUREMENT pair, so this draw stresses the two things JCE did not.

| Referee | Role | Disposition | Critical peeve | Constructive peeve |
|---|---|---|---|---|
| **A** | domain / substance | **THEORY** | *Requires a formal theoretical model for any structural claim.* Eq. (2)'s multiplicative gate product is conceded to be "an organising device, not a result derived from" Eq. (1) — the threshold in (1) is on a *sum* and the factors interact inside an indicator. Referee must rule whether a paper whose central interpretive apparatus is an undeduced product, plus an explicitly non-estimated mediation restatement, meets JIE's "well-quantified mechanism" bar; and whether the claimed necessity of the three conditions can be derived from (1) rather than asserted. Extends to the reference class: which other episodes (China-plus-one, USMCA rules of origin, nearshoring) does the framework predict *differently* for, checkably? | *Rewards a clear "what this paper does not show" paragraph that honestly bounds the claims.* §3, §8, §9 and §11 repeatedly fence the claims (irreversibility undetermined; investment null Kazakhstan-only; auto comparison moves ≥2 gates; Armenia's GFCF runs the other way). Credit this explicitly rather than treating each concession as a fresh objection. |
| **B** | methods / identification | **CREDIBILITY** | *The identification assumption must be stated in one testable sentence.* At present the paper has three partial identification arguments (Bai–Perron breaks read for date only, no HAC; a DiD whose magnitude the authors concede sits inside its own rule-matched null, p=0.58; a neighbour comparison) and asks the reader to aggregate them. Referee must extract the single testable assumption behind each *retained* claim — the 2022m5 break, the "roughly tenfold" magnitude, the ~one-half Western flow-through, and the deal-rate null — and rule whether the DiD (§5.3, Table 2) earns its place at all given the permutation result, or should be demoted to an appendix. Includes the load-bearing calibration: `m` ∈ [6,14]% is chosen, not estimated (JIE methods weight 10→15), and the paper concedes the I-O step "does no work," so the headline *is* `m`. | *Appreciates when robustness checks are motivated by specific threats.* Each check here is tied to a named threat — trend-preserving permutation for pre-trend-driven selection, size-decile×year FE for the non-homogeneous control pool, leave-one-HS2-out for the HS-85 concentration, drop-2022 for anticipation, BNS I-O table for multiplier dependence, three-database cross-check for coverage. Credit the design, then judge whether the surviving claims are the ones the abstract makes. |

## Referee assignment

- **Referee A (domain/substance, THEORY)** → `domain-referee` agent.
- **Referee B (methods/identification, CREDIBILITY)** → `methods-referee` agent.

## Sources consulted (novelty probes)

- [Eurasian roundabout (ScienceDirect)](https://www.sciencedirect.com/science/article/abs/pii/S001429212600084X)
- [Economic Sanctions and Intermediated Trade (AEA P&P)](https://www.aeaweb.org/articles?id=10.1257%2Fpandp.20251083)
- [2025 Kazakhstan Investment Climate Statement](https://www.state.gov/reports/2025-investment-climate-statements/kazakhstan)
- [Kazakhstan re-export monitoring (Baker McKenzie)](https://sanctionsnews.bakermckenzie.com/kazakhstan-changes-regarding-monitoring-of-goods-re-exported-to-russia/)
- [Head–Mayer–Melitz, Laffer Curve for Rules of Origin](https://scholar.harvard.edu/files/melitz/files/hmm_roo_laffer_shared.pdf)
