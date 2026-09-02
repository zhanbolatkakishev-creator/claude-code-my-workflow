#!/usr/bin/env bash
# fetch_neighbors.sh — neighbour intermediaries, annual HS6, keyless preview.
#   Armenia (51) & Kyrgyz Republic (417): customs-union intermediaries (same 2022 break, no
#     "New Kazakhstan" reform -> reform-confound robustness).
#   R&R Essential 5 -- Georgia (268) & Turkiye (792): NON-customs-union intermediaries. A
#     supply from them to Russia crosses a border, so the framework predicts a supply response
#     there; the trade half is the discriminating comparison for external validity.
set -u
cd "$(dirname "$0")"
OUT=_data/json_annual_nb
mkdir -p "$OUT"
BASE="https://comtradeapi.un.org/public/v1/preview/C/A/HS"
UA="User-Agent: Mozilla/5.0 (academic research)"
ALL="854231,854232,854233,854239,851762,852691,853221,853224,854800,847150,850440,851769,852589,852910,852990,853669,853690,854110,854121,854129,854130,854149,854151,854159,854160,848210,848220,848230,848250,880730,901310,901380,901420,901480,847180,848610,848620,848640,853400,854320,902750,903020,903032,903039,903082,845710,845811,845891,845961,846693,090111,170490,190590,210390,210690,220300,330300,330499,340111,392321,392490,401110,480256,610910,611020,620342,630260,640399,691110,732690,841810,940360,950300,961900"
IFS=',' read -ra C <<< "$ALL"
CHUNKS=(); i=0; while [ $i -lt ${#C[@]} ]; do CHUNKS+=("$(IFS=,; echo "${C[*]:$i:7}")"); i=$((i+7)); done
NC=${#CHUNKS[@]}

get() { # tag who year ci chunk
  local tag=$1 who=$2 y=$3 ci=$4 cc=$5
  local f="$OUT/${tag}_${y}_${ci}.json"
  [ -s "$f" ] && grep -q '"data"' "$f" && return 0
  local url="${BASE}?period=${y}&cmdCode=${cc}&customsCode=C00&motCode=0&partner2Code=0&${who}"
  local t=0
  while [ $t -lt 8 ]; do
    code=$(curl -sS --compressed --max-time 120 -H "$UA" -o "$f" -w '%{http_code}' "$url" || echo 000)
    [ "$code" = "200" ] && grep -q '"data"' "$f" && { sleep 3; return 0; }
    t=$((t+1)); sleep $((4 + t*3))
  done
  echo "  !! FAILED $tag $y $ci"; rm -f "$f"; return 1
}

for y in 2018 2019 2020 2021 2022 2023 2024 2025; do
  echo "year $y"
  ci=0; while [ $ci -lt $NC ]; do
    # customs-union intermediaries: Armenia (51), Kyrgyz Rep (417)
    get arm_imp "reporterCode=51&flowCode=M"  "$y" "$ci" "${CHUNKS[$ci]}"
    get arm_exp "reporterCode=51&flowCode=X"  "$y" "$ci" "${CHUNKS[$ci]}"
    get kgz_imp "reporterCode=417&flowCode=M" "$y" "$ci" "${CHUNKS[$ci]}"
    get kgz_exp "reporterCode=417&flowCode=X" "$y" "$ci" "${CHUNKS[$ci]}"
    # non-customs-union intermediaries (R&R E5): Georgia (268), Turkiye (792)
    get geo_imp "reporterCode=268&flowCode=M" "$y" "$ci" "${CHUNKS[$ci]}"
    get geo_exp "reporterCode=268&flowCode=X" "$y" "$ci" "${CHUNKS[$ci]}"
    get tur_imp "reporterCode=792&flowCode=M" "$y" "$ci" "${CHUNKS[$ci]}"
    get tur_exp "reporterCode=792&flowCode=X" "$y" "$ci" "${CHUNKS[$ci]}"
    ci=$((ci+1))
  done
done
echo "have $(ls "$OUT"/*.json 2>/dev/null | wc -l) json files. DONE"
