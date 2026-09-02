# 02_valueadd_analysis.R — is the post-2022 trade route generating value-add operations
# (production / assembly / logistics capacity) in Kazakhstan?
# Deal-level M&A/PE/VC data (CapIQ/PitchBook/Preqin, n~509, 2015-2025).
# QIC state-fund evidence is taken from the published QIC/AIFC/IFC PE report, not from a
# private register -- see corridor.tex Section 7; no QIC data is read here.

source("00_setup.R")
OUT <- DIR_OUT
dd  <- readRDS(file.path(DIR_DATA, "deals_nondup.rds"))

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

cat("\n--- (6) QIC state-fund pipeline: see the QIC/AIFC/IFC PE report (aggregate + sector-year\n")
cat("       + named projects); not reconstructed here. corridor.tex Section 7.\n")

sink()
saveRDS(dd, file.path(OUT, "deals_classified.rds"))
message("done: _outputs/valueadd_findings.txt")
