# 00_setup.R -- packages and relative paths for the kz_valueadd pipeline
# (investment response, sector priority). Sourced by 01..08.

## ---- paths ---------------------------------------------------------------
# Run from scripts/R/kz_valueadd/. If launched from the repo root, hop in.
if (!file.exists("00_setup.R") && dir.exists("scripts/R/kz_valueadd")) {
  setwd("scripts/R/kz_valueadd")
}
stopifnot(file.exists("00_setup.R"))

DIR_DATA      <- "_data"                       # licensed deal xlsx + constructed .rds
DIR_OUT       <- "_outputs"                    # this pipeline's outputs
DIR_PASS_OUT  <- file.path("..", "kz_passthrough", "_outputs")   # trade-pipeline outputs
DIR_PASS_DATA <- file.path("..", "kz_passthrough", "_data")      # trade-pipeline data (kz_io.rds)
dir.create(DIR_DATA, showWarnings = FALSE, recursive = TRUE)
dir.create(DIR_OUT,  showWarnings = FALSE, recursive = TRUE)

## ---- packages ----------------------------------------------------------
.pkgs <- c("data.table", "ggplot2", "jsonlite", "wbstats")
.miss <- .pkgs[!vapply(.pkgs, requireNamespace, logical(1), quietly = TRUE)]
if (length(.miss)) {
  install.packages(.miss, repos = c(CRAN = "https://cloud.r-project.org"), quiet = TRUE)
}
invisible(lapply(.pkgs, function(p) suppressMessages(library(p, character.only = TRUE))))

message("kz_valueadd setup OK | wd = ", getwd())
