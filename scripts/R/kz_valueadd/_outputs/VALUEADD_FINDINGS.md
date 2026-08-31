# Is the post-2022 trade route creating value-add operations in Kazakhstan?

**Date:** 2026-08-28
**Question (user):** using the trade-reorientation data + PE/M&A deal data, does the new route
through Kazakhstan generate value-add operations / production in the country — and what would
raise domestic value capture?
**Deal data:** `20260825_DA_CLEANED.xlsx` — 501 non-duplicate deals, 2015--2025, from
Capital IQ (261), PitchBook (199), Preqin (32); plus QIC (Qazaqstan Investment Corporation /
Baiterek) state-fund transactions. All replicable from the same platforms.
**Method:** `scripts/R/kz_valueadd/` — classify deals into value-chain buckets from
`industry_raw`; compare activity in trade-relevant sectors (manufacturing of tradeables,
transport/logistics, wholesale/distribution) before vs.\ after 2022; split greenfield/new-
capacity vs.\ ownership transfer; scan the QIC industrial pipeline.

## Answer: **essentially no.**

### 1. Deal activity in trade-relevant sectors is flat

| | 2015--2021 | 2022--2025 |
|---|---|---|
| value-add-relevant deals (mfg tradeables + transport/logistics + distribution) | 51 (7.3/yr) | 30 (7.5/yr) |
| of which greenfield / new-capacity (vs.\ M&A of existing assets) | ~2/yr | ~1--2/yr |

The count does not move. Reported deal **value** rises (\$1.0bn $\to$ \$2.3bn) but is
concentrated in a handful of **ownership transfers of existing or distressed assets** ---
ArcelorMittal Tem\-ir\-tau $\to$ Qarmet (nationalisation, 2023), Caustic JSC, cement assets,
Eurocopter Kazakhstan and Lokomotiv Kurastyru Zauyty (re-nationalisations, 2024), and a
\$767m 2025 rail-freight / wagon-repair / forwarding consolidation with Russia-linked asset
names. None of this is new productive capacity.

### 2. Nothing in the sectors the trade surge actually flows through

The reorientation is in dual-use **electronics, precision instruments and machinery
components** (HS 8471, 8517, 8526, 8532, 8541--8542, 9013--9014, 8482, 8486, 8534, 9030,
8457--8459). Across 2015--2025 the deal data contains **zero** transactions in these lines ---
no chip, component, instrument or precision-machinery plant, deal or expansion. The
manufacturing deals that do exist are food processing, cement/glass/silicon, rail rolling
stock (old JVs), and recurring rescue financing of one chronically weak car assembler
(AllurGroup / UVU: financed 2017, 2019, 2021, 2023).

### 3. The state fund's post-2022 industrial pipeline points elsewhere

QIC funded ~28 industrial/logistics projects in 2022--2025. Composition: agri-processing and
metallurgy/steel (largely the Qarmet rescue and rebar/pipe capacity), plus chemicals. QIC's
own money is small (\$1--14m per project; a few larger for Qarmet). A handful are
corridor-adjacent --- "Vehicles Almaty", a utility-meter production expansion in Almaty, a
trade-logistics complex in Almaty region, an "export-oriented trade-purchasing" project ---
but small and not a coordinated re-export-processing push.

### 4. Broader industrialisation exists but is a different story

Kazakhstan is adding SKD/CKD car assembly (Chinese brands Changan/Haval/Chery, KIA, Škoda) and
some appliance capacity. But (i) these programmes pre-date and are largely independent of the
2022 reorientation; (ii) they are **kit assembly** --- imported kits, low domestic value
added, the corridor logic one step in; (iii) they serve the domestic and EAEU consumer market,
not the flow of restricted components to Russia. The aggregate table shows manufacturing deal
count blipping to 8 in 2023 (from 2--3) then reverting to 5--6; transport/warehousing dealmaking
is near zero post-2022 until a single 2025 transaction.

## Why the mismatch (trade $\times$10, investment flat)

1. **The activity does not require domestic capacity.** Under the EAEU there is no KZ--Russia
   border; a good can be imported, warehoused and forwarded with no processing. The unit-value
   evidence (re-export price *below* import price; pass-through slope 0.27) says no
   transformation is happening --- so no plant is needed, and none is built.
2. **The rents are thin and partly hidden.** Retained margin ~8--10% of the gross flow, and
   likely understated by outbound under-invoicing. That is not a return that finances a
   greenfield electronics line.
3. **The flow is expected to be temporary and carries secondary-sanctions risk** --- a poor
   basis for irreversible investment. It recedes after 2023 as enforcement tightens.
4. **The domestic investment climate is weak for exactly this kind of firm.** The Kazakhstan
   PE survey evidence (institutional-voids framing): no functioning exit / M&A market
   (buy-back is the leading exit route), capital dominated by state and DFI money, deal
   sourcing informal, private growth-equity almost absent. A firm that wanted to build
   export-oriented component assembly would face expensive, short, state-tilted financing.
5. **The 2022--25 investment pipeline is crowded by nationalisations** (Qarmet, Eurocopter,
   Lokomotiv), which absorb state attention and balance-sheet capacity that could otherwise
   back new tradeable-manufacturing capacity.

## Bottom line

The trade statistics for these products moved by an order of magnitude; the investment data
show no corresponding build-out of production or assembly. Kazakhstan's role deepened as a
**transit and forwarding** operation (the 2025 rail-freight consolidation), not as a site of
value addition --- the same "corridor, not factory" conclusion, now from the investment side.
