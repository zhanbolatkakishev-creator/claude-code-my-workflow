# 01_read_deals.R — read + profile the three-source deal list.
#
# Source: 20260825_Market size DA.xlsx, sheet "Deals_Preqin+Pitchbook+CapIQ" -- the
# consolidated (de-duplicated) Capital IQ + PitchBook + Preqin extract supplied by the
# market-sizing team, with native per-source deal IDs. This is the same three databases the
# QIC/AIFC/IFC "Private Equity in Kazakhstan" report draws on. The replication package pins
# this file and lists the deal IDs so a licence holder can reconstruct it.
# QIC data is NOT read here -- all QIC facts in the paper come from the published PE report.
suppressMessages({library(readxl); library(data.table)})
SRC <- "C:/Users/zh.kakishev/OneDrive - AIFC/\u0420\u0430\u0431\u043e\u0447\u0438\u0439 \u0441\u0442\u043e\u043b/Personal/Trade research"
OUT <- "C:/Users/zh.kakishev/my-project2/scripts/R/kz_valueadd/_data"
dir.create(OUT, showWarnings = FALSE, recursive = TRUE)
f <- file.path(SRC, "20260825_Market size DA.xlsx")

dd <- as.data.table(read_excel(f, sheet = "Deals_Preqin+Pitchbook+CapIQ"))
setnames(dd, c("source", "deal_id", "company", "date", "year", "deal_type", "value_m",
               "investor", "industry_raw", "industry_group", "category"))
dd[, `:=`(val_m = suppressWarnings(as.numeric(gsub("[^0-9.]", "", value_m))),
          yr    = suppressWarnings(as.integer(year)),
          pe    = as.integer(category == "Pure PE/VC"))]
## the sheet is already the de-duplicated three-source consolidation
dd_nd <- copy(dd)

saveRDS(dd,    file.path(OUT, "deals_all.rds"))
saveRDS(dd_nd, file.path(OUT, "deals_nondup.rds"))

cat("deals:", nrow(dd), " | strict-PE (Pure PE/VC):", sum(dd$pe == 1, na.rm = TRUE),
    " | with value:", sum(!is.na(dd$val_m)), "\n")
cat("\n=== deals by year ===\n")
print(dd[, .(n = .N, val_m = round(sum(val_m, na.rm = TRUE)),
             pe_n = sum(pe == 1, na.rm = TRUE),
             n_valued = sum(!is.na(val_m))), by = yr][order(yr)])
cat("\n=== by source ===\n");        print(dd[, .N, by = source][order(-N)])
cat("\n=== deal type ===\n");        print(dd[, .N, by = deal_type][order(-N)])
cat("\n=== category ===\n");         print(dd[, .N, by = category][order(-N)])
cat("\n=== industry group ===\n");   print(dd[, .N, by = industry_group][order(-N)])
cat("\n=== industry_raw (top 25) ===\n"); print(dd[, .N, by = industry_raw][order(-N)][1:25])
