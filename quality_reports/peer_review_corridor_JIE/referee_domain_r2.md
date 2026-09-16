# Domain Referee Report — Round 2 (R&R)

**Calibrated to:** Journal of International Economics (JIE)
**Disposition:** THEORY
**Critical peeve:** No derived model behind the three-gate decomposition; the reference-class/falsifiability test.
**Constructive peeve:** Reward honest scope-fencing.
**Date:** 2026-09-16
**Paper:** `C:\Users\zh.kakishev\my-project2\Manuscript\corridor.tex`
**Round-1 report:** `quality_reports/peer_review_corridor_JIE/referee_domain.md` (58/100, Reject)

## Executive verdict

**Score:** 65/100 (was 58)
**Recommendation:** **Major Revision** (weakest form — see note to the editor)
**Headline:** The author took the cheap route I endorsed in round 1 and executed it correctly *in Section 3*, but did not cascade it: the abstract, the introduction, Section 8 and Section 11 still assert the stand-alone sufficiency that Section 3 now explicitly denies, so the paper currently contradicts itself on its central claim.

## Disposition of round-1 concerns

| # | Concern | Status |
|---|---|---|
| C1 | Three gates not separately necessary in the paper's own model | **Partial** |
| C2 | Market access not separated from no-comparative-advantage; VA multiplier ≠ transformation margin | **Partial** |
| C3 | No falsifiable prediction; Armenia GFCF runs against it | **Partial** (weak) |
| C4 | Trade-theoretic literature thin for JIE | **Partial** (near-resolved) |

### C1 — PARTIAL

Section 3's `eq:gates` paragraph is genuinely fixed. The offending sentence is gone and
replaced with the right one (ll. 337–342): "only two of the four observations above identify a
factor that alone drives the investment response to zero regardless of the others… The
market-access gate is different… an open gate… drives $R$ toward zero only jointly with a small
transformation margin, not on its own." And ll. 351–355 now concede the form is "not a result
derived from \eqref{eq:build} (whose threshold is on a sum, with the three considerations
interacting inside a single indicator rather than entering as separable multiplicative terms).
We do not claim, and do not need, that the three conditions are separately *necessary*." That
is exactly my round-1 route (b), and it is well done. Sections 9 (ll. 1043–1045, "which we do
not derive and do not treat as a necessity result") and 12 (ll. 1329–1330) were cascaded as
claimed.

The cascade stopped there. Four other passages retain the old claim:

- **Section 8**, l. 956–957: "In a multiplicative decomposition an open market-access gate is
  close to sufficient for $R \approx 0$ **on its own**." This is the sentence I quoted in round
  1, **verbatim and unchanged**, and it now directly contradicts Section 3.
- **Section 8**, l. 949: "Equation~\eqref{eq:gates} attributes the null to at least one factor
  near zero" — still reasoning *from* the decomposition.
- **Introduction**, ll. 144–146: "the market-access gate is plainly open…, which is close to
  sufficient for a null" — no joint-with-small-margin qualifier.
- **Section 11**, ll. 1219–1220: "a near-perfect substitute for production, which is close to
  sufficient **on its own** for a null."

**What would change my mind:** Propagate the Section 3 formulation to all four locations. Every
statement of the form "the open gate is close to sufficient" must carry the qualifier Section 3
now imposes ("jointly with $\mu_P \lesssim \mu_T$"), and l. 949 should reason from
`eq:build`'s scalar threshold rather than from `eq:gates`. This is an afternoon's work, not a
new paper — which is why C1 has moved from conceptual to editorial.

### C2 — PARTIAL

Observation (ii) is now correct and candid. ll. 280–287: the 0.69 multiplier "is a share of
gross output accruing domestically, not a per-unit margin, so it bears on $\mu_P$ only
loosely"; the near-zero base "is itself the outcome the paper is trying to explain, so citing
it as evidence for $\mu_P \lesssim \mu_T$ risks circularity." Both of my round-1 objections are
conceded in the author's own words. Observation (iii) (ll. 297–313) confronts export-platform
FDI head-on with the three citations, states that "$\mu_P$ and $V_T$ can rise together, and
\eqref{eq:build} on its own does not say which effect dominates," and concedes the paper
"cannot rule out that Kazakhstan's absence of an electronics industry is equally consistent
with the country simply lacking a comparative advantage in the sector, customs union or not."
That is the reframing I offered as the fallback, and it is honestly executed.

But no evidence separating the two channels was produced (neither of my routes (a) or (b) was
attempted), and — more seriously — **Section 8 still asserts as established fact exactly what
Section 3 has just disavowed.** l. 952–953: "because a domestic plant's transformation margin
**sits below** the thin re-export markup ($\mu_P \lesssim \mu_T$, **on the sector's near-zero
domestic base and its $0.69$ value-added multiplier**, Section~\ref{sec:framework})." The two
pieces of evidence cited there are the two Section 3 labels circular and only loosely relevant.
Section 8 then builds the entire "which gate binds" answer on that assertion.

**What would change my mind:** Rewrite l. 952–953 so it inherits Section 3's epistemic status
— "suggestive, not dispositive" — and re-derive the Section 8 conclusion under that weaker
premise, stating plainly what survives. If, as I suspect, what survives is "the market-access
gate is institutionally open, and we cannot determine whether it or the absence of comparative
advantage produces the null," then say that in Section 8, the introduction and the abstract,
not only in Section 3.

### C3 — PARTIAL (weak)

The Türkiye/Georgia check was attempted and is reported without spin (ll. 1096–1105): the
search "turned up no comparable project in either country. This does not confirm the
framework's prediction… a public-record search is a weak instrument… The prediction remains
untested at the standard the rest of the paper holds itself to." I asked for one out-of-sample
test executed rather than gestured at; a public-record search is a far weaker instrument than
the fDi Markets / Orbis count I specified, and the paper says so itself. Credit for attempting
it and for refusing to bank it as a confirmation.

The second half of my ask — pre-commit to an ex-ante measurable coding rule for $h$, $\rho$,
$\sigma$ and apply it mechanically to five episodes including one the framework gets wrong —
was not attempted. Consequently the post-hoc pattern survives intact: Table 5's `R↑ when`
column (ll. 1056–1068) is unchanged, with directions and no thresholds; the USMCA and
nearshoring reference cases (ll. 1112–1120) still have their gate values read off realised
outcomes; and the Section 12 paragraph on the 2026 manufacturing expansion (ll. 1359–1377)
still declares, after the fact, "exactly the configuration under which the framework predicts a
supply response." Armenia's GFCF (l. 1131) is unchanged and still not treated as a test.

**What would change my mind:** Unchanged from round 1 — a coding rule for the three gate
arguments that is measurable before the investment outcome is observed (statutory
local-content percentage; sanctions-package count; sunk-cost intensity from capital shares),
applied mechanically to at least five episodes, with the result reported including any the
framework gets wrong. Absent that, the framework should be presented throughout as a taxonomy
of the Kazakhstan case, with all reference-class and forward-looking language (Section 9's
contrast cases, Section 12's 2026 paragraph) removed or explicitly labelled as illustration.

### C4 — PARTIAL, near-resolved

Verified in `corridor.bib`: `handleylimao2015`, `handleylimao2017`, `bowncrowley2007`,
`brainard1997`, `helpmanmelitzyeaple2004`, `ekholmforslidmarkusen2007` are all present. More
importantly, two of the three additions are *integrated*, not padded. ll. 259–263 place
`eq:build` where I asked it to be placed: "The policy-contingent uncertainty that raises
$\Omega$ here is the same channel \citet{handleylimao2015,handleylimao2017} formalise and
estimate…; \eqref{eq:build} adds the re-export outside option $V_T$ to that channel, which is
the addition the market-access gate below turns on." That is the correct positioning and it
materially improves the paper's standing as a trade paper. Bown–Crowley is used substantively
in the contribution paragraph (ll. 162–165), not decoratively.

Still absent: the sunk-cost and entry-hysteresis literature (Roberts–Tybout 1997;
Das–Roberts–Tybout 2007; Impullitti–Irarrazabal–Opromolla 2013, *this journal*), which is the
literature that owns $I$ and $\Omega$; and the upgrading foils (Atkin–Khandelwal–Osman 2017;
Verhoogen 2008), which are the natural counterexamples to a claim about when demand shocks do
and do not induce capacity. Crozet–Hinz, Ahn–Ludema and Blonigen also remain uncited.

**What would change my mind:** Add and engage the entry-hysteresis trio where $I$ and $\Omega$
are introduced (one paragraph), and the two upgrading foils in Section 9 as the cases where a
demand shock *did* induce capacity investment, with a stated reason the configurations differ.
This is now a small, bounded task.

## NEW concerns (introduced by the revision)

### NEW-1: The abstract now contradicts Section 3 on the paper's central claim — MAJOR

Abstract, ll. 54–56: "We read the null through three gates — market access, irreversibility
and capital-market institutions — **each independently sufficient**, though not shown to be
independently necessary, to drive the response toward zero." Section 3, ll. 337–342, says
precisely the opposite for one of the three: the market-access gate is "different," and drives
$R$ toward zero "only jointly with a small transformation margin, **not on its own**."

Whether or not this abstract phrasing is new, the revision made it false. In round 1 the paper
asserted an unsupported *necessity* claim; it now asserts an unsupported *sufficiency* claim
that its own framework section explicitly denies 250 lines later. An editor reading only the
abstract would take away the opposite of what Section 3 establishes. Credit where due: the
abstract *did* drop the round-1 "which is close to sufficient for a null" clause from the
following sentence — so the abstract was edited, and this inconsistency was left standing in an
edited passage.

**What would change my mind:** Rewrite the abstract sentence to match Section 3 — e.g. "two of
which (irreversibility, institutions) would each drive the response toward zero on their own,
while an open market-access gate does so only jointly with a small transformation margin."

### NEW-2: The Limitations paragraph mis-signs the Türkiye/Georgia result — MAJOR

ll. 1400–1405: "the public-record searches in Sections~\ref{sec:why} and~\ref{sec:moderators}
for components-sector capacity in Kazakhstan and for a differential response in T\"urkiye and
Georgia… **all three show no reorientation-linked capacity where the framework would predict
one — consistent with, but not a confirmation of, the framework's cross-country prediction.**"

This inverts the sign. For Kazakhstan the framework predicts *no* capacity, and none was found
— consistent. For Türkiye and Georgia the framework predicts a processing response *would*
appear (l. 1089: "the framework predicts they are the more likely of the two groups to see a
domestic processing or assembly response"), and none was found — that is evidence *against*
the prediction, or at best uninformative given the weak instrument. Lumping all three together
as "consistent with" the framework is the one place in this manuscript where the author's
otherwise scrupulous reporting slips into the post-hoc accommodation C3 is about. Section 9
itself gets this right (ll. 1099–1104); the Limitations paragraph over-claims relative to it.

**What would change my mind:** Restate to match Section 9 — the Kazakhstan search is
consistent with the framework; the Türkiye/Georgia search is a weak-instrument null that fails
to find the predicted differential and is therefore not supportive, and the prediction remains
untested.

## Dimension scores

| # | Dimension | Weight (norm.) | R1 | **R2** | Weighted |
|---|---|---|---|---|---|
| 1 | Contribution & Novelty | 29.1% | 62 | **63** | 18.3 |
| 2 | Literature Positioning | 25.5% | 55 | **72** | 18.4 |
| 3 | Substantive Arguments | 18.2% | 60 | **66** | 12.0 |
| 4 | External Validity / Scope | 18.2% | 48 | **55** | 10.0 |
| 5 | Fit for JIE | 9.1% | 68 | **70** | 6.4 |
| | **Composite** | | 58 | | **65.1 ≈ 65/100** |

Dimension 2 moves most: the Handley–Limão integration is the single largest improvement in the
manuscript. Dimension 1 barely moves, and deliberately so — the revision's honesty has a cost,
in that by conceding it cannot rule out the comparative-advantage reading the paper has
relinquished the claim that made it a mechanism paper. I decline to penalise that concession;
the contribution was always this size, and round 1 was simply not admitting it.

## Positive observations

1. **The author took the cheaper of my two routes and took it properly.** I wrote in round 1
   that abandoning the necessity claim "would cost the paper nothing it can actually defend."
   Section 3 now does exactly that, and the parenthetical at ll. 351–353 explaining *why*
   `eq:gates` is not derivable — "whose threshold is on a sum, with the three considerations
   interacting inside a single indicator" — is a more precise statement of the problem than
   the one in my own report.
2. **Observation (ii) is a model of scope-fencing.** The author volunteers both of my
   objections against his own interest, including naming his own argument circular. Few
   revisions concede this cleanly.
3. **The Türkiye/Georgia search is reported as it should be.** A weak-instrument null found
   nothing, and the paper says it is a weak instrument, does not count it as a confirmation,
   and names the register that would do the job properly. NEW-2 is a slip in one sentence of
   the Limitations, not a pattern.
4. **The Handley–Limão positioning is correct and load-bearing.** `eq:build` is now explicitly
   a Handley–Limão-type problem with a re-export outside option added, which is both the right
   genealogy and the clearest statement of what is actually novel in the setup.

---

**Summary for the editor.** The revision is substantial and in good faith, and it moves my
score from 58 to 65. The literature gap that made this read as a development paper in trade
clothing is largely closed, and closed by integration rather than padding: `eq:build` is now
properly positioned as a Handley–Limão problem with a re-export outside option, and the
export-platform alternative is confronted rather than ignored. The theoretical over-claim I
identified as the paper's central flaw has been withdrawn *in Section 3*, in the author's own
words and correctly reasoned. What has not happened is the cascade: the abstract, the
introduction, Section 8 and Section 11 all still assert the stand-alone sufficiency of the
market-access gate that Section 3 now explicitly denies, and Section 8 still rests its answer
on the two pieces of evidence Section 3 has just labelled circular and category-confused. The
paper therefore currently contradicts itself on its headline claim — which is a serious
defect, but an editorial rather than a conceptual one, and fixable in a day. My remaining
conceptual objection is C3, unchanged: no prediction of this framework was ever at risk, no
ex-ante coding rule was introduced, and the Section 12 post-hoc paragraph survives. I record my
recommendation as the weakest form of Major Revision: if my co-referee also judges the
now-explicitly-reduced contribution — a descriptive value-capture measurement plus a documented
null with an admittedly non-identified interpretation — to fall short of JIE's contribution
bar, I would not dissent from reject-and-refer to a comparative or regional field journal,
where I continue to think this paper would be a welcome and well-executed publication.
