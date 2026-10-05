const fs = require("fs");
const S = require("./splits.js");
const { items, body, txt, x, bodyStart, bodyEnd } = S;
const std = `<w:pPr><w:spacing w:after="183"/><w:ind w:left="-15" w:right="228"/></w:pPr>`;
let out = "", pos = 0, n = 0;
items.forEach((it, k) => {
  if (it.t !== "p") return;
  let p = body.slice(it.s, it.e);
  const t = txt(k);
  const pPr = (p.match(/<w:pPr>[\s\S]*?<\/w:pPr>/) || [""])[0];
  if (t.length > 120 && /<w:jc w:val="right"\/>/.test(pPr) && !/Figure \d+:|^Table/.test(t)) {
    out += body.slice(pos, it.s) + p.replace(/<w:pPr>[\s\S]*?<\/w:pPr>/, std);
    pos = it.e; n++;
  }
});
out += body.slice(pos);
fs.writeFileSync("_work/document_new.xml", x.slice(0, bodyStart) + out + x.slice(bodyEnd));
console.log("normalised", n, "right-aligned body paragraphs");
