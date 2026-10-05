# Desk Review: Corridor, Not Factory: Trade Reorientation and the Missing Investment Response in Kazakhstan, 2022–2025

Calibrated to: EER (European Economic Review, special issue "Global Trade Fragmentation and Regional Trade Alliances")
**Date:** 2026-10-05
**Paper:** quality_reports/peer_review_corridor_EER/manuscript_word_text.md (text extracted from the blinded Word file)
**Round:** Fresh submission (not an R&R)
**Novelty check:** ON (3 probes)
**Blinding:** Double-blind. The editor treated the author as unknown and made no attempt to identify them.
**Phase 0 (cross-artifact reproducibility):** No `/audit-reproducibility` output was given to the editor in this run. This decision uses no reproducibility evidence either way.

(Saved by the orchestrating session: the editor agent had no Write tool and returned this text.)

## Verdict

**SEND OUT**

## One-paragraph contribution statement (editor's understanding)

After 2022, Kazakhstan's exports to Russia rose about tenfold in 29 technology-intensive HS6 lines. Measured against a broader, externally compiled list that was not chosen on this outcome, the rise is 3.5x. The paper measures this shock with break tests and a neighbour comparison, because it concedes that its difference-in-differences cannot be separated from how the product basket was selected. It then calibrates how much of each rerouted dollar the country keeps as domestic value added: about 5–11 cents, against about 76 cents for a dollar of goods made at home. Using three commercial deal databases (2015–2025), it finds no detectable investment response. It interprets this null with a three-gate framework (irreversibility, market access, institutions) that it does not estimate. The general lesson is that membership in a customs union with the destination country (a regional trade alliance) lets trade substitute for production. As a result, a large demand shock in a tradeable good passes through the transit country without building capacity there.

## Desk analysis

The paper clears the EER bar on three criteria, with the reservations noted:

- **(a) The question matters beyond one country.** It asks when a trade shock industrialises an economy and when it only passes through. It also asks how regional customs unions shape what an intermediary country gains from rerouted trade. Both questions are general, and the second is squarely the special issue's theme (sanctions, regional trade agreements, supply-chain reconfiguration). Whether the case-to-general link is earned, rather than asserted, is the main question for the referees.
- **(b) The evidence is credible and honestly bounded.** The paper is unusually candid about its limits: its own permutation test puts γ inside the null distribution created by the selection rule; the value-capture headline is labelled a calibration; the investment null is called "over-determined"; the three gates are said not to be separately identified. This candour is a strength, but it also narrows what is identified. The referees must decide whether what remains (break timing, the size of the jump in levels, the neighbour comparison, a deal-count null with a stated power calculation, and a calibrated value-capture figure) is enough for a general-interest journal.
- **(c) The work is replicable.** A Mendeley Data deposit, the deal-database query specification (Appendix A) and native deal identifiers are provided. The licensed data cannot be redistributed but can be rebuilt by a licence holder.

None of the desk-reject triggers applies: fit is strong; the contribution is statable in one sentence; no fatal design flaw is visible in the abstract; prior work has not already done this (unverified; see the probes below); no reproducibility failure is on file.

**Concerns passed to the referees (not reviewed by the editor):**
1. **Identification of the measured object.** The surge basket is selected on the outcome, and the permutation test gives p = 0.58. The 26 priority-list lines outside the basket give γ = 1.94 (bootstrap p = 0.035). Is that enough independent support?
2. **Power and confounding of the investment null.** Four post-shock years; power is 80% only against a rise of about 80%. The January 2022 unrest, compliance risk and the nationalisations are named confounders. Deal data under-cover greenfield investment.
3. **Calibration-dependence of the value-capture headline.** The 6–14% margin is chosen, not estimated, and the matched-cell figure of 34% is left unreconciled.
4. **Can the framework discriminate between the gates?** Only the market-access gate is pinned down, and only jointly with a margin condition that the paper itself calls possibly circular.
5. **Scope of Sections 10–12.** The policy material is long and normative, including levers on the Chinese side and a January–July 2026 manufacturing-expansion argument, relative to what is identified.

**Internal consistency flags (minor; checked by the editor):**
- §5.2 reports a Newey–West sup-F of 326 and then says "The sup-F is computed without a HAC correction." The two statements read as contradictory.
- §4 says the monthly data are used "for break timing and the event study", but Figure 2 is an annual HS6×year event study.
- §5.3 ("The reform confound") says the Kyrgyz Republic rose "on the same timing". Appendix E dates the Kyrgyz jump to 2019 and says it is "elevated", not a dated break.
- Appendix F places the Kazakhstan components search in Section 7; the main text has it in Section 8.
- The Table 1 row label "Priority list, overlapping (50 HS6)" is unclear.

**Blinding risk (for the editorial office):** The Data availability section gives the Mendeley Data DOI (doi:10.17632/zk2csn8wf6.1). Mendeley dataset pages usually show the depositor's name. The editor did not open it. Recommend masking it for review ("DOI withheld for blind review").

**Table format, against the profile's table rules:** Table 2 reports N and the clustering dimension, and its use of stars is explained. Row 1 of Table 2 deliberately shows no stars; acceptable and explained. Table 3 (deal counts) has no inference columns, acceptable for counts. No deviations that need action.

## Novelty probes

| Probe | Query | Result |
|---|---|---|
| 1 | "Kazakhstan re-exports to Russia 2022 sanctions value added investment response" | Returned only policy and news reporting on re-export volumes and Kazakhstan's screening and export bans (e.g. https://cabar.asia/en/re-export-hub-will-grey-schemes-of-sanctioned-goods-resale-to-russia-harm-kazakhstan ; https://www.fpri.org/article/2024/12/the-impact-of-russia-sanctions-on-central-asia/). No academic paper on value retained or an investment response surfaced. |
| 2 | "trade rerouting intermediary countries Russia sanctions domestic value added retained Central Asia Caucasus paper 2025" | Closest cousin found: Chupilkin, Javorcik and Plekhanov, "The Eurasian roundabout", **published in EER** (https://www.sciencedirect.com/science/article/abs/pii/S001429212600084X ; CEPR DP20097 https://cepr.org/publications/dp20097). It documents the rerouting through Armenia, Kazakhstan and the Kyrgyz Republic, and the offset to sanctions. The manuscript cites it and positions itself as the next step: what the host keeps and whether it invests. No paper found doing that step. |
| 3 | "high priority items" Russia Kazakhstan Armenia Kyrgyz exports difference-in-differences sanctions circumvention | Found the same Chupilkin et al. evidence and press reports on Common High Priority List flows (e.g. https://eurasianet.org/new-report-documents-how-central-asian-states-abet-russian-sanctions-busting). No competing host-country investment or value-capture study surfaced. |

**Novelty assessment:** Clear on the probes run, with one positioning point: the closest prior paper was published in EER itself. The submission must state plainly what it adds beyond documenting the flow. Its three additions are retained value added, the investment null, and the customs-union market-access mechanism.

**Claims the editor could not verify (author should cross-check):**
- (i) That no published or working paper already measures domestic value added retained by the post-2022 intermediaries. WebSearch misses paywalled work and very recent working papers. Possible near-cousins to check: EBRD *Regional Economic Prospects* chapters and IMF Article IV / Selected Issues papers for Armenia, Kazakhstan and the Kyrgyz Republic. Not retrieved; unverified.
- (ii) That no study tests for an investment or capacity response in these intermediaries.
- (iii) The paper's very recent sources: the QIC/AIFC/IFC report (Sept. 2026), the Bureau of National Statistics January–July 2026 industrial release, and the 10 August 2026 government policy review. Not checked.

## Send-out plan

Proceed to Phase 1b (referee selection).

## Referee Selection

**Pool (EER profile):** CREDIBILITY .22, MEASUREMENT .18, STRUCTURAL .17, THEORY .15, POLICY .14, SKEPTIC .14.

**Draw procedure:** No random-number generator was available in the editor's toolset. The editor fixed two uniform values, recorded here for audit.

- **Draw 1:** u1 = 0.31. Cumulative bands: CREDIBILITY [0, .22), MEASUREMENT [.22, .40), STRUCTURAL [.40, .57), THEORY [.57, .72), POLICY [.72, .86), SKEPTIC [.86, 1]. Result: **D1 = MEASUREMENT.**
- **Draw 2:** MEASUREMENT removed and the remaining weights renormalised. u2 = 0.87. Cumulative bands: CREDIBILITY [0, .268), STRUCTURAL [.268, .476), THEORY [.476, .659), POLICY [.659, .829), SKEPTIC [.829, 1]. Result: **D2 = SKEPTIC.**

**Role assignment:** SKEPTIC goes to the domain referee, to press the profile's top concern: why should a reader outside Eurasia care, and how far does the lesson travel? MEASUREMENT goes to the methods referee, because the paper's weak points are measurement-heavy: mirror data, outcome-selected baskets, a calibrated margin, and deal-database coverage. The two dispositions are distinct.

**Paper type (for the methods rubric):** **descriptive.** A quantitative case study with reduced-form components (break tests, a DiD the paper itself does not treat as identified, randomisation inference, a Poisson count test) and an organising framework it does not estimate. Under the profile, the methods referee's Mechanism / framework discrimination weight goes from 20 to 25, alongside Identification 38, External validity 15, Replication 8.

| Referee | Disposition | Critical peeve | Constructive peeve |
|---|---|---|---|
| Referee A (domain) | SKEPTIC | Any claim about "policy implications" must be supported by the data's support range | Rewards a clear "what this paper does not show" paragraph that honestly bounds the claims |
| Referee B (methods) | MEASUREMENT | Sample construction must be documented end-to-end (raw → analysis sample) | Appreciates when robustness checks are motivated by specific threats |

## REFEREE ASSIGNMENTS

**Referee A: Domain referee**
- **Disposition:** SKEPTIC
- **Critical peeve:** Any claim about "policy implications" must be supported by the data's support range.
  - Paper-specific target: Sections 10–12. These cover the levers in §11.1–11.3 (local-content triggers, capped guarantees, moving the state investment corporation (QIC) to a limited-partner role, corridor bargaining, and Chinese VAT-rebate and approval changes). They also cover the sector ranking in Table 5 and the 2026 manufacturing-expansion argument. All of this rests on one country, one shock, and gates that are not separately identified.
- **Constructive peeve:** Rewards a clear "what this paper does not show" paragraph that honestly bounds the claims.
  - Paper-specific target: the §12 Limitations section, the §8 statements on which gates the case cannot identify, and the explicit retreat from reading γ as an identified magnitude.
- **Paper type:** descriptive (quantitative case study + organising framework)

**Referee B: Methods referee**
- **Disposition:** MEASUREMENT
- **Critical peeve:** Sample construction must be documented end-to-end (raw → analysis sample).
  - Target 1: the deal universe. It goes from three raw extracts to N ≈ 500 to 493 after de-duplication, then through the ISIC crosswalk and greenfield/ownership-transfer flag to the 82-deal manufacturing, transport and distribution subset.
  - Target 2: the surge-basket selection rule, from 75 to 29 lines, including the floors and the $10k offset.
  - Target 3: mirror-data construction of the inbound flow, including China's missing 2025 data and Kazakhstan's 2024 monthly reporting gap.
  - Target 4: the steps behind the $479m increment and the 6–14% margin.
- **Constructive peeve:** Appreciates when robustness checks are motivated by specific threats.
  - Paper-specific target: each check is tied to a named threat: selection-rule-matched and trend-preserving permutations (outcome selection); PPML (zeros); Newey–West (persistence); wild-cluster bootstrap (few clusters); the leave-one-chapter-out (HS2) jackknife (concentration in HS 85); the purged-control residual-line DiD (overlap with the priority list); the margin sweep (Table D.1, calibration dependence).
- **Paper type:** descriptive. Methods rubric weights: Mechanism / framework discrimination 25, Identification 38, External validity 15, Replication 8.
