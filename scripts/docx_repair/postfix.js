const fs = require("fs");
const tex = fs.readFileSync("corridor_eer_blind.tex", "utf8").replace(/\r\n/g, "\n").replace(/%.*$/gm, " ").replace(/~/g, " ").replace(/\\"/g, "");
const flat = tex.replace(/\s+/g, " ");
const hy = JSON.parse(fs.readFileSync("_work/hy_fix.json", "utf8")).map((x) => x[0]);
const sp = JSON.parse(fs.readFileSync("_work/sp_fix.json", "utf8")).map((x) => x[0]);
const cands = [...new Set([...hy, ...sp])];
let xml = fs.readFileSync("_work/document_new.xml", "utf8");
const esc = (s) => s.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
const applied = [], skipped = [];
for (const j of cands) {
  let form = null;
  for (let k = 2; k <= j.length - 2 && !form; k++) {
    const a = j.slice(0, k), b = j.slice(k);
    // allow a compound of three parts as well by testing regex with optional separators between all chars at split points
    const re = new RegExp("\\b" + esc(a) + "([- ])" + esc(b) + "\\b", "i");
    const m = flat.match(re);
    if (m) form = { k, sep: m[1] };
  }
  if (!form) {
    // three-part compounds: try two separators
    for (let k1 = 2; k1 < j.length - 3 && !form; k1++) for (let k2 = k1 + 2; k2 <= j.length - 2 && !form; k2++) {
      const re = new RegExp("\\b" + esc(j.slice(0, k1)) + "([- ])" + esc(j.slice(k1, k2)) + "([- ])" + esc(j.slice(k2)) + "\\b", "i");
      const m = flat.match(re);
      if (m) form = { k: k1, k2, sep: m[1], sep2: m[2] };
    }
  }
  if (!form) { skipped.push(j); continue; }
  const rx = new RegExp("(>[^<]*?)\\b(" + j.split("").map((c) => esc(c)).join("") + ")\\b", "gi");
  let n = 0;
  xml = xml.replace(new RegExp("(<w:t[^>]*>)([^<]*)(</w:t>)", "g"), (m0, o, text, c) => {
    const t2 = text.replace(new RegExp("\\b" + esc(j) + "\\b", "gi"), (w) => {
      n++;
      let s = w.slice(0, form.k) + form.sep;
      if (form.k2) s += w.slice(form.k, form.k2) + form.sep2 + w.slice(form.k2); else s += w.slice(form.k);
      return s;
    });
    return o + t2 + c;
  });
  applied.push(j + " (" + n + ")");
}
fs.writeFileSync("_work/document_new.xml", xml);
console.log("applied:", applied.join(", "));
console.log("skipped (no tex evidence):", skipped.join(", "));
