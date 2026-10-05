const fs = require("fs");
const { execSync } = require("child_process");
const norm = (s) =>
  s.replace(/ /g, " ").replace(/[‘’]/g, "'").replace(/[“”]/g, '"')
    .replace(/ﬁ/g, "fi").replace(/ﬂ/g, "fl").replace(/ﬀ/g, "ff").replace(/ﬃ/g, "ffi").replace(/ﬄ/g, "ffl")
    .replace(/[−–—]/g, "-").replace(/-\s*\n\s*/g, "").replace(/ | | /g, " ");
const tok = (s) => norm(s).toLowerCase().replace(/[^a-z0-9$%.,;:()\/-]+/g, " ").split(/\s+/).filter(Boolean);
let a = fs.readFileSync(process.argv[2], "utf8"), b = fs.readFileSync(process.argv[3], "utf8");
const dropNums = (s) => s.split("\n").filter((l) => !/^\s*\d{1,2}\s*$/.test(l)).join("\n");
// keep only alphabetic words >= 3 letters (ignore numbers/math noise) for a content-level comparison
const words = (s) => tok(dropNums(s)).filter((w) => /^[a-z]{3,}[.,;:)]*$/.test(w)).map((w) => w.replace(/[.,;:)]+$/, ""));
const A = words(a), B = words(b);
fs.writeFileSync("_work/qa2_a.txt", A.join("\n") + "\n");
fs.writeFileSync("_work/qa2_b.txt", B.join("\n") + "\n");
let out = "";
try { out = execSync("git diff --no-index --minimal -U0 _work/qa2_b.txt _work/qa2_a.txt", { encoding: "utf8", maxBuffer: 1 << 28 }); } catch (e) { out = e.stdout || ""; }
const hunks = []; let cur = null;
for (const l of out.split("\n")) {
  const m = l.match(/^@@ -(\d+)(?:,(\d+))? \+(\d+)(?:,(\d+))? @@/);
  if (m) { cur = { bs: +m[1], del: [], add: [] }; hunks.push(cur); }
  else if (cur && l.startsWith("-") && !l.startsWith("---")) cur.del.push(l.slice(1));
  else if (cur && l.startsWith("+") && !l.startsWith("+++")) cur.add.push(l.slice(1));
}
console.log("word tokens: word", A.length, " latex-pdf", B.length, " hunks", hunks.length);
hunks.forEach((h, i) => console.log("[" + (i + 1) + "] ..." + B.slice(Math.max(0, h.bs - 6), h.bs - 1).join(" ") + " || LATEX-ONLY: " + h.del.join(" ").slice(0, 160) + " || WORD-ONLY: " + h.add.join(" ").slice(0, 160)));
