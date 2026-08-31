suppressMessages({library(readxl); library(data.table)})
SRC <- "C:/Users/zh.kakishev/OneDrive - AIFC/\u0420\u0430\u0431\u043e\u0447\u0438\u0439 \u0441\u0442\u043e\u043b/Personal/PE Research"
OUT <- "C:/Users/zh.kakishev/my-project2/scripts/R/kz_valueadd/_data"

## ---- aggregates workbook ----
af <- file.path(SRC, "20260825_\u041e\u0431\u044a\u0435\u043c\u044b \u0438 \u043e\u0442\u0440\u0430\u0441\u043b\u0438 DA.xlsx")
for (s in c("value by ind", "deals by ind")) {
  x <- as.data.table(read_excel(af, sheet = s))
  cat("\n########", s, "########  (", nrow(x), "x", ncol(x), ")\n")
  print(x, nrow = 40)
}

## ---- QIC transactions ----
qi <- readRDS(file.path(OUT, "qic.rds"))
setnames(qi, c("fund","fund_type","project","project_co","section","razdel_oked","name",
               "industry","industry_comb","country","region_kz","region","fin_year",
               "fin_year_short","kkm_share","kkm_inv_kzt_m","kkm_inv_usd_m","project_cost",
               "row_id","data_status"))
qi[, yr := suppressWarnings(as.integer(fin_year_short))]
cat("\n######## QIC transactions ########  n =", nrow(qi), "\n")
cat("\nby year: n, KKM invest $m, project cost:\n")
print(qi[, .(n = .N,
             kkm_usd_m = round(sum(suppressWarnings(as.numeric(kkm_inv_usd_m)), na.rm = TRUE)),
             proj_cost = round(sum(suppressWarnings(as.numeric(project_cost)), na.rm = TRUE))),
         by = yr][order(yr)])
cat("\nby combined industry:\n"); print(qi[, .N, by = industry_comb][order(-N)])
cat("\nby KZ region:\n");         print(qi[, .N, by = region_kz][order(-N)])
cat("\nby country of realization:\n"); print(qi[, .N, by = country][order(-N)])
cat("\npost-2021 QIC projects (year, industry, region, project):\n")
print(qi[yr >= 2022, .(yr, industry_comb, region_kz, project)][order(yr)], nrow = 60)
saveRDS(qi, file.path(OUT, "qic_named.rds"))
