const fs = require("fs");
const S = require("./splits.js");
const { items, body, txt, x, bodyStart, bodyEnd } = S;
const endings = [/ so$/, /clus-$/, /v¯TT =$/, / and a$/];
const pairs = [];
for (let k = 0; k < items.length - 1; k++) {
  if (items[k].t !== "p") continue;
  const t = txt(k);
  if (!endings.some((r) => r.test(t))) continue;
  let n = k + 1;
  while (n < items.length && (items[n].t !== "p" || S.isDraw(n) || /^Figure \d+:/.test(txt(n)))) n++;
  const nt = txt(n);
  if (!/^[a-z0-9$]/.test(nt)) { console.log("skip (next not lowercase):", t.slice(-30), "->", nt.slice(0, 30)); continue; }
  pairs.push([k, n]);
}
console.log("merging", pairs.length, "pairs:", pairs.map((p) => p.join("->")).join(", "));
let out = "", pos = 0;
for (const [k, n] of pairs) {
  out += body.slice(pos, items[k].s);
  let pk = body.slice(items[k].s, items[k].e);
  let pn = body.slice(items[n].s, items[n].e);
  pn = pn.replace(/^<w:p[ >][^]*?(?=<w:r[ >]|<w:r>|<m:oMath|<w:proofErr|<w:bookmark)/, (m) => (m.includes("</w:pPr>") || !m.includes("<w:pPr") ? "" : m));
  if (/^<w:p[ >]/.test(pn)) throw new Error("could not strip next paragraph opening");
  const hyphen = /clus-<\/w:t>/.test(pk);
  if (hyphen) pk = pk.replace(/clus-<\/w:t>/, "clus</w:t>");
  const std = `<w:pPr><w:spacing w:after="183"/><w:ind w:left="-15" w:right="228"/></w:pPr>`;
  pk = /<w:pPr>[\s\S]*?<\/w:pPr>/.test(pk) ? pk.replace(/<w:pPr>[\s\S]*?<\/w:pPr>/, std) : pk.replace(/^(<w:p[^>]*>)/, "$1" + std);
  pk = pk.replace(/<\/w:p>$/, "") + (hyphen ? "" : `<w:r><w:t xml:space="preserve"> </w:t></w:r>`) + pn;
  out += pk;
  for (let j = k + 1; j < n; j++) out += body.slice(items[j].s, items[j].e);
  pos = items[n].e;
}
out += body.slice(pos);
fs.writeFileSync("_work/document_new.xml", x.slice(0, bodyStart) + out + x.slice(bodyEnd));
console.log("done");
