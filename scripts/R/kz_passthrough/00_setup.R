# 00_setup.R — packages, paths, shared helpers for the KZ trade-reorientation pipeline
# Paper: "Corridor, Not Factory: Trade Reorientation and the Missing Investment Response
#         in Kazakhstan, 2022–2025"

## ---- paths -----------------------------------------------------------------
# Run from the project dir. If launched from the repo root, hop into it.
if (!file.exists("00_setup.R") && dir.exists("scripts/R/kz_passthrough")) {
  setwd("scripts/R/kz_passthrough")
}
stopifnot(file.exists("00_setup.R"))
DIR_DATA <- "_data"
DIR_OUT  <- "_outputs"
dir.create(DIR_DATA, showWarnings = FALSE, recursive = TRUE)
dir.create(DIR_OUT,  showWarnings = FALSE, recursive = TRUE)

## ---- packages --------------------------------------------------------------
.pkgs <- c("data.table", "eurostat", "fixest", "strucchange", "sandwich",
           "zoo", "ggplot2", "readxl")
.miss <- .pkgs[!vapply(.pkgs, requireNamespace, logical(1), quietly = TRUE)]
if (length(.miss)) {
  install.packages(.miss, repos = c(CRAN = "https://cloud.r-project.org"),
                   quiet = TRUE)
}
invisible(lapply(.pkgs, function(p) suppressMessages(library(p, character.only = TRUE))))

## ---- Comtrade key (needed from Phase 1 on; not for Phase 0) ---------------
COMTRADE_KEY <- Sys.getenv("COMTRADE_PRIMARY", unset = "")
has_comtrade <- nzchar(COMTRADE_KEY)
if (!has_comtrade) {
  message("NOTE: COMTRADE_PRIMARY not set. Phase 0 (Eurostat) runs without it; ",
          "Phase 1 needs a free key from https://comtradedeveloper.un.org/ ",
          "-> add COMTRADE_PRIMARY=<key> to .Renviron.")
}

## ---- shared constants ----------------------------------------------------
TREAT_DATE   <- as.Date("2022-03-01")   # first full month of the sanctions regime
SANCTION_ANN <- 2022                    # annual-frequency treatment year
theme_set(theme_minimal(base_size = 11))

## ---- shared helpers ----------------------------------------------------
save_out <- function(obj, name) {
  saveRDS(obj, file.path(DIR_OUT, paste0(name, ".rds")))
  invisible(obj)
}
save_fig <- function(plot, name, w = 8, h = 4.5) {
  ggsave(file.path(DIR_OUT, paste0(name, ".png")), plot, width = w, height = h, dpi = 150)
  invisible(plot)
}
message("setup OK | wd = ", getwd(), " | comtrade key: ", has_comtrade)
