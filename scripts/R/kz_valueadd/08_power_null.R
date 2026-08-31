# 08_power_null.R — the seven-pass review (C3) asks: with what precision can we say there was
# "no investment response"? The deal-count null rests on ~7 pre and ~4 post annual counts.
# This script reports: pre/post means with a CI on the difference, the minimum detectable
# effect, a Poisson-rate test, and the window sensitivity (2023-25 vs 2015-21).
#
# Writes _outputs/power_null.txt

suppressMessages(library(data.table))
DIR_OUT <- "C:/Users/zh.kakishev/my-project2/scripts/R/kz_valueadd/_outputs"

## value-add-relevant annual counts, from 02_valueadd_analysis.R (section 3 table).
## 2015 carried 0 in-scope deals (bucket table starts 2016); paper divides the pre total
## of 51 by 7 years (2015-2021) => 7.3/yr, so 2015 is a zero year here.
cnt <- data.table(
  yr = 2015:2025,
  n  = c(0, 6, 15, 10, 8, 6, 6, 3, 12, 9, 6)   # mfg tradeables + transport/logistics + distribution
)
pre  <- cnt[yr <= 2021]
post <- cnt[yr >= 2022]
post_ex22 <- cnt[yr >= 2023]

sink(file.path(DIR_OUT, "power_null.txt"), split = TRUE)
cat("===== C3: how precise is the \"no investment response\" null? =====\n\n")
cat(sprintf("pre  2016-2021 : n years = %d, counts = %s, mean = %.2f/yr, sd = %.2f\n",
            nrow(pre), paste(pre$n, collapse = ","), mean(pre$n), sd(pre$n)))
cat(sprintf("post 2022-2025 : n years = %d, counts = %s, mean = %.2f/yr, sd = %.2f\n",
            nrow(post), paste(post$n, collapse = ","), mean(post$n), sd(post$n)))
cat(sprintf("post 2023-2025 : n years = %d, counts = %s, mean = %.2f/yr (drops shock year 2022)\n\n",
            nrow(post_ex22), paste(post_ex22$n, collapse = ","), mean(post_ex22$n)))

## Welch t on annual counts
tt <- t.test(post$n, pre$n)
cat(sprintf("Welch t-test post vs pre : diff = %+.2f/yr, 95%% CI [%+.2f, %+.2f], p = %.2f\n",
            diff(rev(tt$estimate)), tt$conf.int[1], tt$conf.int[2], tt$p.value))
tt2 <- t.test(post_ex22$n, pre$n)
cat(sprintf("Welch t-test 2023-25 vs pre : diff = %+.2f/yr, 95%% CI [%+.2f, %+.2f], p = %.2f\n\n",
            diff(rev(tt2$estimate)), tt2$conf.int[1], tt2$conf.int[2], tt2$p.value))

## Poisson-rate test (exact) — total events over total exposure
pt <- poisson.test(c(sum(post$n), sum(pre$n)), c(nrow(post), nrow(pre)))
cat(sprintf("Poisson rate ratio (post/pre) = %.2f, 95%% CI [%.2f, %.2f], p = %.2f\n",
            pt$estimate, pt$conf.int[1], pt$conf.int[2], pt$p.value))
pt2 <- poisson.test(c(sum(post_ex22$n), sum(pre$n)), c(nrow(post_ex22), nrow(pre)))
cat(sprintf("Poisson rate ratio (2023-25/pre) = %.2f, 95%% CI [%.2f, %.2f], p = %.2f\n\n",
            pt2$estimate, pt2$conf.int[1], pt2$conf.int[2], pt2$p.value))

## MDE: smallest true post-rate we could reject at 80% power, 5% two-sided,
## given pre-rate lambda0 and n_post post-years (Poisson approximation)
lam0 <- mean(pre$n); npost <- nrow(post)
# rate ratio RR detectable: solve via simulation
set.seed(1)
mde_sim <- function(RR, R = 4000) {
  rej <- replicate(R, {
    x <- rpois(npost, lam0 * RR); e <- rpois(nrow(pre), lam0)
    suppressWarnings(poisson.test(c(sum(x), sum(e)), c(npost, nrow(pre)))$p.value) < 0.05
  })
  mean(rej)
}
RRgrid <- seq(1.1, 3, by = 0.1)
pw <- vapply(RRgrid, mde_sim, numeric(1))
mde <- RRgrid[which(pw >= 0.8)[1]]
cat(sprintf("MDE (80%% power, alpha .05, Poisson, lambda0 = %.2f, n_post = %d):\n", lam0, npost))
cat(sprintf("   smallest detectable rate ratio ~ %.1fx  (i.e. we could only reliably detect\n", mde))
cat(sprintf("   an increase to >= %.1f deals/yr; a doubling to %.1f is at ~%.0f%% power)\n",
            lam0 * mde, lam0 * 2, 100 * mde_sim(2)))
cat("\nRead: the data can rule out a LARGE surge in dealmaking, not a modest one. The claim is\n")
cat("'no detectable step-up', with the detectable threshold around a doubling.\n")
sink()
message("wrote _outputs/power_null.txt")
