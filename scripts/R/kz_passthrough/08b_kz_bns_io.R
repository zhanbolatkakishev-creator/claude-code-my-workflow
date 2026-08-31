# 08b_kz_bns_io.R — ROBUSTNESS for sec 5.2: recompute the domestic value-added multipliers
# for trade+transport and for manufacturing from the KAZAKHSTAN BNS symmetric input-output
# table (up to 68 products, 2023 ref year), and compare to the OECD ICIO figures the paper
# uses (v_TT = 0.79, v_M = 0.76).
#
# Source file: _data/kz_bns_io/io_2023_ru.xlsx  (stat.gov.kz, National Accounts ->
#   "Таблицы «Затраты-Выпуск»"; publication 274494, xlsx element 196806).
# Sheet "8." = use of DOMESTIC products (product x industry, thous. tenge)
# Sheet "2." = use at purchaser prices; rows 81 = GVA, 82 = output at basic prices.
#
# Writes _outputs/rq2b_bns_io_check.txt

source("00_setup.R")
suppressMessages({library(readxl); library(data.table)})

f <- file.path(DIR_DATA, "kz_bns_io", "io_2023_ru.xlsx")
if (!file.exists(f)) {
  dir.create(dirname(f), showWarnings = FALSE, recursive = TRUE)
  url <- "https://stat.gov.kz/api/iblock/element/196806/file/ru/"
  message("KZ BNS I-O not cached; downloading from ", url)
  ok <- tryCatch({ download.file(url, f, mode = "wb", quiet = TRUE); file.size(f) > 1e5 },
                 error = function(e) FALSE)
  if (!isTRUE(ok)) {
    message("  download failed -- fetch manually from stat.gov.kz publication 274494 and place at ", f,
            "; skipping robustness check.")
    quit(save = "no")
  }
}

rd <- function(sh) as.data.frame(suppressMessages(read_excel(f, sheet = sh, col_names = FALSE)))
s8 <- rd("8."); s2 <- rd("2.")

## --- locate the product block: rows whose col-2 is a product code (01..98, incl "10-11") ---
codes8 <- trimws(as.character(s8[[2]]))
prow   <- which(grepl("^[0-9]{2}(-[0-9]{2})?[,]?$|^0[0-9]{2}$", codes8))          # product rows
prow   <- prow[s8[prow, 3] != "" & !is.na(s8[prow, 3])]
pcode  <- codes8[prow]
ind_hdr_row <- which(apply(s8, 1, function(r) sum(grepl("^[0-9]{2}", trimws(as.character(r[-(1:3)])))) > 40))[1]
icode  <- trimws(as.character(s8[ind_hdr_row, ]))
icol   <- which(grepl("^[0-9]{2}(-[0-9]{2})?[,]?$|^0[0-9]{2}$", icode))
cat(sprintf("BNS I-O: %d product rows, %d industry columns\n", length(prow), length(icol)))

Z <- suppressWarnings(matrix(as.numeric(as.matrix(s8[prow, icol])), nrow = length(prow)))  # domestic intermediate use
Z[is.na(Z)] <- 0
rownames(Z) <- pcode; colnames(Z) <- icode[icol]

## --- GVA and output per industry, from sheet 2 (rows found by label) ---
lab2 <- trimws(as.character(s2[[3]]))
r_out <- which(grepl("Выпуск в основных ценах", lab2))[1]
r_gva <- which(grepl("Валовая добавленная стоимость", lab2))[1]
ihdr2 <- which(apply(s2, 1, function(r) sum(grepl("^[0-9]{2}", trimws(as.character(r[-(1:3)])))) > 40))[1]
icode2 <- trimws(as.character(s2[ihdr2, ])); icol2 <- which(grepl("^[0-9]{2}(-[0-9]{2})?[,]?$|^0[0-9]{2}$", icode2))
out <- suppressWarnings(as.numeric(s2[r_out, icol2])); names(out) <- icode2[icol2]
gva <- suppressWarnings(as.numeric(s2[r_gva, icol2])); names(gva) <- icode2[icol2]

## align industry order between Z columns and out/gva
common <- intersect(colnames(Z), names(out)); common <- common[out[common] > 0]
Z <- Z[, common, drop = FALSE]
Z <- Z[rownames(Z) %in% common, , drop = FALSE]
Z <- Z[common, common]                                   # square, same order
out <- out[common]; gva <- gva[common]
n <- length(common)

A  <- sweep(Z, 2, out, "/")                              # domestic technical coefficients
Ld <- solve(diag(n) - A)                                 # domestic Leontief inverse
vd <- pmax(0, gva / out)                                 # direct domestic VA coefficient
mult <- as.numeric(t(vd) %*% Ld)                         # v_d' L_d : domestic VA multiplier per unit final demand
names(mult) <- common

## --- aggregate to trade+transport and manufacturing ---
tt_codes  <- c("45","46","47","49","50","51","52","53")            # wholesale/retail + land/water/air transport + warehousing + post
mfg_codes <- c("10-11","12","13","14","15","16","17","18","191","192","20","21","22","23",
               "241","242","243","244","245","25","26","27","28","29","30","31","32","33")
w_tt  <- out[names(out) %in% tt_codes];  m_tt  <- mult[names(mult) %in% tt_codes]
w_mfg <- out[names(out) %in% mfg_codes]; m_mfg <- mult[names(mult) %in% mfg_codes]

v_TT_bns  <- sum(m_tt  * w_tt ) / sum(w_tt )             # output-weighted
v_M_bns   <- sum(m_mfg * w_mfg) / sum(w_mfg)
v_TT_simple <- mean(m_tt); v_M_simple <- mean(m_mfg)

sink(file.path(DIR_OUT, "rq2b_bns_io_check.txt"), split = TRUE)
cat("===== RQ2(b) ROBUSTNESS: KZ BNS 68-product I-O vs OECD ICIO =====\n\n")
cat(sprintf("BNS I-O: %d industries matched; total output = %.0f bn tenge\n\n", n, sum(out)/1e6))
cat("Domestic value-added multiplier (v_d' L_d), output-weighted within group:\n")
cat(sprintf("  trade + transport + warehousing : BNS = %.3f   (OECD ICIO used in paper: 0.79)\n", v_TT_bns))
cat(sprintf("  manufacturing                   : BNS = %.3f   (OECD ICIO used in paper: 0.76)\n\n", v_M_bns))
cat(sprintf("  [unweighted means: trade+transport %.3f, manufacturing %.3f]\n\n", v_TT_simple, v_M_simple))
cat("Implication for the headline (m = 6-14%, midpoint 10%):\n")
cat(sprintf("  VA per rerouted $ = m * v_TT : ICIO 0.079  |  BNS %.3f\n", 0.10 * v_TT_bns))
cat(sprintf("  ratio to a produced $ (/v_M) : ICIO 0.10   |  BNS %.3f\n",
            (0.10 * v_TT_bns) / v_M_bns))
cat("\nper-sector multipliers used:\n")
print(data.table(code = names(m_tt),  group = "trade+transport", mult = round(m_tt, 3)))
print(data.table(code = names(m_mfg), group = "manufacturing",   mult = round(m_mfg, 3)))
sink()
message("wrote _outputs/rq2b_bns_io_check.txt")
