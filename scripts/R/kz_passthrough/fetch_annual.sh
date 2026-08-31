#!/usr/bin/env bash
# fetch_annual.sh — ANNUAL UN Comtrade keyless-preview HS6 pull for the KZ project.
# Fast path (7 years x 3 tags x 4 chunks = 84 calls). Monthly (fetch.sh) runs separately
# as a refinement for the event study. Resumable.
set -u
cd "$(dirname "$0")"
OUT=_data/json_annual
mkdir -p "$OUT"
BASE="https://comtradeapi.un.org/public/v1/preview/C/A/HS"
UA="User-Agent: Mozilla/5.0 (academic research)"

ALL="854231,854232,854233,854239,851762,852691,853221,853224,854800,847150,850440,851769,852589,852910,852990,853669,853690,854110,854121,854129,854130,854149,854151,854159,854160,848210,848220,848230,848250,880730,901310,901380,901420,901480,847180,848610,848620,848640,853400,854320,902750,903020,903032,903039,903082,845710,845811,845891,845961,846693,090111,170490,190590,210390,210690,220300,330300,330499,340111,392321,392490,401110,480256,610910,611020,620342,630260,640399,691110,732690,841810,940360,950300,961900"
# 7-code chunks: with ~60-80 partners per code the 500-row preview cap would bite
# at 19 codes/chunk, so keep chunks small (7 codes x ~70 partners < 500).
IFS=',' read -ra C <<< "$ALL"
CHUNKS=()
i=0; while [ $i -lt ${#C[@]} ]; do CHUNKS+=("$(IFS=,; echo "${C[*]:$i:7}")"); i=$((i+7)); done
NC=${#CHUNKS[@]}
YEARS="2018 2019 2020 2021 2022 2023 2024 2025"

get() {
  local tag="$1" extra="$2" yr="$3" ci="$4" cc="$5"
  local f="$OUT/${tag}_${yr}_${ci}.json"
  if [ -s "$f" ] && grep -q '"data"' "$f"; then return 0; fi
  local url="${BASE}?period=${yr}&cmdCode=${cc}&customsCode=C00&motCode=0&partner2Code=0&${extra}"
  local t=0
  while [ $t -lt 10 ]; do
    code=$(curl -sS --compressed --max-time 120 -H "$UA" -o "$f" -w '%{http_code}' "$url" || echo 000)
    if [ "$code" = "200" ] && grep -q '"data"' "$f"; then sleep 3; return 0; fi
    t=$((t+1)); echo "  retry $tag $yr.$ci code=$code ($t)"; sleep $((4 + t*3))
  done
  echo "  !! FAILED $tag $yr.$ci"; rm -f "$f"; return 1
}

fail=0
for yr in $YEARS; do
  echo "year $yr"
  ci=0; while [ $ci -lt $NC ]; do
    get kzimp  "reporterCode=398&flowCode=M" "$yr" "$ci" "${CHUNKS[$ci]}" || fail=1
    get kzexp  "reporterCode=398&flowCode=X" "$yr" "$ci" "${CHUNKS[$ci]}" || fail=1
    get mirror "partnerCode=398&flowCode=X"  "$yr" "$ci" "${CHUNKS[$ci]}" || fail=1
    ci=$((ci+1))
  done
done
n=$(ls "$OUT"/*.json 2>/dev/null | wc -l)
exp=$(( ${#YEARS[@]} )); exp=$(( 8 * NC * 3 ))
echo "have $n / ~$exp annual json files"
[ "$fail" -eq 0 ] && [ "$n" -ge $((exp - NC*3)) ] && echo "ANNUAL DONE" || echo "INCOMPLETE — rerun"
