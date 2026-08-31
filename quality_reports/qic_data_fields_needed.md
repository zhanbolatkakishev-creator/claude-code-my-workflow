# QIC / Baiterek project register — fields the paper needs in the public release

**Paper:** *Corridor, Not Factory: Trade Reorientation and the Missing Investment Response in
Kazakhstan, 2022–2025.* The QIC/Baiterek register underpins Table 3 (`tab:captive`) and the
§7 "captive capital abstained" identification — the paper's argument that the missing
investment response is not a financing constraint rests on being able to show that the state
fund, which does not face that constraint, also did not invest in the reorientation.

For the result to be replicable from public data, the released register must let an
independent researcher reproduce: (i) a count and dollar value of Baiterek-group industrial
and logistics projects by financing year, and (ii) a classification of each project by sector
and by its relation to the post-2022 trade reorientation.

---

## A. Essential fields (the paper cannot be replicated without these)

| Field | What it is | Why the paper needs it |
|---|---|---|
| **Project name** | Short project name **and** the project company / legal entity (`ТОО …`, `АО …`) | Identifies specific transactions (e.g. the Qarmet modernization, agri-processing plants) and is the text the classification keys on. Company legal name lets a replicator disambiguate. |
| **Sector** | OKED code (section letter + 2-digit division) **or** an industry label | The paper aggregates projects to agri-processing / metallurgy & machinery / chemicals / vehicles / logistics / electronics. Either the OKED code or a consistent industry label works; the OKED code is preferable because it is unambiguous. |
| **Financing year** | Year the financing was approved / committed (a full date is better; year is the minimum) | Used to filter 2022–2025 and to build the pre-2022 vs post-2022 comparison. A subset that only covers recent years is **not sufficient** — see coverage note below. |
| **Baiterek's committed amount** | The amount the Baiterek group (fund) itself put in — KZT millions and/or USD millions | This is the "$m (fund)" column in Table 3. USD is convenient; KZT is fine (we convert at the financing-year rate). |
| **Total project cost** | Full project cost (all sources), KZT millions | Table 3 reports it alongside the fund's own ticket, and the note explains they are on different bases. Also used to gauge project scale. |
| **Region** | Oblast / city of the project | Listed in the paper's data description; used descriptively (which regions the pipeline concentrates in). Lower stakes than the fields above but the paper's §3 names it, so please include it. |

---

## B. Helpful, but the paper can proceed without them

| Field | Why it helps |
|---|---|
| **Fund / subsidiary** (e.g. Baiterek Venture Fund, QIC, Qazaqstan Investment Fund, Damu, …) | Lets the paper state which Baiterek vehicle made each commitment and check that "captive state capital" is defined consistently. |
| **Instrument / deal type** | Greenfield / new capacity vs. modernization vs. equity purchase of an existing (or nationalised) asset. The paper distinguishes "new productive capacity" from "ownership transfers of distressed assets"; right now we infer this from the project name. An explicit field would make that split objective. |
| **Project status** | Financed / disbursed / completed / exited / cancelled. The paper wants the set of projects actually financed, not a pipeline of intentions. |
| **Ownership / participation share** | The fund's equity stake (%). Context for how much control the commitment implies. |
| **Exit (if any) and exit year / route** | The paper's §7 / §9 discussion of the domestic PE market's missing exit would be sharpened by observed exits (trade sale / buy-back / listing). |
| **Brief project description** (1–2 sentences) | Improves the sector/relation classification and reduces reliance on keyword matching of the name. |

---

## C. Coverage requirements (as important as the fields)

1. **Full history, not a highlights list.** The register must cover **all** Baiterek-group
   industrial and logistics projects for at least **2015–2025** (2018–2025 is the strict
   minimum). The paper's claim is a *pre-2022 vs post-2022* comparison — a curated set of
   recent flagship projects cannot support it.
2. **All qualifying projects, not a selection.** Every project in manufacturing (OKED section
   C), transport & storage (section H), and wholesale trade / trade-logistics infrastructure
   (section G) — regardless of size or outcome. Excluding small, cancelled, or
   politically-sensitive projects would bias the count.
3. **One row per project** with a stable identifier, so the public file can be joined to any
   later updates.
4. **A machine-readable format** (CSV / XLSX), not only a PDF report or a web dashboard, and
   a stated **as-of / extraction date** so the version used in the paper can be pinned in the
   replication package.

---

## D. What the paper does **not** need (so QIC need not withhold the release over these)

- No individual salaries, personnel, or board information.
- No commercially sensitive financial projections, IRRs, or valuation models.
- No counterparty banking details or contract terms.
- No information on projects still under negotiation / not yet approved.

The paper uses only the **descriptive record of projects the fund has financed** — the same
kind of portfolio disclosure development-finance institutions routinely publish (cf. the
project databases of the EBRD, IFC, or ADB).

---

## E. One-line summary to send QIC

> "For the register to support the research, please publish, as a machine-readable file
> covering 2015–2025: for every Baiterek-group manufacturing, transport, and trade-logistics
> project — the project name and company, the OKED sector code, the region, the financing
> year, Baiterek's own committed amount, and the total project cost. Ideally also the fund
> vehicle, whether it was greenfield or an acquisition, and the project's current status."
