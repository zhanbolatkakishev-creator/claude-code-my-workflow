# 00_run_all.R — reproduce the KZ pass-through analysis end to end.
# Prereq: bash pulls already run (fetch_annual.sh, fetch_keyed.sh [needs COMTRADE_PRIMARY],
#         fetch_neighbors.sh) and OECD ICIO downloaded to _data/icio/icio_ex/2019_SML.csv.
# From scripts/R/kz_passthrough/ :  Rscript 00_run_all.R

setwd(if (file.exists("00_run_all.R")) "." else "scripts/R/kz_passthrough")
run <- function(f, env = character()) {
  message("\n===== ", f, "  ", paste(env, collapse = " "), " =====")
  if (length(env))
    do.call(Sys.setenv, as.list(setNames(sub("^[^=]+=", "", env), sub("=.*$", "", env))))
  source(f, local = new.env())
}

## classification + I-O (once)
run("03_classify_hs_chpl.R")
run("08a_get_io.R")
run("08b_kz_bns_io.R")   # sec 5.2 robustness: KZ BNS 68-product I-O vs OECD ICIO

## ---- ANNUAL branch (headline magnitudes, DiD, $ totals) ----
run("02b_assemble_json.R", "KZ_FREQ=A")
run("05_panel_build.R")
run("06_eventstudy_did.R")
file.copy("_outputs/surge_basket_stats.rds", "_outputs/surge_basket_frozen.rds", overwrite = TRUE)
file.copy("_outputs/panel_hs_period.rds",   "_outputs/panel_annual.rds",         overwrite = TRUE)
run("07_unit_value_wedge.R")     # annual wedge (n=96) — canonical $ totals
run("08_io_propagation.R")       # RQ2(b) value capture
run("09_fiscal.R")               # RQ2(c) fiscal
run("10_robustness.R")           # placebo + Armenia/Kyrgyz parallel
run("11_macro.R")                # RQ2(d) macro context

## ---- MONTHLY branch (break dates, event study, 647-cell wedge) ----
run("02b_assemble_json.R", "KZ_FREQ=M")
run("05_panel_build.R")
file.copy("_outputs/panel_hs_period.rds", "_outputs/panel_monthly.rds", overwrite = TRUE)
run("06m_monthly_profile.R")
run("07_unit_value_wedge.R")                       # monthly wedge (n=647) — cited in corridor.tex sec 5.1
file.copy("_outputs/rq2a_unit_value_wedge.txt", "_outputs/rq2a_unit_value_wedge_MONTHLY.txt", overwrite = TRUE)
file.copy("_outputs/rq2a_cell_measures.rds",    "_outputs/rq2a_cell_measures_MONTHLY.rds",    overwrite = TRUE)
file.copy("_outputs/rq2a_fig_wedge_hist.png",   "_outputs/rq2a_fig_wedge_hist_MONTHLY.png",   overwrite = TRUE)

## restore the ANNUAL wedge as the canonical rq2a_* (feeds 08/09 $ totals)
file.copy("_outputs/panel_annual.rds",        "_outputs/panel_hs_period.rds",  overwrite = TRUE)
file.copy("_outputs/surge_basket_frozen.rds", "_outputs/surge_basket_stats.rds", overwrite = TRUE)
run("07_unit_value_wedge.R")                       # annual wedge (n=96) -> canonical rq2a_*

## NOTE (2026-08-31, Path B): the inbound flow is now measured as West + China (mirWC) as the
## PRIMARY series everywhere (05 builds it; 06 selects the surge basket on it; 07/08/10 use it).
## DiD spec grid, wild-cluster bootstrap, randomisation inference and PPML are folded into 06
## (annual branch); the unpurged placebo into 10; Bai-Perron break CIs into 06m.

## ---- round-2 seven-pass review: DiD robustness for sec 4.3 ----
run("12_did_robustness.R")     # rule-matched permutation, size#year FE, donut, Holm
                               #   -> _outputs/rq1_did_robustness.txt

message("\nAll done. corridor.tex sec 4 uses rq1_estimates.txt + rq1_did_robustness.txt + ",
        "rq1_monthly.txt (break CIs); sec 5.1 uses rq2a_unit_value_wedge*.txt; ",
        "sec 5.2-5.3 use rq2b/rq2c. See _outputs/ and Manuscript/corridor.tex")
