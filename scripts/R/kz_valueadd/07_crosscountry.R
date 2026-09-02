# 07_crosscountry.R — does the investment response to a tradeable-demand shock track
# SHOCK PERSISTENCE (real options) or FINANCIAL DEVELOPMENT (institutional voids)?
# 2x2: shock type (event-driven / policy-contingent  vs  durable / structural) x findev (low/high).

source("00_setup.R")
OUT <- DIR_OUT

## intermediary economies (transitory, sanctions-driven reorientation shock, 2022) +
## comparators with a DURABLE / structural tradeable-demand shock in the same window
ISO <- c("KAZ","ARM","KGZ","GEO","UZB",          # reorientation intermediaries
         "VNM","MEX","POL","MAR","SRB","TUR","IDN")  # nearshoring / China+1 / EU-integration
grp <- c(KAZ="intermediary",ARM="intermediary",KGZ="intermediary",GEO="intermediary",UZB="intermediary",
         VNM="durable",MEX="durable",POL="durable",MAR="durable",SRB="durable",TUR="durable",IDN="durable")

ind <- c(
  privcredit   = "FS.AST.PRVT.GD.ZS",   # domestic credit to private sector, % GDP
  mktcap       = "CM.MKT.LCAP.GD.ZS",   # stock market cap, % GDP
  fdi_pctgdp   = "BX.KLT.DINV.WD.GD.ZS",# FDI net inflows, % GDP
  gfcf_pctgdp  = "NE.GDI.FTOT.ZS",      # gross fixed capital formation, % GDP
  mva_pctgdp   = "NV.IND.MANF.ZS",      # manufacturing value added, % GDP
  mva_growth   = "NV.IND.MANF.KD.ZG",   # manufacturing VA growth, %
  gdp_usd      = "NY.GDP.MKTP.CD")

d <- as.data.table(wb_data(indicator = ind, country = ISO, start_date = 2015, end_date = 2025))
setnames(d, "date", "yr")

pre  <- d[yr %in% 2017:2021, lapply(.SD, mean, na.rm = TRUE),
          by = .(iso3c), .SDcols = names(ind)]
post <- d[yr %in% 2022:2025, lapply(.SD, mean, na.rm = TRUE),
          by = .(iso3c), .SDcols = names(ind)]
m <- merge(pre, post, by = "iso3c", suffixes = c("_pre","_post"))
m[, group := grp[iso3c]]

## responses
m[, `:=`(
  d_fdi   = fdi_pctgdp_post  - fdi_pctgdp_pre,     # change in FDI/GDP
  d_gfcf  = gfcf_pctgdp_post - gfcf_pctgdp_pre,    # change in investment rate
  d_mva   = mva_growth_post  - mva_growth_pre,     # change in manufacturing VA growth
  findev  = privcredit_pre + fifelse(is.na(mktcap_pre), 0, mktcap_pre))]  # financial-depth index
m[, findev_hi := findev > median(findev, na.rm = TRUE)]

sink(file.path(OUT, "crosscountry.txt"), split = TRUE)
cat("=====================================================================\n")
cat(" Cross-country: investment response vs shock persistence vs financial depth\n")
cat("=====================================================================\n")
cat("\nPer country (pre = 2017-21 mean, post = 2022-25 mean):\n")
print(m[, .(iso3c, group,
            findev = round(findev),
            fdi_pre = round(fdi_pctgdp_pre,1), fdi_post = round(fdi_pctgdp_post,1),
            d_fdi = round(d_fdi,1),
            gfcf_pre = round(gfcf_pctgdp_pre,1), d_gfcf = round(d_gfcf,1),
            mva_grw_pre = round(mva_growth_pre,1), mva_grw_post = round(mva_growth_post,1))][order(group, -findev)])

cat("\n--- 2x2: mean change in investment rate (d_gfcf, pp of GDP) ---\n")
print(dcast(m, group ~ findev_hi, value.var = "d_gfcf",
            fun.aggregate = function(x) round(mean(x, na.rm = TRUE), 1)))
cat("\n--- 2x2: mean change in manufacturing VA growth (d_mva, pp) ---\n")
print(dcast(m, group ~ findev_hi, value.var = "d_mva",
            fun.aggregate = function(x) round(mean(x, na.rm = TRUE), 1)))
cat("\n--- 2x2: mean change in FDI/GDP (d_fdi, pp) ---\n")
print(dcast(m, group ~ findev_hi, value.var = "d_fdi",
            fun.aggregate = function(x) round(mean(x, na.rm = TRUE), 1)))

cat("\nREAD: if the weak response is confined to the 'intermediary' ROW regardless of the",
    "\nfindev column -> shock persistence (real options) is the discriminator. If it is",
    "\nconfined to the low-findev COLUMN regardless of row -> financial development",
    "\n(institutional voids) is the discriminator.\n")
sink()
fwrite(m, file.path(OUT, "crosscountry.csv"))
message("done: _outputs/crosscountry.txt")
