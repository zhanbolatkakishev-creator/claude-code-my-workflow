# 02b_assemble_json.R — parse raw Comtrade JSON -> comtrade_raw.rds
# Reads _data/json_annual (annual, from fetch_annual.sh) and/or _data/json (monthly, fetch.sh).
# Set FREQ below. Annual is the v1 path; monthly upgrades the event study later.

source("00_setup.R")
suppressMessages({library(jsonlite); library(data.table)})

FREQ <- Sys.getenv("KZ_FREQ", "A")                       # "A" (annual) or "M" (monthly)
jdir <- if (FREQ == "M") {
  if (length(list.files(file.path(DIR_DATA, "json_keyed"), "\\.json$")))
    file.path(DIR_DATA, "json_keyed")                    # authenticated pull (12 mo/file)
  else file.path(DIR_DATA, "json")                       # keyless monthly (1 mo/file)
} else file.path(DIR_DATA, "json_annual")
files <- list.files(jdir, pattern = "\\.json$", full.names = TRUE)
cat("assembling from:", jdir, "(", length(files), "files )\n")
stopifnot(length(files) > 0)

read1 <- function(f) {
  j <- tryCatch(fromJSON(f), error = function(e) NULL)
  if (is.null(j) || is.null(j$data) || !length(j$data)) return(NULL)
  d <- as.data.table(j$data)
  d[, pull_tag := sub("_.*", "", basename(f))]
  d
}
raw <- rbindlist(lapply(files, read1), use.names = TRUE, fill = TRUE)
cat("parsed", length(files), "files ->", nrow(raw), "rows (freq =", FREQ, ")\n")

keep <- intersect(c("pull_tag","period","refYear","refMonth","reporterCode","partnerCode",
                    "flowCode","cmdCode","primaryValue","netWgt","qty","altQty"), names(raw))
ct <- unique(raw[!is.na(cmdCode), ..keep])
setnames(ct, c("primaryValue","netWgt","cmdCode"), c("value_usd","netweight_kg","hs6"))
ct[, `:=`(value_usd = as.numeric(value_usd), netweight_kg = as.numeric(netweight_kg))]
if (FREQ == "M") {
  ct[, tt := as.Date(sprintf("%d-%02d-01", refYear, as.integer(refMonth)))]
} else {
  ct[, tt := as.Date(sprintf("%d-01-01", refYear))]
}
ct <- ct[partnerCode != 0 & reporterCode != 0]          # bilateral cells only
attr(ct, "freq") <- FREQ

save_out(ct, "comtrade_raw")
fwrite(ct, file.path(DIR_OUT, "comtrade_raw.csv"))
cat("rows:", nrow(ct), "| tags:", paste(sort(unique(ct$pull_tag)), collapse=", "),
    "| periods:", uniqueN(ct$tt), as.character(range(ct$tt, na.rm=TRUE)), "\n")
cat("\nKZ exports to Russia (643), by year, USD m:\n")
print(ct[pull_tag == "kzexp" & partnerCode == 643,
         .(usd_m = round(sum(value_usd, na.rm = TRUE)/1e6, 1)), by = refYear][order(refYear)])
cat("\nKZ imports from Germany (276) + China (156), by year, USD m:\n")
print(ct[pull_tag == "kzimp" & partnerCode %in% c(276,156),
         .(usd_m = round(sum(value_usd, na.rm = TRUE)/1e6, 1)), by = .(refYear, partnerCode)][order(refYear, partnerCode)])
message("saved _outputs/comtrade_raw.rds")
