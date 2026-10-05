# docx_repair

One-off toolkit used (2026-10-05) to repair the Word manuscript that Word's own
PDF-to-Word conversion produced from `Manuscript/corridor_eer_blind.pdf`.
The conversion keeps prose and figures but scrambles tables, equations, one long
footnote, and drops hyphens/spaces at old line breaks.

Pipeline (run from `Manuscript/` with the unzipped `word/document.xml` in `_work/`):
`build_tables.js` (rebuilds the 9 tables from the LaTeX, the 2 equations as native
Word math, footnote 1 as a real footnote) -> `qa_words.js` + `postfix.js` (restore lost
hyphens/spaces, evidence taken from the .tex) -> `merge_splits.js` (rejoin paragraphs
cut at PDF page ends) -> `normalize_fmt.js` -> `inject_export.ps1` (write the XML back
into a copy of the docx, export to PDF through Word for visual checking).
`qa_diff2.js` compares Word's rendered text with the LaTeX PDF. Paths are hard-wired to
this repo layout; indices in `build_tables.js` are specific to that one conversion.
