# 05_deal_source_reconcile.R — per-source deal counts for Table `tab:dealsource`.
#
# Three-source universe: Capital IQ, PitchBook, Preqin (the databases the QIC/AIFC/IFC PE
# report draws on). FactSet/Dealroom cross-validation was dropped -- see corridor.tex
# Appendix A. To be re-run on the verifiable three-source re-pull once it lands.
# Output: _outputs/deal_source_reconcile.csv
#
# Columns: deals/yr, all deals and value-add-relevant (mfg tradeables + transport/logistics
# + trade/distribution), 2015-21 vs 2022-25. The "surge-basket lines = 0" row in the paper
# is a manual note (two CapIQ records carry a spurious "electronic" tag), not computed here.

suppressMessages({library(data.table)})
OUT <- "C:/Users/zh.kakishev/my-project2/scripts/R/kz_valueadd/_outputs"
dd  <- readRDS(file.path(OUT, "deals_classified.rds"))
dd[, src := fifelse(grepl("cap", tolower(source)), "CapIQ",
              fifelse(grepl("pitch", tolower(source)), "PitchBook",
              fifelse(grepl("preqin", tolower(source)), "Preqin", "other")))]

tab <- rbindlist(lapply(c("CapIQ", "PitchBook", "Preqin"), function(s) {
  r <- dd[src == s]
  data.table(source   = s,
             all_pre  = round(r[yr %in% 2015:2021, .N] / 7, 1),
             all_post = round(r[yr %in% 2022:2025, .N] / 4, 1),
             va_pre   = round(r[valueadd_relevant == TRUE & yr %in% 2015:2021, .N] / 7, 1),
             va_post  = round(r[valueadd_relevant == TRUE & yr %in% 2022:2025, .N] / 4, 1))
}))

fwrite(tab, file.path(OUT, "deal_source_reconcile.csv"))
print(tab)
message("done: _outputs/deal_source_reconcile.csv")
