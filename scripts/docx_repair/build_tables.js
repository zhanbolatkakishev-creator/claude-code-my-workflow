const fs = require("fs");
const M = require("./map.js");
const warnings = new Set();

// ---------- inline LaTeX -> runs ----------
const GREEK = { gamma: "γ", mu: "μ", lambda: "λ", varepsilon: "ε", epsilon: "ε", beta: "β", rho: "ρ", sigma: "σ", alpha: "α", delta: "δ", theta: "θ", tau: "τ" };
const SYM = { times: "×", approx: "≈", ge: "≥", geq: "≥", le: "≤", leq: "≤", lesssim: "≲", to: "→", mid: "|", dagger: "†", uparrow: "↑", sim: "∼", pm: "±", cdot: "·", ldots: "…", quad: " ", qquad: "  " };
const REFS = { "tab:magnitudes": "1", "tab:did": "2", "sec:shock": "5" };

function readGroup(s, i) {
  // s[i] === '{'; returns [inner, indexAfter]
  let d = 0, j = i;
  for (; j < s.length; j++) {
    if (s[j] === "\\") { j++; continue; }
    if (s[j] === "{") d++;
    else if (s[j] === "}") { d--; if (d === 0) return [s.slice(i + 1, j), j + 1]; }
  }
  throw new Error("unbalanced group: " + s.slice(i, i + 40));
}

function parse(s, fmt) {
  const runs = [];
  let buf = "";
  const flush = () => { if (buf) { runs.push({ text: buf, ...fmt }); buf = ""; } };
  const addRuns = (rs) => { flush(); runs.push(...rs); };
  let i = 0;
  while (i < s.length) {
    const c = s[i];
    if (c === "%") { while (i < s.length && s[i] !== "\n") i++; continue; }
    if (c === "\\") {
      const n = s[i + 1] || "";
      if (/[a-zA-Z]/.test(n)) {
        let j = i + 1;
        while (/[a-zA-Z]/.test(s[j] || "")) j++;
        const name = s.slice(i + 1, j);
        i = j;
        if (["emph", "textit"].includes(name)) { const [g, k] = readGroup(s, i); i = k; addRuns(parse(g, { ...fmt, i: !fmt.i })); continue; }
        if (name === "textbf") { const [g, k] = readGroup(s, i); i = k; addRuns(parse(g, { ...fmt, b: true })); continue; }
        if (["text", "mathrm"].includes(name)) { const [g, k] = readGroup(s, i); i = k; addRuns(parse(g, { ...fmt, math: false })); continue; }
        if (name === "bar") {
          while (s[i] === " ") i++;
          let a; if (s[i] === "{") { const [g, k] = readGroup(s, i); a = g; i = k; } else { a = s[i]; i++; }
          addRuns(parse(a, fmt)); buf += "̄"; flush(); continue;
        }
        if (name === "ref") { const [g, k] = readGroup(s, i); i = k; if (!(g in REFS)) warnings.add("unknown ref " + g); buf += REFS[g] || "?"; continue; }
        if (["vspace", "hspace", "label"].includes(name)) { const [, k] = readGroup(s, i); i = k; continue; }
        if (["footnotesize", "small", "centering", "scriptsize", "normalsize"].includes(name)) { if (s[i] === " ") i++; continue; }
        if (name in GREEK) { flush(); runs.push({ text: GREEK[name], ...fmt, i: fmt.math ? true : fmt.i }); if (s[i] === " ") i++; continue; }
        if (name in SYM) {
          const rel = ["approx", "ge", "geq", "le", "leq", "lesssim", "to", "sim"].includes(name);
          if (rel && fmt.math && name !== "sim") buf += " " + SYM[name] + " "; else buf += SYM[name];
          if (s[i] === " ") i++;
          continue;
        }
        warnings.add("unknown command \\" + name);
        if (s[i] === " ") i++;
        continue;
      } else {
        i += 2;
        if (n === "&") buf += "&";
        else if (n === "$") buf += "$";
        else if (n === "%") buf += "%";
        else if (n === "_") buf += "_";
        else if (n === "{") buf += "{";
        else if (n === "}") buf += "}";
        else if (n === ",") buf += " ";
        else if (n === " " || n === "\n") buf += " ";
        else if (n === "!" || n === "-" || n === "@") { /* drop */ }
        else if (n === '"') { const m = { u: "ü", o: "ö", a: "ä", U: "Ü", O: "Ö", A: "Ä" }; buf += m[s[i]] || s[i]; i++; }
        else warnings.add("unknown escape \\" + n);
        continue;
      }
    }
    if (c === "$") {
      let j = i + 1;
      while (j < s.length && !(s[j] === "$" && s[j - 1] !== "\\")) j++;
      const inner = s.slice(i + 1, j);
      i = j + 1;
      let rs = parse(inner, { ...fmt, math: true });
      if (rs.length) { rs[0] = { ...rs[0], text: rs[0].text.replace(/^\s+/, "") }; const l = rs.length - 1; rs[l] = { ...rs[l], text: rs[l].text.replace(/\s+$/, "") }; }
      addRuns(rs.filter((r) => r.text !== ""));
      continue;
    }
    if (c === "{") { const [g, k] = readGroup(s, i); i = k; addRuns(parse(g, fmt)); continue; }
    if ((c === "^" || c === "_") && fmt.math) {
      i++;
      let arg;
      if (s[i] === "{") { const [g, k] = readGroup(s, i); arg = g; i = k; }
      else if (s[i] === "\\") {
        let j = i + 1;
        if (/[a-zA-Z]/.test(s[j])) { while (/[a-zA-Z]/.test(s[j] || "")) j++; } else j++;
        arg = s.slice(i, j); i = j;
      } else { arg = s[i]; i++; }
      addRuns(parse(arg, { ...fmt, sup: c === "^", sub: c === "_" }));
      continue;
    }
    if (c === '"' && !fmt.math) { const pv = s[i - 1]; buf += (!pv || /[\s(\[{~]/.test(pv)) ? "“" : "”"; i++; continue; }
    if (c === "`" && s[i + 1] === "`") { buf += "“"; i += 2; continue; }
    if (c === "'" && s[i + 1] === "'") { buf += "”"; i += 2; continue; }
    if (c === "'" && !fmt.math) { buf += "’"; i++; continue; }
    if (c === "~") { buf += " "; i++; continue; }
    if (c === "-" && s[i + 1] === "-") { i += 2; if (s[i] === "-") i++; buf += "–"; continue; }
    if (fmt.math) {
      if (/[A-Za-z]/.test(c)) { flush(); let j = i; while (/[A-Za-z]/.test(s[j] || "")) j++; runs.push({ text: s.slice(i, j), ...fmt, i: true }); i = j; continue; }
      if (c === "-") { buf += "−"; i++; continue; }
      if (c === "=" || c === "<" || c === ">") { buf += " " + c + " "; i++; continue; }
      if (c === "+") { buf += " + "; i++; continue; }
      if (c === " " || c === "\n") { i++; continue; }
    }
    if (c === "\n" || c === "\r" || c === "\t") { buf += " "; i++; continue; }
    buf += c; i++;
  }
  flush();
  return runs;
}

function mergeRuns(runs) {
  const out = [];
  for (const r of runs) {
    const key = (x) => [x.b, x.i, x.sup, x.sub].map((v) => (v ? 1 : 0)).join("");
    const last = out[out.length - 1];
    if (last && key(last) === key(r)) last.text += r.text; else out.push({ ...r });
  }
  // collapse whitespace across run boundaries and trim ends
  let prevSpace = true;
  for (const r of out) {
    r.text = r.text.replace(/ {2,}/g, " ");
    if (prevSpace) r.text = r.text.replace(/^ /, "");
    prevSpace = /\s$/.test(r.text);
  }
  while (out.length && out[out.length - 1].text.replace(/ $/, "") === "") out.pop();
  if (out.length) out[out.length - 1].text = out[out.length - 1].text.replace(/ +$/, "");
  return out.filter((r) => r.text !== "");
}

const esc = (t) => t.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
function runXml(r, sz, forceBold) {
  const rp =
    `<w:rFonts w:ascii="Times New Roman" w:hAnsi="Times New Roman" w:cs="Times New Roman"/>` +
    (r.b || forceBold ? "<w:b/>" : "") + (r.i ? "<w:i/>" : "") + `<w:sz w:val="${sz}"/><w:szCs w:val="${sz}"/>` +
    (r.sup ? `<w:vertAlign w:val="superscript"/>` : r.sub ? `<w:vertAlign w:val="subscript"/>` : "");
  return `<w:r><w:rPr>${rp}</w:rPr><w:t xml:space="preserve">${esc(r.text)}</w:t></w:r>`;
}
const inline = (s, sz, bold) => mergeRuns(parse(s, {})).map((r) => runXml(r, sz, bold)).join("");
const plain = (s) => mergeRuns(parse(s, {})).map((r) => r.text).join("");

// ---------- table parsing ----------
function between(s, startTok) {
  const i = s.indexOf(startTok);
  if (i < 0) return null;
  const j = s.indexOf("{", i);
  const [g, k] = readGroup(s, j);
  return [g, k, i];
}

function splitTop(s, mode) {
  const parts = []; let d = 0, cur = "", i = 0;
  while (i < s.length) {
    const c = s[i];
    if (c === "\\") {
      const n = s[i + 1];
      if (n === "\\" && d === 0 && mode === "row") {
        parts.push(cur); cur = ""; i += 2;
        if (s[i] === "[") { const e = s.indexOf("]", i); i = e + 1; }
        continue;
      }
      cur += c + (n || ""); i += 2; continue;
    }
    if (c === "{") d++;
    if (c === "}") d--;
    if (c === "&" && d === 0 && mode === "cell") { parts.push(cur); cur = ""; i++; continue; }
    cur += c; i++;
  }
  parts.push(cur);
  return parts;
}

function parseTabular(tex) {
  const bt = tex.indexOf("\\begin{tabular}");
  const [spec, afterSpec] = readGroup(tex, tex.indexOf("{", bt + 15));
  const et = tex.indexOf("\\end{tabular}");
  const body = tex.slice(afterSpec, et).replace(/^[ \t]*%.*$/gm, "");
  const cleanSpec = spec.replace(/@\{[^}]*\}/g, "");
  const cols = [...cleanSpec.matchAll(/[lrc]|p\{([^}]*)\}/g)].map((m) => ({ align: m[0][0] === "p" ? "l" : m[0], cm: m[1] ? parseFloat(m[1]) : null }));
  const rows = [];
  let pendingTop = null;
  for (let raw of splitTop(body, "row")) {
    let t = raw.trim();
    let top = null, bottomForPrev = null;
    for (;;) {
      const m = t.match(/^\\(toprule|midrule|bottomrule)\s*/);
      if (!m) break;
      if (m[1] === "toprule") top = "heavy"; else if (m[1] === "midrule") top = "light"; else bottomForPrev = "heavy";
      t = t.slice(m[0].length);
    }
    if (t === "") { if (bottomForPrev && rows.length) rows[rows.length - 1].bottom = "heavy"; if (top) pendingTop = top; continue; }
    const cells = splitTop(t, "cell").map((c) => c.trim());
    rows.push({ cells, top: top || pendingTop, bottom: null });
    pendingTop = null;
  }
  return { cols, rows };
}

function emitTable(tex, label) {
  const sizeSmall = /\\small\b/.test(tex.split("\\begin{tabular}")[0]);
  const sz = sizeSmall ? 18 : 16;
  const { cols, rows } = parseTabular(tex);
  const nC = cols.length;
  // grid
  const USABLE = 9603;
  // build cell model
  const model = rows.map((r) => {
    const out = []; let c = 0;
    for (const raw of r.cells) {
      let span = 1, align = cols[c] ? cols[c].align : "l", text = raw, rowspan = 1;
      let m = text.match(/^\\multicolumn/);
      if (m) {
        const [a1, k1] = readGroup(text, text.indexOf("{", 12));
        const [a2, k2] = readGroup(text, text.indexOf("{", k1));
        const [a3] = readGroup(text, text.indexOf("{", k2));
        span = +a1;
        const sp = a2.replace(/@\{[^}]*\}/g, "").replace(/p\{[^}]*\}/g, "l");
        align = (sp.match(/[lrc]/) || ["l"])[0];
        text = a3;
      }
      m = text.match(/^\\multirow\{(\d+)\}\{[^}]*\}/);
      if (m) { rowspan = +m[1]; const j = text.indexOf("{", m[0].length - 1 + 0); const [g] = readGroup(text, text.indexOf("{", m[0].length)); text = g; }
      out.push({ c, span, align, text, rowspan, vm: null });
      c += span;
    }
    return { cells: out, top: r.top, bottom: r.bottom };
  });
  // vertical merges
  model.forEach((r, ri) => r.cells.forEach((cell) => {
    if (cell.rowspan > 1) {
      cell.vm = "restart";
      for (let k = 1; k < cell.rowspan; k++) { const cc = model[ri + k].cells.find((x) => x.c === cell.c); if (cc) cc.vm = "cont"; }
    }
  }));
  // column widths
  const maxLen = new Array(nC).fill(0);
  model.forEach((r) => r.cells.forEach((cell) => { if (cell.span === 1 && !cell.vm) maxLen[cell.c] = Math.max(maxLen[cell.c], plain(cell.text).length); }));
  const longestWord = new Array(nC).fill(0);
  model.forEach((r) => r.cells.forEach((cell) => { if (cell.span === 1 && cell.vm !== "cont") plain(cell.text).split(/\s+/).forEach((w) => { longestWord[cell.c] = Math.max(longestWord[cell.c], w.length); }); }));
  let widths = cols.map((c, k) => (c.cm ? Math.max(Math.round(c.cm * 567), longestWord[k] * (sz >= 18 ? 105 : 95) + 180) : Math.max(650, Math.min(5200, Math.round(maxLen[k] * (sz >= 18 ? 100 : 90) + 200)))));
  const sum = widths.reduce((a, b) => a + b, 0);
  if (sum > USABLE) widths = widths.map((w) => Math.floor((w * USABLE) / sum));
  const total = widths.reduce((a, b) => a + b, 0);
  const heavy = `<w:top w:val="single" w:sz="12" w:space="0" w:color="000000"/>`;
  let xml = `<w:tbl><w:tblPr><w:tblW w:w="${total}" w:type="dxa"/><w:jc w:val="center"/><w:tblLayout w:type="fixed"/><w:tblCellMar><w:left w:w="70" w:type="dxa"/><w:right w:w="70" w:type="dxa"/></w:tblCellMar></w:tblPr><w:tblGrid>${widths.map((w) => `<w:gridCol w:w="${w}"/>`).join("")}</w:tblGrid>`;
  model.forEach((r, ri) => {
    xml += `<w:tr><w:trPr><w:cantSplit/></w:trPr>`;
    r.cells.forEach((cell) => {
      let w = 0; for (let k = cell.c; k < cell.c + cell.span; k++) w += widths[k] || 0;
      let b = "";
      if (r.top) b += `<w:top w:val="single" w:sz="${r.top === "heavy" ? 12 : 6}" w:space="0" w:color="000000"/>`;
      if (r.bottom) b += `<w:bottom w:val="single" w:sz="12" w:space="0" w:color="000000"/>`;
      const jc = cell.align === "r" ? "right" : cell.align === "c" ? "center" : "left";
      const body = cell.vm === "cont" ? "" : inline(cell.text, sz);
      xml += `<w:tc><w:tcPr><w:tcW w:w="${w}" w:type="dxa"/>${cell.span > 1 ? `<w:gridSpan w:val="${cell.span}"/>` : ""}${cell.vm ? `<w:vMerge${cell.vm === "restart" ? ` w:val="restart"` : ""}/>` : ""}${b ? `<w:tcBorders>${b}</w:tcBorders>` : ""}</w:tcPr><w:p><w:pPr><w:spacing w:before="24" w:after="24" w:line="240" w:lineRule="auto"/><w:ind w:left="0" w:right="0" w:firstLine="0"/><w:jc w:val="${jc}"/></w:pPr>${body}</w:p></w:tc>`;
    });
    xml += `</w:tr>`;
  });
  xml += `</w:tbl>`;
  return xml;
}

function para(inner, opts = {}) {
  return `<w:p><w:pPr>${opts.keepNext ? "<w:keepNext/>" : ""}<w:spacing w:before="${opts.before ?? 60}" w:after="${opts.after ?? 100}" w:line="240" w:lineRule="auto"/><w:ind w:left="0" w:right="0" w:firstLine="0"/><w:jc w:val="${opts.jc || "both"}"/></w:pPr>${inner}</w:p>`;
}

function buildBlock(k, labelText) {
  const tex = fs.readFileSync(`_work/tbl_${k}.tex`, "utf8").replace(/\r\n/g, "\n");
  const ci = tex.indexOf("\\caption");
  const [cap] = readGroup(tex, tex.indexOf("{", ci));
  const label = `Table ${labelText}:`;
  const capSz = 18;
  const capXml = para(runXml({ text: label + " " , b: true }, capSz) + inline(cap, capSz), { keepNext: true, before: 160, after: 80 });
  const tab = emitTable(tex);
  const after = tex.slice(tex.indexOf("\\end{tabular}") + 13, tex.lastIndexOf("\\end{table}"));
  const noteSrc = after.replace(/\\vspace\{[^}]*\}/g, "").replace(/\\footnotesize/g, "").trim();
  const notes = noteSrc ? noteSrc.split(/\n\s*\n/).filter((p) => p.trim()).map((p) => para(inline(p.trim(), 16), { before: 60, after: 100 })).join("") : "";
  const spacer = notes ? "" : para("", { before: 0, after: 60 });
  return capXml + tab + notes + spacer;
}

// ---------- assemble ----------
const { items, body } = M;
const textOf = (k) => M.txt(body.slice(items[k].s, items[k].e));
const regions = [
  [233, 242, 2, "2"], [243, 245, 3, "3"], [246, 247, 4, "4"], [248, 249, 5, "5"],
  [250, 252, 6, "B.1"], [253, 260, 7, "C.1"], [261, 263, 8, "D.1"], [264, 273, 9, "E.1"],
];
const expect = { 233: /^Table 2:/, 243: /^Table 3:/, 246: /^Table 4:/, 248: /^Table 5:/, 250: /^Table B\.1:/, 253: /^Table C\.1:/, 261: /^Table D\.1:/, 264: /^Table E\.1:/, 51: /^Table 1:/ };
for (const k in expect) if (!expect[k].test(textOf(+k))) throw new Error("region start mismatch at item " + k + ": " + textOf(+k).slice(0, 40));

// Table 1: merge broken sentence (item 50 + 57) and place the table after it
const p50 = body.slice(items[50].s, items[50].e);
let p57 = body.slice(items[57].s, items[57].e);
p57 = p57.replace(/^<w:p[ >][^]*?(?=<w:r[ >]|<w:proofErr|<w:bookmark)/, (m) => (m.includes("</w:pPr>") ? "" : m));
if (p57.startsWith("<w:p")) throw new Error("could not strip item 57 opening");
const merged = p50.replace(/<\/w:p>$/, "") + `<w:r><w:t xml:space="preserve"> </w:t></w:r>` + p57;

// ---------- equations as native Word math (OMML) ----------
const MF = `<w:rPr><w:rFonts w:ascii="Cambria Math" w:hAnsi="Cambria Math"/><w:sz w:val="24"/><w:szCs w:val="24"/></w:rPr>`;
const MFs = `<w:rPr><w:rFonts w:ascii="Times New Roman" w:hAnsi="Times New Roman"/><w:sz w:val="20"/><w:szCs w:val="20"/></w:rPr>`;
const mr = (t) => `<m:r>${MF}<m:t xml:space="preserve">${esc(t)}</m:t></m:r>`;
const mp = (t) => `<m:r><m:rPr><m:sty m:val="p"/></m:rPr>${MF}<m:t xml:space="preserve">${esc(t)}</m:t></m:r>`;
const ml = (t) => `<m:r><m:rPr><m:nor/></m:rPr>${MFs}<m:t xml:space="preserve">${esc(t)}</m:t></m:r>`;
const msub = (b, s) => `<m:sSub><m:e>${b}</m:e><m:sub>${s}</m:sub></m:sSub>`;
const msup = (b, s) => `<m:sSup><m:e>${b}</m:e><m:sup>${s}</m:sup></m:sSup>`;
const mfrac = (n, d) => `<m:f><m:num>${n}</m:num><m:den>${d}</m:den></m:f>`;
const munder = (content, label) => `<m:limLow><m:e><m:groupChr><m:groupChrPr><m:chr m:val="⏟"/><m:pos m:val="bot"/><m:vertJc m:val="top"/></m:groupChrPr><m:e>${content}</m:e></m:groupChr></m:e><m:lim>${ml(label)}</m:lim></m:limLow>`;
const denom = mp("1−") + mr("ρ") + mp("/(1+") + mr("r") + mp(")");
const eqPara = (math, num) => `<w:p><w:pPr><w:keepLines/><w:tabs><w:tab w:val="center" w:pos="4700"/><w:tab w:val="right" w:pos="9400"/></w:tabs><w:spacing w:before="100" w:after="100" w:line="240" w:lineRule="auto"/><w:ind w:left="0" w:right="0" w:firstLine="0"/><w:jc w:val="left"/></w:pPr><w:r><w:tab/></w:r><m:oMath>${math}</m:oMath>${num ? `<w:r><w:tab/><w:t>${num}</w:t></w:r>` : ""}</w:p>`;
const eq1 = eqPara(
  munder(mfrac(msub(mr("μ"), mr("P")) + mr("Q"), denom), "PV of production margin") + mp(" − ") + mr("I") + mp(" > ") +
  munder(mr("Ω") + mp("(") + mr("σ") + mp(", ") + mr("ρ") + mp(")"), "option value of waiting") + mp(" + ") + msub(mr("V"), mr("T")), "(1)");
const fArgs = mr("f") + mp("(") + mr("ρ") + mp(", ") + msup(mr("σ"), mp("−1")) + mp(", ") + msup(mr("I"), mp("−1")) + mp(")");
const hArg = mr("h") + mp("(") + ml("transformation required") + mp(")");
const gArg = mr("g") + mp("(") + ml("financial depth, exit, private/state mix") + mp(")");
const eq2a = eqPara(mr("R") + mp(" = ") + munder(fArgs, "irreversibility") + mp(" × ") + munder(hArg, "market access"), "(2)");
const eq2b = eqPara(mp("× ") + munder(gArg, "institutions"), "");
const vtFrac = `<m:oMath>${msub(mr("V"), mr("T"))}${mp(" = ")}${mfrac(msub(mr("μ"), mr("T")) + mr("Q"), denom)}</m:oMath>`;
let p24 = body.slice(items[24].s, items[24].e);
const dIdx = p24.indexOf("<w:drawing>");
if (dIdx < 0) throw new Error("no drawing in item 24");
const rStart = p24.lastIndexOf("<w:r>", dIdx);
const rEnd = p24.indexOf("</w:r>", dIdx) + 6;
if (p24.slice(rStart, dIdx).includes("</w:r>")) throw new Error("run boundary mismatch in item 24");
p24 = p24.slice(0, rStart) + vtFrac + p24.slice(rEnd);
if (!/^Writing/.test(textOf(35).slice(-7))) { /* informational only */ }
if (!/^\)$/.test(textOf(36)) || !/institutions/.test(textOf(39))) throw new Error("equation 2 items mismatch");
if (!/option value of waiting/.test(textOf(27))) throw new Error("equation 1 items mismatch");

const repl = [];
repl.push({ a: 24, b: 24, xml: p24 });
repl.push({ a: 26, b: 27, xml: eq1 });
repl.push({ a: 36, b: 39, xml: eq2a + eq2b });

// ---------- footnote 1: make it a real footnote, rebuild the split paragraph ----------
const texAll = fs.readFileSync("corridor_eer_blind.tex", "utf8").replace(/\r\n/g, "\n");
const fi = texAll.indexOf("\\footnote{");
const [fnTex] = readGroup(texAll, texAll.indexOf("{", fi));
const runPlain = (r) => {
  const rp = (r.b ? "<w:b/>" : "") + (r.i ? "<w:i/>" : "") + (r.sup ? `<w:vertAlign w:val="superscript"/>` : r.sub ? `<w:vertAlign w:val="subscript"/>` : "");
  return `<w:r>${rp ? `<w:rPr>${rp}</w:rPr>` : ""}<w:t xml:space="preserve">${esc(r.text)}</w:t></w:r>`;
};
const fnRuns = mergeRuns(parse(fnTex, {})).map(runPlain).join("");
const fnXml = `<w:footnote w:id="2"><w:p><w:pPr><w:pStyle w:val="footnotedescription"/></w:pPr><w:r><w:rPr><w:rStyle w:val="footnotemark"/></w:rPr><w:footnoteRef/></w:r><w:r><w:t xml:space="preserve"> </w:t></w:r>${fnRuns}</w:p></w:footnote>`;
let fnPart = fs.readFileSync("_work/footnotes.xml", "utf8");
if (!fnPart.includes('w:id="2"')) fnPart = fnPart.replace("</w:footnotes>", fnXml + "</w:footnotes>");
fs.writeFileSync("_work/footnotes_new.xml", fnPart);
let p74 = body.slice(items[74].s, items[74].e);
const mark = `<w:r><w:rPr><w:vertAlign w:val="superscript"/></w:rPr><w:t xml:space="preserve">1 </w:t></w:r>`;
if (!p74.includes(mark)) throw new Error("footnote-1 marker run not found in item 74");
p74 = p74.replace(mark, `<w:r><w:rPr><w:vertAlign w:val="superscript"/></w:rPr><w:footnoteReference w:id="2"/></w:r><w:r><w:t xml:space="preserve"> </w:t></w:r>`);
repl.push({ a: 74, b: 74, xml: p74 });
if (!/The first$/.test(textOf(76)) || !/^is the weight ratio/.test(textOf(82))) throw new Error("items 76/82 mismatch");
let p82 = body.slice(items[82].s, items[82].e);
p82 = p82.replace('<w:ind w:left="-15" w:right="228" w:firstLine="0"/>', '<w:ind w:left="-15" w:right="228"/>');
p82 = p82.replace("</w:pPr>", `</w:pPr><w:r><w:t xml:space="preserve">Two features cut against domestic transformation, though neither is decisive. The first </w:t></w:r>`);
repl.push({ a: 76, b: 82, xml: p82 });
repl.push({ a: 50, b: 57, xml: merged + buildBlock(1, "1") });
for (const [a, b, k, lab] of regions) repl.push({ a, b, xml: buildBlock(k, lab) });
repl.sort((x, y) => x.a - y.a);
let out = "", pos = 0;
for (const r of repl) { out += body.slice(pos, items[r.a].s) + r.xml; pos = items[r.b].e; }
out += body.slice(pos);
const x = M.x;
const nx = x.slice(0, M.bodyStart) + out + x.slice(M.bodyEnd);
fs.writeFileSync("_work/document_new.xml", nx);
console.log("written", nx.length, "warnings:", [...warnings]);
