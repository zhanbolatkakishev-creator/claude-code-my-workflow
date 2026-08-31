#!/usr/bin/env bash
# fetch.sh — pull UN Comtrade keyless-preview monthly HS6 JSON for the KZ project.
# Bash + curl (the R fetch path was flaky here). Resumable: skips existing non-empty
# JSON files. Run repeatedly until it prints ALL DONE.
set -u
cd "$(dirname "$0")"
OUT=_data/json
mkdir -p "$OUT"
BASE="https://comtradeapi.un.org/public/v1/preview/C/M/HS"
UA="User-Agent: Mozilla/5.0 (academic research)"

# 75 HS6 codes (CHPL 50 + controls 25), from 03_classify_hs_chpl.R
ALL="854231,854232,854233,854239,851762,852691,853221,853224,854800,847150,850440,851769,852589,852910,852990,853669,853690,854110,854121,854129,854130,854149,854151,854159,854160,848210,848220,848230,848250,880730,901310,901380,901420,901480,847180,848610,848620,848640,853400,854320,902750,903020,903032,903039,903082,845710,845811,845891,845961,846693,090111,170490,190590,210390,210690,220300,330300,330499,340111,392321,392490,401110,480256,610910,611020,620342,630260,640399,691110,732690,841810,940360,950300,961900"
# split into 4 comma-groups of ~19 for the 500-row preview cap
IFS=',' read -ra C <<< "$ALL"
CH1=$(IFS=,; echo "${C[*]:0:19}")
CH2=$(IFS=,; echo "${C[*]:19:19}")
CH3=$(IFS=,; echo "${C[*]:38:19}")
CH4=$(IFS=,; echo "${C[*]:57:18}")
CHUNKS=("$CH1" "$CH2" "$CH3" "$CH4")

# months 2019-01 .. (current month - 2)
CUT=$(date -d "-60 days" +%Y%m 2>/dev/null || date +%Y%m)
MONTHS=()
for y in $(seq 2019 ${CUT:0:4}); do for m in 01 02 03 04 05 06 07 08 09 10 11 12; do
  ym="${y}${m}"; [ "$ym" -le "$CUT" ] && MONTHS+=("$ym")
done; done

get() { # tag  extra_query  month  chunkidx  chunk
  local tag="$1" extra="$2" ym="$3" ci="$4" cc="$5"
  local f="$OUT/${tag}_${ym}_${ci}.json"
  if [ -s "$f" ] && grep -q '"data"' "$f"; then return 0; fi
  local url="${BASE}?period=${ym}&cmdCode=${cc}&customsCode=C00&motCode=0&partner2Code=0&${extra}"
  local tries=0
  while [ $tries -lt 8 ]; do
    code=$(curl -sS --compressed --max-time 120 -H "$UA" -o "$f" -w '%{http_code}' "$url" || echo 000)
    if [ "$code" = "200" ] && grep -q '"data"' "$f"; then sleep 3; return 0; fi
    tries=$((tries+1)); echo "   retry $tag $ym.$ci code=$code (try $tries)"; sleep $((5 + tries*4))
  done
  echo "   !! FAILED $tag $ym.$ci"; rm -f "$f"; return 1
}

fail=0
for ym in "${MONTHS[@]}"; do
  echo "month $ym"
  for ci in 0 1 2 3; do
    get kzimp  "reporterCode=398&flowCode=M" "$ym" "$ci" "${CHUNKS[$ci]}" || fail=1
    get kzexp  "reporterCode=398&flowCode=X" "$ym" "$ci" "${CHUNKS[$ci]}" || fail=1
    get mirror "partnerCode=398&flowCode=X"  "$ym" "$ci" "${CHUNKS[$ci]}" || fail=1
  done
done
n=$(ls "$OUT"/*.json 2>/dev/null | wc -l)
exp=$(( ${#MONTHS[@]} * 12 ))
echo "have $n / $exp json files"
if [ "$fail" -eq 0 ] && [ "$n" -ge "$exp" ]; then echo "ALL DONE"; else echo "INCOMPLETE — rerun"; fi
