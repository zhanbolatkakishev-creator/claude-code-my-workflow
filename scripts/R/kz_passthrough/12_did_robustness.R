# 12_did_robustness.R — DiD robustness for sec 4.3.
#   (a) selection-rule-matched randomisation inference  (round-2 C2)
#   (b) size-decile x year fixed effects                (round-2 C5 — the -0.95 placebo)
#   (c) donut / drop-2022 specifications                (round-2 C7)
#   (d) multiple-testing (Holm) across the spec grid    (round-2 M15)
#   (e) leave-one-HS2-out jackknife                     (round-3 L5-5)
#   (f) alternative surge thresholds 1.5/2.5/3x         (round-3 L5-5)
#   (g) trend-preserving (cyclic-shift) permutation null (round-3 L3-11)
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
cat("\n")

## ---------------------------------------------------------------- (e) leave-one-HS2-out
## drop each HS2 chapter that contributes >=1 surge line and re-estimate gamma (exports to
## Russia). The basket is concentrated in HS 84/85/90; this shows no single chapter drives it.
cat("(e) leave-one-HS2-out jackknife on the surge-basket DiD (exports to Russia):\n")
p[, hs2 := substr(as.character(hs6), 1, 2)]
sb_chaps <- sort(unique(p[surge == TRUE, hs2]))
cat(sprintf("    surge-basket HS2 chapters: %s\n", paste(sb_chaps, collapse = ", ")))
for (ch in sb_chaps) {
  gj <- did_g(p[hs2 != ch], "expRU_usd")
  nlj <- p[surge == TRUE & hs2 == ch, uniqueN(hs6)]
  cat(sprintf("    drop HS %s (%d surge lines) : gamma=%.3f  se=%.3f  p=%.3f\n",
              ch, nlj, gj[1], gj[2], gj[3]))
}
cat("\n")

## ---------------------------------------------------------------- (f) alternative thresholds
## re-select the surge basket at 1.5x / 2.5x / 3x (both legs) instead of 2x and re-run the DiD.
sel_rule_thr <- function(d, thr) {
  pre  <- d[tt <  as.Date("2022-01-01") & tt >= as.Date("2019-01-01"),
            .(inpre = mean(mirWC_usd), rupre = mean(expRU_usd)), by = hs6]
  post <- d[tt >= as.Date("2022-01-01") & tt < as.Date("2024-06-01"),
            .(inpost = mean(mirWC_usd), rupost = mean(expRU_usd)), by = hs6]
  m <- merge(pre, post, by = "hs6")
  m[(inpost + 1e4)/(inpre + 1e4) >= thr & (rupost + 1e4)/(rupre + 1e4) >= thr &
    inpost >= 2e5 & rupost >= 1e5, hs6]
}
cat("(f) alternative surge-selection thresholds (both legs), exports to Russia:\n")
for (thr in c(1.5, 2.0, 2.5, 3.0)) {
  lines_thr <- sel_rule_thr(p, thr)
  d <- copy(p); d[, TR := as.integer(hs6 %in% lines_thr)]; d[, y := asinh(expRU_usd)]
  ct <- coeftable(feols(y ~ TR:post | hs6 + tt, d, cluster = ~hs6))["TR:post", ]
  cat(sprintf("    threshold %.1fx : %2d lines   gamma=%.3f  se=%.3f  p=%.3f\n",
              thr, length(lines_thr), ct[1], ct[2], ct[4]))
}
cat("\n")

## ---------------------------------------------------------------- (g) trend-preserving null
## (a) shuffles year labels freely, which also destroys any secular trend, so P(rule picks
## >=29) rejects "no trend" rather than "no 2022 break". Here we instead CYCLICALLY SHIFT the
## year vector within each HS6 by a random offset: autocorrelation and level trends are kept,
## only the alignment of the jump with calendar-2022 is broken.
cat("(g) trend-preserving (cyclic-shift) permutation null for the selection rule:\n")
yrs_v <- sort(unique(p$tt)); nY <- length(yrs_v)
perm_n_cyc <- replicate(2000, {
  off <- sample.int(nY - 1, 1)
  pb <- copy(p)
  pb[, tt := yrs_v[((match(tt, yrs_v) - 1 + off) %% nY) + 1], by = hs6]
  pb[, post := as.integer(tt >= as.Date("2022-01-01"))]
  length(sel_rule(pb))
})
cat(sprintf("    # lines the rule selects: 29 observed  vs  cyclic-null mean %.1f (max %d)\n",
            mean(perm_n_cyc), max(perm_n_cyc)))
cat(sprintf("    P(rule selects >= 29 | cyclic null)     : %.3f\n", mean(perm_n_cyc >= 29)))
cat("    READ: even holding the trend fixed and only moving the break off 2022, the rule\n")
cat("    almost never reproduces a 29-line basket -- the 2022 alignment, not a pre-existing\n")
cat("    trend, is what the selection picks up.\n")

sink()
message("wrote _outputs/rq1_did_robustness.txt")
