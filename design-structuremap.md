# Design Proposal: StructureMap as the Executable Form of the C-CDA ↔ FHIR Maps

Status: DRAFT for committee consideration (2026-07-20). Companion to
PLAN-documents-and-examples.md; decision log cross-ref D-proc-6.

## 1. Problem and motivation

The IG's maps currently exist in three partially-coupled forms: prose mapping
tables (pagecontent markdown), ConceptMaps (terminology), and — since the
example-consolidation work — per-domain correspondence files (YAML) that drive
the generated, build-verified example tables. The correspondence rows are
"the map made executable" only in a narrow sense: each row asserts one
value-level relationship, checked against hand-authored FHIR example instances.

FHIR has a native, publishable, executable mapping formalism: **StructureMap**,
authored in the FHIR Mapping Language (FML). Adopting it would let the IG
*publish* its maps as executable artifacts rather than describe them, and let
the build *derive* the FHIR examples rather than check them.

## 2. Proposed architecture

Division of labor (answering "we'd still need the local info"):

| Concern | Artifact |
|---|---|
| Generic transformation rule ("any Medication Activity → MedicationRequest") | **StructureMap** (published IG artifact, one per domain/template) |
| Terminology translation | Existing **ConceptMaps**, invoked natively via FML `translate()` |
| Which Myra entry demonstrates the map | Correspondence file **selector** (unchanged) |
| Expected output for regression | The published **FHIR example instances** (now asserted equal to engine output) |
| Presentation: colors, notes, alternatives blocks, USCDI tags | Correspondence file (reduced role: display + scope metadata only) |

Pipeline per domain:

```
selector → extract entry from master CCD
        → EXECUTE StructureMap (engine) → produced FHIR resource(s)
        → semantic diff vs published FHIR-Output-* instance   (replaces per-row checks)
        → render highlighted panes (rows retained for display pairing)
```

The check strengthens categorically: today ~15–37 hand-claimed value pairs per
domain are verified; under execution, the *entire* output resource is verified,
and any CDA element the map silently ignores becomes visible as absent output.

## 3. What it requires

1. **CDA as a FHIR logical model.** Engines need StructureDefinitions for the
   source. The `hl7.cda.uv.core` package provides CDA R2.0 as logical models
   (this is how HL7's existing CDA↔FHIR transform projects work). New IG
   dependency; confirm interaction with the C-CDA 3.0 templates (maps are
   written against CDA core structures; template constraints inform rule
   conditions, not source typing).
2. **An execution engine in the build.** Options: the HL7 Java validator's
   transform mode (already a build dependency via the publisher), or matchbox
   (ahdis). Runs in `_genexamples`/CI like SUSHI does; outputs checked in, so
   the HL7 auto-build remains engine-free.
3. **FML authoring competence.** FML is markedly harder to read/write than the
   YAML rows; group/rule syntax, dependent rules, logical-model paths. This is
   the main ongoing cost and the main committee-reviewability question.

## 4. The highlighting problem (known limitation)

Execution engines do not emit source-node → target-node provenance, so the
colored pane pairing cannot be derived from running the map. Options:
(a) retain correspondence rows as a display-only layer (recommended; they lose
verification duty, so drift in them is cosmetic and caught by eye);
(b) statically parse simple copy rules out of the FML to auto-derive pairs
(feasible for `a.b as x -> t.c = x` shapes; not for dependent/conditional
rules). Recommend (a) now, (b) as an enhancement.

## 5. Prior art and cautions

- This project previously published machine maps (the C2F-*/F2C-* ConceptMaps
  used structurally) and retreated to prose tables; those artifacts are
  deprecated. StructureMap re-opens that question deliberately, with a real
  execution story this time. The committee should decide whether executable
  maps are *normative content* or *informative tooling* — ballot framing
  differs substantially.
- Published StructureMaps create conformance expectations: implementers may
  run them literally. Areas of documented ambiguity (medication mood pending
  MedMaps; recordedDate earliest-rule, Q-1) must either be resolved or
  explicitly parameterized before their maps publish.

## 6. Convergence with MedMaps

The MedMaps rule workbook is a decision table over axioms (author axis,
negation-first, status crosswalk). That structure is mechanically generatable
into StructureMap groups with conditions. If MedMaps lands as the medication
truth, emitting its rules as the medication StructureMap would make a single
artifact serve committee review (workbook), publication (StructureMap),
execution (engine), and example verification (this pipeline). Recommend the
medication StructureMap be *generated from MedMaps*, not hand-written.

## 7. Migration path (incremental, per domain)

1. **Pilot (no ballot impact):** one StructureMap for **allergies** (stable
   domain), marked informative/experimental. Wire execution into
   `_genexamples` for that domain only; diff output vs
   FHIR-Output-AllergyIntolerance; keep YAML rows for display. Deliverables:
   the FML, the engine wiring, a diff report, and an honest write-up of
   authoring cost.
2. Committee reviews pilot: adopt / adopt-as-informative / decline.
3. If adopted: convert stable domains one at a time (YAML rows shrink to
   display+scope); medications waits for MedMaps and arrives generated.
4. FC direction: same architecture reversed (FHIR→CDA maps are FML-expressible
   against the same logical models; the current FC gap makes this greenfield).

## 8. Effort estimate

Pilot: roughly the size of the original generator build (engine wiring is the
unknown; FML for allergies is ~60 lines). Full conversion: dominated by FML
authoring/review per domain, not tooling. Not recommended to gate the
January 2027 ballot on full conversion; pilot fits comfortably.

## 9. Recommendation

Approve the allergies pilot as informative tooling now; defer the
normative-vs-informative and full-conversion decisions to committee with the
pilot in hand. The current YAML machinery remains the verification system of
record until (and unless) execution replaces it per domain.
