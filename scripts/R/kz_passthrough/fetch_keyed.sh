#!/usr/bin/env bash
# fetch_keyed.sh — FAST authenticated UN Comtrade pull (needs COMTRADE_PRIMARY exported).
# /data/v1/get : 12 periods/call, 100k rows/call, no 500-row cap.
# MONTHLY HS6, 2019-01..2025-12. 7 years x 3 tags x 2 code-chunks = 42 calls.
set -u
cd "$(dirname "$0")"
: "${COMTRADE_PRIMARY:?export COMTRADE_PRIMARY before running}"
OUT=_data/json_keyed
mkdir -p "$OUT"
BASE="https://comtradeapi.un.org/data/v1/get/C/M/HS"
KEYH="Ocp-Apim-Subscription-Key: ${COMTRADE_PRIMARY}"

ALL="854231,854232,854233,854239,851762,852691,853221,853224,854800,847150,850440,851769,852589,852910,852990,853669,853690,854110,854121,854129,854130,854149,854151,854159,854160,848210,848220,848230,848250,880730,901310,901380,901420,901480,847180,848610,848620,848640,853400,854320,902750,903020,903032,903039,903082,845710,845811,845891,845961,846693,090111,170490,190590,210390,210690,220300,330300,330499,340111,392321,392490,401110,480256,610910,611020,620342,630260,640399,691110,732690,841810,940360,950300,961900"
IFS=',' read -ra C <<< "$ALL"
CH_A=$(IFS=,; echo "${C[*]:0:38}")
CH_B=$(IFS=,; echo "${C[*]:38}")

get() {
  tag=$1; flow=$2; who=$3; y=$4; cn=$5; cc=$6
  f="$OUT/${tag}_${y}_${cn}.json"
  if [ -s "$f" ] && grep -q 'data' "$f"; then return 0; fi
  per=$(printf '%s,' $(seq -w $((y*100+1)) $((y*100+12)))); per=${per%,}
  url="${BASE}?period=${per}&cmdCode=${cc}&flowCode=${flow}&${who}&customsCode=C00&motCode=0&partner2Code=0"
  t=0
  while [ $t -lt 8 ]; do
    code=$(curl -sS --compressed --max-time 300 -H "$KEYH" -o "$f" -w '%{http_code}' "$url" || echo 000)
    if [ "$code" = "200" ] && grep -q 'data' "$f"; then
      echo "  ok $tag $y $cn"; sleep 1; return 0
    fi
    t=$((t+1)); echo "  retry $tag $y $cn code=$code"; sleep $((3 + t*3))
  done
  echo "  FAILED $tag $y $cn"; rm -f "$f"; return 1
}

fail=0
for y in 2019 2020 2021 2022 2023 2024 2025; do
  echo "year $y"
  for cn in A B; do
    if [ "$cn" = "A" ]; then cc="$CH_A"; else cc="$CH_B"; fi
    get kzimp  M "reporterCode=398" "$y" "$cn" "$cc" || fail=1
    get kzexp  X "reporterCode=398" "$y" "$cn" "$cc" || fail=1
    get mirror X "partnerCode=398"  "$y" "$cn" "$cc" || fail=1
  done
done
n=$(ls "$OUT"/*.json 2>/dev/null | wc -l)
echo "have $n / 42"
if [ $fail -eq 0 ] && [ "$n" -ge 39 ]; then echo "KEYED DONE"; else echo "INCOMPLETE"; fi
