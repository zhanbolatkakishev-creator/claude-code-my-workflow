# 05_deal_source_reconcile.R — cross-database reconciliation for Table `tab:dealsource`.
#
# Populates the FactSet and Dealroom columns once their extracts are exported to the spec in
# Appendix A of the paper. Drop the raw exports here:
#   _data/deals_factset.csv   _data/deals_dealroom.csv
# Minimum columns (rename to these; case-insensitive match is attempted):
#   company | date | year | deal_type | value_musd | industry_raw
# Output: _outputs/deal_source_reconcile.csv  +  a LaTeX-ready block.

suppressMessages({library(data.table)})
VA  <- "C:/Users/zh.kakishev/my-project2/scripts/R/kz_valueadd"
OUT <- file.path(VA, "_outputs")

## ---- the already-built CapIQ/PitchBook/Preqin extract ----
dd <- readRDS(file.path(OUT, "deals_classified.rds"))
dd[, src := fifelse(grepl("cap", tolower(source)), "CapIQ",
              fifelse(grepl("pitch", tolower(source)), "PitchBook",
              fifelse(grepl("preqin", tolower(source)), "Preqin", "other")))]

## ---- ingest FactSet / Dealroom if present ----
norm <- function(f, srcname) {
  if (!file.exists(f)) return(NULL)
  x <- fread(f)
  setnames(x, tolower(gsub("[^A-Za-z0-9]+", "_", names(x))))
  pick <- function(cands) { h <- intersect(cands, names(x)); if (length(h)) x[[h[1]]] else NA }
  d <- data.table(company = pick(c("company","target","target_name","issuer","name")),
                  yr = suppressWarnings(as.integer(pick(c("year","announced_year")))),
                  deal_type = pick(c("deal_type","transaction_type","type","round")),
                  val_m = suppressWarnings(as.numeric(gsub("[^0-9.]","",
                          as.character(pick(c("value_musd","value_m","deal_value_usd_m","amount_usd_m")))))),
                  industry_raw = pick(c("industry_raw","industry","sector","primary_industry")))
  if (is.na(d$yr[1])) {
    dt <- as.Date(pick(c("date","announced_date","deal_date")), tryFormats = c("%Y-%m-%d","%m/%d/%Y","%d/%m/%Y"))
    d[, yr := as.integer(format(dt, "%Y"))]
  }
  d <- d[!is.na(yr) & yr %in% 2015:2025]
  ir <- tolower(paste(d$industry_raw, d$company))
  d[, va_rel := grepl("machinery|equipment|automotive|automobile|vehicle|appliance|aerospace|hardware|electronic|semiconductor|steel|metal|chemical|construction material|plastic|rubber|packaged food|food product|rail|airport|logistics|distribution|freight|warehous|forwarding|transport|retail|wholesale|distributor", ir)]
  d[, src := srcname]
  d
}
fs <- norm(file.path(VA, "_data/deals_factset.csv"),  "FactSet")
dr <- norm(file.path(VA, "_data/deals_dealroom.csv"), "Dealroom")

## ---- assemble the table ----
rows <- function(x, src) {
  pre  <- x[yr %in% 2015:2021]; post <- x[yr %in% 2022:2025]
  data.table(source = src,
    all_pre  = round(nrow(pre)/7, 1),  all_post  = round(nrow(post)/4, 1),
    va_pre   = round(nrow(pre[va_rel==TRUE|valueadd_relevant==TRUE, .N, by=1:0][, .N])/7, 1))  # placeholder
}
tab <- rbindlist(list(
  dd[src=="CapIQ",    .(source="CapIQ",     all_pre=round(.SD[yr %in% 2015:2021,.N]/7,1),
     all_post=round(.SD[yr %in% 2022:2025,.N]/4,1),
     va_pre=round(.SD[valueadd_relevant==TRUE & yr %in% 2015:2021,.N]/7,1),
     va_post=round(.SD[valueadd_relevant==TRUE & yr %in% 2022:2025,.N]/4,1))],
  dd[src=="PitchBook",.(source="PitchBook", all_pre=round(.SD[yr %in% 2015:2021,.N]/7,1),
     all_post=round(.SD[yr %in% 2022:2025,.N]/4,1),
     va_pre=round(.SD[valueadd_relevant==TRUE & yr %in% 2015:2021,.N]/7,1),
     va_post=round(.SD[valueadd_relevant==TRUE & yr %in% 2022:2025,.N]/4,1))],
  dd[src=="Preqin",   .(source="Preqin",    all_pre=round(.SD[yr %in% 2015:2021,.N]/7,1),
     all_post=round(.SD[yr %in% 2022:2025,.N]/4,1),
     va_pre=round(.SD[valueadd_relevant==TRUE & yr %in% 2015:2021,.N]/7,1),
     va_post=round(.SD[valueadd_relevant==TRUE & yr %in% 2022:2025,.N]/4,1))]
))
for (z in list(fs, dr)) if (!is.null(z))
  tab <- rbind(tab, data.table(source = z$src[1],
    all_pre  = round(nrow(z[yr %in% 2015:2021])/7,1),
    all_post = round(nrow(z[yr %in% 2022:2025])/4,1),
    va_pre   = round(nrow(z[va_rel==TRUE & yr %in% 2015:2021])/7,1),
    va_post  = round(nrow(z[va_rel==TRUE & yr %in% 2022:2025])/4,1)))

fwrite(tab, file.path(OUT, "deal_source_reconcile.csv"))
print(tab)
cat("\n(If FactSet/Dealroom rows are missing, place the exports at",
    "_data/deals_factset.csv and _data/deals_dealroom.csv and re-run.)\n")
