# 02_pull_comtrade.R — Phase 1 core data pull  (NO API KEY REQUIRED)
# Uses the UN Comtrade *keyless preview* REST endpoint:
#   https://comtradeapi.un.org/public/v1/preview/C/M/HS
# Constraint: 1 period per call -> we loop months. All commodities + all partners fit in
# one call. ~3 calls/month. Resumable: each (tag, month) chunk cached under _data/.
#
# Pulls monthly HS6, 2019-01..latest, for the 75 CHPL + control codes:
#   (A) kzimp  : KZ-reported imports,  all partners
#   (B) kzexp  : KZ-reported exports,  all partners   (KZ->RU is the key cell)
#   (C) mirror : ALL reporters' exports TO Kazakhstan (partner = KZ)

source("00_setup.R")
suppressMessages({library(jsonlite); library(data.table)})
`%||%` <- function(a, b) if (is.null(a) || length(a) == 0) b else a

## Fetch via the curl CLI -> temp file -> parse. (The R `curl` package handle
## behaved inconsistently under the background runner; the CLI is reliable here.)
## Keyless "preview" endpoint is rate-limited (~1 req / 2-4 s) -> retry on 429/5xx.
KEY  <- Sys.getenv("COMTRADE_PRIMARY", "")
CURL <- Sys.which("curl"); if (!nzchar(CURL)) CURL <- "curl"

fetch_json <- function(url, tries = 20) {
  tf <- tempfile(fileext = ".json"); on.exit(unlink(tf), add = TRUE)
  for (i in seq_len(tries)) {
    args <- c("-sS", "--compressed", "--max-time", "120",
              "-o", shQuote(tf), "-w", shQuote("%{http_code}"),
              "-H", shQuote("User-Agent: Mozilla/5.0 (academic research)"))
    if (nzchar(KEY)) args <- c(args, "-H", shQuote(paste0("Ocp-Apim-Subscription-Key: ", KEY)))
    code <- tryCatch(system2(CURL, c(args, shQuote(url)), stdout = TRUE, stderr = NULL),
                     error = function(e) "000")
    code <- suppressWarnings(as.integer(tail(code, 1)))
    if (is.na(code)) code <- 0L
    if (code == 429L || code >= 500L || code == 0L) {
      Sys.sleep(min(45, 5 + 2.5 * i) + runif(1, 0, 2)); next
    }
    if (code != 200L) return(list(err = paste("HTTP", code)))
    j <- tryCatch(jsonlite::fromJSON(tf), error = function(e) NULL)
    if (is.null(j)) { Sys.sleep(4 + 2 * i); next }
    return(j)
  }
  list(err = "exhausted retries")
}

HS   <- readRDS(file.path(DIR_OUT, "hs_class.rds"))$hs6
KZ   <- 398
## the keyless "preview" endpoint returns at most 500 rows/call -> chunk the
## commodity list so an all-partners call stays well under the cap (~13/call).
HS_CHUNKS <- split(HS, ceiling(seq_along(HS) / 19))   # 4 chunks
MONTHS <- {
  end <- as.integer(format(Sys.Date() - 40, "%Y%m"))         # ~last closed month
  ym  <- do.call(c, lapply(2019:as.integer(substr(end,1,4)),
                           function(y) y*100 + 1:12))
  ym[ym <= end]
}
BASE <- "https://comtradeapi.un.org/public/v1/preview/C/M/HS"
## (numeric reporter/partner codes kept as-is; mapped to ISO3 in 05_panel_build.R)

get_month <- function(tag, month, extra) {
  f <- file.path(DIR_DATA, sprintf("ct_%s_%d.rds", tag, month))
  if (file.exists(f)) return(invisible(readRDS(f)))
  out <- vector("list", length(HS_CHUNKS)); ok <- logical(length(HS_CHUNKS))
  for (k in seq_along(HS_CHUNKS)) {
    url <- paste0(BASE, "?", paste(c(
      sprintf("period=%d", month),
      sprintf("cmdCode=%s", paste(HS_CHUNKS[[k]], collapse = ",")),
      "customsCode=C00", "motCode=0", "partner2Code=0",
      extra), collapse = "&"))
    j <- fetch_json(url)
    Sys.sleep(3.5 + runif(1, 0, 1.5))           # keyless endpoint: ~1 req / 2 s
    if (!is.null(j$err)) { message(sprintf("  %s %d chunk %d ERR: %s", tag, month, k, j$err)); next }
    ok[k] <- TRUE
    if (is.null(j$data) || !length(j$data)) next
    d <- as.data.table(j$data)
    if (nrow(d) >= 500) message(sprintf("  !! %s %d chunk %d hit 500-row cap (count=%s)",
                                        tag, month, k, j$count))
    out[[k]] <- d
  }
  if (!all(ok)) {
    message(sprintf("  -> %s %d INCOMPLETE (%d/%d chunks) — not caching, will retry next run",
                    tag, month, sum(ok), length(ok)))
    return(invisible(NULL))
  }
  d <- rbindlist(out, use.names = TRUE, fill = TRUE)
  if (!is.null(d) && nrow(d)) d[, pull_tag := tag] else d <- data.table(pull_tag = character())
  saveRDS(d, f); invisible(d)
}

for (m in MONTHS) {
  message("month ", m)
  get_month("kzimp",  m, c(sprintf("reporterCode=%d", KZ), "flowCode=M"))
  get_month("kzexp",  m, c(sprintf("reporterCode=%d", KZ), "flowCode=X"))
  get_month("mirror", m, c(sprintf("partnerCode=%d", KZ),  "flowCode=X"))  # all reporters
}

## ---- assemble ------------------------------------------------------------
files <- list.files(DIR_DATA, pattern = "^ct_(kzimp|kzexp|mirror)_\\d+\\.rds$",
                    full.names = TRUE)
raw <- rbindlist(lapply(files, readRDS), use.names = TRUE, fill = TRUE)
raw <- raw[!is.na(cmdCode)]
keep <- intersect(c("pull_tag","period","refYear","refMonth","reporterCode","partnerCode",
                    "flowCode","cmdCode","primaryValue","netWgt","qty","qtyUnitAbbr",
                    "altQty"), names(raw))
ct <- raw[, ..keep]
setnames(ct, c("primaryValue","netWgt","cmdCode"), c("value_usd","netweight_kg","hs6"))
ct[, ym := as.Date(sprintf("%d-%02d-01", refYear, as.integer(refMonth)))]
ct <- unique(ct)
save_out(ct, "comtrade_raw")
fwrite(ct, file.path(DIR_OUT, "comtrade_raw.csv"))
cat("rows:", nrow(ct), "| tags:", paste(sort(unique(ct$pull_tag)), collapse=", "),
    "| months:", as.character(range(ct$ym, na.rm=TRUE)), "\n")
cat("KZ exports to Russia (643), CHPL, by year:\n")
print(ct[pull_tag=="kzexp" & partnerCode==643, .(musd = round(sum(value_usd,na.rm=TRUE)/1e6,1)),
         by = refYear][order(refYear)])
message("saved _outputs/comtrade_raw.rds")
