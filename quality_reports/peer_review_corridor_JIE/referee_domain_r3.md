# Domain Referee Report — Round 3 (final)

**Calibrated to:** Journal of International Economics (JIE)
**Disposition:** THEORY
**Critical peeve:** No derived model behind the three-gate decomposition; the reference-class / falsifiability test.
**Constructive peeve:** Reward honest scope-fencing.
**Date:** 2026-09-16
**Paper:** `C:\Users\zh.kakishev\my-project2\Manuscript\corridor.tex`
**Prior rounds:** `referee_domain.md` (58/100, Reject); `referee_domain_r2.md` (65/100, Major Revision, weakest form)

## Executive verdict

**Score:** **73/100** (was 58, then 65)
**Recommendation:** **Minor Revision** — every concern I made a condition is discharged; the residue is polish. See the note to the editor on the separate question of level.
**Headline:** The cascade I demanded in round 2 was executed completely and at every location I named; the paper no longer contradicts itself on its central claim, and the literature gap is now closed by genuine analytical integration rather than citation. My one standing objection (C3) is unchanged and, per the editor's scope ruling, I do not press it further — but it is why my contribution score stays where it is.

## Verification of the six items put to me

I read the manuscript end to end rather than relying on the response letter. All six check out.

1. **C1 cascade, all four locations.** `:993–994` (§7) — "An open market-access gate is close to sufficient for $R\approx0$ **only jointly with that margin condition, not on its own**"; the round-1 sentence I quoted verbatim in r2 is gone. `:980–982` (§7 opening) now reasons from `eq:build` exactly as I asked: "`eq:build`'s threshold is on a sum, not a product, so no single term of `eq:gates` is dispositive on its own." Intro `:157–158` and §11 `:1269–1271` both carry the joint-margin qualifier. A whole-file grep for "close to sufficient" returns three hits, all correctly qualified; "separately necessary" and "independently sufficient" return nothing. **Fully fixed.**
2. **§7's treatment of the circular evidence.** `:984–991` now inherits §3's epistemic status verbatim — "suggestive, not dispositive," the 0.69 multiplier "bears on $\mu_P$ only loosely," the near-zero base "is itself the outcome the paper is trying to explain and so risks circularity" — and, crucially, the conclusion is re-derived under the weaker premise rather than restated: "if it does not [hold], the null is equally consistent with Kazakhstan simply lacking a comparative advantage in the sector, customs union or not… we observe a single configuration, with no gate clearly favourable and the three not separately identified." That is the sentence I said in r2 was the honest residual, and the author has written it into §7, the abstract (`:61–64`, "together with suggestive (not dispositive) evidence") and the Discussion. **Fixed.**
3. **Abstract vs §3 (NEW-1).** `:57–60` now reads: "An extreme irreversibility configuration or a capital market that cannot fund the projects that pass would each drive the response toward zero on their own; an open market-access gate does so only jointly with a small transformation margin, not by itself." That is §3's asymmetric claim, transcribed. **Fixed.**
4. **Limitations (NEW-2).** `:1455–1462` now separates the two searches exactly as asked: the Kazakhstan search "finds no capacity where the framework predicts none, which is consistent with the framework; the Türkiye/Georgia search finds no differential response where the framework predicts one *would* appear… which is a weak-instrument null that fails to find the predicted difference and is therefore **not supportive of the prediction, not consistent with it**." **Fixed**, and fixed in the harder direction, against the author's interest.
5. **The four new citations.** Present in `corridor.bib` with correct bibliographic detail (Roberts–Tybout AER 87(4):545–64; Das–Roberts–Tybout *Econometrica* 75(3):837–73; Atkin–Khandelwal–Osman QJE 132(2):551–615; Verhoogen QJE 123(2):489–530), and — the part that matters — **integrated, not name-dropped**. `:278–282` uses the structural entry-cost estimates to make a substantive point about `eq:build`: entry costs an order of magnitude above per-period profits and heterogeneous across producers, "which is why credible persistence, not merely large expected demand, is what moves the entry margin." `:1160–1170` uses the two upgrading foils precisely as foils on the paper's own parameter: in both Egypt and Mexico "$V_T$ is effectively unavailable… so the shock's effect passes through the market-access gate into $\mu_P$ and $I$ rather than being absorbed as $V_T$, the opposite of the Kazakhstan configuration." That is the analytical use I specified, and it strengthens the framework by showing it discriminates between two known cases.
6. **"Rules out."** Gone. Seven locations now read "is inconsistent with … as the binding constraint for this null" (`:160, 188, 380, 997, 1062, 1386, 1432`). The four surviving "rule(s) out" strings are all legitimate (statistical power; "cannot rule out").

I also note, in passing and outside my remit, that `06_mechanism_tests.R:60–67` now describes the components search consistently with §7 — the manuscript/repository contradiction my co-referee raised as N2 no longer exists on either side.

## Disposition of all prior concerns

| # | Concern | R2 | **R3** |
|---|---|---|---|
| C1 | Three gates not separately necessary in the paper's own model | Partial | **Resolved** |
| C2 | Market access not separated from no-comparative-advantage; VA multiplier ≠ transformation margin | Partial | **Resolved** (as a concession, not as evidence — see below) |
| C3 | No falsifiable prediction; gate values assigned post hoc | Partial (weak) | **Partial — unchanged; not pressed** |
| C4 | Trade-theoretic literature thin for JIE | Partial (near) | **Resolved** |
| NEW-1 | Abstract contradicts §3 on sufficiency | MAJOR | **Resolved** |
| NEW-2 | Limitations mis-signs the Türkiye/Georgia null | MAJOR | **Resolved** |

**On C2.** What was resolved is the epistemic inconsistency: the paper no longer asserts in §7 what it disavows in §3. What was *not* produced, in any round, is evidence separating the customs-union channel from the absence of comparative advantage — neither of my routes (a) or (b) was attempted. The paper now says so itself, in §3, §7, the abstract and the Discussion. I count that as resolution because the claim has been withdrawn to the level the evidence supports; but the editor should be clear that the mechanism the title promises is, on the paper's own account, one of two readings it cannot distinguish.

### C3 — Partial, unchanged, and my standing dissent

No ex-ante coding rule for $h$, $\rho$, $\sigma$ was introduced, so gate values in the reference class are still read off realised outcomes. `:1150–1158` (Vietnam/Mexico/USMCA) still concludes "This is the pattern the framework predicts"; `:1425` still says the 2026 manufacturing expansion is "exactly the configuration under which the framework predicts a supply response," after the outcome is known; Armenia's GFCF rising three points of GDP (`:1181`) is still reported but not treated as the test it is. Partial credit is due for labelling: the contrast cases are now introduced as "motivating contrast cases," and §10 `:1080–1087` states plainly that the framework's "empirical content is not in the functional form of `eq:gates`, which we do not derive and do not treat as a necessity result." The framework is therefore now honestly presented as a taxonomy of one case — which is what I asked for as the fallback.

The editor placed the mechanical five-episode test outside the R&R's scope, and this is the final round. **I do not press C3 as a condition.** I record it as the reason my Contribution score does not move much: a taxonomy whose parameters are assigned ex post cannot travel, and travel is what the contribution claim rests on.

**What would change my mind (for a future paper, not this revision):** the coding rule specified in rounds 1 and 2 — statutory local-content percentage for $h$, sanctions-package count for $\sigma$, capital-share sunk-cost intensity for $I$ — applied mechanically to five or more episodes, reported including any the framework gets wrong.

## Dimension scores

| # | Dimension | Weight (norm.) | R1 | R2 | **R3** | Weighted |
|---|---|---|---|---|---|---|
| 1 | Contribution & Novelty | 29.1% | 62 | 63 | **66** | 19.2 |
| 2 | Literature Positioning | 25.5% | 55 | 72 | **84** | 21.4 |
| 3 | Substantive Arguments | 18.2% | 60 | 66 | **80** | 14.6 |
| 4 | External Validity / Scope | 18.2% | 48 | 55 | **63** | 11.5 |
| 5 | Fit for JIE | 9.1% | 68 | 70 | **73** | 6.6 |
| | **Composite** | | 58 | 65 | | **73.3 ≈ 73/100** |

Dimension 3 moves most (+14): the self-contradiction that was the round-2 headline is gone, and the §7 rewrite re-derives its conclusion under the weaker premise instead of merely relabelling it. Dimension 2 (+12) reflects the entry-hysteresis and upgrading-foil integration. Dimension 1 moves only +3, deliberately: the corroboration reversal firms the central empirical fact, but the theoretical contribution is what C3 says it is.

## New concerns

**None rising to MAJOR.** I checked the propagation of the corrected residual-line DiD ($\gamma = 1.94$, wcb $p = 0.035$) through every location it touches — abstract `:48–51`, intro `:113–124`, Table 2 and its notes, Table C.1 `:1585–1586`, Limitations `:1469–1474` — and found no surviving trace of the withdrawn null (no stale "$-0.15$", "$p = 0.87$", or "indistinguishable from zero"). The revision is internally consistent on this.

## Minor suggestions (for the copy pass; none require a further round)

- `:122–123` and `:1472–1473`: "the residual lines move in the same direction at **roughly a fifth** of the shared lines' scale." A reader will compute $1.94/2.88 \approx 0.67$ and be confused. The "fifth" is the gross level-ratio comparison ($2.4\times$ vs $11.6\times$); say which comparison it is, once.
- `:377–378`: §3's closing summary says the gate is close to sufficient "jointly with **the sector's low transformation margin**" — a flat assertion, softened only by the trailing parenthetical. This is now the one place in the manuscript where the margin is stated as fact rather than as the conditional the rest of the paper uses. Two words fix it ("with a low transformation margin, if that comparison holds").
- `:995–996`: "with no gate clearly favourable" sits oddly one sentence before the state-fund argument, which is precisely a claim that the institutional gate *was* favourable for QIC and still produced no build. Reword.
- Impullitti–Irarrazabal–Opromolla (2013), *this journal*, remains uncited alongside the two entry-hysteresis papers now added; Blonigen (2002) on tariff-jumping FDI would cost one clause in observation (iii). Both are optional.
- Section 11 remains ~4 pages of normative policy writing, including a subsection of levers for China labelled "hypotheses the paper cannot test." My round-1 view is unchanged: JIE does not publish this. It is now clearly fenced (`:1264–1265`), so I raise it only as an editorial preference.

## Positive observations

1. **The revision did the hardest thing available to it, twice.** In round 2 the author withdrew the necessity claim in his own words. In round 3 he rewrote the Limitations to say that one of his two searches is *not supportive of his own prediction* — where the easy move, and the move the previous draft made, was to lump both under "consistent with." That sentence (`:1458–1461`) is the single most creditable thing in the manuscript, and it is the exact form of scope-fencing I said in round 1 I wanted to reward.
2. **The cascade was complete, not selective.** I named four locations; all four are fixed, and the §7 opening was additionally re-grounded in `eq:build`'s scalar threshold rather than patched at the sentence level. That is the difference between answering a referee and understanding him.
3. **The new literature is load-bearing.** Atkin–Khandelwal–Osman and Verhoogen are not cited as related work; they are used to show the framework distinguishes cases, by identifying the *same* parameter ($V_T$ unavailable) as the thing that differs. Das–Roberts–Tybout is used to support the specific claim that persistence, not expected demand size, moves the entry margin — which is the paper's own argument about $\rho$ and $\sigma$. This is how a literature section should read.
4. **The empirical correction strengthened the paper and was propagated honestly.** The residual-line result reversed in the author's favour, and the surrounding language did not over-claim in response: "partial, smaller-scale corroboration rather than a fully independent replication" (`:1473–1474`) is a fair description of $\gamma = 1.94$ against $2.88$.

---

**Summary for the editor.** All six items I put to this round verify. C1, C2, C4, NEW-1 and NEW-2 are resolved — verified by reading the manuscript and the `.bib` directly, not the response letter. The paper that contradicted itself on its headline claim in round 2 now states one consistent claim in the abstract, the introduction, §3, §7, §11 and the Discussion, and states it at the strength the evidence supports: an open market-access gate that is close to sufficient only jointly with a small transformation margin, with suggestive-not-dispositive evidence for that margin and an explicitly acknowledged alternative reading (no comparative advantage) the case cannot exclude. **I have no remaining conditions.** My score is 73.

Two things the editor should weigh separately from that. First, C3 is unresolved and will stay unresolved: no prediction of this framework has been put at risk, and the reference-class and forward-looking passages still assign gate values after outcomes are known. The paper now fences this honestly, so it is no longer a defect of integrity — but it does cap the framework at a taxonomy of one case. Second, and consequently, what the paper contributes is a well-documented corridor fact with a verified break date, a transparent and honestly-bounded value-capture calibration, and a documented investment null with stated power — plus an organising device the author explicitly declines to derive. I score that 66 on contribution for JIE. **Whether 66 clears this journal's bar is a level judgment that belongs to the editor, not a revision I can ask for**, and I will not dissent from either decision: if the editor judges the contribution sufficient, the manuscript is in publishable shape after the copy items above; if not, this is now a strong, unusually scrupulous paper that a comparative or regional field journal should take essentially as it stands, and it has been materially improved by all three rounds.
