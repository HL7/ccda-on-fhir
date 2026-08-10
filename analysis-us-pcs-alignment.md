# Alignment Analysis: C-CDA on FHIR vs. US-PCS and FHIR Clinical Documents

Status: draft for review (D-doc-2). Sources checked 2026-08-03 against the US-PCS CI build
(1.0.0-ballot, in STU1 ballot) and published IPS STU2 / FHIR Clinical Documents STU1.1.

## 1. The two alignment tasks

**FHIR Clinical Documents 1.1 (clear-cut).** Our US Realm Header profiles already derive
from CD-IG 1.1.0 (D-profile-2) and the Bundle example claims the clinical-document-bundle
profile (D-profile-3). Remaining work is verification, not design: confirm our Composition
and Bundle profiles and examples satisfy CD-IG invariants and inherited flags in the IG
Publisher build, and resolve the D-profile-3 open risk (first-entry slice conformance
declaration). This proceeds with the header-map ballot work regardless of US-PCS.

**US-PCS (assessment below).** The United States Patient Care Summary
(hl7.fhir.us.pcs, formerly "US IPS"), balloting now, derives its Bundle/Composition from
CD-IG 1.1.0, aligns with IPS 2.0 section and document codes, and fills its sections with
US Core (6.1.0 floor) resources. Critically for us, its stated scope EXCLUDES CDA-to-FHIR
mapping guidance and it "does not replace the full capabilities of C-CDA."

## 2. Relationship: complementary by design

US-PCS defines the FHIR-native patient summary document, generated from a US Core record
via the IPS `$summary` operation. This IG defines how C-CDA content becomes US Core / FHIR
resources. The realistic pipeline is sequential, not competing:

    C-CDA document --(this IG's maps)--> US Core resources --($summary)--> US-PCS document

A mapped CCD is a CCD-on-FHIR (Composition.type 34133-9), never itself a US-PCS (IPS
patient-summary document code). The alignment requirement is therefore: resources produced
by our maps must be usable as US-PCS section entries.

## 3. Where US-PCS confirms our assumptions

1. **Medication model.** The US-PCS Medications section (10160-0) is US Core
   MedicationRequest only; its recommended list-inclusion criteria are
   `status = active` with `intent = order | plan`, excluding `doNotPerform = true`.
   This matches the MedMaps US Core model exactly (MedicationRequest-first; intent order
   for entry-level authors, plan otherwise; doNotPerform for negation). Note that our
   mapping of reported medications to intent `plan` (not MedicationStatement) is what
   makes CCD-sourced reported medications visible to a US-PCS medication list.
2. **Header foundation.** Both guides derive document profiles from CD-IG 1.1.0. US-PCS
   header SHALLs (author and custodian required; every section has title, code, narrative;
   unique section codes) are all satisfiable from CCD content, which requires the same.
3. **Section codes.** US-PCS uses the C-CDA section LOINC codes (Problems 11450-4,
   Allergies 48765-2, Medications 10160-0, Results 30954-2, Encounters 46240-8,
   Immunizations 11369-6, Procedures 47519-4). Our section maps carry codes unchanged.
4. **US Core floor.** US-PCS requires US Core >= 6.1.0 and recommends newer; consistent
   with this IG's US Core targeting.
5. **Provenance posture.** US-PCS requires author/custodian at the Composition and defers
   granular provenance to US Core Provenance / Basic Provenance guidance — the same
   division we use (entry-level source elements now, Provenance mappings deferred).

## 4. Assumptions to record (friction, not conflict)

1. **Our US Core negation exceptions have no home in US-PCS.** MedMaps maps a negated
   completed reported medication to MedicationAdministration `not-done` (with performer)
   or MedicationStatement `not-taken` (without). Neither is a US Core profile nor a legal
   US-PCS Medications-section entry. For the summary use case this is moot — negation
   records are excluded from the US-PCS medication list by design — but a CCD whose
   medication content includes these cases cannot be repackaged wholesale as a US-PCS.
   Documented boundary; no model change indicated.
2. **Strict IPS prohibits doNotPerform = true.** Verified in the IPS STU2 profile:
   `MedicationRequest-uv-ips` constrains `doNotPerform` (0..1) with Required Pattern
   `false` — the element may be omitted or false, never true. US-PCS deliberately varies
   from IPS here (US Core MedicationRequest allows true; US-PCS excludes such records
   from the list rather than prohibiting them). Consequence: MedMaps negated-active
   output (MR + doNotPerform=true) is representable in US Core and US-PCS contexts but
   not as an IPS-conformant MedicationRequest. IPS-proper output is out of scope for this
   IG; recorded so nobody assumes transitivity from US Core alignment to IPS conformance.
3. **Document type is not carried into a summary.** Composition.type 34133-9 (CCD) vs.
   the IPS patient-summary document code. Transformation does not turn one document kind
   into the other; only `$summary`-style generation produces a US-PCS.
4. **Must-support inheritance ambiguity is shared.** US-PCS flags an open ballot question:
   CD-IG's inherited MS flags carry a different definition than US Core-style MS. Our
   header profiles inherit the identical ambiguity from the same parent. Watch their
   ballot resolution and align our MS definition language in the header-map ballot.
5. **Missing-data posture.** US-PCS: omit elements whose absence reason is unknown; send
   a data-absent-reason when the reason is known. Our nullFlavor mappings should be
   checked against this posture during the header/domain ballots (expected consistent:
   CDA nullFlavors are "known reasons").

## 5. Recommended actions

1. **FHIR Clinical Documents 1.1 check.** This is verification, not new design. Our header
   profiles already derive from CD-IG 1.1 (D-profile-2) and the bundle example already
   claims its profile (D-profile-3), so most of the check happens automatically when the
   IG Publisher validates a build. Fold the remainder — including the D-profile-3
   first-entry-slice risk — into the header-map ballot work.
2. **Document the US-PCS relationship in this IG.** Add a short narrative page stating
   that the two guides are complementary: US-PCS generates FHIR-native summaries; this IG
   maps C-CDA documents into the US Core resources those summaries draw from. Record the
   three boundaries as decisions: (a) our two negation outputs (Administration not-done,
   Statement not-taken) cannot appear in a US-PCS medication section; (b) IPS-conformant
   output is out of scope, because IPS forbids doNotPerform = true; (c) a mapped CCD never
   becomes a US-PCS — a summary is generated from the resources, not converted from the
   document.
3. **Comment on the US-PCS ballot, which is open now.** A short comment confirming the
   division of labor — summary generation is theirs, CDA mapping is ours — puts the
   complementary relationship on the record in their specification at essentially no cost.
   Optionally raise the shared must-support-inheritance question so their resolution can
   be reused here.
4. **No MedMaps changes.** US-PCS independently corroborates MedicationRequest-first,
   order/plan intent by author, and doNotPerform-based negation.

## Sources

- US-PCS home / scope: https://build.fhir.org/ig/HL7/us-fhir-ps/en/index.html
- US-PCS General Guidance (sections table, med list criteria, MS definition, conformance):
  https://build.fhir.org/ig/HL7/us-fhir-ps/en/general-guidance.html
- US-PCS US Variance Statement: https://build.fhir.org/ig/HL7/us-fhir-ps/en/variance.html
- IPS STU2 MedicationRequest profile (doNotPerform Required Pattern false):
  https://hl7.org/fhir/uv/ips/STU2/StructureDefinition-MedicationRequest-uv-ips.html
- FHIR Clinical Documents STU1.1: https://hl7.org/fhir/uv/fhir-clinical-document/STU1.1/en/
