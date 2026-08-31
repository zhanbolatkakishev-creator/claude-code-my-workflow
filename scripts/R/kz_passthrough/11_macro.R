# 11_macro.R — RQ2(d): macro correlates (descriptive, NOT causal).
# The reorientation-attributable flow (~$0.6 bn/yr incremental) is ~0.2% of KZ GDP, so it
# cannot be driving the aggregates. This section shows the macro context and makes exactly
# that point: whatever moved the Kazakh economy in 2022-25 (oil prices, reform, capital
# inflows), the goods-rerouting channel is not it.

source("00_setup.R")
suppressMessages({library(data.table); library(ggplot2)})
if (!requireNamespace("wbstats", quietly = TRUE))
  install.packages("wbstats", repos = "https://cloud.r-project.org", quiet = TRUE)
suppressMessages(library(wbstats))

ind <- c(reserves = "FI.RES.TOTL.CD", gdp_usd = "NY.GDP.MKTP.CD",
         gdp_growth = "NY.GDP.MKTP.KD.ZG", cab = "BN.CAB.XOKA.CD",
         services_va = "NV.SRV.TOTL.CD")
m <- as.data.table(wb_data(indicator = ind, country = "KAZ",
                           start_date = 2015, end_date = 2025))
setnames(m, "date", "year")
save_out(m, "macro_wdi")
fwrite(m, file.path(DIR_OUT, "macro_wdi.csv"))

incr_flow_bn <- 0.6                                   # ~ RQ2(c) incremental KZ->Russia / yr
m[, incr_flow_pct_gdp := 100 * incr_flow_bn * 1e9 / gdp_usd]

sink(file.path(DIR_OUT, "rq2d_macro.txt"), split = TRUE)
cat("===== RQ2(d): macro context (descriptive) =====\n\n")
print(m[year >= 2019, .(year,
        GDP_bn = round(gdp_usd/1e9), growth_pct = gdp_growth,
        reserves_bn = round(reserves/1e9), CAB_bn = round(cab/1e9, 1),
        services_VA_bn = round(services_va/1e9),
        reorient_flow_pct_GDP = round(incr_flow_pct_gdp, 2))])
cat("\nNotes:\n",
    "- 2022 current-account SURPLUS (+$6.4bn) vs deficits before/after — high oil prices +\n",
    "  strong exports; not the rerouting (which is ~0.2% of GDP).\n",
    "- Reserves +$31bn over 2023-25; services VA +$63bn over 2022-24 — broad, not attributable\n",
    "  to a $0.6bn/yr goods-rerouting channel.\n",
    "- REER: pull from BIS (`https://www.bis.org/statistics/eer.htm`) — WDI series discontinued.\n",
    "- CONCLUSION: the reorientation is macro-immaterial; it registers in the trade statistics,\n",
    "  not the national accounts. Consistent with 'corridor, not factory'.\n")
sink()

mm <- melt(m[year >= 2016, .(year, GDP = gdp_usd/1e9, Reserves = reserves/1e9,
                             `Services VA` = services_va/1e9)], id.vars = "year")
save_fig(
  ggplot(mm, aes(year, value, colour = variable)) +
    geom_vline(xintercept = 2022, linetype = 2, colour = "grey40") +
    geom_line(linewidth = .9) + geom_point() +
    labs(title = "Kazakhstan macro context, 2016-2025",
         subtitle = "USD bn. The goods-rerouting flow (~$0.6bn/yr) is far too small to move these.",
         x = NULL, y = "USD bn", colour = NULL),
  "rq2d_fig_macro")
message("RQ2(d) done: _outputs/rq2d_macro.txt, rq2d_fig_macro.png")
