const fs=require('fs');
const x=fs.readFileSync('_work/document.xml','utf8');
const bodyStart=x.indexOf('<w:body>')+8;
const bodyEnd=x.lastIndexOf('</w:body>');
const body=x.slice(bodyStart, bodyEnd);
let i=0, items=[];
while(i<body.length){
  if(body.startsWith('<w:p ',i)||body.startsWith('<w:p>',i)){const e=body.indexOf('</w:p>',i)+6; items.push({t:'p',s:i,e}); i=e;}
  else if(body.startsWith('<w:tbl>',i)){let depth=0,j=i; const re=/<w:tbl>|<\/w:tbl>/g; re.lastIndex=i; let m; while((m=re.exec(body))){ if(m[0]==='<w:tbl>')depth++; else {depth--; if(depth===0){j=m.index+8;break;}}} items.push({t:'tbl',s:i,e:j}); i=j;}
  else if(body.startsWith('<w:sectPr',i)){const e=body.indexOf('</w:sectPr>',i)+11; items.push({t:'sect',s:i,e}); i=e;}
  else {const m=body.indexOf('<',i+1); items.push({t:'other',s:i,e:m<0?body.length:m}); i=m<0?body.length:m;}
}
module.exports={x,bodyStart,bodyEnd,body,items,txt:s=>s.replace(/<[^>]*>/g,'').replace(/\s+/g,' ').trim()};
if(require.main===module){
  const [a,b]=process.argv.slice(2).map(Number);
  items.slice(a,b+1).forEach((it,k)=>{const s=body.slice(it.s,it.e); console.log(a+k,it.t,s.length, module.exports.txt(s).slice(0,110), s.includes('<w:drawing')?'[drawing]':'', s.includes('w:br w:type="page"')?'[pagebreak]':'');});
}
