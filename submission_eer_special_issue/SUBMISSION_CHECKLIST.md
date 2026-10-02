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
table below reflects the actual guide. **Update 2026-10-02 — the live portal overrides two
things the general guide implied:**

1. **This submission is double-blind, not single-anonymized.** The general EER Guide for
   Authors says single-anonymized (author names visible to referees), but the live "Attach
   Files" step for this special issue explicitly warned: *"Manuscript WITHOUT Author
   Identifiers: please ensure the Manuscript file has no information that could allow reviewers
   to identify any of the authors."* The user confirmed this directly against the live portal.
   A blinded manuscript was built accordingly (see below) — the special issue runs a stricter
   policy than the parent journal's default.
2. **The Manuscript file item type only accepts Word (.docx) — no LaTeX, no PDF.** The general
   guide's "Your Paper Your Way" / LaTeX-source language does not apply to this item type on
   this portal; the user confirmed directly: *"Manuscript file must be Word, no other option."*
   The `source/` LaTeX bundle built earlier in this package is kept for reference only and is
   **not** what gets uploaded as the Manuscript file.

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

## Files to upload (corrected 2026-10-02 against the live portal's actual item types)

| Portal item type | File | Notes |
|---|---|---|
| Manuscript file | `manuscript_blind.docx` | **Blinded.** No author name/affiliation in the body; file properties (`dc:creator`, `lastModifiedBy`) scrubbed via Word's Document Inspector — verified empty. Content fidelity spot-checked (table values, Greek-letter math) against the LaTeX source after conversion. |
| Cover page | `title_page.docx` | The portal's dropdown calls this "cover page," not "title page" — same file, same content (name, affiliation, ORCID, COI, funding, CRediT): this is where the identity the manuscript omits belongs. |
| Declaration of interest | `declaration_of_interest.docx` | Unchanged from before. |
| Highlights | `highlights.docx` | Filename contains "highlights" as required, 5 bullets each ≤85 characters. |
| *(cover letter — check if a separate upload slot exists)* | `cover_letter.docx` | The user's dropdown listing (declaration of interest / cover page / highlights) didn't mention a separate cover-letter item; it may be entered as portal text instead. Have this file ready either way. |

**Not uploaded, kept for reference only:** `manuscript.pdf` (non-blind — superseded, this
journal requires blind) and `source/` (the LaTeX bundle — superseded, this portal's Manuscript
item only accepts Word, confirmed live, contrary to the general guide's LaTeX-source language).

## How the blind Word manuscript was built (2026-10-02)

No automated LaTeX-to-Word toolchain in this environment worked reliably on this document
(pandoc and LibreOffice aren't installed; MiKTeX's `tex4ht`/`make4ht` hung indefinitely burning
CPU on this document regardless of a hyperref workaround). The reliable path turned out to be
Microsoft Word's own built-in PDF-reflow: the user opened the blinded `corridor_eer_blind.pdf`
(built from `Manuscript/corridor_eer_blind.tex` — author block emptied, Declaration of
Competing Interest replaced with "Withheld for blind review; see the separate cover page," and
the CRediT statement removed) directly from inside Word, let Word convert it, then **File → Save
As → .docx**. Two things were checked and fixed before trusting the result:

1. **Body-text identity leaks:** none found (checked by extracting and reading `word/document.xml`).
2. **File-properties identity leak:** Word auto-stamps `dc:creator` / `cp:lastModifiedBy` with the
   signed-in account's name on Save As, regardless of what's blinded in the body. Caught via
   `docProps/core.xml`, fixed via Word's Document Inspector ("Check for Issues → Inspect Document"
   → remove "Document Properties and Personal Information"), re-verified empty afterward.

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
2. **Resolved 2026-10-01:** waiver requested via `submissionstart@elsevier.com`. Elsevier's
   response confirmed the standard EUR 100 PhD-student rate — no further special-issue discount
   available. Pay EUR 100 at submission.

## Figure resolution — fixed and regenerated (2026-10-01)

Direct inspection of the 5 PNG figures' embedded dimensions originally showed all of them at
150 DPI, under the guide's stated minimum for line drawings/charts (1000 DPI; minimum width
3543px single-column / 7480px full-page). Fixed at the source level (three `dpi = 150` ->
`dpi = 1000` edits in `kz_passthrough/00_setup.R`'s `save_fig()` helper, `kz_valueadd/03_fig.R`,
`kz_valueadd/04_sector_priority.R`) and **regenerated**: found an R installation on this machine
at `C:\Users\zh.kakishev\AppData\Local\Programs\R\R-4.5.3\bin\Rscript.exe` (not on the session's
`PATH` by default) and re-ran the two pipelines. `kz_passthrough/00_run_all.R`'s full run hit an
unrelated World Bank API timeout in `11_macro.R` (a macro-context script, no figure dependency)
after the three needed figures had already been produced by earlier steps in the script, except
`rq1_fig_monthly.png`, which comes from the monthly branch later in the script and hadn't run
yet — resumed just that branch separately. All 5 figures are now confirmed at 1000 DPI:

| Figure | Dimensions | DPI |
|---|---|---|
| `rq1_fig_monthly.png` | 8000x4500 | 1000 |
| `rq1_fig_eventstudy.png` | 8000x4500 | 1000 |
| `rq2a_fig_wedge_hist.png` | 8000x4500 | 1000 |
| `valueadd_fig_mismatch.png` | 9000x4800 | 1000 |
| `sector_priority_fig.png` | 10000x6500 | 1000 |

The refreshed PNGs are already copied into `source/`, and `manuscript.pdf` recompiled from them
(now ~2.9MB, up from ~540KB — expected given the higher-resolution embedded images, well within
any portal file-size limit).

**One real side effect, caught and fixed:** `kz_valueadd/04_sector_priority.R` re-pulls live
Comtrade HS2 import data as part of producing its figure — re-running it today returned
slightly different numbers than the committed outputs (trade statistics get revised over time;
this is expected, not a bug). Two of those numbers are hand-typed into Table~\ref{tab:priority}
in `corridor.tex` (not auto-generated from the script's output): the import-intensity and
import-growth ratios for "Electrical equipment" (5.6/1.43 -> 5.9/1.37) and "Machinery &
equipment n.e.c." (7.9/1.27 -> 8.1/1.25). Updated the table to match the regenerated data,
recompiled, and re-verified the rendered table against the new `sector_priority_matrix.csv`.
Every other figure/table in the manuscript is unaffected (`kz_passthrough`'s three figures use
already-fetched static data; `valueadd_fig_mismatch.png` doesn't re-pull anything live). No
other numeric claim changed.

## Compliance table (against the actual live guide, supplied 2026-09-29)

| Requirement | Status |
|---|---|
| Peer review model | **Double-blind**, per the live portal (overrides the general guide's single-anon language) — `manuscript_blind.docx` has no identifying body text or file-properties metadata, verified |
| Manuscript file format | Word (.docx), per the live portal (overrides the general guide's LaTeX-source language) — `manuscript_blind.docx` |
| Submission fee EUR 125 / EUR 100 (PhD student) | Resolved — waiver requested, Elsevier confirmed standard EUR 100 PhD rate applies, no further discount; pay at submission |
| Abstract ≤ 250 words | Pass (~150 words) |
| Keywords 1–7 | Pass (5) |
| *(superseded — see "Update 2026-10-02" above)* ~~LaTeX source required, PDF alone not acceptable~~ | The live portal's Manuscript item wants Word only; `source/` kept for reference, not uploaded |
| Cover page: full author name, affiliation, full postal address, corresponding-author email | Pass (Graduate School of Business, Nazarbayev University; full building/street address; ORCID) — `title_page.docx`, uploaded under the portal's "cover page" item type |
| Highlights: separate file, filename contains "highlights", 3–5 bullets ≤85 chars | Pass (reused from the JCE package, already verified compliant) |
| Declaration of competing interest: manuscript + separate document + portal declarations tool | Manuscript + document done; **portal declarations tool must be completed live at submission** |
| Data statement / Option B research-data guidance | Pass (existing replication-package approach) |
| Generative-AI declaration section before references | Pass — heading corrected to the guide's exact required title ("Declaration of generative AI and AI-assisted technologies in the manuscript preparation process") |
| Figure resolution (line drawings/charts, min 1000 DPI) | Pass — regenerated 2026-10-01, all 5 figures confirmed at 1000 DPI (see table above) |
| Highlights content (5 bullets, ≤85 characters each) | Pass — verified directly this pass by extracting the actual `highlights.docx` text (longest bullet: 76 characters), not just carried over from the JCE package's claim |
| Title page content (name, affiliation, address, ORCID, COI, funding, CRediT) | Pass — verified directly this pass by extracting the actual `title_page.docx` text |
| Reference style at submission (any consistent style) | Pass (natbib author-year; will be reformatted at Elsevier's proof stage, not before) |
| Special-issue designation field | `VSI: Global Trade` — enter at the portal's special-issue step |

## Mendeley Data deposit — done 2026-10-02

Deposited to Mendeley Data: DOI **10.17632/zk2csn8wf6.1**, reserved and citable, currently in
Mendeley's moderation queue (~2 business days, not yet publicly live). `replication_package/`
(`DEPOSIT.md`, `data_editor_note.md`) updated with the real DOI and EER as the target journal
(both previously referenced the stale JIE target). The master `corridor.tex` and the blinded
`corridor_eer_blind.tex` Data Availability sections now cite this DOI instead of the vague "in
the replication package" wording.

**Known gap, left as-is:** `manuscript_blind.docx` — already uploaded to the portal before the
DOI existed — still has the old vague wording (not wrong, just less specific). Not worth
redoing the LaTeX→PDF→Word conversion pipeline to patch one sentence mid-submission; fix at a
revision stage if asked, where re-uploading files is normal anyway.

**Declined:** EER's free SSRN preprint-posting offer. SSRN preprints carry the real author
name; posting one while this submission is under double-blind review would let a referee
de-anonymize the manuscript with a simple search. Can revisit after the blind-review stage ends.

## Open items only you can settle

1. **Submission fee payment / waiver request** — see above.
2. **Reviewer suggestions**, if the portal asks: authors of the geoeconomic-fragmentation and
   regional-trade-alliance literature now cited (excluding the guest editors themselves, who
   cannot referee their own special issue), or scholars working on post-Soviet trade and
   sanctions already cited elsewhere in the paper (Chupilkin, Javorcik, Plekhanov).
3. **Data-identifier claim** (carried over from every prior package): vendor permission to
   publish bare deal identifiers has not been confirmed with S&P, PitchBook, or Preqin —
   moot for the current Mendeley deposit (that file was never included), but still relevant if
   a future version adds it.
4. **No rush**: the deadline is 31 March 2027.
