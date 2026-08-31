# 08_io_propagation.R — RQ2(b): domestic value added Kazakhstan retains per USD rerouted.
#
# HYBRID scope (2026-08-31): the DiD / basket (sec 4) is selected on West+China inbound, but
# the value-capture question is about the REORIENTATION-DRIVEN flow, so here we scope to the
# INCREMENTAL WESTERN inbound (post-2022 surge-basket mirW_usd over the 2018-21 baseline) and
# the incremental outbound to Russia. The pre-existing, already-growing China->KZ trade (most
# of it for Kazakh domestic use) is not "the reorientation" and is excluded from the denominator.
#
# Retained margin m: bounded below by the KZ national-accounts trade+insurance+freight
# convention (6-14%); bounded above by the matched-cell gross margin AFTER netting the inbound
# freight Kazakhstan pays (c.i.f.-f.o.b. wedge), which is domestic VA for the freight carrier
# only in part. VA per rerouted $ = m * v_TT (trade/transport multiplier) vs v_M for mfg.

source("00_setup.R")
suppressMessages({library(data.table)})

p   <- readRDS(file.path(DIR_OUT, "panel_hs_period.rds")); setDT(p)
gg  <- readRDS(file.path(DIR_OUT, "surge_basket_stats.rds")); setDT(gg)
if (!"surge" %in% names(p)) p <- merge(p, gg[, .(hs6, surge)], by = "hs6", all.x = TRUE)
p[is.na(surge), surge := FALSE]
p07 <- readRDS(file.path(DIR_OUT, "rq2a_cell_measures.rds")); setDT(p07)

## ---- incremental flows (reorientation-attributable), $m ----------------------
base_yr <- 2018:2021; post_yr <- 2022:2025
b_expRU <- p[surge == TRUE & year(tt) %in% base_yr, sum(expRU_usd)] / length(base_yr)
b_mirW  <- p[surge == TRUE & year(tt) %in% base_yr, sum(mirW_usd)]  / length(base_yr)
incr_expRU <- max(0, p[surge == TRUE & year(tt) %in% post_yr, sum(expRU_usd)] - b_expRU * length(post_yr)) / 1e6
incr_mirW  <- max(0, p[surge == TRUE & year(tt) %in% post_yr, sum(mirW_usd)]  - b_mirW  * length(post_yr)) / 1e6
gross_musd <- incr_expRU                                   # incremental rerouted flow -> Russia

## ---- retained margin, matched cells, freight-netted -------------------------
## freight base = inbound cost of the RE-EXPORTED quantity only (matched_in_usd), not the
## whole inbound flow. EU/China -> landlocked KZ inbound freight ~ 10-20% of value.
freight <- c(lo = 0.10, mid = 0.15, hi = 0.20)
tot_expRU_cells   <- sum(p07$expRU_usd,      na.rm = TRUE)
tot_matchedin     <- sum(p07$matched_in_usd, na.rm = TRUE)
retained_gross    <- sum(p07$retained_usd,   na.rm = TRUE)   # f.o.b.-basis gross margin (upper bound)
m_gross      <- retained_gross / tot_expRU_cells                                        # ~0.34, incl. inbound freight
m_netfreight <- pmax(0, retained_gross - freight["mid"] * tot_matchedin) / tot_expRU_cells  # freight removed

io_path <- file.path(DIR_DATA, "kz_io.rds")
sink(file.path(DIR_OUT, "rq2b_io_propagation.txt"), split = TRUE)
cat("===== RQ2(b): domestic value capture from the trade reorientation (HYBRID scope) =====\n\n")
cat(sprintf("baseline 2018-21 : KZ->Russia $%.0f m/yr | Western inbound $%.0f m/yr (surge basket)\n",
            b_expRU/1e6, b_mirW/1e6))
cat(sprintf("incremental 2022-25 (reorientation-attributable): outbound to Russia $%.0f m ; Western inbound $%.0f m\n",
            incr_expRU, incr_mirW))
cat(sprintf("incremental flow-through (out / Western in)     : %.2f\n\n", incr_expRU/incr_mirW))
cat(sprintf("matched-cell gross margin (f.o.b. basis)        : %.3f  (upper bound; incl. inbound freight)\n", m_gross))
cat(sprintf("  ... after netting inbound freight (~15%%)       : %.3f\n\n", m_netfreight))

if (file.exists(io_path)) {
  io <- readRDS(io_path)
  mv <- mean(io$va_mult[io$margin_sectors])            # KZ trade+transport domestic VA multiplier
  fv <- mean(io$va_mult[io$mfg_sectors])               # KZ manufacturing domestic VA multiplier
  margin_va <- c(mid = mv); mfg_va <- c(mid = fv)
  ## m band: 6% / 10% (NA trade+insurance+freight convention) .. freight-netted matched-cell estimate
  margin_rate <- c(lo = 0.06, mid = 0.10, hi = round(as.numeric(m_netfreight), 3))
  cat("MODE: FULL — Leontief from OECD ICIO", io$year, "\n")
  cat(sprintf("  KZ VA multiplier: trade+transport = %.3f, manufacturing = %.3f (v'L)\n", mv, fv))
  cat(sprintf("  m band: 6%% / 10%% (NA convention) .. %.0f%% (freight-netted matched-cell)\n\n", 100*m_netfreight))
} else {
  cat("MODE: PARAM (fallback — run 08a_get_io.R to build _data/kz_io.rds from OECD ICIO)\n\n")
  margin_rate <- c(lo = 0.06, mid = 0.10, hi = 0.19)
  margin_va   <- c(mid = 0.70); mfg_va <- c(mid = 0.45)
}

grid <- CJ(mr = margin_rate, mv = margin_va, fv = mfg_va)
grid[, `:=`(
  kz_va_from_rerouting_musd = gross_musd * mr * mv,
  kz_va_per_gross_dollar    = mr * mv,
  kz_va_if_domestic_mfg     = fv,
  ratio_corridor_vs_factory = (mr * mv) / fv)]

cat("\n-- domestic VA per $1 of incremental rerouted flow, vs per $1 of domestic mfg output --\n")
print(grid[, .(margin_rate = mr, margin_VAmult = round(mv,3), mfg_VAmult = round(fv,3),
               VA_per_usd_rerouted = round(kz_va_per_gross_dollar, 3),
               VA_per_usd_domestic = round(kz_va_if_domestic_mfg, 3),
               ratio = round(ratio_corridor_vs_factory, 3))])

lo <- grid[mr == min(mr)]; hi <- grid[mr == max(mr)]; mid <- grid[abs(mr - 0.10) < 1e-9]
cat(sprintf(
"\nHEADLINE: of ~$%.0f m in incremental exports to Russia after 2022, Kazakhstan retains
~$%.0f-%.0f m as domestic value added, i.e. %.0f-%.0f%% of the gross flow (midpoint ~%.0f%%),
against ~%.0f%% per dollar of domestic manufacturing output. A rerouted dollar creates on the
order of a tenth to a fifth as much domestic value as a produced one. Corridor, not factory.\n",
  gross_musd, lo$kz_va_from_rerouting_musd, hi$kz_va_from_rerouting_musd,
  100*lo$kz_va_per_gross_dollar, 100*hi$kz_va_per_gross_dollar, 100*mid$kz_va_per_gross_dollar,
  100*mid$kz_va_if_domestic_mfg))
cat("\n(Fiscal — customs duty + import VAT on the KZ-clearing, non-EAEU-exempt share — is 09_*.R.)\n")
sink()
save_out(grid, "rq2b_io_results")
message("RQ2(b) done: _outputs/rq2b_io_propagation.txt")
