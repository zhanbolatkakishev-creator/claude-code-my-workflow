# 04_sector_priority.R — sector-priority matrix for PE deployment that raises
# DOMESTIC value added per dollar, given the post-2022 trade flows.
#  metrics per ISIC rev4 sector:
#   va_mult        domestic VA multiplier v'L  (OECD ICIO KZ 2019)
#   imp_growth     KZ imports 2022-25 avg / 2019-21 avg  (Comtrade, HS2->ICIO)
#   imp_intensity  KZ imports (2023) / KZ domestic output   (substitution headroom)
#   deals          PE/M&A/VC deal count 2015-25 in the sector (financeability proxy)
#   base_musd      KZ domestic output
#  => a transparent composite + a PLATFORM / SUBSTITUTION / AVOID tag.

suppressMessages({library(data.table); library(jsonlite); library(ggplot2)})
VA <- "C:/Users/zh.kakishev/my-project2/scripts/R/kz_valueadd"
OUT <- file.path(VA, "_outputs"); dir.create(OUT, showWarnings = FALSE, recursive = TRUE)

## ---- 1. I-O sector table ------------------------------------------------
io <- readRDS("C:/Users/zh.kakishev/my-project2/scripts/R/kz_passthrough/_data/kz_io.rds")
sec <- data.table(sector = io$sectors, va_mult = io$va_mult, v_direct = io$v, base_musd = io$x)
LAB <- c(A01_02="Agriculture",A03="Fishing",B05_06="Coal & crude extraction",B07_08="Metal-ore mining",
 B09="Mining support",C10T12="Food, beverages, tobacco",C13T15="Textiles, apparel, leather, footwear",
 C16="Wood products",C17_18="Paper & printing",C19="Coke & refined petroleum",C20="Chemicals",
 C21="Pharmaceuticals",C22="Rubber & plastics",C23="Non-metallic mineral products",C24="Basic metals",
 C25="Fabricated metal products",C26="Computer, electronic & optical",C27="Electrical equipment",
 C28="Machinery & equipment n.e.c.",C29="Motor vehicles & parts",C30="Other transport equipment",
 C31T33="Furniture, other mfg & repair",D="Electricity & gas",E="Water & waste",F="Construction",
 G="Wholesale & retail trade",H49="Land transport",H50="Water transport",H51="Air transport",
 H52="Warehousing & transport support",H53="Postal & courier",I="Accommodation & food",
 J58T60="Publishing & broadcasting",J61="Telecoms",J62_63="IT services",K="Finance & insurance",
 L="Real estate",M="Professional, scientific & technical",N="Administrative & support",O="Public admin",
 P="Education",Q="Health & social work",R="Arts & recreation",S="Other services",T="Households as employers")
sec[, name := LAB[sector]]

## ---- 2. HS2 -> ICIO concordance --------------------------------------
hs2map <- rbindlist(list(
  data.table(hs2 = sprintf("%02d", 1:24),  sector = "C10T12"),   # + agri raw, but treat as food chain
  data.table(hs2 = c("25","26"),            sector = "B07_08"),
  data.table(hs2 = "27",                    sector = "C19"),
  data.table(hs2 = sprintf("%02d", 28:38),  sector = "C20"),
  data.table(hs2 = "30",                    sector = "C21"),
  data.table(hs2 = c("39","40"),            sector = "C22"),
  data.table(hs2 = c(sprintf("%02d",41:43), sprintf("%02d",50:63), sprintf("%02d",64:67)), sector = "C13T15"),
  data.table(hs2 = sprintf("%02d",44:46),   sector = "C16"),
  data.table(hs2 = sprintf("%02d",47:49),   sector = "C17_18"),
  data.table(hs2 = sprintf("%02d",68:70),   sector = "C23"),
  data.table(hs2 = "71",                    sector = "C24"),
  data.table(hs2 = c("72","74","75","76","78","79","80","81"), sector = "C24"),
  data.table(hs2 = c("73","82","83"),       sector = "C25"),
  data.table(hs2 = "84",                    sector = "C28"),
  data.table(hs2 = "85",                    sector = "C27"),
  data.table(hs2 = "87",                    sector = "C29"),
  data.table(hs2 = c("86","88","89"),       sector = "C30"),
  data.table(hs2 = "90",                    sector = "C26"),
  data.table(hs2 = c("91","92","93","94","95","96","97"), sector = "C31T33")
))
hs2map <- unique(hs2map, by = "hs2")

## ---- 3. KZ imports by HS2 (Comtrade) -> ICIO sector x year ----------
rd <- function(tag) rbindlist(lapply(list.files(file.path(VA,"_data/trade_hs2"),
        sprintf("^%s_.*json$", tag), full.names = TRUE), function(f){
  j <- tryCatch(fromJSON(f), error=function(e) NULL); if (is.null(j$data)) return(NULL)
  d <- as.data.table(j$data); d[, .(hs2 = cmdCode, yr = refYear, v = as.numeric(primaryValue))]
}), use.names = TRUE)
kzi <- rd("kzimp")[, .(kz = sum(v, na.rm=TRUE)), by = .(hs2, yr)]
mir <- rd("mirror")[, .(mir = sum(v, na.rm=TRUE)), by = .(hs2, yr)]
imp <- merge(kzi, mir, by = c("hs2","yr"), all = TRUE)
imp[, val := pmax(kz, mir, na.rm = TRUE)]                    # use the larger of reported / mirror
imp <- merge(imp, hs2map, by = "hs2")
impS <- imp[, .(imp_musd = sum(val, na.rm=TRUE)/1e6), by = .(sector, yr)]
## net the reorientation "surge basket" out of the electronics-adjacent sectors so the
## import figures reflect genuine domestic demand, not the transit flow (HS84/85/90 carry
## the surge-basket HS6). Subtract the mirror inflow of the surge basket, split across C26-C28.
sbp <- tryCatch({
  p <- readRDS("C:/Users/zh.kakishev/my-project2/scripts/R/kz_passthrough/_outputs/panel_annual.rds")
  s <- readRDS("C:/Users/zh.kakishev/my-project2/scripts/R/kz_passthrough/_outputs/surge_basket_frozen.rds")
  setDT(p); setDT(s); p <- merge(p, s[,.(hs6,surge)], by="hs6", all.x=TRUE, suffixes=c("",".s"))
  p[surge==TRUE, .(sb = sum(mirW_usd + mirCN_usd, na.rm=TRUE)/1e6), by=.(yr=as.integer(format(tt,"%Y")))]
}, error = function(e) NULL)
if (!is.null(sbp)) {
  impS <- merge(impS, sbp, by = "yr", all.x = TRUE)
  impS[is.na(sb), sb := 0]
  impS[sector == "C26", imp_musd := pmax(0, imp_musd - 0.45 * sb)]
  impS[sector == "C27", imp_musd := pmax(0, imp_musd - 0.35 * sb)]
  impS[sector == "C28", imp_musd := pmax(0, imp_musd - 0.20 * sb)]
  impS[, sb := NULL]
}
w <- dcast(impS, sector ~ yr, value.var = "imp_musd")
w[, imp_pre  := rowMeans(.SD, na.rm=TRUE), .SDcols = c("2019","2020","2021")]
w[, imp_post := rowMeans(.SD, na.rm=TRUE), .SDcols = c("2022","2023","2024","2025")]
w[, imp_growth := imp_post / imp_pre]
w[, imp_2023 := `2023`]

## ---- 4. deals by ICIO-ish sector -----------------------------------
dd <- readRDS(file.path(OUT, "deals_classified.rds"))
dd[, ir := tolower(paste(industry_raw, industry_group))]
dd[, isic := NA_character_]
rules <- list(
  C10T12 = "packaged food|food product|food retail|food distrib|meat|dairy|beverage|agricult|cultivation|horticult|farming",
  C27    = "household appliance|electrical equip",
  C28    = "machinery|heavy transportation equipment|construction machinery|industrial machinery",
  C29    = "automotive|automobile|motor vehicle| vehicles|auto parts",
  C30    = "aerospace|locomotive|rolling stock|shipbuild",
  C24    = "steel|basic metal|aluminium|copper|metals and mining|smelt",
  C25    = "fabricated metal|metal product|pipe|wire|rope|structural steel",
  C20    = "chemical|caustic|fertiliz|petrochem",
  C23    = "construction material|cement|glass|ceramic|silicon",
  C22    = "rubber|plastic|tyre|tire",
  C21    = "pharma|medical device",
  H_TL   = "rail transport|airport|passenger airline|logistics|distribution|storage and transportation|freight|warehous|forwarding",
  G      = "retail|wholesale|distributor|broadline")
for (k in names(rules)) dd[is.na(isic) & grepl(rules[[k]], ir), isic := k]
deals_sec <- dd[!is.na(isic), .(deals = .N,
   deals_post = sum(yr >= 2022, na.rm=TRUE)), by = isic]

## ---- 5. assemble the matrix ---------------------------------------
m <- merge(sec, w[, .(sector, imp_pre, imp_post, imp_growth, imp_2023)], by = "sector", all.x = TRUE)
m <- merge(m, deals_sec[isic != "H_TL"], by.x = "sector", by.y = "isic", all.x = TRUE)
tl_deals <- deals_sec[isic == "H_TL"]
m[sector %in% c("H49","H50","H51","H52","H53"),
  `:=`(deals = round(tl_deals$deals/5), deals_post = round(tl_deals$deals_post/5))]
m[is.na(deals), deals := 0L]; m[is.na(deals_post), deals_post := 0L]
m[, imp_intensity := imp_2023 / base_musd]

## category tags
surge_isic <- c("C26")                       # the reorientation flows through computer/electronic/optical
m[, category := fifelse(sector %in% c("G","H49","H51","H52","H53"), "PLATFORM (logistics/trade)",
  fifelse(sector %in% surge_isic, "AVOID (surge basket)",
  fifelse(sector %in% c("C29") & va_mult < 0.72, "AVOID (kit assembly, low VA)",
  fifelse(grepl("^C", sector) & !is.na(imp_intensity), "SUBSTITUTION candidate", "context"))))]

## composite priority (0-1 each, higher = better for domestic-VA-per-$ PE)
rk <- function(x) (frank(x, na.last = "keep") - 1) / (sum(!is.na(x)) - 1)
m[, `:=`(s_va = rk(va_mult),
         s_gap = rk(pmin(imp_intensity, 5)),
         s_growth = rk(pmin(imp_growth, 3)),
         s_deal = rk(pmin(deals, 15)))]
m[, priority := round(0.40*s_va + 0.30*s_gap + 0.15*s_growth + 0.15*s_deal, 3)]
m[category %in% c("AVOID (surge basket)","AVOID (kit assembly, low VA)"), priority := NA]

## PLATFORM tier — logistics/trade sectors have no goods-import gap; rank on VA multiplier
## + output base (the "capture the transit margin" play, durable regardless of the Russia flow)
plat <- m[sector %in% c("G","H49","H51","H52","H53","H50")]
plat[, plat_score := round(rk(va_mult) * 0.6 + rk(base_musd) * 0.4, 3)]
setorder(plat, -plat_score)
sink(file.path(OUT, "sector_priority_platform.txt"), split = TRUE)
cat("PLATFORM tier — capture more of the transit business (rank: VA multiplier + scale)\n\n")
print(plat[, .(sector, name, va_mult = round(va_mult,3), base_musd = round(base_musd),
               deals, deals_post, plat_score)])
sink()

setorder(m, -priority, na.last = TRUE)
fwrite(m[, .(sector, name, category, va_mult = round(va_mult,3), v_direct = round(v_direct,3),
             base_musd = round(base_musd), imp_2023 = round(imp_2023),
             imp_intensity = round(imp_intensity,2), imp_growth = round(imp_growth,2),
             deals, deals_post, priority)],
       file.path(OUT, "sector_priority_matrix.csv"))
saveRDS(m, file.path(OUT, "sector_priority.rds"))

sink(file.path(OUT, "sector_priority.txt"), split = TRUE)
cat("=========================================================\n")
cat(" Sector-priority matrix — PE deployment for DOMESTIC value capture\n")
cat(" score = 0.40*VA-multiplier + 0.30*import-substitution-gap + 0.15*import-growth + 0.15*dealflow\n")
cat(" (ranks within KZ; AVOID = surge basket / low-VA kit assembly)\n")
cat("=========================================================\n\n")
print(m[, .(sector, name, category, va_mult = round(va_mult,3),
            base_musd = round(base_musd), imp23 = round(imp_2023),
            imp_intens = round(imp_intensity,2), imp_grw = round(imp_growth,2),
            deals, dl_post = deals_post, priority)], nrow = 46)
sink()

## ---- scatter ----
pl <- m[grepl("^C|^G|^H", sector) & !is.na(imp_intensity)]
g <- ggplot(pl, aes(imp_intensity, va_mult, size = base_musd, colour = category)) +
  geom_point(alpha = .8) +
  ggrepel::geom_text_repel(aes(label = name), size = 3, max.overlaps = 20) +
  scale_x_continuous(trans = "log10", name = "import-substitution headroom  (imports 2023 / domestic output, log)") +
  labs(y = "domestic value-added multiplier (v'L)", size = "output $m", colour = NULL,
       title = "Where PE money buys the most domestic value added",
       subtitle = "Upper-right = high multiplier + large import gap. Surge basket (electronics/optical) is bottom-left: avoid.") +
  theme_minimal()
ggsave(file.path(OUT, "sector_priority_fig.png"), g, width = 10, height = 6.5, dpi = 150)
message("done: _outputs/sector_priority_matrix.csv / .txt / _fig.png")
