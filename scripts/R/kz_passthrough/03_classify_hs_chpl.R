# 03_classify_hs_chpl.R — the "exposed" product set
# EU/US/UK/JP "List of Common High Priority Items", Version of February 2024 (50 HS6 codes,
# 4 tiers). Source: https://finance.ec.europa.eu/publications/list-common-high-priority-items_en
# VERIFY against the current published version before submission (the list is periodically
# revised; a few Tier 3 sub-codes were column-mangled in the PDF and are flagged below).

source("00_setup.R")

chpl <- rbindlist(list(
  data.table(tier = "1",   hs6 = c("854231","854232","854233","854239")),
  data.table(tier = "2",   hs6 = c("851762","852691","853221","853224","854800")),
  data.table(tier = "3A",  hs6 = c("847150","850440","851769","852589","852910","852990",
                                   "853669","853690","854110","854121","854129","854130",
                                   "854149","854151","854159","854160")),
  data.table(tier = "3B",  hs6 = c("848210","848220","848230","848250","880730",
                                   "901310","901380","901420","901480")),
  data.table(tier = "4A",  hs6 = c("847180","848610","848620","848640","853400","854320",
                                   "902750","903020","903032","903039","903082")),
  data.table(tier = "4B",  hs6 = c("845710","845811","845891","845961","846693"))
))
chpl[, `:=`(exposed = TRUE, hs4 = substr(hs6, 1, 4), hs2 = substr(hs6, 1, 2))]
stopifnot(nrow(chpl) == 50, uniqueN(chpl$hs6) == 50)

## Control basket: clearly-civilian, non-restricted consumer/intermediate goods with a
## comparable pre-2022 import profile. Used as the DiD comparison group.
control_hs6 <- c(
  # food / beverages
  "220300","190590","210390","090111","170490",
  # apparel / footwear / textiles
  "610910","620342","640399","611020","630260",
  # household / furniture / toys
  "940360","691110","392490","950300","961900",
  # personal care / pharma-adjacent OTC
  "330499","340111","330300","210690","480256",
  # civilian vehicles parts unlikely to be battlefield-priority
  "401110","870899","732690","841810","392321"
)
controls <- data.table(tier = "control", hs6 = control_hs6, exposed = FALSE,
                       hs4 = substr(control_hs6,1,4), hs2 = substr(control_hs6,1,2))

hs_class <- rbind(chpl, controls, fill = TRUE)
setcolorder(hs_class, c("hs6","hs4","hs2","tier","exposed"))
save_out(hs_class, "hs_class")
fwrite(hs_class, file.path(DIR_OUT, "hs_class.csv"))

cat("CHPL exposed HS6:", nrow(chpl), " | control HS6:", nrow(controls), "\n")
cat("all HS6 for the Comtrade pull:\n"); print(sort(hs_class$hs6))
message("saved _outputs/hs_class.rds  (VERIFY the CHPL list against the current EU version)")
