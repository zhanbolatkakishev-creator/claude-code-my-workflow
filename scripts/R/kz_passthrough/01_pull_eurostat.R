# 01_pull_eurostat.R — Phase 0 data pull (NO API KEY REQUIRED)
# Eurostat "Extra-EU trade by partner" (annual): EU27 exports/imports vs a set of
# partner countries, TOTAL goods + 6 broad SITC groups. Enough for a GO/NO-GO
# structural-break test at 2022. HS6 / CHPL detail + KZ->Russia mirror come in
# Phase 1 via UN Comtrade (needs the free key).

source("00_setup.R")

## partners: treated (Eurasian intermediaries) + comparison/control partners
PARTNERS <- c(KZ = "KZ",  AM = "AM",  KG = "KG",           # treated intermediaries
              GE = "GE",  UZ = "UZ",  AZ = "AZ",            # regional neighbours
              TR = "TR",  CN = "CN",  RU = "RU",            # context
              US = "US",  BR = "BR",  IN = "IN", ZA = "ZA", # far controls
              EG = "EG",  MA = "MA",  RS = "RS")            # more controls

## SITC one-digit families available without a key (dataset code -> label)
SITC_SETS <- c(
  ext_lt_maineu    = "TOTAL",
  ext_lt_mainagri  = "SITC0_1_food",
  ext_lt_mainrawm  = "SITC2_4_rawmat",
  ext_lt_mainmine  = "SITC3_fuels",
  ext_lt_mainchem  = "SITC5_chemicals",
  ext_lt_mainmanu  = "SITC6_8_manuf",
  ext_lt_mainmach  = "SITC7_machinery_transport"   # <- reorientation-relevant
)

pull_one <- function(dscode, label) {
  message("  pulling ", dscode, " (", label, ") ...")
  d <- tryCatch(
    as.data.table(eurostat::get_eurostat(
      dscode,
      filters = list(partner = unname(PARTNERS)),
      time_format = "num")),
    error = function(e) { message("   ERR: ", conditionMessage(e)); NULL })
  if (is.null(d)) return(NULL)
  # keep export & import values in million EUR
  keep <- intersect(c("MIO_EXP_VAL", "MIO_IMP_VAL"), unique(d$indic_et))
  d <- d[indic_et %in% keep]
  d[, `:=`(dataset = dscode, prodgrp = label)]
  setnames(d, "time", "year", skip_absent = TRUE)
  d[, .(dataset, prodgrp, partner, year,
        flow = fifelse(indic_et == "MIO_EXP_VAL", "eu_export", "eu_import"),
        value_meur = values)]
}

all_list <- Map(pull_one, names(SITC_SETS), SITC_SETS)
eu <- rbindlist(Filter(Negate(is.null), all_list), use.names = TRUE)

## tidy + tag
eu[, treated_partner := partner %in% c("KZ", "AM", "KG")]
eu <- eu[is.finite(value_meur) & year >= 2010]
setorder(eu, prodgrp, partner, flow, year)

save_out(eu, "eu_kz_partner_annual")
fwrite(eu, file.path(DIR_OUT, "eu_kz_partner_annual.csv"))

cat("\n== EU exports to KZ, EUR million ==\n")
print(dcast(eu[partner == "KZ" & flow == "eu_export"],
            year ~ prodgrp, value.var = "value_meur"))

cat("\n== EU exports to treated intermediaries, TOTAL, EUR million ==\n")
print(dcast(eu[flow == "eu_export" & prodgrp == "TOTAL" &
                 partner %in% c("KZ","AM","KG","GE","UZ","TR","CN")],
            year ~ partner, value.var = "value_meur"))

message("saved: ", file.path(DIR_OUT, "eu_kz_partner_annual.rds"))
