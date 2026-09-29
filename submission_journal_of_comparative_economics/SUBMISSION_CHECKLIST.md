# Submission package: Journal of Comparative Economics

Target: *Journal of Comparative Economics* (ISSN 0147-5967), Elsevier Editorial Manager
(`editorialmanager.com/YJCEC`). Guide for Authors checked 2026-09-29 (archived snapshot,
2023-12-16 -- the journal's own page has not been re-dated since, but the requirements below
were cross-checked against the live "Blind review" and "Classification codes and keywords"
sections, which are unlikely to have changed).

Previously desk-rejected at the Journal of International Economics (Ms. INEC-D-26-00590) and at
International Economics (Ms. INTECO-D-26-00956), both without external review, both on fit
rather than quality. This is a fresh submission.

## This journal is double-blind. That is the one requirement that differs from the last two submissions.

- **Manuscript file** (`manuscript_blind.pdf`): the author name, affiliation, and every
  identifying footnote have been removed from this file. It has no Declaration of Competing
  Interest content (replaced with "Withheld for blind review"), no CRediT statement, and the
  PDF's own Author metadata field is blank (verified with `pdfinfo`). One self-referential
  phrase ("available from the author") was also reworded, and the second one ("taken up in a
  companion paper") was already generic. LaTeX source: `Manuscript/corridor_jce_blind.tex`.
- **Cover/title page** (`title_page.docx`): carries the title, your name, affiliation, ORCID,
  correspondence e-mail, the conflict-of-interest footnote, funding statement, and the CRediT
  statement -- everything the blind copy omits. Upload as its own item type, separate from the
  manuscript.
- Double-check before uploading: the manuscript PDF's file properties (right-click > Properties
  in Windows, or Word/Acrobat's "Document Properties") don't carry your name from the OS file
  metadata. `pdfinfo` on this build shows no Author field, but worth a glance since some PDF
  viewers cache the OS username separately.

## Files to upload

| Item type | File |
|---|---|
| Manuscript (blinded) | `manuscript_blind.pdf` |
| Cover/title page | `title_page.docx` |
| Cover letter | `cover_letter.docx` |
| Highlights (mandatory here, not optional) | `highlights.docx` |

## Metadata to enter manually

- **Title:** Corridor, Not Factory: Trade Reorientation and the Missing Investment Response in Kazakhstan, 2022-2025
- **Abstract:** the 150-word abstract in the manuscript (no length cap stated by this journal either)
- **Keywords (up to 5 additional, plus at least one JEL code -- no stated JEL cap):**
  trade reorientation; investment under uncertainty; irreversibility; institutional voids; Kazakhstan
- **JEL codes:** F14, F15, O14, O33, E22, P33 (all six kept; this journal states no cap, unlike JIE/INTECO's 6-code limit)
- **No submission fee** -- the guide states it is waived for all manuscripts.
- **Decision timeline:** the guide states editorial decisions within three months of acknowledgment.

## Compliance against the JCE guide

| Requirement | Status |
|---|---|
| Blind review: separate cover page, no identifying content in the manuscript body or PDF metadata | Done -- see above |
| Highlights mandatory, 3-5 bullets, at most 85 characters | Pass -- reused from the prior submissions, already compliant |
| Keywords, up to 5 additional | Pass -- trimmed from 6 to 5 (dropped "value added") |
| At least one JEL code | Pass -- kept all 6 |
| Reference style: author-year, alphabetical list | Already matches (natbib author-year); the journal's exact punctuation/format examples were not hand-applied line by line, since Elsevier journals generally reformat at the proof stage, but flag this if the editorial office pushes back before then |
| No stated word or page limit | Pass |
| Submission fee | None -- explicitly waived |

## What changed in the manuscript itself (applies to every future submission, not just this one)

- Keywords trimmed from 6 to 5 for this journal's cap.
- "it is the subject of a companion paper (available from the author)" reworded to "it is the
  subject of ongoing companion work" -- this was a self-identifying phrase regardless of which
  journal reads it, so it stays fixed going forward.
- The blinding itself (`corridor_jce_blind.tex`) is a separate file from the master
  `corridor.tex` and does not affect the master, the JIE/INTECO packages, or `corridor.pdf`.

## Open items only you can settle

1. **Reviewer suggestions**, if the portal asks: same guidance as before -- no recent
   co-authors or collaborators, no current editorial-board members, prefer reviewers outside
   your own country. Good candidates given this journal's institutional-economics focus:
   authors of the transition-economics and institutional-voids literature already cited
   (Khanna and Palepu; Rajan and Zingales) or scholars working on post-Soviet trade and
   sanctions (Chupilkin, Javorcik, Plekhanov).
2. **Data-identifier claim** (carried over from the last package): vendor permission to publish
   bare deal identifiers has not been confirmed. Either confirm with S&P, PitchBook and Preqin,
   or soften the sentence before an accepted-version stage.
3. **If asked for a graphical abstract**: optional here too; not created.
