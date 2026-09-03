## Computational requirements

**Software:** R 4.5.3 (2026-03-11 ucrt), platform `x86_64-w64-mingw32`. R only; no Python,
Stata, or MATLAB.

**OS used:** Windows 11 Pro (build 10.0.26100), x86_64. No Dockerfile is shipped; the R
version is pinned in `renv.lock`, and `FROM rocker/r-ver:4.5.3` + `renv::restore()`
reproduces a Linux layer if a replicator needs byte-identical output.

**Key packages:** fixest 0.14.2, strucchange 1.6-0, sandwich 3.1-1, data.table 1.18.6.1,
ggplot2 4.0.2, zoo 1.8-15, eurostat 4.0.0, jsonlite 2.0.0, readxl 1.4.5, wbstats 1.1,
countrycode 1.9.0 (full closure of 78 packages in `renv.lock` and in the two
`sessionInfo.txt` files).

**Random seeds and RNG:**
- `scripts/R/kz_passthrough/06_eventstudy_did.R` — `set.seed(20260831)`: wild-cluster
  bootstrap (B = 1999) and random-basket randomisation inference (R = 2000).
- `scripts/R/kz_passthrough/12_did_robustness.R` — `set.seed(20260831)`:
  selection-rule-matched permutation (free and trend-preserving cyclic-shift),
  leave-one-HS2-out jackknife, alternative selection thresholds. This script produces
  Table 2, Panel C.
- `scripts/R/kz_valueadd/08_power_null.R` — `set.seed(1)`: minimum-detectable-effect
  simulation for the deal-count null.
- All other steps (structural-break sup-F tests, input–output propagation, fiscal/macro
  aggregation, deal-source reconciliation) are deterministic and use no RNG.
- `RNGkind()` = Mersenne-Twister, Inversion, Rejection (R default). No parallel RNG streams.

**Data pulled at run time (results drift by a few per cent as sources revise):**
`fetch_*.sh` (UN Comtrade, needs a `COMTRADE_PRIMARY` API key), `04_sector_priority.R`
(Comtrade HS2 imports), `07_crosscountry.R` and `11_macro.R` (World Bank WDI). The
replication package pins the exact extracts used for every table and figure; a live re-pull
is expected to match within the `replication-protocol.md` tolerances, not byte-for-byte.

**Approx. runtime:** approximately 12–18 minutes single-core, analysis only (network fetches
excluded): ~10–15 minutes for the full `kz_passthrough/00_run_all.R`, dominated by the
wild-cluster bootstrap and the permutation loops in steps 06 and 12; the `kz_valueadd` steps
add another 2–3 minutes. The `fetch_*.sh` pulls and the live re-pulls in steps 04, 07, 11 add
15–30 minutes depending on the Comtrade / World Bank API. Peak RAM under 4 GB; no HPC or
cluster required. [Author: replace with the measured wall-clock time from a clean run.]

**Lockfiles / environment files in the package:** `renv.lock` (repo root),
`scripts/R/kz_passthrough/_outputs/sessionInfo.txt`,
`scripts/R/kz_valueadd/_outputs/sessionInfo.txt`, this file.

_Note: the scripts install into the system library via `00_setup.R` rather than an renv
project library. `renv.lock` was assembled from `installed.packages()` for portability and
`renv::restore()` consumes it directly. It was generated 2026-08-31 and is unchanged — the
subsequent revisions (m-sensitivity blocks in step 08, Georgia/Türkiye extension in step 10,
the deal-list swap in `kz_valueadd/01`) added no new package dependencies. To adopt renv
fully, run `renv::init()` then `renv::snapshot()`._
