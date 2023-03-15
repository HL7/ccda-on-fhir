import fs from 'fs'
import pretty from 'pretty-data'
const pd = pretty.pd;
import chalk from 'chalk'

let fhir_schema = JSON.parse(fs.readFileSync('./fhir.schema.json', 'utf-8'));

let main_directory = fs.readdirSync('../Raw_Output');

if (!fs.existsSync('../Reformatted_Output')) fs.mkdirSync('../Reformatted_Output');

const reformat_json = function (filepath) {
  if (filepath.slice(-4).toLowerCase() !== 'json' ) {
    console.log(chalk.yellow(`skipping file which is not JSON ${filepath}`));
  }
  else {
    let oldResource = null;
    try {
      oldResource =  JSON.parse(fs.readFileSync(filepath, 'utf-8'));
    }
    catch (e) {
      console.log(`JSON parsing issue ${e}`);
    }
    let newResource = {};
    if (oldResource && oldResource.fullUrl) newResource.fullUrl = oldResource.fullUrl;
    if (oldResource && oldResource.request) newResource.request = oldResource.request;
    newResource.resource = {};
    let resourceSchema = null;
    if (oldResource && oldResource.resource && oldResource.resource.resourceType) resourceSchema = fhir_schema.definitions[oldResource.resource.resourceType];
    if (resourceSchema && resourceSchema.properties) {
      for (let key in resourceSchema.properties) {
        if (resourceSchema.properties.hasOwnProperty(key)) {
          if (oldResource.resource[key]) {
            newResource.resource[key] = oldResource.resource[key] 
          }
        }
      }
      console.log(chalk.green(`writing Reformatted_Output resource ${filepath.replace('../Raw_Output', '../Reformatted_Output')}`));
      fs.writeFileSync(filepath.replace('../Raw_Output', '../Reformatted_Output'), pd.json(newResource));
    }
    else if (oldResource === null) console.log(chalk.red(`Error due to JSON parsing error ${filepath}`));
    else console.log(chalk.red(`Error due to non-specified resource on file ${filepath}`));
  }
}

const recurse_directories = function (filepath) {
  if (!fs.existsSync(`${filepath.replace('../Raw_Output', '../Reformatted_Output')}`)) {
    console.log(`mkdir ${filepath.replace('../Raw_Output', '../Reformatted_Output')}`);
    fs.mkdirSync(`${filepath.replace('../Raw_Output', '../Reformatted_Output')}`);
  }
  let files = fs.readdirSync(filepath);
  for (let i = 0; i < files.length; i++) {
    fs.stat(`${filepath}/${files[i]}`, (err, stats) => {
      if (err) throw err;
      if (stats.isDirectory()) {
        recurse_directories(`${filepath}/${files[i]}`)
      }
      else {
        reformat_json(`${filepath}/${files[i]}`);
      }; 
    }) 
  }
}

for (let i = 0; i < main_directory.length; i++) {
  recurse_directories(`../Raw_Output/${main_directory[i]}`);
}