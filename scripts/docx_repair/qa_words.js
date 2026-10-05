const fs = require("fs");
const tex = fs.readFileSync("corridor_eer_blind.tex", "utf8").replace(/\r\n/g, "\n");
const bib = fs.readFileSync("corridor.bib", "utf8");
// crude prose extraction from tex: drop comments, math, commands
let t = tex.replace(/%.*$/gm, " ").replace(/\$[^$]*\$/g, " ").replace(/\\(cite[pt]|ref|eqref|label)\{[^}]*\}/g, " ").replace(/\\[a-zA-Z]+\*?/g, " ").replace(/[{}\\^_~]/g, " ");
t = t.replace(/\\"/g, "").replace(/---/g, " ").replace(/--/g, " ");
const words = (t + " " + bib.replace(/[{}\\]/g, " ")).toLowerCase().match(/[a-zà-ÿ0-9]+(?:-[a-zà-ÿ0-9]+)*/g) || [];
const vocab = new Set(words);
const hy = new Set(words.filter((w) => w.includes("-") && !/^\d/.test(w) && w.length >= 6));
const xml = fs.readFileSync(process.argv[2], "utf8");
const dtxt = xml.replace(/<\/w:p>/g, "\n").replace(/<[^>]*>/g, "").replace(/&amp;/g, "&").replace(/&apos;/g, "'").toLowerCase();
const dtoks = dtxt.match(/[a-zà-ÿ0-9]+(?:-[a-zà-ÿ0-9]+)*/g) || [];
const dset = new Map(); dtoks.forEach((w) => dset.set(w, (dset.get(w) || 0) + 1));
console.log("--- lost hyphens (joined form in docx, hyphenated in tex)");
const hyFix = [];
for (const h of hy) {
  const j = h.replace(/-/g, "");
  if (!vocab.has(j) && dset.has(j)) { console.log(j, "->", h, dset.get(j)); hyFix.push([j, h]); }
}
fs.writeFileSync("_work/hy_fix.json", JSON.stringify(hyFix));
console.log("--- possible lost spaces (docx token not in vocab but splits into two vocab words)");
const sp = [];
for (const [w, c] of dset) {
  if (vocab.has(w) || w.length < 6 || w.includes("-") || /\d/.test(w)) continue;
  for (let k = 2; k <= w.length - 2; k++) {
    const a = w.slice(0, k), b = w.slice(k);
    if (vocab.has(a) && vocab.has(b) && a.length >= 2 && b.length >= 3) { sp.push([w, a, b, c]); break; }
  }
}
console.log(sp.map((s) => s.join(" | ")).join("\n"));
fs.writeFileSync("_work/sp_fix.json", JSON.stringify(sp));
