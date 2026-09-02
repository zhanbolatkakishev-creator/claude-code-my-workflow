# 00_run_all.R -- reproduce the investment-response + sector-priority analysis end to end.
#
# Prerequisites:
#   1. The kz_passthrough pipeline has been run (00_run_all.R there), so
#      ../kz_passthrough/_outputs/{panel_annual.rds, surge_basket_frozen.rds} and
#      ../kz_passthrough/_data/kz_io.rds exist.
#   2. The licensed deal extract is at _data/20260825_Market size DA.xlsx
#      (or point KZ_DEAL_XLSX at it). See
#      replication_package/data/access-restricted-data.md -- it is NOT redistributable.
#   3. fetch_kz_imports_hs2.sh has been run (HS2 imports for step 04), needs COMTRADE_PRIMARY.
#
# From scripts/R/kz_valueadd/ :  Rscript 00_run_all.R

if (!file.exists("00_run_all.R") && dir.exists("scripts/R/kz_valueadd")) {
  setwd("scripts/R/kz_valueadd")
}

run <- function(f) {
  message("\n===== ", f, " =====")
  source(f, local = new.env())
}

run("01_read_deals.R")            # read + profile the three-source deal list  -> _data/deals_*.rds
run("02_valueadd_analysis.R")     # classify into value-chain buckets          -> _outputs/deals_classified.rds, valueadd_findings.txt
run("03_fig.R")                   # Figure 4: trade surged, investment did not -> _outputs/valueadd_fig_mismatch.png
run("04_sector_priority.R")       # Table 6 + sec-10 figure (re-pulls Comtrade HS2)
run("05_deal_source_reconcile.R") # Table 3: deal counts by source x period    -> _outputs/deal_source_reconcile.csv
run("06_mechanism_tests.R")       # sec 8 mechanism tests
run("07_crosscountry.R")          # sec 9 cross-country context (re-pulls World Bank WDI)
run("08_power_null.R")            # sec 6 minimum-detectable-effect for the deal-count null  [set.seed(1)]

message("\nAll done. corridor.tex sec 6 uses valueadd_findings.txt + power_null.txt; ",
        "Table 3 = deal_source_reconcile.csv; Figure 4 = valueadd_fig_mismatch.png; ",
        "Table 6 = sector_priority*.  See _outputs/.")
