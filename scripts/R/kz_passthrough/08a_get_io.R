# 08a_get_io.R — build _data/kz_io.rds from the OECD ICIO 2023 edition (SML csv).
# Source: OECD Inter-Country Input-Output tables, 2016-2020 block, downloaded to
#   _data/icio/icio_ex/<year>_SML.csv  (76 economies x 45 ISIC-rev4 sectors + TLS/VA/OUT).
# We take the KAZ x KAZ domestic block and the KAZ VA/output rows and build a
# domestic Leontief inverse + value-added multipliers.

source("00_setup.R")
suppressMessages({library(data.table)})

YR <- "2019"                                   # pre-COVID; KZ structure is stable
f  <- file.path(DIR_DATA, "icio", "icio_ex", paste0(YR, "_SML.csv"))
stopifnot(file.exists(f))

icio <- fread(f, showProgress = FALSE)
setnames(icio, 1, "row")

FD <- c("HFCE","NPISH","GGFC","GFCF","INVNT","DPABR")         # final-demand column suffixes
kz_cols  <- grep("^KAZ_", names(icio), value = TRUE)
kz_cols  <- kz_cols[!sub("^KAZ_", "", kz_cols) %in% FD]       # keep the 45 sector columns
sec      <- sub("^KAZ_", "", kz_cols)
stopifnot(length(kz_cols) == 45)

Z_kk <- as.matrix(icio[row %in% kz_cols, ..kz_cols])          # 45x45 domestic intermediates
rownames(Z_kk) <- sub("^KAZ_", "", icio[row %in% kz_cols, row])
x    <- as.numeric(icio[row == "OUT", ..kz_cols])             # gross output by KZ sector
va   <- as.numeric(icio[row == "VA",  ..kz_cols])             # value added by KZ sector
tls  <- as.numeric(icio[row == "TLS", ..kz_cols])             # net taxes on products

x[x <= 0] <- NA
A_d  <- sweep(Z_kk, 2, x, "/"); A_d[!is.finite(A_d)] <- 0     # domestic technical coefficients
L_d  <- solve(diag(nrow(A_d)) - A_d)                          # domestic Leontief inverse
v_d  <- va  / x; v_d[!is.finite(v_d)]  <- 0                    # direct domestic VA coefficient
t_d  <- tls / x; t_d[!is.finite(t_d)]  <- 0

va_mult  <- as.numeric(t(v_d) %*% L_d)                        # domestic VA per $1 final demand
tax_mult <- as.numeric(t(t_d) %*% L_d)

margin_sectors <- which(sec %in% c("G", "H49", "H50", "H51", "H52", "H53"))  # trade + transport + warehousing
mfg_sectors    <- which(grepl("^C", sec))                                    # manufacturing C10T12..C31T33

io <- list(
  year = YR, sectors = sec, A = A_d, L = L_d,
  v = v_d, tax = t_d, va_mult = va_mult, tax_mult = tax_mult,
  x = x, va = va,
  margin_sectors = margin_sectors, mfg_sectors = mfg_sectors,
  emp = NULL)                                                 # ICIO SML has no employment
saveRDS(io, file.path(DIR_DATA, "kz_io.rds"))

cat("KZ I-O (OECD ICIO", YR, ") built.  45 sectors.\n")
cat(sprintf("VA multiplier  — trade+transport (G,H49-53): %.3f   manufacturing (C*): %.3f\n",
            mean(va_mult[margin_sectors]), mean(va_mult[mfg_sectors])))
cat(sprintf("tax multiplier — trade+transport: %.3f\n", mean(tax_mult[margin_sectors])))
cat("\nper-sector VA multiplier (v'L):\n")
print(data.table(sector = sec, VA_mult = round(va_mult, 3),
                 out_musd = round(x/1e3, 0))[order(-VA_mult)][1:15])
cat("\nmargin sectors:", paste(sec[margin_sectors], collapse = ", "), "\n")
message("saved _data/kz_io.rds")
