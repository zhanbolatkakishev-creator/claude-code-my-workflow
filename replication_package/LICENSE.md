# License

## Code

The analysis code in `code/` (repository paths `scripts/R/kz_passthrough/` and
`scripts/R/kz_valueadd/`) is released under the **MIT License**.

```
MIT License

Copyright (c) 2026 Zhanbolat Kakishev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

(The wider working repository is itself a fork of an MIT-licensed academic-workflow
template, © 2026 Pedro H. C. Sant'Anna; that root `LICENSE` covers the template
infrastructure. The line above is the license for the paper's replication code specifically.)

## Data

- **UN Comtrade** derived panels: redistributed under the UN Comtrade data-use terms
  (attribution; non-commercial research use).
- **World Bank WDI** extracts: CC-BY 4.0.
- **Kazakhstan BNS** input–output and resources tables: public-sector information, free use
  with attribution.
- **OECD ICIO 2023**: not redistributed; obtain from the OECD under its research-use terms.
- **Capital IQ / PitchBook / Preqin** deal data: **proprietary; not licensed for
  redistribution.** Only aggregate counts (Table 3) are included. See
  `data/raw/access-restricted-data.md`.
- **QIC / AIFC / IFC report figures**: third-party publication; cited, not redistributed.

Users of this package must obtain the OECD ICIO matrix and the deal-level data under their own
licences before running the steps that depend on them.
