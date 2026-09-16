# Domain Referee Report

**Calibrated to:** Journal of International Economics (JIE)
**Disposition:** THEORY
**Critical peeve:** No derived model — the three-gate decomposition (Eq. 2) and the mediation restatement are asserted organising devices, not results; plus the reference-class/falsifiability test.
**Constructive peeve:** Reward honest scope-fencing.
**Date:** 2026-09-15
**Paper:** `C:\Users\zh.kakishev\my-project2\Manuscript\corridor.tex`

## Executive verdict

**Score:** 58/100
**Recommendation:** **Reject** (resubmission to a comparative/regional field journal strongly encouraged; a JIE-viable version is a different paper)
**Headline:** The paper's central causal claim — that an open market-access gate is "close to sufficient" for the investment null — is derived not from its own model but from a multiplicative functional form the authors concede is asserted, and in the model as written (Eq. 1) the three gates are *not* separately necessary, so the interpretive apparatus that carries Sections 7–12 does not follow from the theory that precedes it.

## Dimension scores

JIE profile adjustments (32/28/20/20/10) sum to 110; I normalise to 100 and report both.

| # | Dimension | Weight (adj. → norm.) | Score | Weighted |
|---|---|---|---|---|
| 1 | Contribution & Novelty | 32 → 29.1% | 62/100 | 18.0 |
| 2 | Literature Positioning | 28 → 25.5% | 55/100 | 14.0 |
| 3 | Substantive Arguments | 20 → 18.2% | 60/100 | 10.9 |
| 4 | External Validity / Scope | 20 → 18.2% | 48/100 | 8.7 |
| 5 | Fit for JIE | 10 → 9.1% | 68/100 | 6.2 |
| | **Composite** | | | **57.9 ≈ 58/100** |

## Major concerns

### Concern 1: The three gates are not separately necessary in the paper's own model

**Dimension:** 3 (and 1)
**Severity:** MAJOR

Eq. (1) is a scalar threshold: build iff `μ_P Q/(1−ρ/(1+r)) − I > Ω(σ,ρ) + V_T`. Eq. (2) rewrites this as a product `R = f(·)×h(·)×g(·)` and states that "its content is that the three conditions are separately necessary" (l. 306–307). That claim is false in Eq. (1). A sufficiently large `μ_P` clears the threshold *with* `V_T` large — i.e. with the market-access gate wide open. Necessity of a closed market-access gate is not a property of the model; it is a property of the multiplicative form, which the authors concede is "an organising device, not a result derived from (1)" (l. 303–305).

This is not a presentational quibble, because the paper's headline inference runs through it. Section 7: "*In a multiplicative decomposition* an open market-access gate is close to sufficient for R ≈ 0 on its own" (l. 862–863, emphasis mine). The sufficiency is conditional on the decomposition; the decomposition is asserted; and the abstract then reports the conditional conclusion unconditionally ("The case identifies an open market-access gate... which is close to sufficient for a null"). The chain is circular: the functional form that makes the gate diagnostic is the only evidence that the gate is diagnostic.

**Why this matters:** Every substantive claim in Sections 7, 9, 10 and 12 — which gate binds, which policy lever works, why the auto sector responded — reasons from Eq. (2), not Eq. (1). If Eq. (2) is not derivable, the paper's interpretive core is an assumption presented as a finding.

**What would change my mind:** Derive a condition under which the three factors are genuinely separately necessary — e.g. state the entry problem with a fixed cost and a profit function in which market access enters `μ_P − μ_T` multiplicatively rather than as a stand-alone indicator, and show that the threshold is monotone in each argument with a zero at each boundary. Alternatively, abandon Eq. (2) entirely and reason throughout from Eq. (1)'s scalar threshold, restating every downstream claim as a statement about the sign of `μ_P − μ_T − (I + Ω)/PV` rather than about "which gate binds." The second route is cheaper and would cost the paper nothing it can actually defend.

### Concern 2: The "market-access gate" is not separated from the absence of comparative advantage — and the relevant trade theory predicts the opposite sign

**Dimension:** 3 and 2
**Severity:** MAJOR

The mechanism is: customs union ⇒ trade substitutes for production ⇒ no entry. But a customs union with the destination market is precisely the configuration under which the export-platform FDI literature (Ekholm, Forslid and Markusen 2007) and the proximity–concentration trade-off (Brainard 1997; Helpman, Melitz and Yeaple 2004) predict that production *locates in the member country* to serve the bloc tariff-free. Union membership lowers the cost of serving Russia from a Kazakh plant just as it lowers the cost of re-exporting; it shifts `μ_P` and `μ_T` together, and Eq. (2) treats it as moving only one.

The paper's escape is `μ_P ≲ μ_T`, justified by "the sector's near-zero domestic base (≈$230m of electronics output) and its low value-added multiplier (0.69)" (l. 259–263). Both justifications are problematic. A near-zero domestic base is the *outcome* being explained, not an independent parameter — inferring that production is unprofitable from the absence of production is circular. And a domestic value-added multiplier is a share of gross output accruing domestically; it is not a per-unit transformation margin. Conflating `(v_d'L_d)_j = 0.69` with `μ_P` is a category error, and the paper leans on it twice more (Sections 7 and 11).

Once `μ_P ≲ μ_T` is the operative condition, the honest reading of the null is the trivial one: Kazakhstan has no comparative advantage in electronics assembly, so no plant would have been built with or without a customs frontier. That is a real and defensible finding — but it is not the paper's finding, and it is not a JIE-level mechanism.

**What would change my mind:** Evidence that separates the customs-union channel from the comparative-advantage channel. Two concrete routes: (a) a within-Kazakhstan comparison of lines where EAEU local-content or technical-regulation requirements bind against otherwise similar lines where they do not, holding sector value-added multipliers roughly constant; (b) an explicit treatment of why the export-platform prediction fails here, with a stated parameter restriction under which union membership lowers `μ_T` by more than it raises `μ_P`, and some evidence on that restriction. Absent either, drop "market access" as a separately identified gate and reframe the paper as a comparative-advantage/value-capture result.

### Concern 3: The framework generates no prediction that a reader could have checked and found wrong

**Dimension:** 4
**Severity:** MAJOR

The paper claims membership in a general class: "a trade-policy-driven demand shock that does not induce production." I applied the reference-class test to the three episodes the manuscript itself invokes.

- **USMCA rules of origin** (l. 1004–1007): the framework predicts a supply response via a closed market-access gate. But the gate value is *read off the outcome* — we know autos relocated, so the gate is coded closed. No independent measurement of `h` is offered, and no threshold is specified at which a rule of origin counts as binding.
- **Nearshoring / China-plus-one (Vietnam, Mexico)** (l. 1001–1009): coded as "structural" (high `ρ`) with a citation to Juhász–Lane–Rodrik. `ρ` is again assigned after the investment outcome is observed. The framework would equally comfortably have accommodated a null in Vietnam by invoking high `σ`.
- **Türkiye and Georgia** (l. 984–999): this is the *only* genuine differential prediction the paper makes — non-members face a customs border, so "the framework predicts they are the more likely... to see a domestic processing or assembly response." The paper then states it cannot test this ("our deal data are Kazakhstan-only"). The single falsifiable implication is left unchecked.

Meanwhile the one out-of-sample quantity the paper does observe runs against it: Armenia shares Kazakhstan's value on *every* moderator in Table 5, and Armenia's GFCF "rose about three points of GDP after 2022" (l. 1019–1020). The paper fences this honestly as "too noisy," which is fair on its own terms — but it is also the closest thing in the manuscript to a test the framework could have failed, and it is not treated as one.

The same post-hoc pattern recurs in the Section 12 paragraph on Kazakhstan's 2026 manufacturing expansion: the growth is declared "exactly the configuration under which the framework predicts a supply response" after the outcome is known. Nothing was at risk.

**Why this matters:** JIE's bar is a mechanism "that a trade economist anywhere would recognise as adding to a live debate." A framework whose gate values are assigned from realised outcomes is a labelling scheme, not a mechanism, and it cannot travel.

**What would change my mind:** One out-of-sample test executed, not gestured at. The cheapest is a greenfield-announcement count (fDi Markets or Orbis Cross-border Investment — the paper already names these in its limitations) for surge-basket-adjacent sectors in Türkiye and Georgia versus Kazakhstan, Armenia and the Kyrgyz Republic, 2015–2025. The framework predicts a positive differential for the non-members. If it appears, the market-access gate has content; if it does not, the paper should say so. Alternatively, pre-commit to a coding rule for `h`, `ρ`, `σ` that is measurable *ex ante* (e.g. statutory local-content percentage, sanctions-package count, sunk-cost intensity from BEA/ORBIS capital shares) and apply it mechanically to five episodes including at least one the framework gets wrong.

### Concern 4: The paper's trade-theoretic literature is thin for JIE

**Dimension:** 2
**Severity:** MAJOR

The bibliography is strong on development/institutions (Khanna–Palepu, Rajan–Zingales), value-added accounting (Koopman, Johnson–Noguera), entrepôt (Feenstra–Hanson, Fisman–Wei) and the post-2022 policy literature (Chupilkin et al., Simola). It is close to silent on the literatures a JIE referee would consider load-bearing here:

- **Trade policy uncertainty and investment** — Handley (2014), Handley and Limão (2015, 2017). The paper's central irreversibility story *is* their story, with their model, and they are not cited. This is the single most conspicuous omission.
- **Trade deflection and third-country rerouting under trade policy** — Bown and Crowley (2007, 2010). This is the general class the paper claims membership in, already formalised and estimated.
- **Proximity–concentration and export-platform FDI** — Brainard (1997), Helpman–Melitz–Yeaple (2004), Ekholm–Forslid–Markusen (2007); tariff-jumping FDI (Blonigen 2002). See Concern 2.
- **Sunk costs and entry hysteresis** — Roberts and Tybout (1997), Das–Roberts–Tybout (2007), Impullitti–Irarrazabal–Opromolla (2013, *JIE*).
- **Demand shocks that *did* induce upgrading** — Atkin, Khandelwal and Osman (2017); Verhoogen (2008). These are the natural foils: a demand shock that produced capacity/quality investment, and the reason differs in a way the paper could exploit.
- **Sanctions and firm-level trade** — Crozet and Hinz (2020), Ahn and Ludema (2020).

**Why this matters:** The paper reads as a development/institutions paper wearing trade clothes. A JIE reader will not accept a new three-gate framework when two of the three gates have twenty-year formal literatures the paper does not engage.

**What would change my mind:** A framework section that positions Eq. (1) explicitly as a special case of Handley–Limão with a re-export outside option, and a market-access discussion that confronts the export-platform prediction head-on. This is not a citation-padding request — engaging these papers would materially change how Eq. (2) is written.

## Minor suggestions

- Eq. (1) adds `Ω(σ,ρ)` and `V_T` on the RHS. In a standard real-options formulation the value of waiting already embeds the interim payoff from the outside option; adding them double-counts. Either derive `Ω` conditional on trading in the interim, or note the approximation.
- The mediation restatement (l. 315–330) is a third framing of the same content, explicitly "not a model we estimate," with no firm-level panel behind it. It adds no prediction beyond Eq. (2) and one paragraph of exposition. I would cut it.
- The abstract says the case "rules out capital-market institutions as the binding constraint," but Section 7 concedes the QIC evidence is "illustrative rather than a controlled test (the report gives no pre-2022 baseline and no sector-level denominator)" (l. 885–886), and Section 12 adds that QIC's "mandate and its cross-border-compliance exposure cloud the comparison." "Rules out" oversteps a fence the paper itself sets 30 pages later. Harmonise to the Section 7 language.
- Section 10 (Policy implications, ~4 pages, including a subsection of levers for China offered as "hypotheses the paper cannot test") is the kind of forward-looking normative writing JIE explicitly does not publish. Compress to one paragraph or move it out.
- Table 5's `R↑ when` column assigns each moderator a direction but no magnitude or threshold; as written it cannot discriminate between cases. See Concern 3.

## Positive observations

1. **The scope-fencing is exemplary and I want to say so plainly.** This paper does something rare: it states what it cannot show, in the place where a reader would be tempted to over-read, and it does so consistently. "Whether irreversibility independently binds cannot be settled here"; "the coefficient's magnitude is not separable from the selection and we do not read it as an identified effect size" (l. 526–530); the durable-vs-transitory auto comparison "moves more than one gate at a time"; the deal test "rules out only a large one"; and, most creditably, the manuscript volunteers that Armenia's GFCF moved *against* its mechanism rather than burying it. Several of these are facts a less scrupulous author would simply have omitted. My concerns above are not re-litigations of these fences — they are about the places where the fences are inconsistent (the abstract's "rules out") or where what remains inside the fence is too small for this journal.

2. **The value-capture measurement is a genuine contribution and is handled with unusual honesty.** The 6–14% margin is labelled a calibration, the input–output step is disclosed as doing "almost no work," and the full sweep is given with the exact margin at which each qualitative reading breaks (a tenth up to `m ≈ 12%`, a fifth at 19%, a third at 32%). That is better practice than most published calibrations. My residual objection is presentational only: with the propagation step near the identity, the paper leads with "5–11 cents" where a band-first presentation would be more defensible.

3. **The selection-rule-matched permutation test is the right instinct, honestly reported against the authors' own interest.** Finding that `γ = 2.44` sits inside the rule-matched null (`p = 0.58`) while the basket's *existence* is not a chance artefact (`p < 0.001`) is a careful distinction, and the authors draw the conservative conclusion from it rather than the convenient one.

---

**Summary for the editor.** This is a conscientious, well-documented, honestly-fenced paper that I would be glad to see published — in a comparative or regional field journal, where the descriptive value-capture measurement and the corridor fact carry the paper on their own. For JIE it falls short on the dimension the profile weights most heavily after contribution: there is no derived mechanism. The formal model is stated and then set aside; the apparatus that actually does the interpretive work is conceded to be an organising device whose key property (separate necessity) is false in the model it supposedly summarises; and the framework's only differential prediction is left untested while the one observable out-of-sample fact runs the other way. The revision that would fix this — a derived entry model confronting export-platform FDI, plus a cross-country greenfield panel — is a new paper, not a revision.
