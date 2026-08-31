# 06m_monthly_profile.R — monthly time profile of the reorientation for the FROZEN
# (annual-defined) surge basket. Monthly HS6 bilateral data is zero-heavy for a small
# country, so we do NOT re-select the basket or run HS6-level DiD on it; we use the monthly
# data for what it is good for: the aggregate series, the break DATE, the event study around
# 2022m3, and the in->out lag.

source("00_setup.R")
suppressMessages({library(data.table); library(fixest); library(strucchange); library(ggplot2)})

p  <- readRDS(file.path(DIR_OUT, "panel_monthly.rds")); setDT(p)
fb <- readRDS(file.path(DIR_OUT, "surge_basket_frozen.rds")); setDT(fb)
p  <- merge(p, fb[, .(hs6, surge)], by = "hs6", all.x = TRUE, suffixes = c("", ".f"))
p[is.na(surge), surge := FALSE]
TREAT <- as.Date("2022-03-01")

ag <- p[surge == TRUE, .(mirWC = sum(mirWC_usd), mirW = sum(mirW_usd), impW = sum(impW_usd),
                         expRU = sum(expRU_usd), mirCN = sum(mirCN_usd)),
        by = tt][order(tt)]
ag[, `:=`(mrel = 12 * (year(tt) - 2022) + month(tt) - 3)]      # 0 = 2022-03

sink(file.path(DIR_OUT, "rq1_monthly.txt"), split = TRUE)
cat("===== RQ1 monthly profile — frozen surge basket (", sum(fb$surge), "HS6) =====\n")
cat("months:", as.character(range(ag$tt)), " (2024 dropped: KZ stopped monthly reporting)\n")
cat("inbound = mirWC (West EU-27/UK/US/JP/KR/CH/NO + China mirrored exports to KZ)\n\n")

## structural break on the monthly aggregate series -> BREAK DATE(S) + 95% CI
for (v in c("mirWC", "mirW", "expRU")) {
  s  <- ts(asinh(ag[[v]]), frequency = 12, start = c(year(min(ag$tt)), month(min(ag$tt))))
  bp <- breakpoints(s ~ 1, h = 0.15)
  st <- sctest(Fstats(s ~ 1, from = 0.15), type = "supF")
  bd <- "none"
  if (!all(is.na(bp$breakpoints))) {
    ci <- tryCatch(confint(bp)$confint, error = function(e) NULL)
    bd <- if (!is.null(ci))
      paste(sprintf("%s [%s,%s]", format(ag$tt[bp$breakpoints], "%Y-%m"),
                    format(ag$tt[pmax(1, ci[, 1])], "%Y-%m"),
                    format(ag$tt[pmin(nrow(ag), ci[, 3])], "%Y-%m")), collapse = "; ")
      else paste(format(ag$tt[bp$breakpoints], "%Y-%m"), collapse = ", ")
  }
  cat(sprintf("  %-6s : supF = %.1f  p = %.3g   Bai-Perron breaks = %s\n",
              v, st$statistic, st$p.value, bd))
}

## event study on the aggregate (monthly), window +-15 months, ref = -1
es_dt <- ag[abs(mrel) <= 15]
esW <- feols(asinh(mirWC) ~ i(mrel, ref = -1), es_dt)
esR <- feols(asinh(expRU) ~ i(mrel, ref = -1), es_dt)

## level ratio pre vs post (aggregate)
pre  <- ag[tt <  as.Date("2022-01-01"), .(mirWC = mean(mirWC), expRU = mean(expRU))]
post <- ag[tt >= TREAT & tt < as.Date("2024-01-01"), .(mirWC = mean(mirWC), expRU = mean(expRU))]
cat(sprintf("\naggregate monthly level: West+China->KZ x%.2f (%.1f -> %.1f $m/mo);  KZ->Russia x%.2f (%.1f -> %.1f)\n",
            post$mirWC/pre$mirWC, pre$mirWC/1e6, post$mirWC/1e6,
            post$expRU/pre$expRU, pre$expRU/1e6, post$expRU/1e6))
sink()

## ---- figures ----
plot_dt <- melt(ag[, .(tt, `West+China -> KZ (mirror)` = mirWC/1e6, `KZ -> Russia` = expRU/1e6)],
                id.vars = "tt")
plot_dt[tt >= as.Date("2024-01-01") & tt < as.Date("2025-01-01"), value := NA]  # KZ monthly reporting gap
save_fig(
  ggplot(plot_dt, aes(tt, value, colour = variable)) +
    geom_vline(xintercept = as.numeric(TREAT), linetype = 2, colour = "grey40") +
    geom_line(linewidth = .7, na.rm = TRUE) +
    labs(title = "Surge-basket trade through Kazakhstan, monthly",
         subtitle = "USD million. Frozen (annual-defined) basket. Dashed = 2022-03. 2024 omitted (no KZ monthly reporting).",
         x = NULL, y = "USD m", colour = NULL),
  "rq1_fig_monthly")

grab <- function(m) {
  nm <- names(coef(m)); keep <- grepl("^mrel::", nm)
  data.table(mrel = as.integer(sub("^mrel::(-?[0-9]+)$", "\\1", nm[keep])),
             b = as.numeric(coef(m))[keep], se = as.numeric(se(m))[keep])
}
edf <- rbind(cbind(series = "West+China->KZ", grab(esW)),
             cbind(series = "KZ->Russia",     grab(esR)))[!is.na(mrel)]
save_fig(
  ggplot(edf, aes(mrel, b, colour = series)) +
    geom_hline(yintercept = 0, colour = "grey70") +
    geom_vline(xintercept = -0.5, linetype = 2, colour = "grey40") +
    geom_pointrange(aes(ymin = b - 1.96*se, ymax = b + 1.96*se), position = position_dodge(.4)) +
    labs(title = "Event study around 2022m3 (monthly aggregate, frozen surge basket)",
         subtitle = "asinh(value) ~ i(month_rel), ref = -1; 95% CI", x = "months relative to 2022m3",
         y = "coefficient", colour = NULL),
  "rq1_fig_monthly_eventstudy")

message("06m done: _outputs/rq1_monthly.txt, rq1_fig_monthly*.png")
