# 02_valueadd_analysis.R — is the post-2022 trade route generating value-add operations
# (production / assembly / logistics capacity) in Kazakhstan?
# Deal-level M&A/PE/VC data (CapIQ/PitchBook/Preqin, n~509, 2015-2025) + QIC state-fund projects.

suppressMessages({library(data.table)})
OUT <- "C:/Users/zh.kakishev/my-project2/scripts/R/kz_valueadd/_outputs"
dir.create(OUT, showWarnings = FALSE, recursive = TRUE)
dd  <- readRDS("C:/Users/zh.kakishev/my-project2/scripts/R/kz_valueadd/_data/deals_nondup.rds")
qi  <- readRDS("C:/Users/zh.kakishev/my-project2/scripts/R/kz_valueadd/_data/qic_named.rds")

## ---- classify deals into value-chain buckets from industry_raw / group ----
ir <- tolower(paste(dd$industry_raw, dd$industry_group, dd$company))
dd[, bucket := fifelse(
  grepl("machinery|heavy transportation equipment|automotive|automobile|vehicles|parts|household appliance|aerospace|defense|hardware|electronic|semiconductor|steel|metal.*fabric|commodity chemical|construction material|plastic|rubber|packaged food|food product", ir), "mfg_tradeables",
  fifelse(grepl("rail transport|airport|logistics|distribution|storage and transportation|freight|warehous|alternative carrier|passenger airline|shipping", ir), "transport_logistics",
  fifelse(grepl("retail|distributor|wholesale|broadline|internet retail", ir), "trade_distribution",
  fifelse(grepl("software|internet|telecom|it consult|media|fintech|financial software", ir), "digital",
  fifelse(grepl("oil and gas|coal|energy explor|mining|gold|copper|metals and mining|uranium", ir), "extractive",
  fifelse(grepl("bank|financ|capital market|asset management|insurance|brokerage|exchange", ir), "finance",
  "other"))))))]
dd[, valueadd_relevant := bucket %in% c("mfg_tradeables", "transport_logistics", "trade_distribution")]

## ---- greenfield-ish vs ownership-transfer ----
dd[, newcap := grepl("company formation|joint venture|growth|expansion|capitaliz|series|seed|early stage|later stage|angel|accelerator|incubator|grant|crowdfund", tolower(deal_type))]

sink(file.path(OUT, "valueadd_findings.txt"), split = TRUE)
cat("================================================================\n")
cat(" Does the post-2022 trade reorientation create value-add operations in Kazakhstan?\n")
cat(" Deal data: CapIQ/PitchBook/Preqin, non-duplicate, n =", nrow(dd), " (2015-2025)\n")
cat("================================================================\n")

cat("\n--- (1) ALL deals by year: count, value $M ---\n")
print(dd[, .(n = .N, val_m = round(sum(val_m, na.rm = TRUE))), by = yr][order(yr)])

cat("\n--- (2) deals by value-chain bucket ---\n")
print(dd[, .(n = .N, val_m = round(sum(val_m, na.rm = TRUE))), by = bucket][order(-n)])

cat("\n--- (3) VALUE-ADD-RELEVANT deals (mfg tradeables + transport/logistics + trade/distribution) by year ---\n")
va <- dd[valueadd_relevant == TRUE]
print(va[, .(n = .N, val_m = round(sum(val_m, na.rm = TRUE)),
             newcap_n = sum(newcap), MnA_n = sum(!newcap)), by = yr][order(yr)])
cat(sprintf("\n  pre-2022 (2015-2021): %.0f deals, ~$%.0fm, %.1f/yr avg\n",
            va[yr < 2022, .N], va[yr < 2022, sum(val_m, na.rm=TRUE)], va[yr < 2022, .N]/7))
cat(sprintf("  2022-2025           : %.0f deals, ~$%.0fm, %.1f/yr avg\n",
            va[yr >= 2022, .N], va[yr >= 2022, sum(val_m, na.rm=TRUE)], va[yr >= 2022, .N]/4))

cat("\n--- (4) mfg-of-tradeables deals, ALL years (the sectors the trade surge flows through) ---\n")
print(dd[bucket == "mfg_tradeables", .(yr, company, deal_type, val_m, industry_raw)][order(yr)])

cat("\n--- (5) transport / logistics deals, ALL years ---\n")
print(dd[bucket == "transport_logistics", .(yr, company, deal_type, val_m, industry_raw)][order(yr)])

## ---- QIC state-fund real-economy projects, post-2022 ----
qi[, `:=`(cost = suppressWarnings(as.numeric(project_cost)),
          kkm  = suppressWarnings(as.numeric(kkm_inv_usd_m)))]
cat("\n--- (6) QIC (state fund) projects 2022+ in industry/manufacturing/logistics ---\n")
qi_rel <- qi[yr >= 2022 & grepl("\u041c\u0435\u0442\u0430\u043b\u043b|\u043c\u0430\u0448\u0438\u043d\u043e|\u0425\u0438\u043c\u0438|\u043f\u0440\u043e\u043c\u044b\u0448\u043b|\u043b\u043e\u0433\u0438\u0441\u0442|\u0442\u0440\u0430\u043d\u0441\u043f\u043e\u0440\u0442|\u0410\u041f\u041a", paste(industry_comb, project))]
print(qi_rel[, .(yr, industry_comb, region_kz, kkm_usd_m = round(kkm), cost = round(cost),
                 project = substr(project, 1, 70))][order(yr)], nrow = 60)
cat(sprintf("\n  QIC 2022+ industry/logistics: %d projects, KKM $%.0fm, total project cost $%.0fm\n",
            nrow(qi_rel), qi_rel[, sum(kkm, na.rm=TRUE)], qi_rel[, sum(cost, na.rm=TRUE)]))

sink()
saveRDS(dd, file.path(OUT, "deals_classified.rds"))
message("done: _outputs/valueadd_findings.txt")
