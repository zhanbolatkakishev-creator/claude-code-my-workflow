# 04_probe_break_tests.R — Phase 0 GO/NO-GO
# (1) structural-break tests on EU exports to Kazakhstan (TOTAL + SITC7 machinery)
# (2) difference-in-differences: treated intermediaries {KZ,AM,KG} vs far controls
# (3) event-study plot
# Annual Eurostat data, no API key. Monthly HS6 / CHPL detail is Phase 1.

source("00_setup.R")
eu <- readRDS(file.path(DIR_OUT, "eu_kz_partner_annual.rds"))

CONTROLS <- c("US", "BR", "IN", "ZA", "EG", "MA", "RS")   # far, non-intermediary
TREATED  <- c("KZ", "AM", "KG")
Y_MAX    <- 2024   # 2025 may be partial -> excluded from tests, shown in figures

sink(file.path(DIR_OUT, "phase0_break_tests.txt"), split = TRUE)
cat("=========================================================\n")
cat(" PHASE 0  —  GO/NO-GO PROBE   (", format(Sys.time()), ")\n")
cat(" Source: Eurostat ext_lt_main* (annual, no key). Treatment year 2022.\n")
cat("=========================================================\n\n")

## ---- (1) structural-break tests on the KZ series -------------------------
for (grp in c("TOTAL", "SITC7_machinery_transport")) {
  s <- eu[partner == "KZ" & flow == "eu_export" & prodgrp == grp &
            year >= 2010 & year <= Y_MAX][order(year)]
  y <- ts(log(s$value_meur), start = min(s$year))
  cat("---- KZ EU-exports, group =", grp, "  (log, ", min(s$year), "-", Y_MAX, ") ----\n")

  ## supF / QLR test for an unknown single break (strucchange)
  fs   <- strucchange::Fstats(y ~ 1, from = 0.15)
  qlr  <- strucchange::sctest(fs, type = "supF")
  bp   <- strucchange::breakpoints(y ~ 1, h = 3)
  brkyr <- if (!all(is.na(bp$breakpoints))) min(s$year) + bp$breakpoints - 1 else NA
  cat(sprintf("  supF (QLR)  stat = %.2f   p = %.4g   -> break yr (Bai-Perron) = %s\n",
              qlr$statistic, qlr$p.value, paste(brkyr, collapse = ", ")))

  ## explicit Chow test at 2022
  s[, post := as.integer(year >= 2022)]
  ch <- lmtest::waldtest(lm(log(value_meur) ~ 1, s),
                         lm(log(value_meur) ~ post, s))
  cat(sprintf("  Chow @2022   F = %.2f   p = %.4g\n",
              ch$F[2], ch$`Pr(>F)`[2]))
  ## jump size
  pre  <- mean(s[year %in% 2017:2021, value_meur]); postm <- mean(s[year %in% 2022:Y_MAX, value_meur])
  cat(sprintf("  mean 2017-21 = %.0f  ->  mean 2022-%d = %.0f   (x%.2f, +%.0f%%)\n\n",
              pre, Y_MAX, postm, postm/pre, 100*(postm/pre - 1)))
}

## ---- (2) difference-in-differences on the partner panel ----------------
pan <- eu[flow == "eu_export" & prodgrp %in% c("TOTAL", "SITC7_machinery_transport") &
            partner %in% c(TREATED, CONTROLS) & year >= 2010 & year <= Y_MAX]
pan[, `:=`(post = as.integer(year >= 2022),
           treated = as.integer(partner %in% TREATED),
           lval = log(value_meur))]

cat("---- DiD: log(EU exports) ~ treated*post + partner FE + year FE ----\n")
cat("     treated = {KZ,AM,KG};  controls = {", paste(CONTROLS, collapse=","), "}\n\n")
for (grp in c("TOTAL", "SITC7_machinery_transport")) {
  m <- fixest::feols(lval ~ treated:post | partner + year,
                     data = pan[prodgrp == grp], cluster = ~partner)
  cat("### group:", grp, "\n"); print(summary(m)); cat("\n")
}

## KZ-only DiD (drop AM, KG)
cat("---- DiD, Kazakhstan only vs controls ----\n")
for (grp in c("TOTAL", "SITC7_machinery_transport")) {
  d <- pan[prodgrp == grp & (partner == "KZ" | partner %in% CONTROLS)]
  d[, treated := as.integer(partner == "KZ")]
  m <- fixest::feols(lval ~ treated:post | partner + year, data = d, cluster = ~partner)
  cat("### group:", grp, " (KZ only)\n"); print(coeftable(m)); cat("\n")
}

## ---- (3) event study ---------------------------------------------------
es <- fixest::feols(
  lval ~ i(year, treated, ref = 2021) | partner + year,
  data = pan[prodgrp == "SITC7_machinery_transport"], cluster = ~partner)
cat("---- Event study (SITC7), treated x year, ref = 2021 ----\n")
print(coeftable(es))
sink()

## ---- figures ----------------------------------------------------------
fig1 <- ggplot(eu[partner %in% c("KZ","AM","KG","TR","GE","UZ") &
                    flow == "eu_export" & prodgrp == "TOTAL" & year >= 2012],
               aes(year, value_meur, colour = partner)) +
  geom_vline(xintercept = 2022, linetype = 2, colour = "grey40") +
  geom_line(linewidth = 0.9) + geom_point(size = 1.3) +
  scale_y_log10() +
  labs(title = "EU exports to Kazakhstan and other Eurasian intermediaries",
       subtitle = "Eurostat ext_lt_maineu, annual, EUR million (log scale). Dashed line = 2022.",
       y = "EUR million (log10)", x = NULL, colour = NULL)
save_fig(fig1, "phase0_fig1_intermediaries_total")

fig2 <- ggplot(eu[partner == "KZ" & flow == "eu_export" &
                    prodgrp %in% c("TOTAL","SITC7_machinery_transport",
                                   "SITC5_chemicals","SITC6_8_manuf") & year >= 2012],
               aes(year, value_meur, colour = prodgrp)) +
  geom_vline(xintercept = 2022, linetype = 2, colour = "grey40") +
  geom_line(linewidth = 0.9) + geom_point(size = 1.3) +
  labs(title = "EU exports to Kazakhstan by broad product group",
       subtitle = "Eurostat, annual, EUR million. Dashed line = 2022.",
       y = "EUR million", x = NULL, colour = NULL)
save_fig(fig2, "phase0_fig2_kz_by_group")

es_df <- data.table(broom_term = names(coef(es)), b = as.numeric(coef(es)),
                    se = as.numeric(se(es)))
es_df <- es_df[grepl("year::", broom_term)]
es_df[, yr := as.integer(sub(".*year::([0-9]+).*", "\\1", broom_term))]
es_df <- rbind(es_df, data.table(broom_term = "ref", b = 0, se = 0, yr = 2021))
fig3 <- ggplot(es_df[order(yr)], aes(yr, b)) +
  geom_hline(yintercept = 0, colour = "grey60") +
  geom_vline(xintercept = 2021.5, linetype = 2, colour = "grey40") +
  geom_pointrange(aes(ymin = b - 1.96*se, ymax = b + 1.96*se)) +
  labs(title = "Event study: EU machinery/transport exports, treated intermediaries vs controls",
       subtitle = "feols  log(value) ~ treated x year | partner + year ; ref = 2021 ; 95% CI (cluster by partner)",
       y = "coefficient (log points)", x = NULL)
save_fig(fig3, "phase0_fig3_eventstudy_sitc7")

message("Phase 0 done. See _outputs/phase0_break_tests.txt and phase0_fig1..3.png")
