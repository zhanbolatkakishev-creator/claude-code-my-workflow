# Submission package: European Economic Review — Special Issue "Global Trade Fragmentation and Regional Trade Alliances"

Target: *European Economic Review* (ISSN 0014-2921), Elsevier Editorial Manager
(`editorialmanager.com/eerev`). Special issue guest-edited by Luu Duc Toan Huynh (Queen Mary
University of London), Chang Ma (Fudan University), Davin Chor (Dartmouth Tuck), and Viet Hoang
Nguyen (University of Melbourne). **Submission deadline: 31 March 2027.** Short Special Issue
Name to select in the portal: **`VSI: Global Trade`**.

Previously desk-rejected at the Journal of International Economics (Ms. INEC-D-26-00590) and at
International Economics (Ms. INTECO-D-26-00956), both without external review, both on fit
rather than quality. The Journal of Comparative Economics submission was never completed (the
live portal got stuck at the article-type-selection step) and is not being pursued further —
this is a fresh submission, and there is nothing to withdraw there since no manuscript ID was
ever issued.

## Why this journal, and why now

EER is a materially stronger, more general field journal than JCE, INTECO, or JIE, and the
special issue's stated themes — sanctions, geopolitical (mis)alignment, friend-shoring/
near-shoring, supply-chain reconfiguration, regional trade agreements, firm-level investment
responses — match this paper's actual content unusually closely. The manuscript itself is
**not** a fresh draft: it has already been through two independent multi-round revision
processes (a JCE-style simulated peer review, cleared to "Minor revision, both FATALs cleared";
a separate JIE-style simulated peer review, three rounds, final referee scores 73/100 and
79/100 with no further round required) and a reproducibility audit that shows 0 FAIL. See
`quality_reports/peer_review_corridor/` and `quality_reports/peer_review_corridor_JIE/` for the
full record, and `quality_reports/plans/2026-09-29_eer-special-issue-retarget.md` for why this
submission round did **not** re-run that revision work (it was already done).

## What changed in the manuscript for this submission (real content, not just packaging)

Two short additions in the Introduction tie the paper explicitly to the special issue's own
framing, using citations verified via WebSearch before being added to `corridor.bib`:

1. Opening paragraph: the February 2022 shock is now framed as "one instance of the broader
   post-2022 reallocation of global trade and production that sanctions, tariff uncertainty, and
   geopolitical realignment have set in motion," citing Aiyar et al. (2023, IMF SDN 2023/001,
   "Geo-Economic Fragmentation and the Future of Multilateralism") and Alfaro and Chor (2023,
   NBER WP 31661, "Global Supply Chains: The Looming 'Great Reallocation'"). The latter is
   co-authored by guest editor Davin Chor and is genuinely on-topic (supply-chain reallocation
   under geopolitical shock), not a courtesy citation.
2. Contribution paragraph (ii): one new sentence states explicitly that the paper "speaks
   directly to how a regional trade alliance shapes the domestic consequences of a geoeconomic
   shock" — the customs union is what keeps the market-access gate open, which the framework
   already identified as central; this was previously implicit and is now stated in the special
   issue's own vocabulary.

No numeric claim, table, or estimate changed. `corridor.tex` recompiled clean afterward: 49
pages, 0 undefined refs/citations, the same 3 baseline overfull hboxes as before.

## Files to upload

| Item type | File |
|---|---|
| Manuscript | `manuscript.pdf` (49 pp; not blinded — EER appears to use single-anonymized review, see caveat below) |
| Cover letter | `cover_letter.docx` (addressed to the four named guest editors, ties the paper to the special issue's call) |
| Title page | `title_page.docx` (name, affiliation, ORCID, COI, funding, CRediT) |
| Highlights | `highlights.docx` (5 bullets, reused unchanged from the JCE package — already ≤85 characters each) |
| Declaration of interest | `declaration_of_interest.docx` (regenerated fresh from the current manuscript footnote — **not** copied from `Manuscript/make_competing_interest_docx.js`'s output, which still contains a "consulting engagement" clause that was deliberately dropped from the manuscript in an earlier commit) |

## Metadata to enter manually

- **Title:** Corridor, Not Factory: Trade Reorientation and the Missing Investment Response in Kazakhstan, 2022-2025
- **Author:** Zhanbolat Kakishev, Nazarbayev University, zhanbolat.kakishev@nu.edu.kz (corresponding), ORCID 0009-0002-2227-0469
- **Special issue field:** `VSI: Global Trade`
- **Keywords:** trade reorientation; investment under uncertainty; irreversibility; institutional voids; Kazakhstan
- **JEL codes:** F14, F15, O14, O33, E22, P33
- **Abstract:** the 150-word abstract in the manuscript

## Open item — could not independently verify EER's live Guide for Authors this session

ScienceDirect's guide-for-authors page returned a Cloudflare block on every direct-fetch and
live-browser attempt this session, and the usual Wayback Machine fallback was itself offline
("Internet Archive services are temporarily offline") at the time of writing. The package above
is built on a WebSearch-synthesized characterization (single-anonymized review — author names
visible to referees, unlike JCE's double-blind policy) that was **not** cross-checked against
Elsevier's own primary-source text. Before submitting:

1. **Re-check the live guide** at `sciencedirect.com/journal/european-economic-review/publish/guide-for-authors`
   (or retry the Wayback fallback) for the review-anonymity policy, any keyword/JEL cap, reference
   style, and submission fee — none of this was confirmed against primary source this session.
2. If EER turns out to require blind review after all, the blinding approach already built for
   JCE (`Manuscript/corridor_jce_blind.tex`) is a ready template to adapt.
3. The portal itself will also state the actual requirements live, as it did for JIE/INTECO/JCE —
   this checklist is a starting point, not a substitute for reading the real screens.

## Open items only you can settle

1. **Reviewer suggestions**, if the portal asks: authors of the geoeconomic-fragmentation and
   regional-trade-alliance literature now cited (outside the guest editors themselves, who
   cannot referee their own special issue), or scholars working on post-Soviet trade and
   sanctions already cited elsewhere in the paper (Chupilkin, Javorcik, Plekhanov).
2. **Data-identifier claim** (carried over from every prior package): vendor permission to
   publish bare deal identifiers has not been confirmed with S&P, PitchBook, or Preqin.
3. **No rush**: the deadline is 31 March 2027. Read the live guide, then submit whenever ready.
