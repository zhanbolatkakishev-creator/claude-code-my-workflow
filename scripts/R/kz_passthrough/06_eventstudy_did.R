# 06_eventstudy_did.R — RQ1: measure the post-2022 trade reorientation through Kazakhstan.
# Descriptive framing ("trade rerouted through KZ amid regional geopolitical tensions").
#
# PRIMARY exposed set = DATA-DRIVEN "surge basket", selected on the inbound flow the paper
# actually describes: WEST + CHINA mirrored exports to KZ (mirWC_usd), AND outflow to Russia
# (expRU_usd), both >= 2x pre->post.  The EU/US/UK/JP dual-use (CHPL) list is a pre-specified
# robustness lens; the West-only inbound measure is a second robustness variant.
#
# Consolidates the selection-aware inference (wild-cluster bootstrap, randomisation inference
# over baskets) that the 2026-08 seven-pass review asked for. Works on annual or monthly panel.

source("00_setup.R")
suppressMessages({library(data.table); library(fixest); library(strucchange); library(ggplot2)})
`%||%` <- function(a,b) if (is.null(a)) b else a
set.seed(20260831)

p <- readRDS(file.path(DIR_OUT, "panel_hs_period.rds")); setDT(p)
FREQ <- attr(p, "freq") %||% "A"
TREAT <- if (FREQ == "M") as.Date("2022-03-01") else as.Date("2022-01-01")

## ---- data-driven "surge basket": inbound = West+China mirror, outbound = KZ->Russia ----
pre  <- p[tt <  as.Date("2022-01-01") & tt >= as.Date("2019-01-01")]
post <- p[tt >= TREAT & tt < as.Date("2024-06-01")]
gg <- merge(
  pre [, .(inWC_pre  = mean(mirWC_usd), inW_pre  = mean(mirW_usd), expRU_pre  = mean(expRU_usd)), by = hs6],
  post[, .(inWC_post = mean(mirWC_usd), inW_post = mean(mirW_usd), expRU_post = mean(expRU_usd)), by = hs6],
  by = "hs6")
gg[, `:=`(inWC_ratio  = (inWC_post + 1e4) / (inWC_pre + 1e4),
          expRU_ratio = (expRU_post + 1e4) / (expRU_pre + 1e4))]
gg[, surge := inWC_ratio >= 2 & expRU_ratio >= 2 & inWC_post >= 2e5 & expRU_post >= 1e5]
p <- merge(p, gg[, .(hs6, surge, inWC_ratio, expRU_ratio)], by = "hs6", all.x = TRUE)
p[is.na(surge), surge := FALSE]
save_out(gg, "surge_basket_stats")
cat("surge-basket HS6 (West+China rule):", sum(gg$surge), "of", nrow(gg),
    "| dual-use among surge:", p[surge == TRUE, uniqueN(hs6[exposed == TRUE])], "\n")

mk <- function(dt, yv, tv) {
  dt <- copy(dt); dt[, y := asinh(get(yv))]; dt[, TR := as.integer(get(tv))]
  list(es  = feols(y ~ i(t_rel, TR, ref = -1) | hs6 + tt, dt, cluster = ~hs6),
       did = feols(y ~ TR:post | hs6 + tt, dt, cluster = ~hs6))
}

sink(file.path(DIR_OUT, "rq1_estimates.txt"), split = TRUE)
cat("===== RQ1: trade reorientation through Kazakhstan (freq =", FREQ, ") =====\n",
    "panel:", nrow(p), "rows |", uniqueN(p$hs6), "HS6 |", as.character(range(p$tt)), "\n")
cat(" inbound measure: mirWC_usd = West (EU-27/UK/US/JP/KR/CH/NO) + China mirrored exports to KZ\n")

OUTC <- c("expRU_usd", "mirWC_usd", "mirW_usd", "impW_usd", "mirror_gap_wc")
for (tv in c("surge", "exposed")) {
  cat("\n########", tv,
      ifelse(tv == "exposed", "(dual-use CHPL list — pre-specified robustness)",
             "(data-driven surge basket, West+China rule)"), "########\n")
  for (yv in OUTC) {
    cat("\n----", yv, "(asinh) : DiD  TR:post ----\n"); print(coeftable(mk(p, yv, tv)$did))
  }
  cat("\n-- event study: KZ imports from West+China (mirWC_usd) --\n")
  print(coeftable(mk(p, "mirWC_usd", tv)$es))
}

## ---- pre-trend joint test (surge basket) --------------------------------
cat("\n-- pre-trend joint Wald test (surge basket) --\n")
for (yv in c("mirWC_usd", "expRU_usd")) {
  es <- mk(p, yv, "surge")$es
  w <- tryCatch(wald(es, keep = "t_rel::-[2-9]"), error = function(e) NULL)
  if (!is.null(w)) cat(sprintf("  %-11s : F = %.3f  p = %.3f\n", yv, w$stat, w$p))
}

## ---- selection-aware inference (annual only; the review's C1) -----------
if (FREQ == "A") {
  cat("\n-- wild cluster bootstrap p (Rademacher, restricted resid, cluster=HS6, B=1999) --\n")
  wcb <- function(yv, B = 1999) {
    d <- copy(p); d[, TR := as.integer(surge)]; d[, y := asinh(get(yv))]
    t_obs <- coeftable(feols(y ~ TR:post | hs6 + tt, d, cluster = ~hs6))["TR:post","t value"]
    rest  <- feols(y ~ 1 | hs6 + tt, d)
    d[, `:=`(fit_r = predict(rest), e_r = resid(rest))]; cl <- unique(d$hs6)
    tb <- replicate(B, { w <- setNames(sample(c(-1,1), length(cl), TRUE), cl)
      d[, yb := fit_r + e_r * w[as.character(hs6)]]
      coeftable(feols(yb ~ TR:post | hs6 + tt, d, cluster = ~hs6))["TR:post","t value"] })
    mean(abs(tb) >= abs(t_obs))
  }
  for (yv in c("expRU_usd","mirWC_usd","mirW_usd","impW_usd"))
    cat(sprintf("  surge %-11s : p_wcb = %.3f\n", yv, wcb(yv)))

  cat("\n-- randomisation inference: surge-basket gamma vs a random basket of the same size --\n")
  ri <- function(yv, R = 2000) {
    d <- copy(p); d[, y := asinh(get(yv))]; hs <- unique(d$hs6); k <- d[surge == TRUE, uniqueN(hs6)]
    g_obs <- coef(feols(y ~ I(as.integer(surge)):post | hs6 + tt, d))[1]
    gs <- replicate(R, { pick <- sample(hs, k); d[, TRp := as.integer(hs6 %in% pick)]
      coef(feols(y ~ TRp:post | hs6 + tt, d))[1] })
    c(gamma = unname(g_obs), p2 = mean(abs(gs) >= abs(g_obs)), p_up = mean(gs >= g_obs))
  }
  for (yv in c("expRU_usd","mirWC_usd","mirW_usd","impW_usd")) {
    r <- ri(yv); cat(sprintf("  %-11s : gamma=%.3f  p2=%.3f  p_upper=%.3f\n", yv, r["gamma"], r["p2"], r["p_up"]))
  }

  cat("\n-- PPML (fepois) DiD in levels, surge basket --\n")
  for (yv in c("expRU_usd","mirWC_usd")) {
    d <- copy(p); d[, TR := as.integer(surge)]; d[, yy := get(yv)]
    m <- tryCatch(fepois(yy ~ TR:post | hs6 + tt, d, cluster = ~hs6), error = function(e) NULL)
    if (!is.null(m)) { ct <- coeftable(m)["TR:post", ]
      cat(sprintf("  %-11s : b=%.3f se=%.3f p=%.4g  exp(b)=%.2fx\n", yv, ct[1], ct[2], ct[4], exp(ct[1]))) }
  }
}

## ---- structural break on aggregate surge-basket series -----------------
ag <- p[surge == TRUE, .(mirWC = sum(mirWC_usd), mirW = sum(mirW_usd),
                         expRU = sum(expRU_usd), gap = sum(mirror_gap_wc)), by = tt][order(tt)]
freq_n <- if (FREQ == "M") 12 else 1
cat("\n-- structural breaks (supF + Bai-Perron) on the surge-basket aggregate --\n")
for (v in c("mirWC", "mirW", "expRU", "gap")) {
  s <- ts(asinh(ag[[v]]), frequency = freq_n,
          start = if (FREQ == "M") c(year(min(ag$tt)), month(min(ag$tt))) else year(min(ag$tt)))
  fs <- tryCatch(Fstats(s ~ 1, from = if (FREQ == "M") 0.15 else 0.2), error = function(e) NULL)
  if (!is.null(fs)) {
    st <- sctest(fs, type = "supF")
    bpstr <- ""
    if (FREQ == "M") {
      bp <- tryCatch(breakpoints(s ~ 1, h = 0.15), error = function(e) NULL)
      if (!is.null(bp) && !all(is.na(bp$breakpoints)))
        bpstr <- paste("| BP:", paste(format(ag$tt[bp$breakpoints], "%Y-%m"), collapse = ", "))
    }
    cat(sprintf("  %-6s : supF = %.2f  p = %.4g  %s\n", v, st$statistic, st$p.value, bpstr))
  }
}
sink()

## ---- figures ----------------------------------------------------------
a2 <- melt(ag, id.vars = "tt", measure.vars = c("mirWC", "expRU"))
save_fig(
  ggplot(a2, aes(tt, value/1e6, colour = variable)) +
    geom_vline(xintercept = as.numeric(TREAT), linetype = 2, colour = "grey40") +
    geom_line(linewidth = .9) + geom_point() +
    scale_colour_manual(values = c(mirWC = "#2c7fb8", expRU = "#d95f0e"),
                        labels = c("West+China exports to KZ (mirror)", "KZ exports to Russia")) +
    labs(title = "Surge-basket trade through Kazakhstan",
         subtitle = paste0("USD million. Dashed = ", TREAT, ". Freq: ", FREQ),
         x = NULL, y = "USD m", colour = NULL),
  "rq1_fig_surge")

es <- mk(p, "mirWC_usd", "surge")$es
ed <- data.table(term = names(coef(es)), b = as.numeric(coef(es)), se = as.numeric(se(es)))
ed <- ed[grepl("t_rel::", term)]
ed[, tr := as.integer(sub(".*t_rel::(-?[0-9]+).*", "\\1", term))]
ed <- rbind(ed, data.table(term = "ref", b = 0, se = 0, tr = -1))[order(tr)]
save_fig(
  ggplot(ed, aes(tr, b)) +
    geom_hline(yintercept = 0, colour = "grey70") +
    geom_vline(xintercept = -0.5, linetype = 2, colour = "grey40") +
    geom_pointrange(aes(ymin = b - 1.96*se, ymax = b + 1.96*se)) +
    labs(title = "Event study: KZ imports from West+China, surge basket vs controls",
         subtitle = "asinh(value) ~ i(period_rel, surge) | hs6 + period ; ref = -1 ; 95% CI",
         x = paste0("periods relative to treatment (", FREQ, ")"), y = "coefficient"),
  "rq1_fig_eventstudy")

message("RQ1 done: _outputs/rq1_estimates.txt, rq1_fig_*.png")
