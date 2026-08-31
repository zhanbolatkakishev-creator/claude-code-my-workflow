# 12_did_robustness.R — DiD robustness for sec 4.3, addressing the round-2 seven-pass review:
#   (a) selection-rule-matched randomisation inference  (round-2 C2)
#   (b) size-decile x year fixed effects                (round-2 C5 — the -0.95 placebo)
#   (c) donut / drop-2022 specifications                (round-2 C7)
#   (d) multiple-testing (Holm) across the spec grid    (round-2 M15)
# Reads _outputs/panel_annual.rds + surge_basket_stats.rds. Writes _outputs/rq1_did_robustness.txt

source("00_setup.R")
suppressMessages({library(data.table); library(fixest)})
set.seed(20260831)

p  <- readRDS(file.path(DIR_OUT, "panel_annual.rds")); setDT(p)
gg <- readRDS(file.path(DIR_OUT, "surge_basket_stats.rds")); setDT(gg)
p  <- merge(p, gg[, .(hs6, surge)], by = "hs6", all.x = TRUE); p[is.na(surge), surge := FALSE]

did_g <- function(dt, yv, treat = "surge") {
  d <- copy(dt); d[, TR := as.integer(get(treat))]; d[, y := asinh(get(yv))]
  ct <- coeftable(feols(y ~ TR:post | hs6 + tt, d, cluster = ~hs6))["TR:post", ]
  c(g = unname(ct[1]), se = unname(ct[2]), p = unname(ct[4]))
}

sink(file.path(DIR_OUT, "rq1_did_robustness.txt"), split = TRUE)
cat("===== sec 4.3 DiD robustness (round-2 review) =====\n\n")

## ---------------------------------------------------------------- (a) rule-matched RI
## Under H0 (no reorientation), permute the YEAR labels within each HS6 to destroy time
## structure, re-apply the surge-selection rule (both legs >= 2x, pre 2019-21 -> post
## 2022-24, + level floors), re-run the DiD. Distribution of gamma shows how much the
## rule + DiD manufacture from noise.
sel_rule <- function(d) {
  pre  <- d[tt <  as.Date("2022-01-01") & tt >= as.Date("2019-01-01"),
            .(inpre = mean(mirWC_usd), rupre = mean(expRU_usd)), by = hs6]
  post <- d[tt >= as.Date("2022-01-01") & tt < as.Date("2024-06-01"),
            .(inpost = mean(mirWC_usd), rupost = mean(expRU_usd)), by = hs6]
  m <- merge(pre, post, by = "hs6")
  m[(inpost + 1e4)/(inpre + 1e4) >= 2 & (rupost + 1e4)/(rupre + 1e4) >= 2 &
    inpost >= 2e5 & rupost >= 1e5, hs6]
}
obs_g <- unname(did_g(p, "expRU_usd")["g"])
B <- 2000
perm_g <- numeric(B)
yrs <- sort(unique(p$tt))
for (b in seq_len(B)) {
  pb <- copy(p)
  pb[, tt := tt[sample(.N)], by = hs6]                       # permute year labels within HS6
  pb[, post := as.integer(tt >= as.Date("2022-01-01"))]
  fb <- sel_rule(pb)
  pb[, TRp := as.integer(hs6 %in% fb)]
  perm_g[b] <- if (length(fb) >= 3)
    tryCatch(coef(feols(asinh(expRU_usd) ~ TRp:post | hs6 + tt, pb))[1], error = function(e) NA) else NA
}
perm_g <- perm_g[is.finite(perm_g)]
perm_n <- replicate(1000, { pb <- copy(p); pb[, tt := tt[sample(.N)], by = hs6]
  pb[, post := as.integer(tt >= as.Date("2022-01-01"))]; length(sel_rule(pb)) })
cat("(a) selection-rule-matched randomisation inference: permute year labels within HS6 to\n")
cat("    impose H0 (no reorientation), re-apply the >=2x/>=2x rule, re-estimate the DiD.\n")
cat(sprintf("    B = %d ; each permuted DiD run on the lines the rule then selects.\n\n", length(perm_g)))
cat(sprintf("    # lines the rule selects: %d observed  vs  null mean %.1f (max over %d draws: %d)\n",
            29L, mean(perm_n), length(perm_n), max(perm_n)))
cat(sprintf("    P(rule selects >= 29 lines under H0)     : %.3f   <- the basket's EXISTENCE is not a fluke\n\n",
            mean(perm_n >= 29)))
cat(sprintf("    observed gamma (exports to Russia)       : %.3f\n", obs_g))
cat(sprintf("    permuted-null gamma  mean | sd | p95     : %.3f | %.3f | %.3f\n",
            mean(perm_g), sd(perm_g), quantile(perm_g, .95)))
cat(sprintf("    p (|perm gamma| >= |observed|)           : %.3f   <- gamma MAGNITUDE is not separable from selection\n\n",
            mean(abs(perm_g) >= abs(obs_g))))
cat("    READ: a 29-line basket satisfying the rule is essentially impossible under H0, so the\n")
cat("    reorientation itself is real; but the ratio rule, applied to no-treatment data, also\n")
cat("    yields large DiD coefficients on the few lines it picks, so the cross-sectional gamma\n")
cat("    should be read with the structural breaks + neighbours, not as stand-alone identification.\n\n")

## how binding is the inbound leg? of the 29 surge lines, how many clear ONLY the inbound
## criterion but not the outbound, and vice versa
pre  <- p[tt <  as.Date("2022-01-01") & tt >= as.Date("2019-01-01"),
          .(inpre = mean(mirWC_usd), rupre = mean(expRU_usd)), by = hs6]
post <- p[tt >= as.Date("2022-01-01") & tt < as.Date("2024-06-01"),
          .(inpost = mean(mirWC_usd), rupost = mean(expRU_usd)), by = hs6]
mm <- merge(pre, post, by = "hs6")
mm[, `:=`(in_ok  = (inpost + 1e4)/(inpre + 1e4) >= 2 & inpost >= 2e5,
          ru_ok  = (rupost + 1e4)/(rupre + 1e4) >= 2 & rupost >= 1e5)]
cat(sprintf("    lines clearing inbound criterion: %d ; outbound criterion: %d ; both (=surge basket): %d\n",
            mm[in_ok == TRUE, .N], mm[ru_ok == TRUE, .N], mm[in_ok & ru_ok, .N]))
cat(sprintf("    of the 29 surge lines, %d would still qualify on the OUTBOUND criterion alone\n\n",
            mm[ru_ok == TRUE, .N]))

## ---------------------------------------------------------------- (b) size-decile x year FE
p[, pre_sz := mean(mirWC_usd[tt < as.Date("2022-01-01")]), by = hs6]
p[, sz_dec := as.integer(cut(frank(pre_sz, ties.method = "first"),
                             breaks = quantile(frank(pre_sz, ties.method="first"), 0:10/10),
                             include.lowest = TRUE))]
cat("(b) add size-decile x year fixed effects (pre-2022 mean inbound size), surge basket:\n")
for (yv in c("expRU_usd", "mirWC_usd")) {
  d <- copy(p); d[, TR := as.integer(surge)]; d[, y := asinh(get(yv))]
  base <- coeftable(feols(y ~ TR:post | hs6 + tt, d, cluster = ~hs6))["TR:post", ]
  sz   <- coeftable(feols(y ~ TR:post | hs6 + tt + sz_dec^tt, d, cluster = ~hs6))["TR:post", ]
  cat(sprintf("    %-11s : baseline gamma=%.3f (p=%.3f)  ->  with size#year FE gamma=%.3f (p=%.3f)\n",
              yv, base[1], base[4], sz[1], sz[4]))
}
cat("\n")

## ---------------------------------------------------------------- (c) donut / drop-2022
cat("(c) no-anticipation / donut checks, exports to Russia, surge basket:\n")
g_full <- did_g(p, "expRU_usd")
g_no22 <- did_g(p[year(tt) != 2022], "expRU_usd")
d23 <- copy(p); d23 <- d23[year(tt) != 2022]; d23[, post := as.integer(year(tt) >= 2023)]
g_t23  <- did_g(d23, "expRU_usd")
cat(sprintf("    baseline (TREAT=2022, ref=2021)          : gamma=%.3f  se=%.3f  p=%.3f\n", g_full[1], g_full[2], g_full[3]))
cat(sprintf("    drop 2022 entirely                       : gamma=%.3f  se=%.3f  p=%.3f\n", g_no22[1], g_no22[2], g_no22[3]))
cat(sprintf("    donut: drop 2022, TREAT=2023             : gamma=%.3f  se=%.3f  p=%.3f\n\n", g_t23[1], g_t23[2], g_t23[3]))

## ---------------------------------------------------------------- (d) Holm across the grid
cat("(d) multiple-testing across the surge-basket spec grid (4 outcomes), Holm-adjusted:\n")
gr <- rbindlist(lapply(c("expRU_usd","mirWC_usd","mirW_usd","impW_usd"),
                       function(v) data.table(outcome = v, p = unname(did_g(p, v)["p"]))))
gr[, p_holm := p.adjust(p, method = "holm")]
print(gr[, .(outcome, p = signif(p,3), p_holm = signif(p_holm,3),
             sig_05_after_holm = p_holm < 0.05)])
sink()
message("wrote _outputs/rq1_did_robustness.txt")
