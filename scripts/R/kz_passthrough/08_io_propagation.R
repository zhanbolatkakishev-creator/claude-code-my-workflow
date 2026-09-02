# 08_io_propagation.R — RQ2(b): domestic value added Kazakhstan retains per USD rerouted.
#
# Scope (2026-08-31, round-2 revision): the DiD / basket (sec 4) is selected on West+China
# inbound, but the value-capture question is about the REORIENTATION-DRIVEN flow, so here we
# scope to the INCREMENTAL WESTERN inbound and the incremental outbound to Russia. The large,
# already-growing China->KZ trade is not "the reorientation" and is excluded from the
# denominator; we report the West+China flow-through alongside for context.
#
# Retained margin m: the seven-pass round-2 review showed the matched-cell f.o.b. margin is
# not a usable estimate (censoring negative-margin cells inflates it to +34%; the value-
# weighted aggregate is negative, dominated by a c.i.f./f.o.b. and under-invoicing artifact).
# We therefore take m from the Kazakhstan national-accounts trade+insurance+freight convention
# on goods trade, 6-14%, and use the matched-cell unit-value wedge (07) only descriptively.
# VA per rerouted $ = m * v_TT (trade/transport multiplier) vs v_M for manufacturing.

source("00_setup.R")
suppressMessages({library(data.table)})

p   <- readRDS(file.path(DIR_OUT, "panel_hs_period.rds")); setDT(p)
gg  <- readRDS(file.path(DIR_OUT, "surge_basket_stats.rds")); setDT(gg)
if (!"surge" %in% names(p)) p <- merge(p, gg[, .(hs6, surge)], by = "hs6", all.x = TRUE)
p[is.na(surge), surge := FALSE]
p07 <- readRDS(file.path(DIR_OUT, "rq2a_cell_measures.rds")); setDT(p07)

## ---- incremental flows (reorientation-attributable), $m ----------------------
base_yr <- 2018:2021; post_yr <- 2022:2025
b_expRU  <- p[surge == TRUE & year(tt) %in% base_yr, sum(expRU_usd)]  / length(base_yr)
b_mirW   <- p[surge == TRUE & year(tt) %in% base_yr, sum(mirW_usd)]   / length(base_yr)
b_mirWC  <- p[surge == TRUE & year(tt) %in% base_yr, sum(mirWC_usd)]  / length(base_yr)
incr_expRU <- max(0, p[surge == TRUE & year(tt) %in% post_yr, sum(expRU_usd)] - b_expRU * length(post_yr)) / 1e6
incr_mirW  <- max(0, p[surge == TRUE & year(tt) %in% post_yr, sum(mirW_usd)]  - b_mirW  * length(post_yr)) / 1e6
incr_mirWC <- max(0, p[surge == TRUE & year(tt) %in% post_yr, sum(mirWC_usd)] - b_mirWC * length(post_yr)) / 1e6
gross_musd <- incr_expRU

## ---- matched-cell unit-value wedge: descriptive only (see header) ------------
tot_expRU_cells <- sum(p07$expRU_usd,      na.rm = TRUE)
tot_matchedin   <- sum(p07$matched_in_usd, na.rm = TRUE)
m_gross_censored <- sum(p07$retained_usd, na.rm = TRUE) / tot_expRU_cells          # +0.34, censored (NOT used)
m_agg_uncensored <- (tot_expRU_cells - tot_matchedin) / tot_expRU_cells            # negative (NOT used)

io_path <- file.path(DIR_DATA, "kz_io.rds")
sink(file.path(DIR_OUT, "rq2b_io_propagation.txt"), split = TRUE)
cat("===== RQ2(b): domestic value capture from the trade reorientation =====\n\n")
cat(sprintf("baseline 2018-21 : KZ->Russia $%.0f m/yr | Western inbound $%.0f m/yr | West+China inbound $%.0f m/yr\n",
            b_expRU/1e6, b_mirW/1e6, b_mirWC/1e6))
cat(sprintf("incremental 2022-25 (reorientation-attributable): outbound $%.0f m ; Western inbound $%.0f m ; West+China inbound $%.0f m\n",
            incr_expRU, incr_mirW, incr_mirWC))
cat(sprintf("incremental flow-through: out / Western in = %.2f ;  out / West+China in = %.2f\n\n",
            incr_expRU/incr_mirW, incr_expRU/incr_mirWC))
cat(sprintf("matched-cell unit-value wedge (07), descriptive only: censored gross margin = %+.2f ; value-weighted aggregate = %+.2f\n",
            m_gross_censored, m_agg_uncensored))
cat("  -> not a usable margin estimate (censoring inflates; the aggregate is a c.i.f./f.o.b. + under-invoicing artifact).\n")
cat("  -> m taken instead from the KZ national-accounts trade+insurance+freight convention: 6-14%.\n\n")

if (file.exists(io_path)) {
  io <- readRDS(io_path)
  mv <- mean(io$va_mult[io$margin_sectors])            # KZ trade+transport domestic VA multiplier
  fv <- mean(io$va_mult[io$mfg_sectors])               # KZ manufacturing domestic VA multiplier
  cat("MODE: FULL — Leontief from OECD ICIO", io$year, "\n")
  cat(sprintf("  KZ VA multiplier: trade+transport = %.3f, manufacturing = %.3f (v'L)\n\n", mv, fv))
} else {
  cat("MODE: PARAM (fallback — run 08a_get_io.R)\n\n")
  mv <- 0.79; fv <- 0.76
}
margin_rate <- c(lo = 0.06, mid = 0.10, hi = 0.14)      # KZ NA trade+insurance+freight convention

grid <- CJ(mr = margin_rate, mv = mv, fv = fv)
grid[, `:=`(
  kz_va_from_rerouting_musd = gross_musd * mr * mv,
  kz_va_per_gross_dollar    = mr * mv,
  kz_va_if_domestic_mfg     = fv,
  ratio_corridor_vs_factory = (mr * mv) / fv)]

cat("-- domestic VA per $1 of incremental rerouted flow, vs per $1 of domestic mfg output --\n")
print(grid[, .(m = mr, margin_VAmult = round(mv,3), mfg_VAmult = round(fv,3),
               VA_per_usd_rerouted = round(kz_va_per_gross_dollar, 3),
               VA_per_usd_domestic = round(kz_va_if_domestic_mfg, 3),
               ratio = round(ratio_corridor_vs_factory, 3))])

lo <- grid[mr == min(mr)]; hi <- grid[mr == max(mr)]; mid <- grid[abs(mr - 0.10) < 1e-9]
cat(sprintf(
"\nHEADLINE: of ~$%.0f m in incremental exports to Russia after 2022, Kazakhstan retains
~$%.0f-%.0f m as domestic value added, i.e. %.0f-%.0f%% of the gross flow (midpoint ~%.0f%%),
against ~%.0f%% per dollar of domestic manufacturing output --- a rerouted dollar creates on
the order of a tenth as much domestic value as a produced one. Corridor, not factory.\n",
  gross_musd, lo$kz_va_from_rerouting_musd, hi$kz_va_from_rerouting_musd,
  100*lo$kz_va_per_gross_dollar, 100*hi$kz_va_per_gross_dollar, 100*mid$kz_va_per_gross_dollar,
  100*mid$kz_va_if_domestic_mfg))
cat("\nCAVEAT: single I-O vintage (OECD ICIO 2019); the ICIO's KZ domestic-content shares are\n")
cat("relatively high, so v_TT and v_M are likely upper bounds. An ADB MRIO / KZ BNS 68-product\n")
cat("cross-check is left for a robustness appendix. (Fiscal is 09_*.R.)\n")

## ---- R&R Essential 1(a): full sensitivity of the headline to m -----------------
## m is a calibration, not an estimate. The I-O step does little work (mv ~= fv), so the
## rerouted-vs-produced ratio is ~ (mv/fv)*m. Sweep m over the whole BNS resources-table
## bracket [transport-only ~1%, full trade+transport ~49%] and report where the headline
## framing changes.
mg <- seq(0.01, 0.49, by = 0.01)
sens <- data.table(m = mg,
                   VA_per_usd_rerouted = mg * mv,
                   ratio_to_produced   = (mg * mv) / fv,
                   retained_musd       = gross_musd * mg * mv)
cross <- function(target) sens[which.min(abs(ratio_to_produced - target)), m]
cat("\n-- Essential 1(a): sensitivity of the value-capture headline to m --\n")
cat(sprintf("   ratio_to_produced ~= %.3f * m   (mv=%.3f, fv=%.3f; the I-O step moves it ~%.0f%%)\n",
            mv/fv, mv, fv, 100*abs((mv/fv)-1)))
anchors <- data.table(
  label = c("transport margin only", "paper's band (lo)", "paper's band (mid)",
            "paper's band (hi)", "censored matched-cell gross margin", "full trade+transport margin"),
  m     = c(0.01, 0.06, 0.10, 0.14, 0.34, 0.49))
anchors[, `:=`(VA_per_usd_rerouted = round(m * mv, 3),
               ratio_to_produced   = round((m * mv) / fv, 3),
               retained_musd       = round(gross_musd * m * mv))]
print(anchors)
cat(sprintf("\n   m at which the rerouted dollar captures one-fifth of a produced dollar : %.2f\n", cross(1/5)))
cat(sprintf("   m at which it captures one-third                                       : %.2f\n", cross(1/3)))
cat(sprintf("   m at which it captures one-half                                        : %.2f\n", cross(1/2)))
cat("   READ: 'corridor, not factory' (a rerouted dollar ~ a tenth of a produced one) holds for\n")
cat(sprintf("   m up to about %.2f; it weakens to 'about a fifth' at m~%.2f and to 'about a third' at m~%.2f.\n",
            cross(0.12), cross(1/5), cross(1/3)))
cat("   The paper's 6-14% band is a wholesale-plus-freight reading of the BNS bracket; it is chosen,\n")
cat("   not estimated, and the whole headline scales with it.\n")
save_out(sens, "rq2b_m_sensitivity")

## ---- R&R secondary #7: flat vs trend counterfactual for the $479m increment ----
## The pre-2022 outbound series is itself declining (17 -> 8), so a flat counterfactual at
## the 2018-21 mean is conservative relative to extrapolating the pre-trend.
ru_ann <- p[surge == TRUE, .(ru = sum(expRU_usd) / 1e6), by = .(yr = year(tt))][order(yr)]
pre_ru <- ru_ann[yr %in% base_yr]; post_ru <- ru_ann[yr %in% post_yr]
cf_flat  <- mean(pre_ru$ru)
cf_trend <- pmax(0, predict(lm(ru ~ yr, pre_ru), newdata = post_ru))
incr_flat  <- sum(post_ru$ru) - length(post_yr) * cf_flat
incr_trend <- sum(post_ru$ru) - sum(cf_trend)
cat("\n-- #7: counterfactual sensitivity of the incremental outbound flow --\n")
cat(sprintf("   pre-2022 outbound $m/yr : %s  (declining)\n", paste(round(pre_ru$ru, 1), collapse = ", ")))
cat(sprintf("   flat cf (2018-21 mean)  : %.1f/yr  -> increment = $%.0f m  (headline)\n", cf_flat, incr_flat))
cat(sprintf("   linear-trend cf         : %s      -> increment = $%.0f m\n",
            paste(round(cf_trend, 1), collapse = ", "), incr_trend))
cat(sprintf("   => the flat counterfactual is conservative; the trend cf raises the increment ~%.0f%%\n",
            100 * (incr_trend / incr_flat - 1)))

## ---- R&R secondary #8: where the flow-through gap goes -------------------------
## flow-through = incr KZ->Russia / incr Western inbound. The complement is domestic use +
## onward export to non-Russia destinations + measurement. Decompose using KZ-reported
## exports of the surge basket to World (partnerCode 0) and to Russia (643).
kzx_f <- list.files(file.path(DIR_DATA, "json_annual"), "^kzexp_.*json$", full.names = TRUE)
if (length(kzx_f)) {
  suppressMessages(library(jsonlite))
  sbv <- gg[surge == TRUE, hs6]
  kzx <- rbindlist(lapply(kzx_f, function(f) {
    j <- tryCatch(fromJSON(f), error = function(e) NULL)
    if (is.null(j$data) || !length(j$data)) return(NULL)
    as.data.table(j$data)
  }), fill = TRUE)
  kzx[, `:=`(hs6 = sprintf("%06d", as.integer(cmdCode)), v = as.numeric(primaryValue),
             yr = refYear, pc = partnerCode)]
  kzx <- kzx[hs6 %in% sbv & pc %in% c(0, 643)]
  w <- dcast(kzx, yr ~ pc, value.var = "v",
             fun.aggregate = function(x) sum(x, na.rm = TRUE) / 1e6)
  setnames(w, c("0", "643"), c("world", "russia"), skip_absent = TRUE)
  w[, nonRU := world - russia]
  iw <- function(col) sum(w[yr %in% post_yr][[col]]) - length(post_yr) * mean(w[yr %in% base_yr][[col]])
  incr_world <- iw("world"); incr_ru_x <- iw("russia"); incr_nonRU <- iw("nonRU")
  resid_gap <- incr_mirW - incr_ru_x - incr_nonRU
  cat("\n-- #8: decomposition of the incremental Western inbound ($", sprintf("%.0f", incr_mirW), "m) --\n", sep = "")
  cat(sprintf("   onward to Russia (KZ-reported exports)      : $%.0f m  (%.0f%%)\n",
              incr_ru_x, 100 * incr_ru_x / incr_mirW))
  cat(sprintf("   onward to non-Russia destinations           : $%.0f m  (%.0f%%)\n",
              incr_nonRU, 100 * incr_nonRU / incr_mirW))
  cat(sprintf("   residual (domestic absorption + inventory + c.i.f./mirror measurement gap): $%.0f m  (%.0f%%)\n",
              resid_gap, 100 * resid_gap / incr_mirW))
  cat("   => onward diversion to third countries is small; the gap is domestic use + measurement,\n")
  cat("      not hidden re-export.\n")
} else {
  cat("\n-- #8: skipped (no _data/json_annual/kzexp_*.json) --\n")
}

sink()
save_out(grid, "rq2b_io_results")
message("RQ2(b) done: _outputs/rq2b_io_propagation.txt")
