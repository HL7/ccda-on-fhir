#!/usr/bin/env python3
"""Render the Myra CCD FHIR bundle as a resource-reference graph (Graphviz SVG + PNG)."""
import json, subprocess, html

import os
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BUNDLE = os.path.join(ROOT, 'fsh-generated', 'resources', 'Bundle-Bundle-CCD-Myra.json')
OUT = os.path.join(ROOT, 'input', 'images', 'myra-bundle-graph')

b = json.load(open(BUNDLE))
entries = b['entry']

# ---- index resources ----
res = {}   # key 'Type/id' -> resource
for e in entries:
    r = e['resource']
    res[f"{r['resourceType']}/{r['id']}"] = r

def hint(r):
    """Short human label for the second line of a node."""
    t = r['resourceType']
    def code_disp(cc):
        if not cc: return ''
        if 'text' in cc: return cc['text']
        for c in cc.get('coding', []):
            if 'display' in c: return c['display']
        return ''
    if t == 'Patient':
        n = r.get('name', [{}])[0]
        return ' '.join(n.get('given', []) + [n.get('family', '')]).strip()
    if t == 'Practitioner':
        n = r.get('name', [{}])[0]
        return (' '.join(n.get('given', []) + [n.get('family', '')]).strip() or '')
    if t == 'Organization':
        return r.get('name', '')
    if t == 'Composition':
        return r.get('title', '')
    if t == 'Encounter':
        return code_disp((r.get('type') or [{}])[0])
    if t in ('Condition', 'Observation', 'Medication', 'DiagnosticReport', 'AllergyIntolerance'):
        return code_disp(r.get('code'))
    if t == 'MedicationRequest':
        return code_disp(r.get('medicationCodeableConcept')) or 'medication order'
    if t == 'Specimen':
        return code_disp(r.get('type'))
    return ''

def short(s, n=26):
    s = s or ''
    return (s[:n - 1] + '…') if len(s) > n else s

# ---- collect edges: (src_key, tgt_key, element, via_section) ----
edges = []
def walk(obj, path, src):
    if isinstance(obj, dict):
        ref = obj.get('reference')
        if isinstance(ref, str) and ref in res:
            elem = next((p for p in reversed(path) if not isinstance(p, int)), '?')
            in_section = 'section' in path
            edges.append((src, ref, elem, in_section))
        for k, v in obj.items():
            walk(v, path + [k], src)
    elif isinstance(obj, list):
        for i, v in enumerate(obj):
            walk(v, path + [i], src)

for key, r in res.items():
    walk(r, [], key)

# dedupe
seen = set(); uniq = []
for s, t, e, sec in edges:
    k = (s, t, e, sec)
    if k not in seen:
        seen.add(k); uniq.append((s, t, e, sec))
edges = uniq
print(f'{len(res)} resources, {len(edges)} edges')

# ---- styling ----
FILL = {
    'Composition': '#FFF2CC', 'Patient': '#DAE8FC',
    'Practitioner': '#E6E6E6', 'Organization': '#E6E6E6', 'Encounter': '#E6E6E6',
    'Medication': '#FFE6CC', 'MedicationRequest': '#FFE6CC',
}
BORDER = {
    'Composition': '#B09500', 'Patient': '#4472A8',
    'Practitioner': '#7F7F7F', 'Organization': '#7F7F7F', 'Encounter': '#7F7F7F',
    'Medication': '#C87F2F', 'MedicationRequest': '#C87F2F',
}
DEF_FILL, DEF_BORDER = '#D5E8D4', '#5B8F58'   # clinical green

bundle_id = b.get('id', '')
bundle_type = b.get('type', '')
n_entries = len(entries)

# Composition sections: title -> list of entry keys
comp = next(r for r in res.values() if r['resourceType'] == 'Composition')
sections = []
for s in comp.get('section', []):
    keys = [e.get('reference') for e in s.get('entry', []) if e.get('reference') in res]
    if keys:
        sections.append((s.get('title', '(untitled section)'), keys))
in_section_keys = {k for _, keys in sections for k in keys}

lines = [
    'digraph myra {',
    '  graph [rankdir=LR, splines=true, nodesep=0.4, ranksep=1.0, compound=true,'
    '         fontname="Helvetica", pad="0.2", dpi=96];',
    '  node  [shape=box, style="rounded,filled", fontname="Helvetica",'
    '         fontsize=13, margin="0.16,0.09", penwidth=1.4];',
    '  edge  [fontname="Helvetica", fontsize=11, color="#333333",'
    '         fontcolor="#333333", arrowsize=0.8, penwidth=1.2];',
    '  subgraph cluster_bundle {',
    f'    label=<<B>Bundle</B> ({html.escape(bundle_type)}) — {html.escape(bundle_id)}'
    f'<BR/><FONT POINT-SIZE="11">{n_entries} entries</FONT>>;',
    '    labeljust=l; fontsize=16; fontname="Helvetica";',
    '    style="rounded"; color="#4472A8"; penwidth=1.8; margin=18;',
]
ids = {}
def node_line(key, r, indent='    '):
    t = r['resourceType']
    h = short(html.escape(hint(r)))
    label = f'<<B>{t}</B>' + (f'<BR/><FONT POINT-SIZE="11">{h}</FONT>' if h else '') + '>'
    return f'{indent}{ids[key]} [label={label}, fillcolor="{FILL.get(t, DEF_FILL)}", color="{BORDER.get(t, DEF_BORDER)}"];'

for i, key in enumerate(res):
    ids[key] = f'n{i}'

# section clusters (inside the bundle frame)
for si, (title, keys) in enumerate(sections):
    lines.append(f'    subgraph cluster_sec{si} {{')
    lines.append(f'      label=<<I>{html.escape(title)}</I>>; labeljust=l;')
    lines.append('      fontsize=12; fontname="Helvetica"; style="rounded,dashed";')
    lines.append('      color="#999999"; fontcolor="#555555"; margin=10;')
    for k in keys:
        lines.append(node_line(k, res[k], indent='      '))
    lines.append('    }')

# remaining resources, free-floating in the bundle
for key, r in res.items():
    if key not in in_section_keys:
        lines.append(node_line(key, r))

# gray section.entry edges: Composition -> each entry resource (inside its section frame)
comp_key = next(k for k, r in res.items() if r['resourceType'] == 'Composition')
for si, (title, keys) in enumerate(sections):
    for k in keys:
        lines.append(f'    {ids[comp_key]} -> {ids[k]} '
                     f'[color="#BBBBBB", penwidth=0.9, arrowsize=0.6];')

for s, t, e, sec in edges:
    if sec:
        continue  # replaced by the Composition -> section-frame edges above
    lines.append(f'    {ids[s]} -> {ids[t]} [label="{e}"];')

lines.append('  }')
lines.append('}')
open(OUT + '.dot', 'w').write('\n'.join(lines))
subprocess.run(['dot', '-Tsvg', OUT + '.dot', '-o', OUT + '.svg'], check=True)
# PNG preview intentionally not generated in the repo (SVG only)
os.remove(OUT + '.dot')
print('rendered', OUT + '.svg')
