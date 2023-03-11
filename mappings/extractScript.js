const fs = require('fs');

let doFC = true;
let doCF = false;

typestoMap = ['source value', 'transform'];
backbones = ['[backbone]', 'backbone'];

if (doFC) {
  let files = fs.readdirSync('./FC');
  for (let i = 0; i < files.length; i++) {
    let filename = files[i].replace('.csv', '.md');
    let data = fs.readFileSync(`./FC/${files[i]}`, 'utf-8');
    let lines = data.split('\r\n');
    let write = '|FHIR|CDA|Transform Steps|\r\n|:----|:----|:----|\r\n';
    let lastBackbone = '';
    for (let j = 0; j < lines.length; j++) {
      let pieces = lines[j].split(',');
      if (typestoMap.includes(pieces[2])) {
        let newLine = '';
        if (lastBackbone) {
          newLine = `|[${lastBackbone}]${pieces[0]}|${pieces[4]}|${pieces[8]}|\r\n`;
          lastBackbone = '';
        }
        else {
          newLine = `|${pieces[0]}|${pieces[4]}|${pieces[8]}|\r\n`;
        }
        write += newLine;
      } 
      else if (backbones.includes(pieces[2])) {
        lastBackbone = pieces[0];
      }
    }
    console.log(write);
  }  
}

if (doCF) {

}

