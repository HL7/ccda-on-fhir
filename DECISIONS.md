# Decision Log — Document Guidance & Example Consolidation

Working document, not published. Every content adjudication, gap, and concern lands here for Jay's review.
Convention: each entry gets an ID (`D-<domain>-<n>`), states the sources compared, the choice, the rationale, and a status (`proposed` / `approved` / `amended` / `rejected`). Reviewed entries keep their history.

Plan: see `PLAN-documents-and-examples.md`. Ballot target: January 2027 (maps reviewed and tested).

## 1. Content adjudications (per domain)

_Three-way source diffs: baked HTML example vs. published Binary/JSON examples vs. Myra CCD (v7), with `Rec_Output` vendor consensus as tiebreaker. Entries added as each domain is reconciled; medications first._

### D-base-1 — v8 baseline file — **approved (Jay 2026-07-18)**

Sources compared: `Myra_Jones v7.xml` (well-formed) vs. `Myra_Jones v7_ChunEditsv2.xml` (not well-formed: missing space before `codeSystem` at line 1856; also invalid 33-char UUID in the tribal-affiliation observation id).

Chun's four edits: (1) Ph.D. suffix on patient name; (2) Tribal Affiliation observation (template 4.506 2023-05-01, LOINC 95370-3) — USCDI-relevant, keep with defects fixed; (3) Pregnancy Status swapped from "Not pregnant" (newer template 4.297, obs. 2016) to "Pregnancy" assertion (older template 10.20.15.3.8, onset 2011) — exercises the CF-social Pregnancy Observation map but is clinically odd for a 2016 document; (4) missing templateId 4.140 added to Reason for Referral act — clear fix, keep.

**Resolved (v8 written 2026-07-18):** v8 = v7 + edits 1, 2 (fixed: space + valid UUID), 4. Edit 3 **rejected**: Myra is 69 at document date (b. 1947); "pregnant since 2011" is implausible. Kept v7's "Not pregnant" observation (current template 4.297), which still exercises the pregnancy map with plausible data. If the team wants a positive-pregnancy example, it belongs to a fragment or another persona — not the canonical CCD.
### D-med-1 — Canonical medication content — **approved (Jay 2026-07-18)**

Four variants of the shared albuterol entry (id `cdbd33f0-…`, common ancestor across all sources): baked HTML (spray, RxNorm 1190220, moodCode INT); published Binary fragment (powder, 252298, EVN); Myra v7/v8 (albuterol/ipratropium spray, 1190220, EVN — richest sub-entry detail); Rec_Output vendor consensus vs. v6 (powder, 582498, intent=order). **Canonical: Myra v8's two entries** — albuterol/ipratropium spray 1190220 EVN (primary map example) and bevacizumab 1657066 INT (adds rateQuantity/IV coverage). Powder codes retired. Fixed v8's internal narrative/entry mismatch (narrative table said powder; entry codes the spray; narrative was marked "not updated").

### D-med-2 — mood/intent: PLACEHOLDER pending MedMaps — **interim, confirmed (Jay 2026-07-18)**

The medication maps will be updated and mood will be addressed by the MedMaps work; no outcome is assumed here. For the pilot, FHIR-side values follow the currently published ConceptMap (EVN→plan, INT→order) solely so the correspondence/generator tooling has concrete values to demonstrate — these values are explicitly provisional and will be regenerated when MedMaps lands. Observed inconsistencies recorded for that effort's input: baked HTML shows INT→plan (violates current ConceptMap); Rec vendor consensus mapped EVN→order (also differs); CF-medications STU note claims INT-only scope while the ConceptMap covers EVN.

### D-med-3 — v8 enriched for map coverage — **approved (Jay 2026-07-18)**

Two mapped features present in the baked HTML but absent from Myra: Comment Activity (48767-8 → `.note`/Annotation) and manufacturerOrganization (→ `Medication.manufacturer`). Added to v8's albuterol entry (manufacturer renamed "Good Vaccines Inc" → "Good Pharma Inc" — it's an inhaler). Keeps every row of the medication map table demonstrable from the master CCD.

### D-med-4 — Medication as referenced (not contained) resource — **approved with amendment (Jay 2026-07-18)**

The baked HTML used a contained Medication "for ease of creating a single, visual, highlighted example." Canonical form: a separate `Medication` instance referenced via `medicationReference`, matching the shared-instance architecture (SUSHI inlines it into document bundles; map pages link it standalone) and demonstrating the Medication map table (form, code, manufacturer, ingredient) on a real artifact page.

*Amendment (Jay):* also illustrate the codeableConcept alternative. Implemented as a generator `alternatives:` feature — a comment block rendered inside the MedicationRequest pane showing `medicationCodeableConcept`, with its JSON **derived live from `FHIR-Output-Medication.code`** so the illustration cannot drift; only the prose is hand-authored (in the correspondence YAML).


### D-med-5 — v8 supply order INT; author NPI made valid — **approved (Jay 2026-07-18)**

(a) v8's supply entryRelationship was `moodCode="EVN"` (a dispense — which the map table explicitly does not document); switched to `INT` with Supply Order template 4.17 and `effectiveTime/high=20121106` so the dispenseRequest map rows (validityPeriod.end, numberOfRepeatsAllowed = repeatNumber−1, quantity) are demonstrable. (b) Medication author id `66666` → Luhn-valid NPI `1679576722` so the mapped US Core Practitioner can carry the same identifier without failing us-core-17. Unmapped v8 sub-entries left as-is and noted for the map team: reaction observation (MFST), medication monitoring act (4.123), drug administration act (4.118) — no rows in the current map table.


### D-med-6 — Display-name policy — **approved (Jay 2026-07-20)**

Validator rejected four display strings (RxNorm 1190220, NCI C48501/C38288, NUCC 207RC0000X). Policy: **FHIR side uses terminology-server-preferred displays** (fixes the qa errors); **CDA side keeps realistic source displayNames** (unchanged v8). Consequence: display values may legitimately differ across the pair, so display correspondence rows use a new `display` transform — pair still highlighted, both sides must be non-empty, equality not asserted. Codes and systems remain strictly checked.


### D-allergy-1 — Canonical allergy example: v8 aspirin concern act — **approved (Jay 2026-07-20; sourcing confirmed: recordedDate=act author/time 20140104, criticality=CRITH observation; both are checked rows)**

v8's Allergies section has two entries: aspirin (drug allergy 419511003, substance RxNorm 1191 + SNOMED translation, Wheal reaction w/ severity, CRITH criticality, treatment substanceAdministration) and peanut (food allergy 414285001). Canonical page example: the aspirin entry, which matches the existing FHIR instance's lineage (v6 Rec consensus). Peanut entry noted as available for future variety/FC. FHIR instance updated: +us-core profile, +criticality=high (CRITH via CF-Criticality), +recordedDate=2014-01-04 (author/time, date-only policy). No v8 changes needed — Myra's allergy entry was already the richest source.

### D-allergy-2 — type intentionally absent; statusCode fallback — **approved (Jay 2026-07-20: confirmed no type for that category; statusCode used when status observation absent)**

(a) The IG's CF-AllergyIntoleranceType ConceptMap deliberately leaves 419511003 unmapped (no target), so the FHIR example carries **no `type`** — my initial type=allergy contradicted the spec and the correspondence checker caught it. If the team wants a type for drug-propensity codes, that's a ConceptMap change, not an example change. (b) clinicalStatus uses the act statusCode fallback (map row: only when Allergy Status Observation absent — it is, in this entry); row documented with equal transform + note rather than the CF-AllergyStatus ConceptMap, which maps status-observation values.


### D-problem-1 — Canonical problem example: v8 pneumonia concern — **approved (Jay 2026-07-20); recordedDate + assertedDate escalated to BALLOT-QUESTIONS.md (Q-1, Q-2)**

Six problem entries in v8 (pneumonia, empty-value concern, wheezing, pharyngitis, SDOH food insecurity, obesity). Canonical page example: pneumonia (233604007 + ICD-9/ICD-10/local translations — richest coding). FHIR instance updated: assertedDate extension removed (its Date-of-Diagnosis act 77975-1 lives in the SDOH entry, not pneumonia — the old example's 2012-08-06 assertedDate had no source); recordedDate corrected to the EARLIEST author time (2010-08-15, obs author) per the map's own "Earliest, if more than one" rule — the old baked example showed 2014-01-04 (act author), violating it. 4th coding system (local OID 2.16.840.1.113883.3.247.1.1) uses urn:oid form; oid-to-uri transform now falls back to urn:oid:<oid> for unregistered OIDs.

### D-problem-2 — Coverage notes — **amended (Jay 2026-07-20): include sub-entries; see D-scope-1**

Unmapped-but-present sub-entries in the pneumonia entry, no rows in the current map table: prognosis observation (75328-5), patient preference (4.143), age at onset (445518008 — the map may want this as onsetAge alternative; team question). Date of Diagnosis / assertedDate demonstrable later from the SDOH entry or by adding a 77975-1 act to pneumonia in a future v8 amendment.


### D-imm-1 — Immunization example rebuilt from v8 influenza entry — **approved (Jay 2026-07-20)**

FHIR instance enriched to cover the map rows the old example skipped: route (NCI C28161), site (SNOMED 700022004), doseQuantity 60 ug, NDC translation as vaccineCode.coding[1], manufacturer display, lotNumber. `recorded` corrected 2010-08-16 -> 2010-08-15 (author/time; the old value matched nothing in the source). performer.actor now a display reference ("Amanda Assigned", the CDA performer) instead of the unrelated Document-PractitionerRole; a shared Myra practitioner instance can replace it in stage-3 persona work. negationInd="false" not asserted as a row (presence semantics; refusal mapping demonstrable later from a refused-vaccine example if the team wants CF-ImmunizationRefusal coverage).


### D-proc-ex-1 — Procedure example rebuilt from v8 — **approved (Jay 2026-07-20)**

Old FSH instance (appendectomy 80146002 + ICD-10-PCS) has no counterpart in v8; rewritten from v8's first procedure entry (416940007 history-of-procedure with V15.89/Z92.89/local translations, bodySite 416550000, performer). Semantic oddity flagged for the team: the entry's code is a "History of Procedure (situation)" code rather than a procedure code, with the actual procedure implied by methodCode (363680008 radiographic imaging); v8 inherits this from the vendor exercise. priorityCode and methodCode have no rows in the current map table (noted for coverage). Other v8 entries (colonoscopy, stress test, SDOH education act) available for variety; the act-based SDOH entry would exercise the act/observation procedure variants the map mentions.


### D-patient-1 — Patient example aligned to v8 recordTarget; header selector added — **approved (Jay 2026-07-20)**

Generator extended with `selector.headerPath` for header-based examples (recordTarget/patientRole); this also unblocks the future CF-header work. FHIR-Output-Patient updated to v8: official name + Ph.D. suffix, maiden name (use=old, Gonzalez), email corrected to myra.jones@email.com (was a stray developer address), maritalStatus M added. Not yet asserted as rows (present in CDA, candidates for instance/row additions on review): religiousAffiliation, detailed race (2108-9 sdtc) and detailed ethnicity (2146-9 — VSAC expansion of the detailed-ethnicity value set failed for other codes earlier; risk of qa errors, so deliberately left out), guardian (-> RelatedPerson or contact), birthplace extension, language mode/proficiency. New transforms: tel-value, mailto-value, boolean.


### D-vital-1 — First from-scratch instance: heart rate — **approved (Jay 2026-07-20; zoned-datetime reading confirmed)**

No FHIR vitals instance existed on the branch. Created FHIR-Output-Observation-HeartRate (us-core-heart-rate) from v8's organizer component 8867-4: value 80/min, effective 2014-05-20T19:36:05-06:00 (time WITH zone kept — CDA supplies the zone, so the no-times-without-zone concern doesn't apply; confirm this reading of the date policy). status completed->final via CF-ResultStatus map (vitals map reuses result status). Organizer-level rows (panel 46680005/74728-7, US Core vital-signs panel profile) not yet asserted; BP requires the two-component pattern - both queued as follow-ons.


### D-scope-1 — USCDI-3/header scope tagging for example content — **approved (Jay 2026-07-20), sub-entry policy amended**

Need: distinguish data elements in scope for USCDI-3 + header from elements that merely happen to be in the example; incidental elements that raise intractable mapping questions become v8-removal candidates for team review. Design: (a) correspondence rows and the unmapped-element inventory gain an optional `scope:` tag (`uscdi3` | `header` | `incidental`); (b) the coverage check (plan test 3, to be built) reports three buckets per domain: in-scope mapped+demonstrated, in-scope missing, incidental (with mapped/unmapped status); (c) sub-entries stay visible in the CDA pane regardless. **Amended sub-entry policy (Jay 2026-07-20): do NOT include unmapped sub-entries.** Unmapped CDA sub-entries are excluded from the FHIR side entirely; where a likely map is evident, the inventory SUGGESTS it (e.g., age-at-onset -> Condition.onsetAge as an alternative to onsetDateTime; prognosis 75328-5 -> no clean Condition target, possibly ClinicalImpression.prognosisCodeableConcept) but suggestions are never a dependency for progress. Intractable incidentals remain v8-removal candidates.


### D-imm-2 — NDC translation removed from FHIR side — **decided per amended sub-entry policy (2026-07-20)**

tx.fhir.org (NDC snapshot 2021-11-01) rejects the CDA translation code 49281-0422-50 (likely a discontinued seasonal Fluzone NDC), producing a qa error on vaccineCode.coding[1]. Per the amended D-scope-1 policy (incidental + intractable = don't block), the NDC coding is removed from the FHIR instance and its two correspondence rows dropped; the CDA translation stays as source realism, and CVX (the USCDI-relevant coding) remains fully mapped and checked. If the team wants NDC demonstrated, substitute a currently-listed NDC in a future v8 amendment (suggestion only, not a dependency).


### D-social-1 — Smoking status example (fan-out 7) — **proposed**

New instance FHIR-Output-Observation-SmokingStatus (us-core-smokingstatus) from v8's 4.78 observation: 449868002, effective 2014-06-06T10:32-05:00 (zoned, per confirmed policy). Display uses the current SNOMED preferred term "Smokes tobacco daily" vs CDA's older "Current every day smoker" (display transform, non-asserting). status completed->final via CF-ResultStatus. Section's remaining USCDI-relevant entries (tribal affiliation, sexual orientation, gender identity, pregnancy, disability) queue behind the committee coverage review.


### D-result-1 — Results trio: DiagnosticReport + lab Observation + Specimen (fan-out 8) — **proposed**

Three new instances from v8's urinalysis organizer: FHIR-Output-DiagnosticReport (us-core-diagnosticreport-lab; organizer id/status/code/effective range/performer org), FHIR-Output-Observation-Lab (us-core-observation-lab; 5811-5 specific gravity 1.015, interpretation N, reference range 1.005-1.030), FHIR-Output-Specimen (us-core-specimen; urine 122575003). All six USCDI-3 Laboratory elements now demonstrated and tagged. Status maps: organizer completed->final via CF-ResultReportStatus; observation completed->final via CF-ResultStatus.


### D-enc-1 — Encounter pair (fan-out 9) — **proposed**

FHIR-Output-Encounter (us-core-encounter) + FHIR-Output-Condition-EncounterDx (us-core-condition-encounter-diagnosis — completing the US Core condition split alongside the problems example) from v8's urgent-care encounter. All five USCDI-3 Encounter Information elements demonstrated and tagged. Judgment calls on record: class=AMB inferred from the outpatient CPT type (no direct CDA source; noted in instance description); status=finished from EVN mood + past time (entry has no statusCode; CF-EncounterStatus map applies when statusCode present); encounter diagnosis is 64109004, deliberately NOT linked to the pneumonia problem Condition (different code, different concern). sdtc namespace support added to the generator for dischargeDispositionCode.


### D-result-2 — DiagnosticReport.issued synthesized — **proposed**

us-core-9 requires DiagnosticReport.issued (instant: full datetime+zone), but v8's results organizer has no author participation to source it from, and the effectiveTime is date-only. Value synthesized as effectiveTime/high at local midnight (2015-06-22T00:00:00-05:00), noted in the instance description; no correspondence row (nothing to check against). Committee options: add an author to the organizer in a v8 amendment (preferred — also feeds USCDI Provenance), or document the synthesis rule in the map's transform notes.

### D-enc-2 — 64109004 display corrected — **decided (tx-verified)**

The encounter-diagnosis display I authored ("Croupous pneumonia") was wrong — SNOMED 64109004 is Costochondritis (tx.fhir.org). CDA source carries no displayName, so only server validation caught it. Corrected. Lesson reinforcing D-med-6: never author SNOMED displays from memory; when the CDA lacks a displayName, take the tx-preferred term.


### D-note-1 — Notes example: DocumentReference from Note Activity (fan-out 10 of 10) — **proposed**

FHIR-Output-DocumentReference (us-core-documentreference) from v8's consultation Note Activity (34109-9 w/ translation 11488-4): type from translation per the map, category clinical-note, date=author/time (zoned instant), context.period from effectiveTime, attachment = narrative excerpt resolved from the text reference, base64 text/plain. Notes on record: (a) v8's Note Activities carry no <id> (template requires one) — v8-amendment candidate + the map's /id row undemonstrated; (b) attachment.data is hand-resolved from the narrative (no mechanical check; narrative-resolution transform is a possible future generator feature); (c) 7 more note activities exist in v8 for the other USCDI note types.


### D-header-1 — Header maps + Myra Composition (item d) — **proposed; build-fix addendum**

New CF-header.md (menu + index linked) mapping the ClinicalDocument header to Composition, with a generated example: Composition-CCD-Myra (Continuity-of-Care-Document profile) built from the v8 header, its six required sections populated with narratives and entry references to the shared standalone instances — this is also the stage-4 document-example seed. Generator gains selector.exclude (structuredBody elided from the header pane, 394KB -> 37KB). On record: (a) event.period.start is date-only (source low has no timezone; per policy) while end is zoned — mixed precision noted in a row note; (b) header elements absent from v8 and therefore undemonstrated: setId/versionNumber, legalAuthenticator, dataEnterer, informant, relatedDocument — v8-amendment candidates for the committee list; (c) componentOf/encompassingEncounter mapped to Composition.encounter referencing the encounters-domain example (ids differ in source; flagged for review). *Build-fix addendum:* event.period made date-only at BOTH bounds — mixed date/datetime precision fails per-1 (uncomparable); zone-less source low forces date precision, so end matches. IG artifact title disambiguated ('CCD Composition Example (Myra Jones)') to avoid a TOC duplicate with the profile page; Composition.title element unchanged (row-checked). DocumentReference type display corrected to tx-preferred 'Consult note' (also expected to clear the required-binding error, which the wrong display triggered).


### D-proc-5 — Binary fragments are now generated copies of the master CCD — **decided (per Jay's drift catch, 2026-07-20)**

Jay spotted that the registered Binary CDA-Input-* fragments were still stale pre-v8 copies (e.g., the medication Binary showed the retired powder entry while the page above it showed v8's spray). Fix: correspondence files declare `binary: <id>`, and the generator serializes the selected master-CCD entry verbatim (namespaces added) into input/resources/binary/<id>.xml on every run — the Binary artifact, the highlighted pane, and the master can no longer disagree. Applied to the six CDA-Input binaries with converted domains. CDA-Output-* (FC direction) remain stale until the FC conversion; **Resolved (Jay 2026-07-20): KEEP, at least for now** — redundant but handy as clean raw-XML downloads; harmless now that they are generated copies. Revisit only if the artifact index gets unwieldy.


### D-doc-1 — Myra document Bundle (stage-4 close) — **proposed**

Bundle-CCD-Myra: Composition-CCD-Myra first entry + the transitive closure of its references (15 entries incl. Medication, Practitioner, Specimen, encounter-dx Condition, Patient's managing Organization), assembled natively by SUSHI from the shared instances — verified: every internal reference resolves to a bundle fullUrl; timestamp = Composition.date (satisfies clindoc-timestamp-ge-compoDate); claims the clinical-document-bundle profile. Bundle.identifier = ClinicalDocument/id per the header map. myra-jones.html completed with CCD static download (copy synced by _genexamples). Note: bundle-contained copies of profiled resources will be validated in-bundle by the publisher — any new errors surface on Jay's next build.


## 2. Document-profile requirements unsupported by Myra data

_Populated during stage 3 when the 11 document examples are built. Each entry: profile, required element, why Myra lacks it, proposed remedy (targeted v8 addition vs. minimal synthetic supplement)._

(none yet)

## 3. CapabilityStatement issues

_Reviewed by Jay 2026-07-18: items 1–3 approved and implemented (commit 948afd9): H&P profile added, metadata updated (2.0.0), interactions constrained — Bundle carries the document lifecycle (create/read/vread/search/update/delete), Composition is discovery/read-only; patch and history-* removed. Items 4–5 remain open; see also proposed additions awaiting Jay's OK: `$document` operation, DocumentReference discovery, CapabilityStatement.document element._

_Original issue list:_

1. **History-and-Physical missing** from Composition.supportedProfile in both statements (10 of 11 document profiles listed).
2. **Stale metadata:** version "1.0", date 2020-08-12 — predates everything; should track IG version/date.
3. **Interaction list is implausibly broad** for a document-exchange use case: full CRUD including `patch` and `delete` on Bundle and Composition, but **no `$document` operation** and no `DocumentReference` resource, even though `the_specification.md` recommends US Core DocumentReference for indexing. Recommend: trim to read/search/create (receive), add the `$document` operation on Composition, and consider a DocumentReference entry.
4. **No `instantiates` or documentation of the document paradigm** (Bundle type=document expectations, clinical-document-bundle conformance) — worth adding once the CD-IG alignment lands.
5. Client and Server statements are near-identical mirror copies; consider whether both carry information or one should reference the other's expectations narratively.

## 4. Process / tooling decisions

### D-proc-1 — Bundle entries single-sourced; fullUrl scheme — **approved (Jay 2026-07-18)**

The fsh branch's `Complete-Document-Bundle-Example` carried 5 GoFSH `Inline-Instance-*` copies that had drifted from the standalone instances (stale 2020 meta, `urn:uuid` refs, Patient identifier 1032702 vs. 900). Rewrote the bundle to inline the shared named instances via SUSHI (`entry.resource = <name>`), standalone content winning. fullUrls changed from `urn:uuid:*` to `http://example.org/fhir/<Type>/<id>` so the instances' relative references resolve within the document bundle (verified: all Composition refs resolve). Consequence: bundle content differs from the previously published example (meta dropped, identifiers, fullUrls) — acceptable for a non-normative example; flag in changelog.

### D-proc-2 — Artifact id renames on fsh branch — **approved (Jay 2026-07-18): browseable names win over publication-file churn; renames stand; FHIR-us-ccda.xml reconciled on top of publisher output**

The fsh branch's "align example names" commit renamed example artifact ids (e.g., Patient `example` → `Document-Patient`, `CF-*` → `FHIR-Input-*`/`FHIR-Output-*`). Published artifact URLs (e.g., `Patient-example.html`, `MedicationRequest-CF-medication.html`) will break; needs deprecation/redirect handling in `FHIR-us-ccda.xml` at registration time (task 6) — same treatment as the retired `Binary-CF-*` pages.

### D-proc-3 — GoFSH debris pruned — **approved (Jay 2026-07-18)**

Deleted `example-1.fsh` (Encounter) and `rehab.fsh` (Procedure): unreferenced Amy Shaw-era instances, already deprecated in the last publication. Renamed meaningless instance `1` → `FHIR-Input-Immunization-Performer` (output JSON unchanged; contained id "1" kept). Remaining SUSHI warning (×2): `Document-Observation-*` instances set `category` by numeric index against sliced US Core Observation.category — cosmetic; will disappear when these Amy-Shaw-era instances are replaced by Myra equivalents (stage 3); left as-is.
### D-proc-4 — FHIR-us-ccda.xml is publisher-managed; hands off — **decided (2026-07-18)**

The IG Publisher regenerates artifact entries and `deprecated` flags in `FHIR-us-ccda.xml` by comparison with the *published* site, so manual un-deprecation of restored artifacts gets re-overwritten every build (observed: US-Realm-Header re-flagged after each reconciliation attempt). Policy: take publisher output verbatim; the flags resolve themselves when the next version publishes containing the restored artifacts. Earlier manual reconciliation commits (f2ceea0, 6f9acc2) superseded by 7ac9345. Browseable-rename churn in this file (D-proc-2) is likewise absorbed automatically.

## 4a. Profile decisions (Jay-directed and re-confirmed on review 2026-07-18, implemented commit 741d91f)

### D-profile-1 — Confidentiality un-prohibited — **approved (Jay)**

Removed the restored US Realm Header's `confidentiality 0..0` prohibition; aligns with FHIR Clinical Documents IG, which keeps the element. Prior "use Meta.security" guidance may be re-added as prose (SHOULD), not a prohibition. Substantive vs. prior publication → changelog.

### D-profile-2 — Adopt UV extensions — **approved (Jay)**

US Realm Header now references the FHIR Clinical Documents IG (1.1.0) extensions instead of local ones: data-enterer, informant, information-recipient, Participant, consent-extension (for authorization), cross-version `event-basedOn` (for order), R5 `Composition.version` (for versionNumber). PerformerExtension stays local — no UV equivalent. 7 local extension StructureDefinitions deleted. Notes: (a) UV participation extensions are complex (required `type` CodeableConcept + `party`), so instances were restructured; `type` codes chosen: ENT / INF / PRCP / PART from v3-ParticipationType — **PART for the generic participant needs validation against the CD-IG's `fhir-clinical-doc-participant` value set** (couldn't expand offline; IG Publisher run will confirm). (b) New dependencies: `hl7.fhir.uv.fhir-clinical-document 1.1.0`, `hl7.fhir.uv.xver-r5.r4 0.0.1-snapshot-2` (snapshot pin — check for a release version before ballot). Substantive → changelog; old extension pages need deprecation handling.

### D-profile-3 — Bundle example conforms to clinical-document-bundle — **approved (Jay)**

Complete-Document-Bundle-Example claims `meta.profile = clinical-document-bundle`; timestamp corrected (was 2013, before Composition.date 2016 — violated `clindoc-timestamp-ge-compoDate`). Open risk: the profile's first-entry slice expects the Composition to conform to `clinical-document-composition`; ours conforms structurally but doesn't declare it — watch the IG Publisher validation outcome.

## 4b. Build-baseline record (stage 1)

First full IG Publisher build of `fsh-claude`: **29 errors / 177 warnings / 17 broken links** → after fix batches (commits 72345c4, 14ec76a, ba9430f, c526086, 08db492): **0 errors**. Fixes: ValueSet OIDs ×9; Luhn-valid NPIs ×2; LOINC display corrections ×3; `us-core-condition` → `us-core-condition-problems-health-concerns`; detailed-ethnicity codings removed from Amy-Shaw-era Patient (VSAC expansion failures; superseded by Myra later); 12 Binary CDA fragments namespace-fixed, registered with `implementationguide-resource-format=application/xml` (the mechanism master used); downloads/CF-results link fixes; xver dependsOn uri = canonical + `/ImplementationGuide/` path. Warnings pass 1 (b94724b): cross-version extension URLs version-pinned; 42 instance descriptions added. Remaining warnings (~130): LOINC display corrections in re