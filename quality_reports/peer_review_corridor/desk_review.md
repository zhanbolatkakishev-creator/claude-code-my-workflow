# Desk Review: "Corridor, Not Factory" — /review-paper --peer JCE

**Calibrated to:** Journal of Comparative Economics (JCE)
**Date:** 2026-09-01
**Paper:** `Manuscript/corridor.tex` (1,110 lines, ~11,200 words); commit `b2c3368`
**Paper type:** `theory+empirics` / `descriptive` hybrid
**Novelty check:** ON (3 probes)
**Cross-artifact Phase 0:** PASS — `quality_reports/cross_artifact_corridor/reproducibility.md` (118 PASS / 0 FAIL / 1 EXPLAINED / 3 UNMATCHED).

> Reconstructed from the editor agent's completion payload (the subagent could not write to disk).

## Calibration re-weightings passed to referees

**Domain referee:** Contribution 30→**28**; Lit positioning 25→**25**; Substance 20→**22**; External validity 15→**18**; Fit 10→**7**.
**Methods referee:** Identification 35→**30**; External validity / generalisation 15→**20**; Replication 5→**8**; Mechanism / framework discrimination 20→**25**.
Bar: "A well-identified result, *or* a sharp framework applied to a case that teaches us something general." Table override: stars permitted; SE in parentheses; **N per specification**.

## Verdict: **SEND OUT**

Desk-reject checks all clear: fit is core JCE territory; three contributions stated, the primary one in a sentence; the abstract concedes its own identification limits (not a desk-reject under JCE weighting); not a measurement note, not advocacy-without-spine; reproducibility PASS. Against the three JCE case-study criteria: (1) phenomenon **well measured** — strongest part of the paper; (2) analytical spine **partially discriminates** — the durable-vs-transitory auto comparison varies ρ, *I* and local-content bindingness at once, which is the central referee question (framework-discrimination weighted to 25); (3) external validity **framed honestly** — §9 "What we cannot show here" names the collinearity and the counter-evidence (Armenia's GFCF rose ~3pp post-2022).

## Novelty probes

- **Probe 1** (host-economy value retention / investment response): only policy/IFI material (OECD, EBRD, World Bank Middle Corridor). **No academic paper on host-economy value retention or the investment response.**
- **Probe 2** (Chupilkin et al.): both confirmed as *sanctions-efficacy* papers — object of interest is the sanctioned economy's import replacement, not the intermediary's retained value added. Manuscript's §1 positioning is accurate, not strawmanned.
- **Probe 3**: literature is theoretical/macro or policy. **One near-cousin — UNVERIFIED**: a ResearchGate item on Georgia becoming a refining/export platform (`researchgate.net/publication/401854161`). Editor could not verify (no author/venue/date). **Manual check for the author; cite if real.**

**Novelty assessment: Clear**, with the one item flagged for manual cross-check.

## Editor's steers for the referees

1. **Transitory premise vs. the paper's own four-year series.** §7 asserts "the transitory condition is observed, not assumed" on a monthly 2023 fall, but Table 1 shows exports to Russia flat at ~10× baseline (128/145/119/133 USDm) through 2025, and §9 concedes "Kazakhstan's persist." Low ρ carries §7's conclusion. → **methods**.
2. **DiD magnitude not separable from selection, by the paper's own test** (free-permutation placebo γ ≈ 2.8 > observed 2.44). Rule on whether "about threefold" may stay in the abstract/§1. → **methods**.
3. **Load-bearing evidence co-published by the author's employer** (`qicaifcifc2026pe`, QIC/AIFC/IFC) supplies the §6–§7 state-fund pipeline evidence while §10 makes recommendations about the same investor. Full disclosure footnote credited; not a misconduct question. It *is* a question of how much weight a non-baselined aggregate from an interested source carries. → **domain**.
4. **Weight-ratio evidence.** §5.1 reads a re-export/import tonnage ratio of 0.08 as "no weight gain"; equally consistent with most imported tonnage never leaving Kazakhstan. → **methods**.

**Formatting flags (JCE):** `tab:did` reports N in the caption only; `tab:dealsource` / `tab:priority` report neither N nor SE (override needs N per spec). `plainnat` bib style — switch at submission. Line 33 "Preliminary draft … please do not cite" — remove at submission.

## Referee selection

Pool: STRUCTURAL 0.22 / THEORY 0.20 / POLICY 0.20 / MEASUREMENT 0.18 / CREDIBILITY 0.12 / SKEPTIC 0.08.
Draw 1 → **POLICY** (domain). Draw 2 (POLICY removed, renormalised) → **MEASUREMENT** (methods).

| Referee | Disposition | Critical peeve | Constructive peeve |
|---|---|---|---|
| **A** (domain) | **POLICY** | Is §10 disciplined by the framework or a wish list? Every recommendation must map to a named gate + a §4–§8 quantity; the untestable China levers and the Vietnam/Mexico contrast cases must be fenced off from the positive results. | Rewards an honest statement of the population the case is a case *of* and how far conclusions travel — credit §9/§11 for bounding the generalisation and naming counter-evidence. |
| **B** (methods) | **MEASUREMENT** | Value capture rests on a hand-set 6–14% *m* while the I-O step "does no work" — how much of the headline is calibration? Demand a full sensitivity map over *m*, a defence of the band vs. the rejected data-driven alternatives, and extend to the §5.1 weight-ratio-0.08 inference and the §4.3 selection/permutation problem. | Rewards genuine discrimination of the three gates — credit §7 for stating why its tests are not clean, then rule on whether what remains identifies a binding gate. |

```
decision: SEND_OUT
referee_domain: {disposition: POLICY}
referee_methods: {disposition: MEASUREMENT}
```
