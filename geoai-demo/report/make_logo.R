# make_logo.R — generate report/logo.png (a clean placeholder wordmark for
# GeoAI Analytics). Swap in a designer asset any time; the app and the reports
# pick up report/logo.png automatically.
#
#   from the geoai-demo/ project root:  source("report/make_logo.R")

if (!file.exists("app.R"))
  stop("Run this from the geoai-demo/ project root (the folder with app.R).")
if (!dir.exists("report")) dir.create("report")

BRAND <- "#1b5e9c"
INK   <- "#20272e"
GREY  <- "#6a7683"

W <- 560; H <- 250
grDevices::png("report/logo.png", width = W, height = H, bg = "transparent", res = 150)
op <- graphics::par(mar = c(0, 0, 0, 0), xaxs = "i", yaxs = "i")
graphics::plot.new(); graphics::plot.window(xlim = c(0, W), ylim = c(0, H), asp = 1)

# --- round icon ---
cx <- 125; cy <- H / 2; r <- 105
th <- seq(0, 2 * pi, length.out = 240)
graphics::polygon(cx + r * cos(th), cy + r * sin(th), col = BRAND, border = NA)

# clean exponential decline curve inside the disc
t  <- seq(0, 1, length.out = 160)
x0 <- cx - 62; x1 <- cx + 62
y0 <- cy - 58; ytop <- cy + 52
lx <- x0 + t * (x1 - x0)
ly <- y0 + exp(-3.0 * t) * (ytop - y0)
graphics::lines(lx, ly, col = "white", lwd = 6, lend = 1)

# baseline + tick, and three tidy points sitting on the early curve
graphics::segments(x0 - 6, y0, x1 + 6, y0, col = "white", lwd = 3, lend = 1)
graphics::segments(x0, y0 - 6, x0, ytop - 4, col = "white", lwd = 3, lend = 1)
pxt <- c(0.06, 0.16, 0.28)
graphics::points(x0 + pxt * (x1 - x0),
                 y0 + exp(-3.0 * pxt) * (ytop - y0),
                 pch = 21, bg = "white", col = BRAND, cex = 1.1, lwd = 1)

# --- wordmark ---
graphics::text(260, cy + 14, "GeoAI", adj = c(0, 0.5), font = 2, cex = 2.7, col = INK)
graphics::text(263, cy - 40, "A N A L Y T I C S", adj = c(0, 0.5), font = 1,
               cex = 1.05, col = GREY)

graphics::par(op); grDevices::dev.off()
message("wrote report/logo.png  (", W, "x", H, ")")
