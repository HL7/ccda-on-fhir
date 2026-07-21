# Delta Review: Restored US Realm Header vs. HL7 FHIR Clinical Documents IG

Purpose: review artifact for the deferred rebase decision (plan item a.2). Compares the restored (as-was) profiles on the `fsh-claude` branch against `hl7.fhir.uv.fhir-clinical-document` **1.1.0** (R4, from package.tgz provided 2026-07-18). Each delta is classified for ballot planning: **compatible** (could adopt without substantive change) or **substantive** (changes conformance; would need ballot).

## 1. Structural differences

| Aspect | Ours (restored) | Clinical Document IG | Impact |
|---|---|---|---|
| Composition parent | Base R4 `clinicaldocument` profile; US-Realm-Header is **abstract**, 11 doc profiles derive from it | `clinical-document-composition` derives directly from `Composition`, non-abstract | Rebasing = re-parenting US-Realm-Header onto `clinical-document-composition` and re-verifying every inherited constraint. **Substantive** |
| Bundle profile | **None** — we have no document-Bundle profile at all | `clinical-document-bundle`: identifier 1..1 (system+value required), timestamp 1..1 with invariant timestamp ≥ Composition.date, type=document, total 0..0, entry.search/request/response 0..0, first entry 1..1 = clinical-document-composition | Adopting is nearly free for examples (our rebuilt Complete-Document-Bundle already satisfies the mechanical rules except the profiled-composition first entry). Declaring conformance in profiles = **substantive**; conforming examples = **compatible**, recommended now |
| Document-type profiles | 11 concrete document profiles (CCD, Discharge Summary, ...) with fixed `type` codes | None — one generic composition profile + category slice (`clinicalnotecategory`) | Our doc-type layer is additive; no conflict. Keep |

## 2. Extension mapping

| Ours (canonical under us/ccda) | CD-IG equivalent | Delta |
|---|---|---|
| DataEntererExtension | `data-enterer-extension` | Same concept, same name pattern, different canonical URL |
| InformantExtension | `informant-extension` | Same concept, different URL |
| InformationRecipientExtension | `information-recipient-extension` | Same concept, different URL |
| ParticipantExtension | `ParticipantExtension` (identical name) | Same concept, different URL; CD-IG marks it MS |
| VersionNumber | R5 cross-version extension `R5-Composition-version` | Different mechanism, same intent |
| OrderExtension | `basedOn` extension | Different name, same intent |
| AuthorizationExtension | `consent-extension` | Similar intent (consent/authorization); semantics need review |
| PerformerExtension | **none** | No CD-IG equivalent — would remain ours |
| — | `ChangeMade` (Composition + section) | CD-IG-only; no counterpart |
| — | `R5-Composition-status` | CD-IG-only status alignment |

Swapping our extension canonicals for the UV ones is **substantive** (URL changes break existing instances) but eliminates 7 of our 8 locally-maintained extensions. Strong rebase candidate.

## 3. Composition element-level deltas

| Element | Ours | CD-IG | Notes |
|---|---|---|---|
| language | **1..1 MS** | base (0..1) | We require; they don't |
| text | (inherited) | **MS** | They emphasize narrative |
| identifier | **1..1 MS** | base | We require (CDA id heritage) |
| status | base | **MS** + R5 status ext | |
| category | — | slice `clinicalnotecategory` 0..1 | |
| subject | 0..1 MS → us-core-patient \| Group | **1..1 MS** → Patient \| Group | CD-IG **requires** subject; our target profile is tighter. Adopting min=1 is **substantive** (though all our documents have subjects in practice) |
| encounter | MS → us-core-encounter | base | US-realm tightening; keep |
| author | MS → us-core-practitioner/role, PractitionerRole, us-core-patient, Device, RelatedPerson | MS → Patient, Practitioner, PractitionerRole, RelatedPerson, Device, **Organization** | CD-IG allows Organization authors; we don't. Worth aligning — **substantive** but additive |
| confidentiality | **0..0** ("use meta.security") | unconstrained | Direct philosophical conflict. CD-IG keeps the element; we prohibit it. Rebase would force un-prohibiting — **substantive** |
| attester | slices legal 0..1 / professional 0..* / **personal 0..*"**; fixedCode mode; party 1..1 with US Core targets; MS | slices legal 0..1 / professional 0..* ; patternCode mode; no party constraints | Ours is a superset (personal attester, required party, profiled targets). fixedCode vs patternCode: harmless divergence, align on pattern when touched |
| custodian | **1..1 MS** → us-core-organization | MS (0..1) | We require custodian (CDA heritage) |
| relatesTo | — (VersionNumber ext covers versioning) | slices `replaced_document` (code=replaces) / `appended_document` (code=appends) with required targetIdentifier system/value | Two different document-versioning idioms. Rebase decision should pick one; CD-IG's is the FHIR-native pattern — **substantive** |
| section | inherited from base `clinicaldocument` | **1..* MS**; title 1..1 MS; code MS; text MS; ChangeMade ext | Verify what our base parent actually imposes on section (base `clinicaldocument` profile constraints) during rebase work |

## 4. Recommendations (for the rebase review)

1. **Now (compatible, no ballot impact):** make all document Bundle *examples* satisfy `clinical-document-bundle` mechanics (identifier system+value, timestamp ≥ Composition.date, no search/request/response). Costs nothing; future-proofs the examples. Already nearly true after the D-proc-1 bundle rebuild.
2. **Rebase package (single ballot item later):** re-parent US-Realm-Header onto `clinical-document-composition`; swap the 7 mappable extensions to UV canonicals (keep PerformerExtension); adopt subject 1..1, Organization authors, and relatesTo slicing; resolve the confidentiality conflict (propose: follow CD-IG, un-prohibit, keep meta.security guidance as SHOULD).
3. **Keep ours regardless:** the 11 document-type profiles, US Core reference-target tightenings, required identifier/custodian/language, personal attester slice.
4. **Open question for the team:** whether HL7 will expect US Realm alignment with the UV IG before January 2027 — if yes, item 2 moves into this effort and gets balloted once (see plan, ballot-dates discussion).

_Sources: `fsh-generated` SUSHI output of `fsh-claude` (differentials) vs. package StructureDefinitions. CD-IG operation `convert-to-transaction-bundle` and `example/` content not reviewed; out of scope for profile deltas._
