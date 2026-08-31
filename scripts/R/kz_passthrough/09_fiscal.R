# 09_fiscal.R — RQ2(c): the fiscal take Kazakhstan gets from the rerouted flow.
# Scope it to the REORIENTATION-ATTRIBUTABLE flow: the incremental KZ->Russia surge-basket
# exports over the pre-2022 baseline (this is the trade that was rerouted). Those goods enter
# KZ from outside the EAEU, may be customs-cleared (duty), then leave to Russia intra-EAEU
# (no KZ border, onward supply zero-rated -> net import VAT ~ 0).
# Transparent bands; refine with WITS-TRAINS line tariffs + KZ State Revenue Committee data.

source("00_setup.R")
suppressMessages(library(data.table))

p  <- readRDS(file.path(DIR_OUT, "panel_hs_period.rds")); setDT(p)
gg <- readRDS(file.path(DIR_OUT, "surge_basket_stats.rds")); setDT(gg)
p  <- merge(p, gg[, .(hs6, surge)], by = "hs6", all.x = TRUE, suffixes = c("", ".x"))
p[is.na(surge), surge := FALSE]

base_yr <- 2018:2021
base_expRU <- p[surge == TRUE & year(tt) %in% base_yr, sum(expRU_usd)] / length(base_yr) / 1e6
yrs <- 2022:2025
incr <- sapply(yrs, function(y) p[surge == TRUE & year(tt) == y, sum(expRU_usd)]/1e6 - base_expRU)
incr[incr < 0] <- 0
incr_total <- sum(incr)

cet <- c(lo = 0.04, mid = 0.06, hi = 0.08)      # EAEU CET on these HS lines
clr <- c(lo = 0.5,  mid = 0.75, hi = 1.0)       # share formally customs-cleared in KZ (vs bonded transit)
grid <- CJ(cet = cet, clr = clr)
grid[, duty_musd := incr_total * clr * cet]     # net import VAT ~ 0 on the re-exported portion

sink(file.path(DIR_OUT, "rq2c_fiscal.txt"), split = TRUE)
cat("===== RQ2(c): fiscal take from the reorientation =====\n\n")
cat(sprintf("pre-2022 baseline KZ->Russia (surge basket)     : $%.0f m/yr\n", base_expRU))
cat("incremental KZ->Russia (surge basket), reorientation-attributable:\n")
print(data.table(year = yrs, incremental_musd = round(incr)))
cat(sprintf("cumulative 2022-25 incremental                  : $%.0f m\n\n", incr_total))
print(grid[, .(CET = cet, cleared_share = clr, customs_duty_musd = round(duty_musd, 1))])
mid <- grid[cet == 0.06 & clr == 0.75]
cat(sprintf(
"\nHEADLINE (mid): customs duty on the rerouted flow ~ $%.0f m over 2022-25 (~$%.0f m/yr); net
import VAT ~ 0 (goods leave to Russia intra-EAEU, onward supply zero-rated). Kazakhstan's
annual customs revenue is ~ $4-5 bn -> the reorientation adds well under 1%%. The fiscal
channel is negligible; whatever Kazakhstan gains from the reorientation is the trade margin
(RQ2a-b), not tax.\n", mid$duty_musd, mid$duty_musd/4))
cat("\nCaveat: if a larger share transits under bonded procedure, duty is lower still. Import\n",
    "VAT on the domestically-absorbed (non-rerouted) inflow is ordinary revenue, not a\n",
    "reorientation gain, and is excluded here.\n")
sink()
save_out(grid, "rq2c_fiscal_grid")
message("RQ2(c) done: _outputs/rq2c_fiscal.txt")
