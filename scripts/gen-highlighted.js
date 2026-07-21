#!/usr/bin/env node
/* =============================================================================
 * gen-highlighted.js — generate a color-highlighted CDA <-> FHIR example table
 * =============================================================================
 *
 * PURPOSE
 *   Each C-CDA <-> FHIR mapping page in this IG shows a side-by-side example: a
 *   CDA entry on the left, the mapped FHIR resource(s) on the right, with
 *   corresponding values wrapped in <mark class="colorN"> pairs so readers can
 *   see exactly which CDA value became which FHIR value. Historically these
 *   tables were hand-built HTML that drifted from the real example artifacts.
 *   This script generates the table from the canonical sources instead, and at
 *   the same time VERIFIES that the paired values agree — making the
 *   illustration a test of the map.
 *
 * INPUTS
 *   1. argv[2]: a correspondence YAML file (examples-src/correspondence/*.yaml):
 *        selector:   which entry of the master CCD to use
 *                      .section  — LOINC code of the containing <section>
 *                      .entryId  — id/@root of the target clinical statement
 *                      .element  — element name of the clinical statement
 *        resources:  ordered SUSHI instance names rendered as right-hand panes
 *        rows:       one row per highlighted pair:
 *                      .cda       — XPath relative to the selected element
 *                                   (element steps auto-prefixed; see nsify)
 *                      .fhir      — "<InstanceName>.<dotted.path[with][ix]>"
 *                      .transform — declared value relationship (see TRANSFORMS)
 *                      .note      — optional reviewer hint (not rendered)
 *        alternatives: optional illustrative comment blocks rendered inside a
 *                      resource pane (e.g. the medicationCodeableConcept
 *                      alternative to medicationReference). Each has:
 *                        .resource — pane to annotate
 *                        .before   — property name the comment precedes
 *                        .comment  — hand-authored explanatory prose
 *                        .as       — property name shown in the illustration
 *                        .from     — "<Instance>.<path>" whose ACTUAL value is
 *                                    rendered, so the illustration derives from
 *                                    canonical data and cannot drift
 *                    Row order assigns colors: row i -> class "color(10+i)"
 *                    matching the palette in input/images/colors.css.
 *   2. examples-src/myra-jones-ccd.xml  — master CCD (canonical CDA side)
 *   3. fsh-generated/resources/*.json   — SUSHI output (canonical FHIR side);
 *      run `sushi .` before this script
 *   4. examples-src/oid-map.json        — OID -> canonical URI lookup, built
 *      from the hl7.terminology package, plus a manual "overrides" section
 *      that wins over the generated map
 *
 * OUTPUTS
 *   - input/includes/examples/<yamlname>-example.xhtml — the generated table,
 *     pulled into a mapping page via Jekyll {% include %}. Never edit by hand.
 *   - console report: row count and any value-check failures
 *   - exit code: 0 all checks pass; 1 any value mismatch (CI gate);
 *     2 structural error (file/section/entry not found)
 *
 * HIGH-LEVEL FLOW
 *   1. setup    — read YAML, master CCD, SUSHI JSON, OID map
 *   2. locate   — find <section> by LOINC code, then the entry by id/@root
 *   3. evaluate — run each row's XPath against the entry (collect DOM nodes to
 *                 mark) and its dotted path against the JSON (collect path->color)
 *   4. check    — compare each pair under the row's declared transform
 *   5. render   — DOM-aware CDA pretty-print + JSON pretty-print, wrapping
 *                 matched nodes in <mark class="colorN">
 *   6. write + report
 *
 * DESIGN NOTES
 *   - DOM/AST-aware marking, not string search: a value like "1" occurs many
 *     times; we mark the exact attribute/element node the XPath matched and
 *     the exact JSON node the dotted path resolved to.
 *   - Dotted FHIR paths (not full FHIRPath) keep resolution deterministic and
 *     the implementation dependency-light.
 * ========================================================================== */

const fs = require('fs');
const path = require('path');
const yaml = require('js-yaml');
const { DOMParser } = require('@xmldom/xmldom');
const xpath = require('xpath');

/* ----------------------------- CONSTANTS --------------------------------- */

/** Repository root: this script lives in <root>/scripts/. */
const ROOT = path.resolve(__dirname, '..');
/** Master CCD — canonical CDA side of every example. */
const MASTER_CCD = path.join(ROOT, 'examples-src', 'myra-jones-ccd.xml');
/** SUSHI output directory — canonical FHIR side. */
const FSH_GEN = path.join(ROOT, 'fsh-generated', 'resources');
/** Where generated includes land ({% include %}d from pagecontent). */
const OUT_DIR = path.join(ROOT, 'input', 'includes', 'examples');
/** OID -> canonical URI lookup (generated map + manual overrides; overrides win). */
const OID_MAP_FILE = path.join(ROOT, 'examples-src', 'oid-map.json');
/** First color index; row i renders with class "color(FIRST_COLOR + i)". */
const FIRST_COLOR = 10;
/** Namespace prefixes usable inside correspondence XPaths. */
const NS = { v3: 'urn:hl7-org:v3', xsi: 'http://www.w3.org/2001/XMLSchema-instance', sdtc: 'urn:hl7-org:sdtc' };

/* ------------------------- STEP 1: SETUP --------------------------------- */

const corrFile = process.argv[2];
if (!corrFile) { console.error('usage: gen-highlighted.js <correspondence.yaml>'); process.exit(2); }
/** Parsed correspondence file (selector / resources / rows). */
const corr = yaml.load(fs.readFileSync(corrFile, 'utf8'));
/** Basename ("CF-medication") — names the output file. */
const name = path.basename(corrFile).replace(/\.ya?ml$/, '');
/** XPath evaluator bound to the CDA + xsi namespaces. */
const sel = xpath.useNamespaces(NS);
/** OID lookup with overrides applied. */
const oidData = JSON.parse(fs.readFileSync(OID_MAP_FILE, 'utf8'));
const OID2URI = Object.assign({}, oidData.map, oidData.overrides);

/* ------------------- STEP 2: LOCATE THE CDA ENTRY ------------------------ */

const ccd = new DOMParser().parseFromString(fs.readFileSync(MASTER_CCD, 'utf8'), 'text/xml');
let entryEl;
if (corr.selector.headerPath) {
  // Header-based example (e.g. recordTarget/patientRole): path from document root,
  // element steps auto-prefixed like row XPaths. First match wins.
  entryEl = sel('//' + nsifyEarly(corr.selector.headerPath), ccd)[0];
  if (!entryEl) fail(`headerPath ${corr.selector.headerPath} not found in master CCD`);
} else {
  const section = sel(`//v3:section[v3:code/@code="${corr.selector.section}"]`, ccd)[0];
  if (!section) fail(`section ${corr.selector.section} not found in master CCD`);
  // entryId optional: some templates (e.g. Note Activity) may lack <id>; the
  // first matching element in the section is then the canonical entry.
  entryEl = corr.selector.entryId
    ? sel(`.//v3:${corr.selector.element}[v3:id/@root="${corr.selector.entryId}"]`, section)[0]
    : sel(`.//v3:${corr.selector.element}`, section)[0];
  if (!entryEl) fail(`entry ${corr.selector.entryId||'(first '+corr.selector.element+')'} not found in section ${corr.selector.section}`);
}
/** nsifyEarly: nsify() is declared below; tiny forwarder usable before it. */
function nsifyEarly(p) { return nsify(p); }

/* --------------- STEP 3a: EVALUATE THE CDA SIDE OF EACH ROW -------------- */

/**
 * nsify(xpathString)
 * Correspondence XPaths are written prefix-free for readability
 * ("routeCode/@code"). CDA elements live in urn:hl7-org:v3, which XPath 1.0
 * cannot address without a prefix, so every element step is prefixed with
 * "v3:". Attribute steps (@...) and boolean operators are left untouched.
 */
function nsify(p) {
  return p.replace(/(^|\/|\[)(?!@)([A-Za-z_][\w-]*)(?=[\/\[@=\]]|$)/g, (m, pre, el) =>
    ['and', 'or', 'not'].includes(el) ? m : `${pre}v3:${el}`);
}

/**
 * textOf(node)
 * Comparable value of a matched DOM node: the attribute value for attribute
 * nodes, trimmed text content for elements.
 */
function textOf(n) { return (n.nodeType === 2 ? n.value : n.textContent || '').trim(); }

/**
 * marks: DOM node -> [colorIndex...]
 * Populated during row evaluation; consumed by the CDA renderer. A node may
 * carry several colors when multiple rows target it (marks nest).
 */
const marks = new Map();
/** checks: accumulated {row, ok, msg} results, reported at the end. */
const checks = [];

corr.rows.forEach((row, i) => {
  const color = FIRST_COLOR + i;
  const nodes = sel(nsify(row.cda), entryEl);
  if (!nodes.length) {
    checks.push({ row, ok: false, msg: `CDA path matched nothing: ${row.cda}` });
    return;
  }
  nodes.forEach(n => {
    if (!marks.has(n)) marks.set(n, []);
    marks.get(n).push(color);
  });
  row._color = color;             // remembered for the FHIR side + rendering
  row._cdaVal = textOf(nodes[0]); // first match is the compared value
});

/* --------------- STEP 3b: EVALUATE THE FHIR SIDE OF EACH ROW ------------- */

/**
 * findJson(instanceName)
 * SUSHI writes "<ResourceType>-<InstanceName>.json"; the resource type is not
 * recorded in the correspondence file, so match on the "-<name>.json" suffix.
 */
function findJson(rn) {
  const hit = fs.readdirSync(FSH_GEN).find(f => f.endsWith(`-${rn}.json`));
  if (!hit) fail(`no fsh-generated JSON for instance "${rn}" — run sushi first`);
  return path.join(FSH_GEN, hit);
}

/** resources: instanceName -> parsed JSON for every pane listed in the YAML. */
const resources = {};
for (const rn of corr.resources) resources[rn] = JSON.parse(fs.readFileSync(findJson(rn), 'utf8'));

/**
 * resolvePath(obj, dotted)
 * Walk a dotted path with array indices ("dosageInstruction[0].route.coding[0].code")
 * through parsed JSON. Returns undefined if any step is missing. Deterministic
 * by construction — no search semantics.
 */
function resolvePath(obj, dotted) {
  const parts = dotted.match(/[^.\[\]]+|\[\d+\]/g).map(p => p.startsWith('[') ? +p.slice(1, -1) : p);
  let cur = obj;
  for (const p of parts) cur = cur == null ? undefined : cur[p];
  return cur;
}

/**
 * fhirMarks: instanceName -> { dottedPath -> colorIndex }
 * Consumed by the JSON renderer, which tracks the path of each value it emits
 * and wraps the value when that path appears here.
 */
const fhirMarks = {};

/** evaluateFhirSide(): deferred until TRANSFORMS below is initialized. */
function evaluateFhirSide() {
corr.rows.forEach(row => {
  if (row._color === undefined) return;   // CDA side already failed
  const dot = row.fhir.indexOf('.');
  const rn = row.fhir.slice(0, dot);      // instance name
  const p = row.fhir.slice(dot + 1);      // dotted path within it
  if (!resources[rn]) { checks.push({ row, ok: false, msg: `resource ${rn} not in resources: list` }); return; }
  row._fhirVal = resolvePath(resources[rn], p);
  (fhirMarks[rn] = fhirMarks[rn] || {})[p] = row._color;
  checks.push(check(row));
});
}

/* -------- STEP 4: CHECKS — verify each pair under its transform ----------
 * A transform names the expected relationship between the CDA string and the
 * FHIR value; "equal" is the default. To support a new relationship, add an
 * entry here and document it in the correspondence file header.            */

const TRANSFORMS = {
  /** Byte equality after String() coercion of the FHIR value. */
  'equal':         (c, f) => c === String(f),
  /** Equality ignoring internal/edge whitespace (narrative-ish text). */
  'trim':          (c, f) => c.replace(/\s+/g, ' ').trim() === String(f).replace(/\s+/g, ' ').trim(),
  /** Numeric equality ("06" == 6). */
  'number':        (c, f) => Number(c) === Number(f),
  /** CDA id/@root (bare UUID) vs FHIR identifier.value (urn:uuid:...). */
  'uuid-to-urn':   (c, f) => `urn:uuid:${c}` === f,
  /** CDA TS (YYYYMMDD...) vs FHIR date (YYYY-MM-DD): date parts must agree. */
  'cda-date':      (c, f) => c.replace(/^(\d{4})(\d{2})(\d{2}).*$/, '$1-$2-$3') === f,
  /** CDA TS with time+zone vs FHIR dateTime at full precision. */
  'cda-datetime':  (c, f) => cdaDT(c) === f,
  /** CDA repeatNumber (total dispenses) vs FHIR numberOfRepeatsAllowed (refills only). */
  'minus-one':     (c, f) => Number(c) - 1 === Number(f),
  /** Presence of the CDA element implies FHIR boolean true (precondition -> asNeeded). */
  'presence-true': (c, f) => c !== '' && f === true,
  /** Both sides are human display strings for the same code; displays may
   * legitimately differ (CDA keeps source text, FHIR uses terminology-server
   * preferred). Checked only for presence on both sides. */
  'display':       (c, f) => c !== '' && typeof f === 'string' && f !== '',
  /** CDA telecom tel:+1... vs FHIR value without the tel: scheme. */
  'tel-value':     (c, f) => c.replace(/^tel:/, '') === f,
  /** CDA telecom mailto:x vs FHIR value without the mailto: scheme. */
  'mailto-value':  (c, f) => c.replace(/^mailto:/, '') === f,
  /** CDA boolean attribute string vs FHIR boolean. */
  'boolean':       (c, f) => (c === 'true') === f,
  /** CDA id/@root OID vs FHIR identifier.system as urn:oid:<root>. */
  'oid-to-urn':    (c, f) => `urn:oid:${c}` === f,
  /** CDA codeSystem OID vs FHIR system URI via the OID lookup table; OIDs not
   * in the registry fall back to the canonical urn:oid:<oid> form. */
  'oid-to-uri':    (c, f) => (OID2URI[c] !== undefined ? OID2URI[c] : `urn:oid:${c}`) === f,
  /** Source and target codes must be a mapped pair in the named ConceptMap. */
  'conceptmap':    (c, f, arg) => conceptMapOk(c, f, arg),
};

/**
 * check(row)
 * Apply the row's transform ("conceptmap CF-MedicationStatus" -> fn "conceptmap",
 * arg "CF-MedicationStatus") to the captured value pair. Returns {row, ok, msg};
 * msg carries both values so failures are immediately actionable.
 */
function check(row) {
  const parts = (row.transform || 'equal').split(' ');
  const fn = TRANSFORMS[parts[0]];
  const c = String(row._cdaVal == null ? '' : row._cdaVal);
  const ok = fn ? fn(c, row._fhirVal, parts[1]) : false;
  return {
    row, ok,
    msg: ok ? '' : (fn
      ? `${row.cda} = "${c}"  vs  ${row.fhir} = ${JSON.stringify(row._fhirVal)} (${row.transform || 'equal'})`
      : `unknown transform "${parts[0]}" on ${row.cda}`),
  };
}

/**
 * cdaDT(value)
 * CDA timestamp (YYYYMMDDHHMM[SS][+-ZZZZ]) -> FHIR dateTime string
 * (YYYY-MM-DDTHH:MM:SS+-ZZ:ZZ). Returns input unchanged if it doesn't look
 * like a timestamp, so the comparison fails visibly rather than silently.
 */
function cdaDT(v) {
  const m = v.match(/^(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})?([+-]\d{4})?$/);
  if (!m) return v;
  let s = `${m[1]}-${m[2]}-${m[3]}T${m[4]}:${m[5]}:${m[6] || '00'}`;
  if (m[7]) s += `${m[7].slice(0, 3)}:${m[7].slice(3)}`;
  return s;
}

/**
 * conceptMapOk(cdaCode, fhirCode, conceptMapId)
 * True when fsh-generated/resources/ConceptMap-<id>.json contains an element
 * whose code is the CDA value with a target whose code is the FHIR value.
 * This ties examples to the IG's own terminology maps: change a ConceptMap
 * and any now-inconsistent example fails the build.
 */
function conceptMapOk(cdaCode, fhirCode, cmId) {
  const f = path.join(FSH_GEN, `ConceptMap-${cmId}.json`);
  if (!fs.existsSync(f)) return false;
  const cm = JSON.parse(fs.readFileSync(f, 'utf8'));
  for (const g of cm.group || [])
    for (const e of g.element || [])
      if (e.code === cdaCode)
        return (e.target || []).some(t => t.code === String(fhirCode));
  return false;
}

/* ------------------- STEP 5a: RENDER THE CDA PANE ------------------------ */

/** esc(s): minimal XML/HTML escaping for text placed inside the table. */
const esc = s => s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');

/**
 * markWrap(node, renderedText)
 * Wrap rendered text in the <mark class="colorN"> element(s) recorded for its
 * DOM node during evaluation. Multiple colors nest (innermost = first row).
 */
function markWrap(node, text) {
  const colors = marks.get(node);
  if (!colors) return text;
  return colors.reduce((acc, c) => `<mark class="color${c}">${acc}</mark>`, text);
}

/**
 * renderEl(element, indentLevel)
 * Recursive DOM-aware pretty-printer for the CDA entry. Emits the same visual
 * vocabulary as the legacy hand-built examples (span classes "field",
 * "attrib", "value", styled by colors.css), wrapping matched attribute values
 * and element text via markWrap(). Namespace declarations are suppressed;
 * comments and whitespace-only text nodes are dropped.
 */
function renderEl(el, indent) {
  const pad = '  '.repeat(indent);
  // selector.exclude: element names elided from the rendered pane (e.g. the
  // structuredBody in header examples); an ellipsis comment marks the spot.
  if ((corr.selector.exclude || []).includes(el.nodeName.replace('v3:', '')))
    return `${pad}<span class="comment">&lt;!-- &lt;${el.nodeName}&gt; omitted (see section examples) --&gt;</span>\n`;
  let out = `${pad}&lt;<span class="field">${el.nodeName}</span>`;
  for (const a of Array.from(el.attributes || []))
    if (!a.name.startsWith('xmlns'))
      out += ` <span class="attrib">${a.name}=</span><span class="value">"${markWrap(a, esc(a.value))}"</span>`;
  const kids = Array.from(el.childNodes || []).filter(n => n.nodeType === 1 || (n.nodeType === 3 && n.textContent.trim()));
  if (!kids.length) return out + '/&gt;\n';
  out += '&gt;';
  if (kids.every(k => k.nodeType === 3)) {          // text-only element
    out += markWrap(el, esc(el.textContent.trim()));
    return out + `&lt;/<span class="field">${el.nodeName}</span>&gt;\n`;
  }
  out += '\n';
  for (const k of kids) if (k.nodeType === 1) out += renderEl(k, indent + 1);
  return out + `${pad}&lt;/<span class="field">${el.nodeName}</span>&gt;\n`;
}

/* ----------------- STEP 5b: RENDER THE FHIR PANE(S) ---------------------- */

/**
 * renderJson(value, marksForResource, currentPath, indentLevel)
 * Recursive JSON pretty-printer that tracks the dotted path of the value
 * being emitted; when that path appears in the resource's mark table, the
 * primitive is wrapped in its <mark class="colorN">. Key names get the
 * "field" span, primitives the "value" span — mirroring the CDA pane.
 */
function renderJson(obj, rnMarks, curPath, indent) {
  const pad = '  '.repeat(indent);
  if (Array.isArray(obj)) {
    if (!obj.length) return '[]';
    const items = obj.map((v, i) => pad + '  ' + renderJson(v, rnMarks, `${curPath}[${i}]`, indent + 1));
    return '[\n' + items.join(',\n') + '\n' + pad + ']';
  }
  if (obj && typeof obj === 'object') {
    const items = Object.entries(obj).map(([k, v]) => {
      const p = curPath ? `${curPath}.${k}` : k;
      return `${pad}  "<span class="field">${k}</span>": ${renderJson(v, rnMarks, p, indent + 1)}`;
    });
    return '{\n' + items.join(',\n') + '\n' + pad + '}';
  }
  let s = typeof obj === 'string' ? `"<span class="value">${esc(obj)}</span>"` : `<span class="value">${obj}</span>`;
  const color = rnMarks[curPath];
  return color !== undefined ? `<mark class="color${color}">${s}</mark>` : s;
}

/* ------------- STEP 6: ASSEMBLE OUTPUT, WRITE, REPORT, EXIT -------------- */

evaluateFhirSide();

/**
 * applyAlternatives(resourceName, paneHtml)
 * Insert illustrative comment blocks declared under `alternatives:` in the
 * correspondence file. The block's JSON content is rendered from the live
 * value at `from` (an "<Instance>.<dotted path>" reference), so the
 * illustration is derived from canonical data — only the prose is authored.
 * The block is inserted immediately before the line rendering the `before`
 * property, at matching indentation, wrapped in span.comment (colors.css).
 */
function applyAlternatives(rn, pane) {
  for (const alt of corr.alternatives || []) {
    if (alt.resource !== rn) continue;
    const dot = alt.from.indexOf('.');
    const srcVal = resolvePath(resources[alt.from.slice(0, dot)], alt.from.slice(dot + 1));
    const lines = pane.split('\n');
    const keyMarker = `"<span class="field">${alt.before}</span>"`;
    const idx = lines.findIndex(l => l.includes(keyMarker));
    if (idx === -1) { checks.push({ row: alt, ok: false, msg: `alternative anchor not found: ${alt.before}` }); continue; }
    const indent = lines[idx].match(/^\s*/)[0];
    const body = JSON.stringify({ [alt.as]: srcVal }, null, 2)
      .split('\n').map(l => indent + esc(l)).join('\n');
    const block = `${indent}<span class="comment">/* ${esc(alt.comment)}\n${body} */</span>`;
    lines.splice(idx, 0, block);
    pane = lines.join('\n');
  }
  return pane;
}

let right = '';
for (const rn of corr.resources)
  right += `<div class="border codeArea">${applyAlternatives(rn, renderJson(resources[rn], fhirMarks[rn] || {}, '', 0))}</div>\n`;

const html = `<!-- GENERATED by scripts/gen-highlighted.js from examples-src/correspondence/${path.basename(corrFile)} - do not edit -->
<table><tr><th>CDA (Myra Jones master CCD)</th><th>FHIR (generated example instances)</th></tr>
<tr><td>
<div class="border codeArea">${renderEl(entryEl, 0)}</div>
</td><td>
${right}</td></tr></table>
`;

fs.mkdirSync(OUT_DIR, { recursive: true });
const outFile = path.join(OUT_DIR, `${name}-example.xhtml`);
fs.writeFileSync(outFile, html);

/* ---- optional: refresh the registered Binary fragment from the master ----
 * If the correspondence file declares `binary: <id>`, the selected entry is
 * serialized verbatim (with namespace declarations) to
 * input/resources/binary/<id>.xml, so the published Binary artifact is a
 * generated copy of the master CCD entry and can never drift from the pane
 * rendered above it. */
if (corr.binary) {
  const { XMLSerializer } = require('@xmldom/xmldom');
  let xml = new XMLSerializer().serializeToString(entryEl);
  const m = xml.match(/^<(\S+)((?:[^>"]|"[^"]*")*?)(\/?)>/);
  let attrs = m[2];
  if (!/xmlns=/.test(attrs)) attrs += ' xmlns="urn:hl7-org:v3"';
  if (/xsi:/.test(xml) && !/xmlns:xsi=/.test(attrs)) attrs += ' xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"';
  if (/sdtc:/.test(xml) && !/xmlns:sdtc=/.test(attrs)) attrs += ' xmlns:sdtc="urn:hl7-org:sdtc"';
  xml = `<${m[1]}${attrs}${m[3]}>` + xml.slice(m[0].length);
  fs.writeFileSync(path.join(ROOT, 'input', 'resources', 'binary', corr.binary + '.xml'), xml + '\n');
  console.log(`  binary refreshed: input/resources/binary/${corr.binary}.xml`);
}

const bad = checks.filter(c => !c.ok);
console.log(`${name}: ${corr.rows.length} rows, ${bad.length} check failures -> ${path.relative(ROOT, outFile)}`);
bad.forEach(b => console.log('  FAIL:', b.msg));
process.exit(bad.length ? 1 : 0);

/** fail(msg): structural error (bad inputs) — report and exit 2. */
function fail(msg) { console.error('ERROR:', msg); process.exit(2); }
