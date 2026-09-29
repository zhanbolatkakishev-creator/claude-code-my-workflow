# Submission package: European Economic Review — Special Issue "Global Trade Fragmentation and Regional Trade Alliances"

Target: *European Economic Review* (ISSN 0014-2921), Elsevier Editorial Manager
(`editorialmanager.com/eerev`). Special issue guest-edited by Luu Duc Toan Huynh (Queen Mary
University of London), Chang Ma (Fudan University), Davin Chor (Dartmouth Tuck), and Viet Hoang
Nguyen (University of Melbourne). **Submission deadline: 31 March 2027.** Short Special Issue
Name to select in the portal: **`VSI: Global Trade`**.

Previously desk-rejected at the Journal of International Economics (Ms. INEC-D-26-00590) and at
International Economics (Ms. INTECO-D-26-00956), both without external review, both on fit
rather than quality. The Journal of Comparative Economics submission was never completed (the
live portal got stuck at the article-type-selection step, no manuscript ID was ever issued) and
is not being pursued further. This is a fresh submission.

**Guide for Authors checked against the live page 2026-09-29 (user supplied the full text
directly, since automated fetch attempts were Cloudflare-blocked this session).** The compliance
table below reflects the actual guide, not an assumption.

## Why this journal, and why now

EER is a materially stronger, more general field journal than JCE, INTECO, or JIE, and the
special issue's stated themes — sanctions, geopolitical (mis)alignment, friend-shoring/
near-shoring, supply-chain reconfiguration, regional trade agreements, firm-level investment
responses — match this paper's actual content unusually closely. The manuscript itself is not a
fresh draft: it has already been through two independent multi-round revision processes (a
JCE-style simulated peer review, cleared to "Minor revision, both FATALs cleared"; a separate
JIE-style simulated peer review, three rounds, final referee scores 73/100 and 79/100 with no
further round required) and a reproducibility audit showing 0 FAIL. See
`quality_reports/peer_review_corridor/`, `quality_reports/peer_review_corridor_JIE/`, and
`quality_reports/plans/2026-09-29_eer-special-issue-retarget.md` for the full record.

Two short, citation-verified additions were made to the Introduction to tie the paper explicitly
to the special issue's own framing (geoeconomic fragmentation, regional trade alliances) —
citing Aiyar et al. (2023, IMF SDN 2023/001) and Alfaro & Chor (2023, NBER WP 31661, the latter
co-authored by guest editor Davin Chor and genuinely on-topic). No numeric claim, table, or
estimate changed.

## Files to upload

| Item type | File |
|---|---|
| Manuscript source (LaTeX) | `source/corridor.tex` + `source/corridor.bib` + the 5 `source/*.png` figures — **required**, see below |
| Manuscript (reference PDF, for your own checking — not the source-file requirement) | `manuscript.pdf` |
| Cover letter | `cover_letter.docx` (addressed to the four named guest editors, ties the paper to the special issue's call) |
| Title page | `title_page.docx` (name, affiliation, ORCID, COI, funding, CRediT) |
| Highlights | `highlights.docx` — filename contains "highlights" as required, 5 bullets each ≤85 characters |
| Declaration of interest | `declaration_of_interest.docx` (also complete the portal's own declarations tool — the guide requires both) |

## Why the LaTeX source is included this time (unlike the JIE/INTECO/JCE packages)

Those three journals all accept a PDF at new submission ("Your Paper Your Way"). **EER's guide
states plainly: "A PDF is not an acceptable source file"** and separately, under LaTeX
submission, "You will be asked to provide all relevant editable source files upon submission."
`source/` is a verified-standalone bundle: `corridor.tex` compiles clean on its own (Tectonic,
0 undefined refs) with `\graphicspath` pointed at the local folder instead of the repo's
`scripts/R/.../\_outputs/` paths, and the 5 referenced figures copied alongside it. Upload the
whole `source/` folder's contents as the manuscript's editable files; the portal converts them
to a single PDF for the peer-review process itself.

## Metadata to enter manually

- **Title:** Corridor, Not Factory: Trade Reorientation and the Missing Investment Response in Kazakhstan, 2022-2025
- **Author:** Zhanbolat Kakishev, Graduate School of Business, Nazarbayev University, 53 Kabanbay Batyr Ave, Building C3, Astana 010000, Kazakhstan, zhanbolat.kakishev@nu.edu.kz (corresponding), ORCID 0009-0002-2227-0469
- **Special issue field:** `VSI: Global Trade`
- **Abstract:** the ~150-word abstract in the manuscript (guide caps at 250 words — compliant)
- **Keywords (1–7):** trade reorientation; investment under uncertainty; irreversibility; institutional voids; Kazakhstan (5, compliant; none use "and"/"of" per the guide's soft guidance)
- **JEL codes:** F14, F15, O14, O33, E22, P33 (the guide has no explicit JEL field/requirement, but these are already in the abstract text as standard econ-journal practice)
- **Reference style at submission:** any consistent style is accepted ("Our journal reference style will be applied to your article after acceptance, at proof stage") — the manuscript's existing natbib author-year style needs no change for submission
- **Data availability:** Option B (repository link, or a stated reason data can't be shared) — already satisfied via the existing replication-package / data-editor-note approach
- **Generative-AI declaration:** required if used; the manuscript already carries this section before the references

## Submission fee — a real action item, not something I can complete for you

**The guide states a non-refundable fee of EUR 125 for new submissions, reduced to EUR 100 for a
PhD-student corresponding author, payable before the submission is even considered.** You are a
PhD student, so the EUR 100 rate should apply. Two things to note:

1. Payment is handled entirely inside Elsevier's own payment flow at submission — I cannot and
   will not enter payment details on your behalf; you'll need to do this step yourself when you
   submit.
2. The guide also states: **"Special Issue submissions... will be considered on a case-by-case
   basis"** for a fee exemption. If you want to ask for a waiver given this is a special-issue
   submission, the guide says to contact `submissionstart@elsevier.com` for a voucher code
   *before* submitting — I have not sent that email; let me know if you'd like me to draft it for
   your review and send once you approve.

## Compliance table (against the actual live guide, supplied 2026-09-29)

| Requirement | Status |
|---|---|
| Peer review model: single anonymized (author names visible to referees) | Matches — manuscript is not blinded, unlike the JCE package |
| Submission fee EUR 125 / EUR 100 (PhD student) | **Open — user must pay at submission; special-issue waiver possible on request** |
| Abstract ≤ 250 words | Pass (~150 words) |
| Keywords 1–7 | Pass (5) |
| LaTeX source required, PDF alone not acceptable | Pass — `source/` bundle verified to compile standalone |
| Title page: full author name, affiliation, full postal address, corresponding-author email | Pass (Graduate School of Business, Nazarbayev University; full building/street address; ORCID) |
| Highlights: separate file, filename contains "highlights", 3–5 bullets ≤85 chars | Pass (reused from the JCE package, already verified compliant) |
| Declaration of competing interest: manuscript + separate document + portal declarations tool | Manuscript + document done; **portal declarations tool must be completed live at submission** |
| Data statement / Option B research-data guidance | Pass (existing replication-package approach) |
| Generative-AI declaration section before references | Pass (carried over from prior packages) |
| Reference style at submission (any consistent style) | Pass (natbib author-year; will be reformatted at Elsevier's proof stage, not before) |
| Special-issue designation field | `VSI: Global Trade` — enter at the portal's special-issue step |

## Open items only you can settle

1. **Submission fee payment / waiver request** — see above.
2. **Reviewer suggestions**, if the portal asks: authors of the geoeconomic-fragmentation and
   regional-trade-alliance literature now cited (excluding the guest editors themselves, who
   cannot referee their own special issue), or scholars working on post-Soviet trade and
   sanctions already cited elsewhere in the paper (Chupilkin, Javorcik, Plekhanov).
3. **Data-identifier claim** (carried over from every prior package): vendor permission to
   publish bare deal identifiers has not been confirmed with S&P, PitchBook, or Preqin.
4. **No rush**: the deadline is 31 March 2027.
