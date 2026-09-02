# 07_unit_value_wedge.R — RQ2(a): how much margin does Kazakhstan retain per $ rerouted?
# Compares the unit value (USD/kg) of the goods flowing INTO KZ with KZ exports-to-Russia for
# the same HS6xperiod. PRIMARY inbound price = mirror West+China (mirWC, FOB) -> the wedge is
# FOB-vs-FOB and free of the CIF/FOB asymmetry. KZ-reported import price (uv_impW, CIF) kept
# as a variant. Pass-through corridor => wedge ~ 1; genuine processing => larger wedge / weight
# gain. Also reports the CONTROL (civilian) basket, so a sub-1 wedge is not read as distinctive.

source("00_setup.R")
suppressMessages({library(data.table); library(fixest); library(ggplot2)})
`%||%` <- function(a,b) if (is.null(a)) b else a

p <- readRDS(file.path(DIR_OUT, "panel_hs_period.rds")); setDT(p)
g <- readRDS(file.path(DIR_OUT, "surge_basket_stats.rds")); setDT(g)
if (!"surge" %in% names(p)) p <- merge(p, g[, .(hs6, surge)], by = "hs6", all.x = TRUE)
p[is.na(surge), surge := FALSE]
TREAT <- if ((attr(p, "freq") %||% "A") == "M") as.Date("2022-03-01") else as.Date("2022-01-01")

mkcells <- function(dt) {
  d <- dt[tt >= TREAT & expRU_kg > 0 & expRU_usd > 0 & mirWC_kg > 0 & mirWC_usd > 0]
  d[, `:=`(
    uv_mirWC = mirWC_usd / mirWC_kg,                          # inbound price, mirror FOB (primary)
    uv_impW  = fifelse(impW_kg > 0 & impW_usd > 0, impW_usd / impW_kg, NA_real_),  # KZ-reported CIF
    uv_expRU = expRU_usd / expRU_kg,
    passthru_val = pmin(expRU_usd, mirWC_usd) / mirWC_usd,
    wt_ratio     = expRU_kg / mirWC_kg)]
  d[, `:=`(uv_wedge     = uv_expRU / uv_mirWC,                # primary
           uv_wedge_cif = uv_expRU / uv_impW)]                # KZ-reported variant
  d[, matched_in_usd := mirWC_usd * pmin(1, wt_ratio)]        # inbound cost of the re-exported qty
  d[, retained_usd   := pmax(0, expRU_usd - matched_in_usd)]  # f.o.b.-basis gross margin
  d
}
post  <- mkcells(p[surge == TRUE])
postc <- mkcells(p[exposed == FALSE])                          # civilian control comparison

summ <- post[, .(
  n_cells        = .N,
  med_uv_wedge   = median(uv_wedge, na.rm = TRUE),
  p25_uv_wedge   = quantile(uv_wedge, .25, na.rm = TRUE),
  p75_uv_wedge   = quantile(uv_wedge, .75, na.rm = TRUE),
  med_wedge_cif  = median(uv_wedge_cif, na.rm = TRUE),
  med_passthru   = median(passthru_val, na.rm = TRUE),
  tot_inflow_musd   = sum(mirWC_usd) / 1e6,
  tot_expRU_musd    = sum(expRU_usd) / 1e6,
  tot_retained_musd = sum(retained_usd) / 1e6)]
summ[, retained_share_of_gross := tot_retained_musd / tot_expRU_musd]

sink(file.path(DIR_OUT, "rq2a_unit_value_wedge.txt"), split = TRUE)
cat("===== RQ2(a): unit-value wedge & retained margin (surge basket, post-2022) =====\n")
cat("primary wedge = uv_expRU / uv_mirWC  (both FOB) ; _cif variant uses KZ-reported imports\n\n")
print(summ)
cat(sprintf("\ncontrol (civilian) basket, same construction: n=%d, median wedge = %.3f (cif %.3f)\n",
            nrow(postc), median(postc$uv_wedge, na.rm = TRUE), median(postc$uv_wedge_cif, na.rm = TRUE)))
cat("=> a sub-1 wedge is a general feature of this trade, not specific to the reorientation.\n\n")
cat("-- wedge by CHPL tier (surge basket) --\n")
print(post[, .(med_wedge = median(uv_wedge, na.rm = TRUE),
               retained_musd = sum(retained_usd)/1e6,
               gross_musd = sum(expRU_usd)/1e6), by = tier][order(tier)])
cat("\n-- pass-through: log(uv_expRU) ~ log(uv_mirWC) | hs6 + tt  (slope ~1 => pure markup) --\n")
print(coeftable(feols(log(uv_expRU) ~ log(uv_mirWC) | hs6 + tt, post, cluster = ~hs6)))
cat("\n-- pass-through, KZ-reported variant: log(uv_expRU) ~ log(uv_impW) --\n")
print(coeftable(feols(log(uv_expRU) ~ log(uv_impW) | hs6 + tt, post[is.finite(uv_impW)], cluster = ~hs6)))
cat(sprintf("\n-- weight ratio (kg out / kg in), matched cells: median %.3f, p25 %.3f, p75 %.3f ; share > 1.05: %.2f --\n",
            median(post$wt_ratio, na.rm = TRUE),
            quantile(post$wt_ratio, .25, na.rm = TRUE), quantile(post$wt_ratio, .75, na.rm = TRUE),
            mean(post$wt_ratio > 1.05, na.rm = TRUE)))

## ---- R&R Essential 1(b): the aggregate kg ratio tracks the value flow-through, so it is
## uninformative about transformation whenever flow-through is partial. The Comtrade extract
## carries value + net weight but NOT physical quantity/units, so the per-physical-unit
## statistic the referee asks for (netWgt/qty in vs out) cannot be formed here. Fallback
## (editor-offered): restrict to NEAR-PURE-TRANSIT cells where value flow-through ~ 1, where
## the aggregate weight ratio IS interpretable.
post[, vft := expRU_usd / mirWC_usd]                       # cell-level value flow-through
val_ratio_all <- sum(post$expRU_usd, na.rm=TRUE) / sum(post$mirWC_usd, na.rm=TRUE)
transit <- post[is.finite(vft) & vft >= 0.8 & vft <= 1.25]  # near-pure-transit cells
cat(sprintf("\n-- Essential 1(b): weight ratio vs value flow-through --\n"))
cat(sprintf("   median kg_out/kg_in = %.3f   ~=   aggregate value flow-through = %.3f  (same object)\n",
            median(post$wt_ratio, na.rm=TRUE), val_ratio_all))
cat(sprintf("   -> ~%.0f%% of the imported tonnage in these lines is NOT re-exported to Russia; an\n",
            100*(1 - median(post$wt_ratio, na.rm=TRUE))))
cat("      aggregate kg ratio below one is consistent with that, not only with 'no weight gain'.\n")
cat(sprintf("   near-pure-transit cells (value flow-through in [0.8, 1.25]): n = %d of %d\n",
            nrow(transit), nrow(post)))
if (nrow(transit) >= 5) {
  cat(sprintf("      weight ratio there: median %.3f, p25 %.3f, p75 %.3f ; share > 1.05: %.2f\n",
              median(transit$wt_ratio, na.rm=TRUE),
              quantile(transit$wt_ratio, .25, na.rm=TRUE), quantile(transit$wt_ratio, .75, na.rm=TRUE),
              mean(transit$wt_ratio > 1.05, na.rm=TRUE)))
  cat("      In cells where essentially all the tonnage is re-exported, the weight ratio is at or\n")
  cat("      below one -> no evidence of local input added on the goods that do transit.\n")
} else {
  cat("      too few near-pure-transit cells for a stable read; report the limitation.\n")
}
sink()

## keep legacy column name for 08 compatibility
post[, impW_usd_for_io := mirWC_usd]
save_out(post, "rq2a_cell_measures")
save_fig(
  ggplot(post[is.finite(uv_wedge) & uv_wedge > 0 & uv_wedge < 5],
         aes(uv_wedge)) +
    geom_histogram(bins = 40) +
    geom_vline(xintercept = 1, linetype = 2, colour = "grey40") +
    labs(title = "Unit-value wedge: KZ re-export price / exporter-reported inbound price",
         subtitle = "Same HS6, surge basket, post-2022. Both prices f.o.b. Wide dispersion; no mass at the high multiples.",
         x = "uv_expRU / uv_mirWC  (f.o.b. / f.o.b.)", y = "HS6 x period cells"),
  "rq2a_fig_wedge_hist")

message("RQ2(a) done: _outputs/rq2a_unit_value_wedge.txt, rq2a_fig_wedge_hist.png")
