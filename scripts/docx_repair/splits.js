const fs = require("fs");
const x = fs.readFileSync(process.argv[2] || "_work/document_new.xml", "utf8");
const bodyStart = x.indexOf("<w:body>") + 8, bodyEnd = x.lastIndexOf("</w:body>");
const body = x.slice(bodyStart, bodyEnd);
function split(body) {
  let i = 0; const items = [];
  while (i < body.length) {
    if (body.startsWith("<w:p ", i) || body.startsWith("<w:p>", i)) { const e = body.indexOf("</w:p>", i) + 6; items.push({ t: "p", s: i, e }); i = e; }
    else if (body.startsWith("<w:tbl>", i)) { let d = 0, j = i; const re = /<w:tbl>|<\/w:tbl>/g; re.lastIndex = i; let m; while ((m = re.exec(body))) { if (m[0] === "<w:tbl>") d++; else { d--; if (d === 0) { j = m.index + 8; break; } } } items.push({ t: "tbl", s: i, e: j }); i = j; }
    else if (body.startsWith("<w:sectPr", i)) { const e = body.indexOf("</w:sectPr>", i) + 11; items.push({ t: "sect", s: i, e }); i = e; }
    else { const m = body.indexOf("<", i + 1); items.push({ t: "other", s: i, e: m < 0 ? body.length : m }); i = m < 0 ? body.length : m; }
  }
  return items;
}
const items = split(body);
const txt = (k) => body.slice(items[k].s, items[k].e).replace(/<w:tab\/>/g, " ").replace(/<[^>]*>/g, "").replace(/&amp;/g, "&").replace(/&lt;/g, "<").replace(/&gt;/g, ">").replace(/\s+/g, " ").trim();
const isDraw = (k) => items[k].t === "p" && /<w:drawing>/.test(body.slice(items[k].s, items[k].e)) && txt(k).length < 3;
module.exports = { x, bodyStart, bodyEnd, body, items, txt, isDraw, split };
if (require.main === module) {
  const out = [];
  for (let k = 0; k < items.length - 1; k++) {
    if (items[k].t !== "p") continue;
    const t = txt(k);
    if (t.length < 25) continue;
    if (/[.!?:;)\]”"’']$/.test(t) && !/\b(e\.g|i\.e|vs|al|et|no|approx)\.$/.test(t)) continue;
    if (/^\d+\s*[A-Z]/.test(t) && t.length < 80) continue; // headings
    // find next text paragraph skipping drawings, figure captions and tables
    let n = k + 1;
    while (n < items.length && (items[n].t !== "p" || isDraw(n) || /^Figure \d+:/.test(txt(n)))) n++;
    if (n >= items.length || items[n].t !== "p") continue;
    const nt = txt(n);
    out.push(`${k}->${n} (${n - k - 1} between)  ...${t.slice(-60)}  ||  ${nt.slice(0, 60)}...`);
  }
  console.log(out.length + " candidates\n" + out.join("\n"));
}
