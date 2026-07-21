# Plan: Reactivate Document Guidance & Consolidate Examples (FSH-based)

## Objectives

End goal: a **ballotable spec that is easy for implementers to use**. Immediate goal: **verifiability** — a single canonical example set (Myra Jones) demonstrating both the document Profiles and the C-CDA ↔ FHIR maps, with the highlighted map examples generated from, and mechanically tested against, the canonical files. Verification tooling is therefore built early (stage 2), not bolted on at the end.

## Decision log

All content adjudications, gaps, and concerns are recorded for review in **`DECISIONS.md`** (repo root, working document, not published), with sections for: per-domain content adjudications (e.g., medication moodCode INT vs. EVN); document-profile requirements that Myra data cannot satisfy; CapabilityStatement problems; and anything merged into the published changelog at release time. Profile-rebase deltas get their own file (see a.2).

## Baseline (verified)

- Map pages (`input/pagecontent/CF-*.md`, `FC-*.md`) contain hand-baked highlighted HTML examples whose content **differs** from the standalone example resources and Binary entries — e.g., medication: RxNorm 1190220/spray/moodCode=INT in HTML vs. 252298/powder/moodCode=EVN in Binary, with the JSON's `intent: plan` inconsistent with the Binary's EVN.
- The **`fsh` branch** already: reinstates the R4 document profiles deleted by `cfda2c6` (commit `f3f261d`); converts profiles, extensions, value sets, ConceptMaps, and examples to FSH via GoFSH (`input/fsh/`); adds `sushi-config.yaml` (US Core 6.1.0, STU2); and establishes naming conventions (`CDA-Input-*`/`CDA-Output-*` binaries, `FHIR-Input-*`/`FHIR-Output-*` map instances, `Document-*` profile-example instances).
- The branch's `Complete-Document-Bundle-Example.fsh` uses SUSHI inline-instance assignment (`* entry[+].resource = <InstanceName>`) — SUSHI copies named instances into bundle entries at build. **Bundle assembly needs no custom script.**
- Myra Jones CCD: the IG repo's `mappings/` copy (v2) is **stale**; the living version (v7) is in the separate **`C:\repos\CCDAtoFHIRSamples`** repo (`CDAtoFHIRExamples/Input`), alongside vendor `Raw_Output`/`Rec_Output` consensus artifacts. FHIR→CDA has one vendor output (Oracle/Cerner).
- The STU3-final folder (OneDrive) is FHIR 3.0.1 in the old ig.json layout — reference only.

---

## a. Bring CDA XML and profiling content into current main

The `fsh` branch is the vehicle; (a) = finish and land the branch.

1. **GoFSH cleanup**: replace generated `Inline-Instance-*` bundle copies with references to shared named instances (see e2); prune conversion debris (`1.fsh`, `example-1.fsh`, `rehab.fsh`); verify profile deltas survived conversion.
2. **Restore as-was; rebase later.** Profiles are restored as previously published (US Core refs updated to 6.1.0). Produce **`deltas-clinical-document.md`**: an element-by-element comparison of the restored US Realm Header / document profiles against the HL7 FHIR Clinical Document IG bases, as the review artifact for a future rebase decision. No re-derivation now.
3. **CapabilityStatements: keep** (`CcdaOnFhirClient/Server`); any problems found during restore (stale API expectations, US Core version drift, unsupported interactions) go to `DECISIONS.md`.
4. Re-register restored artifacts; remove `deprecated` flags in `FHIR-us-ccda.xml` for returning artifacts (same canonical URLs/ids). Restore `StructureDefinition-*-intro.md` pages and menu entries.
5. Bring the Myra CCD (v8 — see c) into the IG as a static download linked from the complete-example page; entry fragments are not republished as Binary artifacts (see b note).
6. Merge `fsh` → `main` once it builds clean; later stages work on main.

**Your verification (a):**

- **Build baseline:** before any merge, build current `main` and record the `output/qa.html` error/warning counts. After the fsh branch lands, rebuild — no new errors; new warnings only if logged in `DECISIONS.md`.
- **Artifact parity:** every artifact flagged `deprecated` in `FHIR-us-ccda.xml` that is meant to return appears in the built artifacts page with the same id and canonical URL (grep the deprecated list, tick them off against the artifact index).
- **Profile fidelity:** for US Realm Header plus two document profiles of your choice, diff the SUSHI-generated StructureDefinition against the pre-deletion original (`git show cfda2c6^:input/resources/structuredefinition/US-Realm-Header.xml`) — differential elements, cardinalities, and bindings must match except for logged US Core updates.
- **Delta file:** pick 3 rows of `deltas-clinical-document.md` at random and confirm them against the published Clinical Document IG pages.
- **CapStatements:** confirm the two restored CapabilityStatements render, and that any oddities you notice appear in `DECISIONS.md`.

## b. Information architecture

### Web navigation (menu.xml)

```
IG Home
Background
Documents ▾                ← NEW dropdown
  Document Guidance         (documents.html: overview, US Realm Header, doc-level rules)
  Profiles                  (artifacts page section: 11 doc profiles + header extensions)
  Complete Example          (myra-jones.html: links CCD download + document Bundles)
C-CDA → FHIR ▾
  Header                    ← NEW (CF-header.html)
  Sections & Narrative      ← NEW if separated from Header (CF-sections.html)
  Allergies ... Vital Signs (existing 12 pages)
FHIR → C-CDA ▾
  Header (minimal)          ← NEW
  Allergies ... Vitals      (existing 7 pages)
Structural Guidance
Terminology Maps
Change Log / Known Issues
```

FHIR→CDA remains less complete by design; FC pages say so explicitly.

### Folders

```
sushi-config.yaml                      — IG config (from fsh branch)
DECISIONS.md                           — decision log (see above)
deltas-clinical-document.md            — profile rebase review artifact (a.2)
input/
  fsh/                                 — AUTHORED source of truth for all FHIR content
    aliases.fsh
    profiles/            11 document profiles + USRealmHeader
    extensions/          header extensions
    valuesets/           doc-type value sets
    instances/
      conceptmaps        CF-*.fsh, FC-*.fsh
      map examples       FHIR-Input-*.fsh / FHIR-Output-*.fsh (one per domain; Myra content; shared by CF and FC pages)
      shared entities    Myra-Patient.fsh, Myra-Practitioner-*.fsh, Myra-Organization-*.fsh
      document examples  Composition-*.fsh + Bundle-*.fsh (bundles reference shared instances)
  images/ (static)       myra-jones-ccd.xml + optional per-domain fragment .xml downloads (GENERATED, checked in)
  pagecontent/           CF-*.md, FC-*.md, documents.md, myra-jones.md, StructureDefinition-*-intro.md
  includes/examples/     CF-*-example.xhtml, FC-*-example.xhtml — GENERATED highlighted tables ({% include %}d)
examples-src/                          — unpublished CDA source + generation inputs
  myra-jones-ccd.xml                   — copy of canonical v8 (see c); scripts treat as read-only input
  correspondence/        CF-*.yaml, FC-*.yaml, CF-header.yaml
scripts/                               — Node generator + tests (npm project)
fsh-generated/                         — SUSHI output (not authored, not committed)
```

Principles: every FHIR fact lives once (a named FSH instance — reused by map pages and inlined into document bundles by SUSHI); every CDA fact lives once (canonical Myra CCD); highlighted HTML, fragment downloads, and bundles are derived mechanically.

Fragment-publication note: entry fragments are no longer registered as `Binary` IG artifacts — their display home is the generated highlighted HTML, extracted from the master CCD at build. Raw-XML downloads (full CCD, optional per-domain fragments) ship as static files (same mechanism as `colors.css`). Previously published `Binary-CF-*.html` pages need deprecation/redirect handling in `FHIR-us-ccda.xml`, not silent removal.

**Your verification (b):**

- **Click-through:** open the local build; walk every menu item — each resolves, each new page has real content (no stubs except the declared FC-header stub). The qa.html link-checker section shows zero new broken links.
- **Layout conformance:** `git ls-files input/fsh` matches the folder table above; `fsh-generated/` is gitignored (`git check-ignore fsh-generated` returns it); no FHIR example content remains under `input/resources/` except intentional static/binary holdovers.
- **Old URLs:** request a removed `Binary-CF-*.html` URL on the built site — confirm it's handled per the deprecation note, not a 404 surprise.

## c. Update CDA example content to Myra Jones

**Versioning workflow:** create **Myra Jones v8** in the `CCDAtoFHIRSamples` repo (starting from v7), applying the reconciliation below; copy v8 into `examples-src/` in the IG repo. v2–v7 and the vendor outputs remain archival provenance. (Requires connecting `C:\repos\CCDAtoFHIRSamples`.)

Per domain (order: medications first — richest; then allergies, problems, immunizations, patient, procedures, results, vitals, social, notes, encounters):

1. Diff three sources: baked HTML example (usually richest entry detail), current Binary fragment, and the Myra **v7** entry.
2. Reconcile into a single canonical entry in v8: keep Myra's ids/demographics/section context; fold in the HTML example's richer sub-entries (indication, instruction, free-text sig, supply order, precondition, drug vehicle...). **Adjudication: editor (Claude) decides, every decision recorded in `DECISIONS.md` for review**, with `Rec_Output` consensus consulted as tiebreaker.
3. Rewrite the domain's `FHIR-Output-*` FSH instance as the faithful map of the canonical entry — current contradictions (status/intent, codes) are fixed by construction.
4. **Document examples: populate all 11 document types with Myra data to the extent possible** (shared instances, SUSHI-inlined). Where a document profile requires content Myra doesn't have (e.g., surgical/operative detail, imaging findings), list the unmet requirement in `DECISIONS.md` — that list then drives either targeted Myra v8 additions or minimal synthetic supplements, decided at review.
5. Myra is the single persona: restored `Document-*` (Amy Shaw era) instances are replaced by Myra equivalents.

**Your verification (c):**

- **Traceable v8:** diff v8 against v7 in the samples repo — every changed element must trace to a `DECISIONS.md` entry; any unlogged change is a defect. (I'll provide the diff summary; you audit it against the log.)
- **v8 validity:** run v8 through CDA schema validation and a C-CDA validator (e.g., xmllint against the CDA schema; ONC/HealthIT validator for template conformance) before accepting it as canonical.
- **Decision review:** read `DECISIONS.md` per domain as it lands — each entry names the three sources' values, the choice, and why. Reject or amend inline; I re-apply.
- **Spot-check one domain hands-on:** open its map page, pick 3 highlighted pairs, and confirm the values appear in the v8 CCD entry and the `FHIR-Output-*` instance exactly.
- **Single persona:** grep the built site and `input/` for retired persona names/ids (e.g., "Amy Shaw") — zero hits.
- **Myra-gap list:** for each of the 11 document examples, the profile's required elements are either populated from Myra data or listed in the gap section of `DECISIONS.md` — pick one document type and check its required elements yourself against the built example.

## d. Maps for header elements

New `CF-header.md` mapping `ClinicalDocument` header → FHIR document artifacts, reusing restored header extensions:

| CDA header | FHIR target |
|---|---|
| id / setId / versionNumber | Bundle.identifier / Composition.identifier + VersionNumber extension |
| code, title, effectiveTime, confidentialityCode, languageCode | Composition.type, .title, .date, .confidentiality, .language |
| recordTarget | Patient (link to CF-patient page) |
| author / dataEnterer / informant / custodian / authenticator / legalAuthenticator / participant | Composition.author/.attester/.custodian + extensions (link to CF-participations) |
| inFulfillmentOf | Order extension |
| documentationOf/serviceEvent | Composition.event + Performer extension |
| componentOf/encompassingEncounter | Composition.encounter → Encounter (link to CF-encounters) |
| relatedDocument | Composition.relatesTo |
| component/structuredBody/section | Composition.section (code, title, text/narrative, entry references) |

Highlighted example: Myra CCD header ↔ Myra Composition + Bundle wrapper, generated via `CF-header.yaml`. A minimal `FC-header.md` documents the reverse at current maturity.

**Your verification (d):**

- **Coverage against the profile:** every element the restored US Realm Header profile constrains has a row in the header map table or an explicit waiver — the coverage check (e, test 3) prints the unmatched list; it should be empty or all-waived.
- **Example concordance:** open the generated header example and confirm 3 pairs by hand (e.g., `ClinicalDocument/id` ↔ `Bundle.identifier`, `effectiveTime` ↔ `Composition.date`, `code` ↔ `Composition.type`) against the raw v8 CCD and built Bundle JSON.
- **Cross-links:** the header page's links to CF-patient, CF-participations, and CF-encounters resolve and those pages agree on the shared elements (no contradictory mappings between pages).

## e. Scripts and tests (`scripts/`, Node)

### e1. CDA ↔ highlighted HTML

- **Bootstrap (one-time, HTML → documents):** `extract-html-examples.js` strips `<span>`/`<mark>` markup from the baked examples, yielding plain XML/JSON for the stage-c reconciliation diffs. Retired after consolidation.
- **Steady state (documents → HTML):** `gen-highlighted.js`
  - Inputs: entry fragment extracted from the canonical CCD (selector: section LOINC code + entry `id/@root`, declared in the correspondence file); the domain's instance JSON from `fsh-generated/resources/`; correspondence YAML — rows of `{cda: <XPath>, fhir: <dotted.path[with][indices]>, note?}`, row order assigning `colorN` from existing `colors.css`. Rows are the mapping-table rows made machine-readable.
  - CDA side: `xmldom` + `xpath`; DOM-aware pretty-print with the existing `field`/`attrib`/`value` spans; matched attribute/text nodes wrapped in `<mark class="colorN">`. DOM-aware emission (not string search) prevents mis-marking duplicate values.
  - FHIR side: resolve dotted paths against the JSON object; serialize with the same span/mark treatment.
  - **FC direction: same masters, reversed.** FC pages get generated examples from the same fragment/instance pair with FC correspondence files (direction and column order flip; content shared). Existing 7 FC domains only.
  - Outputs: `input/includes/examples/{CF,FC}-<domain>-example.xhtml`; refreshed static CCD download and optional fragment downloads.
- **Presentation: keep the current color-mark style.** Side task (not blocking): a design proposal for an improved presentation (e.g., hover-to-highlight counterpart, correspondence legend) for team review.

### e2. FHIR instances → document Bundles

Native FSH, no script: each document Bundle instance lists `* entry[+].resource = <shared instance name>`; SUSHI copies instances in at build, satisfying the clinical-document rule that direct targets of Composition references SHALL be in the bundle, while each instance is authored once. Work item: rewrite the restored bundle examples to reference shared Myra instances with stable fullUrls.

### Build pipeline

```
_ccdabuild.bat  =  _genexamples.bat (sushi → generate/verify all correspondence files)  →  _genonce.bat (managed)
```

The HL7 publisher scripts (`_genonce.bat`, `_build.bat`, ...) are managed upstream (self-updating from ig-publisher-scripts) and are never modified; our controller `_ccdabuild.bat` runs our steps first and aborts before the publisher on any example-check failure. Generated files are checked in so plain CI/auto-builds (which run only the managed scripts) still build correctly without Node — the checks then run in our own CI instead.

### Tests (`npm test`, in CI before the IG build) — the verifiability core

1. **Sync checks:** extracted CCD entry ⇄ generated HTML identical (round-trip strip); published CCD download identical to `examples-src` copy; generated includes current (regenerate + `git diff --exit-code`).
2. **Correspondence value checks:** each correspondence row compares CDA and FHIR values under declared transforms (date reformat, OID→URI table, ConceptMap lookup); mismatch fails the build — the illustration becomes a test of the map.
3. **Coverage check:** warn when a mapping-table row on a CF/FC page has no correspondence row (every mapped element demonstrated or explicitly waived).
4. **IG build validation:** SUSHI + IG Publisher validate Bundles against restored document profiles and instances against US Core — the final gate.

**Your verification (e):**

- **Trust the tests by breaking them (mutation check):** change one value in a `FHIR-Output-*` instance (e.g., a code) and run `npm test` — the correspondence check must fail naming that row. Revert; change one CDA value in the v8 copy — same expectation. A harness that can't fail is decoration.
- **Idempotence:** run `npm run gen` twice; `git status` clean after the second run.
- **Bootstrap fidelity (one-time):** for two domains, diff the text content of the stripped HTML extraction against the visible values on the current published page — nothing lost or altered by stripping.
- **Bundle containment:** qa.html shows no unresolved-reference errors for document Bundles; open one built Bundle and confirm an entry (e.g., Patient) is byte-equivalent to the standalone instance JSON.
- **CI proof:** push a branch with a deliberate mismatch and confirm CI blocks it; then confirm the fix goes green.
- **Visual regression:** side-by-side a generated CF-medications example against the current published page — same visual language, same pairs highlighted (allowing for reconciled content changes logged in `DECISIONS.md`).

---

## Sequence

Stages = ordered work packages (dependency order, not calendar):

| Stage | Work | Plan items | Depends on |
|---|---|---|---|
| 1 | Finish fsh branch: GoFSH cleanup, US Core reconciliation, CapStatement review, artifact registration, nav skeleton; `deltas-clinical-document.md`; merge to main | a, b | — |
| 2 | Medications pilot end-to-end: Myra v8 reconciliation (meds only), rewrite FHIR-Output-MedicationRequest.fsh, correspondence file, generator + tests prototype | c, e | 1 |
| 3 | Roll reconciliation + generation across remaining domains (CF and FC); retire baked HTML; rebuild document bundles on shared Myra instances; populate all 11 document examples, logging Myra gaps | c, e | 2 |
| 4 | Header maps + header highlighted example; myra-jones.html complete-example page | d | 1, 2 |
| 5 | Tests in CI; presentation-redesign proposal (side task); changelog; ballot-ready QA pass | e | 3, 4 |

Stage 2 pilots the hardest domain to prove the correspondence format, generator, and adjudication workflow before committing the remaining eleven.

### Stage gates (your sign-off ritual per stage)

Each stage ends with the same three-part review before the next begins:

1. **qa.html delta** — error/warning counts vs. the recorded baseline; anything new is explained or fixed.
2. **`DECISIONS.md` new entries** — read and approve/amend; unresolved entries block the gate.
3. **Section tactics** — run the "Your verification" checklist(s) for the plan items that stage touched (a–b for stage 1; c+e pilot subset for stage 2; c+e full for stage 3; d for stage 4; e's CI proof and visual regression for stage 5).

Stage 2 gets the strictest gate: the mutation check and the hands-on medications spot-check must both pass before stage 3 fan-out, since every later domain inherits the pilot's tooling and format.

## Status

Execution begun (2026-07-18). Target: **maps reviewed and tested for the January 2027 ballot**; dated mileston