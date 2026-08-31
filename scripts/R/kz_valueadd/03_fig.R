# 03_fig.R — the mismatch: trade flow x10, investment response flat
suppressMessages({library(data.table); library(ggplot2)})
OUT <- "C:/Users/zh.kakishev/my-project2/scripts/R/kz_valueadd/_outputs"
dd <- readRDS(file.path(OUT, "deals_classified.rds"))

## trade: surge-basket KZ imports from EU+China (mirror), annual, from the trade project
tp <- "C:/Users/zh.kakishev/my-project2/scripts/R/kz_passthrough/_outputs/panel_annual.rds"
sb <- "C:/Users/zh.kakishev/my-project2/scripts/R/kz_passthrough/_outputs/surge_basket_frozen.rds"
p  <- readRDS(tp); s <- readRDS(sb); setDT(p); setDT(s)
p <- merge(p, s[, .(hs6, surge)], by = "hs6", all.x = TRUE, suffixes = c("", ".s"))
trade <- p[surge == TRUE, .(trade_musd = sum(mirW_usd) / 1e6), by = .(yr = as.integer(format(tt, "%Y")))]

## investment: value-add-relevant deal count, by year
inv <- dd[valueadd_relevant == TRUE, .(deals = .N,
          newcap = sum(newcap)), by = yr][order(yr)]

m <- merge(trade, inv, by = "yr", all = TRUE)[yr >= 2016 & yr <= 2025]
m[is.na(deals), deals := 0]

scale <- max(m$trade_musd, na.rm = TRUE) / max(m$deals, na.rm = TRUE)
g <- ggplot(m, aes(yr)) +
  geom_col(aes(y = deals * scale), fill = "grey80") +
  geom_line(aes(y = trade_musd), colour = "#d95f0e", linewidth = 1) +
  geom_point(aes(y = trade_musd), colour = "#d95f0e") +
  geom_vline(xintercept = 2022, linetype = 2, colour = "grey40") +
  scale_y_continuous(name = "surge-basket imports from EU+China, USD m (line)",
                     sec.axis = sec_axis(~ . / scale, name = "value-add-relevant deals per year (bars)")) +
  scale_x_continuous(breaks = 2016:2025) +
  labs(title = "Trade through Kazakhstan surged; the investment response did not",
       subtitle = "Line: surge-basket inbound trade (mirror). Bars: M&A/PE deals in manufacturing-of-tradeables, transport/logistics, distribution. Dashed = 2022.",
       x = NULL)
ggsave(file.path(OUT, "valueadd_fig_mismatch.png"), g, width = 9, height = 4.8, dpi = 150)

fwrite(m, file.path(OUT, "valueadd_mismatch.csv"))
print(m)
message("fig: _outputs/valueadd_fig_mismatch.png")
