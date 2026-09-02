# 05_panel_build.R — assemble the HS6 x period analytic panel from comtrade_raw
# Works for annual (tt = Jan-1 of year) or monthly (tt = month start). v1 = annual.
source("00_setup.R")
suppressMessages(library(data.table))

ct  <- readRDS(file.path(DIR_OUT, "comtrade_raw.rds")); setDT(ct)
hsc <- readRDS(file.path(DIR_OUT, "hs_class.rds"))
FREQ <- attr(ct, "freq") %||% "A"
`%||%` <- function(a,b) if (is.null(a)) b else a
TREAT <- if (FREQ == "M") as.Date("2022-03-01") else as.Date("2022-01-01")

## Comtrade M49 numeric code -> ISO3 (only the codes we query)
CODE2ISO <- c(
  "40"="AUT","56"="BEL","100"="BGR","191"="HRV","196"="CYP","203"="CZE","208"="DNK",
  "233"="EST","246"="FIN","250"="FRA","251"="FRA","276"="DEU","300"="GRC","348"="HUN",
  "372"="IRL","380"="ITA","381"="ITA","428"="LVA","440"="LTU","442"="LUX","470"="MLT",
  "528"="NLD","616"="POL","620"="PRT","642"="ROU","703"="SVK","705"="SVN","724"="ESP",
  "752"="SWE","826"="GBR","842"="USA","392"="JPN","410"="KOR","757"="CHE","578"="NOR",
  "156"="CHN","792"="TUR","643"="RUS","398"="KAZ","97"="EU27","0"="WLD")
ct[, reporter_iso := CODE2ISO[as.character(reporterCode)]]
ct[, partner_iso  := CODE2ISO[as.character(partnerCode)]]

WEST_ISO <- c("AUT","BEL","BGR","HRV","CYP","CZE","DNK","EST","FIN","FRA","DEU","GRC",
              "HUN","IRL","ITA","LVA","LTU","LUX","MLT","NLD","POL","PRT","ROU","SVK",
              "SVN","ESP","SWE","GBR","USA","JPN","KOR","CHE","NOR")

ct <- ct[!is.na(hs6) & !is.na(tt) & hs6 %in% hsc$hs6]

## drop years where KZ-reported monthly coverage is incomplete (KZ stopped monthly
## reporting to Comtrade after 2024-02; mirror still covers those months but a KZ-side
## series built on 2 months would be spurious). Keeps 2019-2023 (+2025) monthly.
if (FREQ == "M") {
  mo_by_yr <- ct[pull_tag == "kzexp", .(mo = uniqueN(tt)), by = .(yr = year(tt))]
  bad_yrs  <- mo_by_yr[mo < 12, yr]
  if (length(bad_yrs)) {
    message("dropping incomplete KZ-reporting years: ", paste(bad_yrs, collapse = ", "))
    ct <- ct[!year(tt) %in% bad_yrs]
  }
}
agg <- function(d) d[, .(value_usd = sum(value_usd, na.rm = TRUE),
                         kg        = sum(netweight_kg, na.rm = TRUE)), by = .(hs6, tt)]

kz_imp_west <- agg(ct[pull_tag == "kzimp" & partner_iso %in% WEST_ISO]);  setnames(kz_imp_west, 3:4, c("impW_usd","impW_kg"))
kz_imp_cn   <- agg(ct[pull_tag == "kzimp" & partner_iso == "CHN"]);       setnames(kz_imp_cn,   3:4, c("impCN_usd","impCN_kg"))
kz_imp_tr   <- agg(ct[pull_tag == "kzimp" & partner_iso == "TUR"]);       setnames(kz_imp_tr,   3:4, c("impTR_usd","impTR_kg"))
kz_exp_rus  <- agg(ct[pull_tag == "kzexp" & partner_iso == "RUS"]);       setnames(kz_exp_rus,  3:4, c("expRU_usd","expRU_kg"))
mir_west    <- agg(ct[pull_tag == "mirror" & reporter_iso %in% WEST_ISO]);setnames(mir_west,    3:4, c("mirW_usd","mirW_kg"))
mir_cn      <- agg(ct[pull_tag == "mirror" & reporter_iso == "CHN"]);     setnames(mir_cn,      3:4, c("mirCN_usd","mirCN_kg"))

grid <- CJ(hs6 = hsc$hs6, tt = sort(unique(ct$tt)))
p <- Reduce(function(a, b) merge(a, b, by = c("hs6","tt"), all.x = TRUE),
            list(grid, kz_imp_west, kz_imp_cn, kz_imp_tr, kz_exp_rus, mir_west, mir_cn))
num <- setdiff(names(p), c("hs6","tt"))
p[, (num) := lapply(.SD, function(x) fifelse(is.na(x), 0, x)), .SDcols = num]

p <- merge(p, hsc[, .(hs6, tier, exposed)], by = "hs6", all.x = TRUE)

## ---- canonical inbound measure = West + China (the flow the paper describes) --------
## mirW_usd (Western reporters only) is kept as a robustness variant. China is ~2/3 of
## the inbound value in the surge-basket lines, so the West-only series understates it.
p[, `:=`(mirWC_usd = mirW_usd + mirCN_usd,
         mirWC_kg  = mirW_kg  + mirCN_kg)]

per <- sort(unique(p$tt)); ref_idx <- match(TREAT, per); if (is.na(ref_idx)) ref_idx <- sum(per < TREAT) + 1
p[, `:=`(
  post   = as.integer(tt >= TREAT),
  t_rel  = match(tt, per) - ref_idx,
  mirror_gap    = mirW_usd  - impW_usd,                     # West-only proxy (kept)
  mirror_gap_wc = mirWC_usd - (impW_usd + impCN_usd),       # West+China onward-movement proxy
  uv_impW  = fifelse(impW_kg  > 0, impW_usd  / impW_kg,  NA_real_),
  uv_expRU = fifelse(expRU_kg > 0, expRU_usd / expRU_kg, NA_real_),
  uv_mirWC = fifelse(mirWC_kg > 0, mirWC_usd / mirWC_kg, NA_real_))]
p[, uv_wedge     := fifelse(is.finite(uv_impW)  & uv_impW  > 0, uv_expRU / uv_impW,  NA_real_)]  # KZ-reported import price (kept)
p[, uv_wedge_mir := fifelse(is.finite(uv_mirWC) & uv_mirWC > 0, uv_expRU / uv_mirWC, NA_real_)]  # mirror FOB vs re-export FOB (primary)
attr(p, "freq") <- FREQ

save_out(p, "panel_hs_period")
fwrite(p, file.path(DIR_OUT, "panel_hs_period.csv"))
cat("panel:", nrow(p), "rows |", uniqueN(p$hs6), "HS6 | freq", FREQ, "|",
    as.character(range(p$tt)), "\n\n")
cat("CHPL vs control — KZ imports from West & exports to Russia, $m per period:\n")
print(dcast(p[, .(impW_m = round(sum(impW_usd)/1e6), expRU_m = round(sum(expRU_usd)/1e6)),
              by = .(exposed, yr = year(tt))], yr ~ exposed, value.var = c("impW_m","expRU_m")))
message("saved _outputs/panel_hs_period.rds")
