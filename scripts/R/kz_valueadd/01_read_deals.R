# 01_read_deals.R — read + profile the PE/M&A deal-analysis (DA) dataset.
# NOTE: interim deal source is a cleaned workbook; to be replaced by a verifiable
# three-source (Capital IQ / PitchBook / Preqin) re-pull. QIC data is NOT read here any
# more -- all QIC facts in the paper come from the published QIC/AIFC/IFC PE report.
suppressMessages({library(readxl); library(data.table)})
SRC <- "C:/Users/zh.kakishev/OneDrive - AIFC/\u0420\u0430\u0431\u043e\u0447\u0438\u0439 \u0441\u0442\u043e\u043b/Personal/PE Research"
OUT <- "C:/Users/zh.kakishev/my-project2/scripts/R/kz_valueadd/_data"
dir.create(OUT, showWarnings = FALSE, recursive = TRUE)
f <- file.path(SRC, "20260825_DA_CLEANED.xlsx")

dd <- as.data.table(read_excel(f, sheet = "Recorded deals (clean)"))

setnames(dd, c("source","deal_id","company","date","year","deal_type","value_m","investor",
               "industry_raw","oked","otrasl_bns","industry_group","category","dup","pe",
               "row_id","data_status"))
dd[, `:=`(val_m = suppressWarnings(as.numeric(gsub("[^0-9.]", "", value_m))),
          yr    = suppressWarnings(as.integer(year)),
          dup   = suppressWarnings(as.integer(dup)),
          pe    = suppressWarnings(as.integer(pe)))]
dd_nd <- dd[is.na(dup) | dup != 1]

saveRDS(dd,    file.path(OUT, "deals_all.rds"))
saveRDS(dd_nd, file.path(OUT, "deals_nondup.rds"))

cat("recorded deals:", nrow(dd), " | non-duplicate:", nrow(dd_nd),
    " | strict-PE:", sum(dd$pe == 1, na.rm = TRUE), " | with value:", sum(!is.na(dd$val_m)), "\n")
cat("\n=== deals by year (non-dup) ===\n")
print(dd_nd[, .(n = .N, val_m = round(sum(val_m, na.rm = TRUE)),
                pe_n = sum(pe == 1, na.rm = TRUE),
                n_valued = sum(!is.na(val_m))), by = yr][order(yr)])
cat("\n=== deal type ===\n");       print(dd[, .N, by = deal_type][order(-N)])
cat("\n=== category ===\n");        print(dd[, .N, by = category][order(-N)])
cat("\n=== industry group ===\n");  print(dd[, .N, by = industry_group][order(-N)])
cat("\n=== industry_raw (top 25) ===\n"); print(dd[, .N, by = industry_raw][order(-N)][1:25])
cat("\n=== source ===\n");          print(dd[, .N, by = source][order(-N)])
