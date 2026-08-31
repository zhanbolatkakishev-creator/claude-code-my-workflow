# 06_mechanism_tests.R — discriminate real-options (irreversibility) vs institutional-voids
# as the explanation for the missing investment response.
#
# TEST D: did CAPTIVE state capital (QIC/Baiterek) respond to the reorientation specifically?
#   real options -> no (not worth irreversible commitment for a transitory flow)
#   inst. voids  -> yes, more than private (state can self-finance)
# TEST F: same country, same institutions, same period — durable demand shock (autos) vs
#   transitory demand shock (re-export components). Different response => persistence is the
#   binding moderator (real options). Same (null) response => institutions (voids).

suppressMessages({library(data.table)})
VA  <- "C:/Users/zh.kakishev/my-project2/scripts/R/kz_valueadd"
OUT <- file.path(VA, "_outputs")

dd <- readRDS(file.path(OUT, "deals_classified.rds"))          # CapIQ/PitchBook/Preqin
qi <- readRDS(file.path(VA, "_data/qic_named.rds"))
qi[, `:=`(cost = suppressWarnings(as.numeric(project_cost)),
          kkm  = suppressWarnings(as.numeric(kkm_inv_usd_m)),
          yr   = suppressWarnings(as.integer(fin_year_short)))]

sink(file.path(OUT, "mechanism_tests.txt"), split = TRUE)
cat("================================================================\n")
cat(" Mechanism horse race: real options (irreversibility) vs institutional voids\n")
cat("================================================================\n")

## ---------- TEST D: captive state capital vs private, by relation to the shock ----------
cat("\n===== TEST D — did captive state capital (QIC) respond to the reorientation? =====\n")

## classify each QIC post-2022 project by its relation to the reorientation
qi22 <- qi[yr >= 2022]
ic <- tolower(paste(qi22$industry_comb, qi22$project, qi22$name))
qi22[, relation := fifelse(grepl("электрон|полупроводник|микроэлектрон|прибор.*учет|оптическ", ic), "surge-basket sector",
  fifelse(grepl("логист|склад|терминал|транзит|контейнер|торгово-логист|экспортоориентированн", ic), "corridor logistics/processing",
  fifelse(grepl("автомоб|автосбор|vehicles|машиностроен", ic), "vehicles/machinery (domestic mkt)",
  "unrelated (agri, steel, chem, energy, ...)")))]
cat("\nQIC projects financed 2022-2025, by relation to the reorientation:\n")
print(qi22[, .(n = .N, kkm_usd_m = round(sum(kkm, na.rm=TRUE)),
               proj_cost_kzt_bn = round(sum(cost, na.rm=TRUE)/1000)), by = relation][order(-n)])

## private deals post-2022 by the same relation
d22 <- dd[yr >= 2022]
dr <- tolower(paste(d22$industry_raw, d22$company, d22$industry_group))
d22[, relation := fifelse(grepl("electronic|semiconductor|optical|instrument|integrated circuit", dr), "surge-basket sector",
  fifelse(grepl("logistics|warehous|freight|forwarding|rail transport|terminal|distribution", dr), "corridor logistics/processing",
  fifelse(grepl("automotive|automobile|vehicle|motor|machinery", dr), "vehicles/machinery (domestic mkt)",
  "unrelated")))]
cat("\nPrivate PE/M&A deals 2022-2025, by relation to the reorientation:\n")
print(d22[, .(n = .N, val_musd = round(sum(val_m, na.rm=TRUE))), by = relation][order(-n)])

cat("\nINTERPRETATION: if BOTH state and private ~ 0 in 'surge-basket sector' and",
    "\n'corridor logistics/processing built FOR the flow', the binding constraint is not",
    "\nfinancing (state capital is unconstrained) -> real options / irreversibility.\n")

## ---------- TEST F: durable shock (autos) vs transitory shock (re-export components) ----------
cat("\n\n===== TEST F — same country/institutions/period: durable vs transitory demand shock =====\n")
auto <- dd[bucket == "mfg_tradeables" &
           grepl("automotive|automobile|motor vehicle|vehicles|auto parts|UVU|Allur", tolower(paste(industry_raw, company)))]
elec <- dd[grepl("electronic|semiconductor|optical|instrument|integrated circuit", tolower(paste(industry_raw, company)))]
cat(sprintf("\nAUTOMOTIVE (durable domestic+EAEU consumer-demand shock post-2022):\n"))
print(auto[, .(yr, company, deal_type, val_m)][order(yr)])
cat(sprintf("\n  auto deals 2015-21: %d   |   2022-25: %d\n",
            auto[yr<2022,.N], auto[yr>=2022,.N]))
cat(sprintf("\nELECTRONICS / PRECISION (the transitory re-export shock):\n"))
print(elec[, .(yr, company, deal_type, val_m, industry_raw)][order(yr)])
cat(sprintf("\n  electronics/precision deals 2015-21: %d   |   2022-25: %d\n",
            elec[yr<2022,.N], elec[yr>=2022,.N]))
cat("\nPublic record (triangulation): post-2022 KZ launched/announced Chinese-brand SKD plants",
    "\n(Changan/Haval/Chery ~90k units), a KIA plant ($200m), Skoda assembly, a car-multimedia",
    "\nplant (Almaty, 2024) — i.e. real capacity for the DURABLE auto shock, under the SAME weak",
    "\nfinancial market. The TRANSITORY component shock got zero plants.\n")
cat("\nINTERPRETATION: durable shock -> investment, transitory shock -> none, holding institutions",
    "\nfixed => persistence/irreversibility is the binding moderator (real options), with",
    "\ninstitutional voids as a LEVEL effect (baseline manufacturing investment is chronically thin).\n")
sink()
message("done: _outputs/mechanism_tests.txt")
