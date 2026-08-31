#!/usr/bin/env bash
# KZ total imports by HS2 chapter, annual 2017-2025, authenticated Comtrade.
# KZ-reported (from World) AND mirror (all reporters -> KZ). One call per year.
set -u
cd "$(dirname "$0")"
: "${COMTRADE_PRIMARY:?export COMTRADE_PRIMARY}"
OUT=_data/trade_hs2
mkdir -p "$OUT"
KEYH="Ocp-Apim-Subscription-Key: ${COMTRADE_PRIMARY}"
BASE="https://comtradeapi.un.org/data/v1/get/C/A/HS"

for y in 2017 2018 2019 2020 2021 2022 2023 2024 2025; do
  # KZ reported imports from World, all HS2 (cmdCode=AG2)
  f="$OUT/kzimp_${y}.json"
  if [ ! -s "$f" ] || ! grep -q data "$f"; then
    curl -sS --compressed --max-time 300 -H "$KEYH" -o "$f" -w "kzimp $y %{http_code}\n" \
      "${BASE}?period=${y}&reporterCode=398&partnerCode=0&flowCode=M&cmdCode=AG2&customsCode=C00&motCode=0&partner2Code=0"
    sleep 1
  fi
  # mirror: all reporters -> KZ, all HS2
  g="$OUT/mirror_${y}.json"
  if [ ! -s "$g" ] || ! grep -q data "$g"; then
    curl -sS --compressed --max-time 300 -H "$KEYH" -o "$g" -w "mirror $y %{http_code}\n" \
      "${BASE}?period=${y}&partnerCode=398&flowCode=X&cmdCode=AG2&customsCode=C00&motCode=0&partner2Code=0"
    sleep 1
  fi
done
echo "files: $(ls "$OUT"/*.json | wc -l)"
