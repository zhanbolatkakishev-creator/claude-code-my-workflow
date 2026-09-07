# make_samples.R — build the bundled synthetic sample fields the app offers
# alongside real Volve data. Clearly SYNTHETIC: illustrative shapes, Kazakh field
# names, realistic decline + workover + water-cut behaviour. Not real production.
#
#   from geoai-demo/:  source("data/samples/make_samples.R")

if (!file.exists("app.R"))
  stop("Run from the geoai-demo/ project root (the folder with app.R).")
suppressPackageStartupMessages({library(dplyr); library(lubridate); library(tibble)})
SM3 <- 6.28981
set.seed(20260907)
dir.create("data/samples", showWarnings = FALSE, recursive = TRUE)

arps <- function(t, qi, Di, b) {
  if (b <= 1e-6) qi * exp(-Di * t)
  else if (abs(b - 1) < 1e-6) qi / (1 + Di * t)
  else qi / (1 + b * Di * t)^(1 / b)
}

# one well: monthly oil rate (bopd), water cut, gas, with optional workover events
gen_well <- function(name, start, n_months, qi, Di, b,
                     wc0 = 0.05, wc_mid_yr = 6, wc_max = 0.9,
                     workovers = numeric(0), uplift = 1.5, ramp_months = 0,
                     problem = 0) {
  months <- seq(as.Date(start), by = "month", length.out = n_months)
  t  <- (0:(n_months - 1)) / 12
  q  <- arps(t, qi, Di, b)
  # slow start
  if (ramp_months > 0) {
    r <- pmin(seq_len(n_months) / ramp_months, 1)
    q <- q * r
  }
  # a well with an un-fixed problem: extra mid-life fall-off below its own trend
  if (problem > 0) q <- q * (1 - problem * plogis((t - 6) * 0.8))
  # workovers: at month m, step the effective qi up and restart a gentler decline
  boost <- rep(1, n_months)
  for (m in workovers) {
    if (m < n_months - 6) {
      q[m:n_months] <- NA                       # short shut-in
      q[(m + 3):n_months] <- arps((0:(n_months - m - 3)) / 12,
                                  arps((m - 1) / 12, qi, Di, b) * uplift,
                                  Di * 0.85, b)
    }
  }
  q <- q * rlnorm(n_months, 0, 0.05)
  wc <- wc0 + (wc_max - wc0) * plogis((t - wc_mid_yr) * 0.9)
  for (m in workovers) if (m < n_months) wc[m:n_months] <- pmax(wc[m:n_months] - 0.15, 0.02)
  gorv <- 250 + 60 * t
  cd   <- as.numeric(days_in_month(months))
  dos  <- pmin(pmax(rnorm(n_months, 27, 3), 0), cd)
  oil_bbl <- ifelse(is.na(q), 0, q) * cd
  wat_bbl <- oil_bbl * wc / pmax(1 - wc, 0.05)
  gas     <- oil_bbl * gorv
  tibble(
    well = name, month = months,
    oil_bbl = oil_bbl, gas = gas, wat_bbl = wat_bbl,
    days_on_stream = ifelse(is.na(q), 0, dos), days_reported = 1L, cal_days = cd,
    oil_rate_bopd = oil_bbl / cd,
    oil_rate_on   = ifelse(dos > 0, oil_bbl / dos, NA_real_),
    wct = ifelse((wat_bbl + oil_bbl) > 0, wat_bbl / (wat_bbl + oil_bbl), NA_real_),
    gor = ifelse(oil_bbl > 0, gas / oil_bbl, NA_real_)
  ) |>
    filter(oil_rate_bopd > 0) |>
    arrange(month)
}

finalize <- function(df, path, label) {
  df <- df |> group_by(well) |> arrange(month, .by_group = TRUE) |>
    mutate(cum_oil_bbl = cumsum(oil_bbl)) |> ungroup()
  saveRDS(df, path)
  message(sprintf("  %-42s %2d wells  %s..%s  %5.1f MMbbl",
                  label, n_distinct(df$well),
                  format(min(df$month)), format(max(df$month)),
                  sum(df$oil_bbl) / 1e6))
}

# --- 1. mature onshore field with workover history --------------------
mature <- bind_rows(
  gen_well("KZ-101", "2006-03-01", 210, 4200, 0.28, 0.6, wc0 = 0.08, wc_mid_yr = 5,
           workovers = c(96, 168), uplift = 1.7),
  gen_well("KZ-104", "2006-03-01", 210, 6100, 0.34, 0.4, wc0 = 0.05, wc_mid_yr = 6,
           workovers = c(120), uplift = 1.5),
  gen_well("KZ-107", "2007-09-01", 198, 2600, 0.22, 0.9, wc0 = 0.10, wc_mid_yr = 4,
           workovers = c(84, 156), uplift = 1.6),
  gen_well("KZ-112", "2009-01-01", 180, 3500, 0.40, 0.3, wc0 = 0.06, wc_mid_yr = 5,
           problem = 0.35, wc_max = 0.94),                    # underperforming, high water
  gen_well("KZ-115", "2011-06-01", 150, 5200, 0.31, 0.5, wc0 = 0.04, wc_mid_yr = 6,
           workovers = c(108), uplift = 1.4),
  gen_well("KZ-118", "2014-02-01", 120, 1800, 0.18, 1.0, wc0 = 0.12, wc_mid_yr = 3,
           problem = 0.40, wc_max = 0.92),                    # underperforming, rising water
  gen_well("KZ-121", "2017-08-01",  84, 7400, 0.52, 0.2, wc0 = 0.03, wc_mid_yr = 5),
  gen_well("KZ-124", "2020-05-01",  50, 2900, 0.30, 0.6, wc0 = 0.05, wc_mid_yr = 4,
           ramp_months = 4)
)
finalize(mature, "data/samples/kz_mature_synthetic.rds", "Kazakhstan mature field (synthetic)")

# --- 2. young field, still early in life -----------------------------
young <- bind_rows(
  gen_well("NF-1", "2020-04-01", 54, 9800, 0.45, 0.7, wc0 = 0.02, wc_mid_yr = 8, ramp_months = 3),
  gen_well("NF-2", "2020-07-01", 51, 7300, 0.38, 0.8, wc0 = 0.02, wc_mid_yr = 9, ramp_months = 3),
  gen_well("NF-3", "2021-02-01", 44, 12500, 0.55, 0.5, wc0 = 0.03, wc_mid_yr = 7, ramp_months = 4),
  gen_well("NF-4", "2022-01-01", 33, 6400, 0.30, 1.0, wc0 = 0.04, wc_mid_yr = 8, ramp_months = 3),
  gen_well("NF-5", "2023-06-01", 16, 8100, 0.42, 0.6, wc0 = 0.02, wc_mid_yr = 9, ramp_months = 4)
)
finalize(young, "data/samples/kz_young_synthetic.rds", "Kazakhstan new field (synthetic)")

message("done — wrote data/samples/*.rds")
