# 06_mechanism_tests.R — discriminate real-options (irreversibility) vs institutional-voids
# as the explanation for the missing investment response.
#
# TEST D: did PRIVATE capital respond to the reorientation specifically, by relation to the
#   shock? (surge-basket components / corridor logistics built FOR the flow / vehicles /
#   unrelated). The captive-state-capital comparison is handled qualitatively in the paper
#   from the published QIC/AIFC/IFC PE report (no project-level QIC register is public) --
#   see corridor.tex Section 7; it is NOT reconstructed here.
# TEST F: same country, same institutions, same period — durable demand shock (autos) vs
#   transitory demand shock (re-export components). Different response => persistence is the
#   binding moderator (real options). Same (null) response => institutions (voids).

source("00_setup.R")
VA  <- "."
OUT <- DIR_OUT

dd <- readRDS(file.path(OUT, "deals_classified.rds"))          # CapIQ/PitchBook/Preqin

sink(file.path(OUT, "mechanism_tests.txt"), split = TRUE)
cat("================================================================\n")
cat(" Mechanism horse race: real options (irreversibility) vs institutional voids\n")
cat("================================================================\n")

## ---------- TEST D: private capital by relation to the shock ----------
cat("\n===== TEST D — did private capital respond to the reorientation, by relation to the shock? =====\n")
cat("(Captive state capital: see the QIC/AIFC/IFC PE report; illustrative, not a controlled test.)\n")

## private deals post-2022 by relation to the reorientation
d22 <- dd[yr >= 2022]
dr <- tolower(paste(d22$industry_raw, d22$company, d22$industry_group))
d22[, relation := fifelse(grepl("electronic|semiconductor|optical|instrument|integrated circuit", dr), "surge-basket sector",
  fifelse(grepl("logistics|warehous|freight|forwarding|rail transport|terminal|distribution", dr), "corridor logistics/processing",
  fifelse(grepl("automotive|automobile|vehicle|motor|machinery", dr), "vehicles/machinery (domestic mkt)",
  "unrelated")))]
cat("\nPrivate PE/M&A deals 2022-2025, by relation to the reorientation:\n")
print(d22[, .(n = .N, val_musd = round(sum(val_m, na.rm=TRUE))), by = relation][order(-n)])

cat("\nINTERPRETATION: private capital is ~ 0 in 'surge-basket sector' and in 'corridor",
    "\nlogistics/processing built FOR the flow'. The published QIC/AIFC/IFC PE report shows the",
    "\nstate fund's disclosed post-2022 pipeline (power, poultry, steel/energy bonds, pipe",
    "\nsystems, bioethanol, a school, an office block) is also free of reorientation-linked",
    "\nprojects -- illustrative, not a controlled test (no pre-2022 baseline, no denominator).\n")

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
    "\nplant (Almaty, 2024). NOTE: auto-sector DEAL counts actually fell after 2022 (6 -> 3); the",
    "\ncapacity evidence is press/announcement triangulation, not deal data, and no symmetric",
    "\nannouncement search was run for components. Much of the auto capacity also predates 2022.\n")
cat("\nINTERPRETATION (illustrative, not a controlled test): the durable auto shock coincided with",
    "\nnew assembly capacity while the transitory component shock did not, which is SUGGESTIVE that a",
    "\ndurable, transformation-requiring shock draws capacity where a transitory re-export shock does",
    "\nnot. But the two shocks differ in sunk-cost intensity, in whether market access requires domestic",
    "\ncontent (EAEU rules bind for vehicles, not the re-export), and in destination market -- so this",
    "\nis not a clean rho experiment. See corridor.tex Section 7.\n")
sink()
message("done: _outputs/mechanism_tests.txt")
