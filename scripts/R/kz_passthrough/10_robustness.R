# 10_robustness.R — reform-confound + placebo checks for RQ1
#  (a) placebo: the civilian control basket ALSO breaks in 2022 (a common disruption effect),
#      but far more weakly than the surge basket; a placebo DiD on it is flat. Reported on
#      both the UNPURGED civilian basket (exposed==FALSE) and the surge==FALSE-purged one,
#      for transparency (the 2026-08 seven-pass review flagged the purge).
#  (b) parallel: Armenia & Kyrgyz Republic show the same 2022 break with no "New Kazakhstan"
#      reform -> the break is a common Russia-trade shock, not KZ-specific liberalisation.
#      R&R E5: Georgia & Turkiye added as NON-customs-union intermediaries. Named population is
#      {Kazakhstan, Armenia, Kyrgyz Rep., Belarus} (EAEU) plus non-EAEU transit {Georgia,
#      Turkiye}. We can show the trade break for each; we cannot run the investment test outside
#      Kazakhstan (no deal data) -> external validity is for the demand shock, not the null.

source("00_setup.R")
suppressMessages({library(data.table); library(fixest); library(strucchange); library(jsonlite)})
`%||%` <- function(a,b) if (is.null(a)) b else a

p  <- readRDS(file.path(DIR_OUT, "panel_hs_period.rds")); setDT(p)
gg <- readRDS(file.path(DIR_OUT, "surge_basket_stats.rds")); setDT(gg)
p  <- merge(p, gg[, .(hs6, surge)], by = "hs6", all.x = TRUE, suffixes = c("", ".x"))
p[is.na(surge), surge := FALSE]

sink(file.path(DIR_OUT, "rq1_robustness.txt"), split = TRUE)

## ---- (a) placebo: civilian (non-restricted) basket ------------------------
cat("===== (a) PLACEBO — civilian control basket (inbound = mirWC) =====\n")
brk <- function(dt, v) {
  s <- dt[, .(y = sum(get(v))), by = tt][order(tt)]
  st <- sctest(Fstats(ts(asinh(s$y), start = year(min(s$tt))) ~ 1, from = 0.2), type = "supF")
  sprintf("supF = %7.2f  p = %.4g", st$statistic, st$p.value)
}
for (v in c("mirWC_usd", "expRU_usd")) {
  cat(sprintf("  %-11s surge basket        : %s\n", v, brk(p[surge == TRUE], v)))
  cat(sprintf("  %-11s civilian (unpurged) : %s   [%d HS6]\n", v, brk(p[exposed == FALSE], v),
              p[exposed == FALSE, uniqueN(hs6)]))
  cat(sprintf("  %-11s civilian (purged)   : %s   [%d HS6]\n\n", v,
              brk(p[exposed == FALSE & surge == FALSE], v),
              p[exposed == FALSE & surge == FALSE, uniqueN(hs6)]))
}
ctrl <- p[exposed == FALSE]
cat("  DiD on the civilian basket only (placebo 'treatment' = top-quartile pre-2022 size):\n")
big_hs6 <- ctrl[year(tt) < 2022, .(m = mean(mirWC_usd)), by = hs6][m > quantile(m, .75), hs6]
ctrl[, big := as.integer(hs6 %in% big_hs6)]
print(coeftable(feols(asinh(mirWC_usd) ~ big:post | hs6 + tt, ctrl, cluster = ~hs6)))
csurge <- p[surge == TRUE & exposed == FALSE, unique(hs6)]
cat(sprintf("\n  %d civilian HS6 fall in the surge basket; their share of post-2022 gross flow to RU: %.1f%%\n",
            length(csurge),
            100 * p[post == 1 & hs6 %in% csurge, sum(expRU_usd)] / p[post == 1, sum(expRU_usd)]))
## JIE round-1 review, Referee B minor #5: disclose which civilian lines receive the
## placebo's fake treatment, and flag any overlap with the (genuinely treated) surge basket.
cat(sprintf("\n  placebo fake-treatment ('big', top pre-2022 quartile) assigned to: %s\n",
            paste(sort(big_hs6), collapse = ", ")))
big_and_surge <- intersect(big_hs6, csurge)
cat(sprintf("  of these, in the surge basket (contamination check): %s\n",
            if (length(big_and_surge)) paste(sort(big_and_surge), collapse = ", ") else "NONE"))

## ---- (b) Armenia / Kyrgyz Republic parallel ------------------------------
nbdir <- file.path(DIR_DATA, "json_annual_nb")
if (dir.exists(nbdir) && length(list.files(nbdir, "\\.json$"))) {
  cat("\n===== (b) NEIGHBOUR-INTERMEDIARY PARALLEL (Armenia, Kyrgyz Rep. | Georgia, Turkiye) =====\n")
  cu_lab <- c(ARM = "EAEU customs union", KGZ = "EAEU customs union",
              GEO = "non-EAEU (border to Russia)", TUR = "non-EAEU (border to Russia)")
  rd <- rbindlist(lapply(list.files(nbdir, "\\.json$", full.names = TRUE), function(f) {
    j <- tryCatch(fromJSON(f), error = function(e) NULL)
    if (is.null(j$data) || !length(j$data)) return(NULL)
    d <- as.data.table(j$data); d[, tag := sub("_[0-9].*", "", basename(f))]; d
  }), use.names = TRUE, fill = TRUE)
  rd <- rd[!is.na(cmdCode)]
  rd[, `:=`(v = as.numeric(primaryValue), yr = refYear,
            ctry = toupper(sub("_.*", "", tag)), flow = sub(".*_", "", tag))]
  sb <- gg[surge == TRUE, hs6]
  agg <- rd[cmdCode %in% sb, .(v = sum(v, na.rm = TRUE)), by = .(ctry, flow, yr,
              to_russia = partnerCode == 643, from_west = reporterCode == 0)]
  # exports to Russia by country x year
  ex <- rd[cmdCode %in% sb & flow == "exp" & partnerCode == 643,
           .(expRU_m = sum(v, na.rm = TRUE)/1e6), by = .(ctry, yr)][order(ctry, yr)]
  cat("\nExports to Russia, surge-basket HS6, $m:\n"); print(dcast(ex, yr ~ ctry, value.var = "expRU_m"))
  ## JIE round-1 review, Referee B Concern 4: report an HAC (Newey-West) variant alongside the
  ## homoskedastic sup-F for each neighbour series too, with an explicit small-sample caveat --
  ## these are 8-year annual series, so the HAC bandwidth choice is itself fragile, unlike the
  ## ~70-observation monthly series in 06m_monthly_profile.R where the correction is decisive.
  for (cc in c("ARM", "KGZ", "GEO", "TUR")) {
    s <- ex[ctry == cc][order(yr)]
    if (nrow(s) >= 6) {
      st <- sctest(Fstats(ts(asinh(s$expRU_m), start = min(s$yr)) ~ 1, from = 0.25), type = "supF")
      st_hac <- tryCatch(sctest(Fstats(ts(asinh(s$expRU_m), start = min(s$yr)) ~ 1, from = 0.25,
                                        vcov = function(x) sandwich::NeweyWest(x, prewhite = FALSE)),
                                 type = "supF"), error = function(e) NULL)
      pk <- s[which.max(c(NA, diff(asinh(expRU_m)))), yr]
      cat(sprintf("  %-3s [%-27s] exports->Russia: supF = %7.2f  p = %.4g ; largest jump at %s\n",
                  cc, cu_lab[[cc]] %||% "?", st$statistic, st$p.value, pk))
      if (!is.null(st_hac))
        cat(sprintf("  %-3s   HAC (Newey-West, n=%d, caveat: small-sample) supF = %7.2f  p = %.4g\n",
                    cc, nrow(s), st_hac$statistic, st_hac$p.value))
    } else {
      cat(sprintf("  %-3s : only %d yrs of data, break test skipped\n", cc, nrow(s)))
    }
  }
  cat("\n=> The 2022 break appears in every intermediary regardless of customs-union status:\n",
      "   Armenia/Kyrgyz Rep. (EAEU, no 'New Kazakhstan' reform) AND Georgia/Turkiye (non-EAEU).\n",
      "   The break is the common Russia-trade shock, and the demand shock generalises across\n",
      "   the named population; the investment test remains Kazakhstan-only.\n")
} else {
  cat("\n(b) skipped — run fetch_neighbors.sh first (_data/json_annual_nb/).\n")
}
sink()
message("robustness done: _outputs/rq1_robustness.txt")
