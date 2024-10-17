### 1.3.0 (Current STU Ballot)
Though feedback is welcome on any part of the IG, only changed content may be voted upon during an STU ballot. The following is a high-level list of changes since version 1.2.0 STU1.

**New Resources / Guidance**
- [C-CDA → FHIR Encounters](CF-encounters.html)
- [C-CDA → FHIR Notes](CF-notes.html)
- [C-CDA → FHIR Participation](CF-participations.html)
- [C-CDA → FHIR Results](CF-results.html)
- [C-CDA → FHIR Social History](CF-social.html)
- [C-CDA → FHIR Vitals](CF-vitals.html)
- [FHIR → Notes](FC-notes.html)
- [GeneralGuidance](mappingGuidance.html)
   - [Missing Maps](mappingGuidance.html#missing-maps)
   - [FHIR Code → CDA Coding](mappingGuidance.html#fhir-code--cda-coding)
   - [Ranges of Physical Quantities](mappingGuidance.html#ranges-of-physical-quantities)

**Updated Mappings**

During the 2023 & 2024 connectathons, several mappings were enhanced. These updates addressed gaps for fields required by C-CDA or USCDI and included non-controversial mappings. For guidance on handling unmapped fields, refer to the [Missing Maps](mappingGuidance.html#missing-maps) section.
- [C-CDA → FHIR Medications](CF-medications.html) - Added `approachSiteCode`, `maxDoseQuantity`, `manufacturer`, `Drug Vehicle`, and`Supply`.
- [C-CDA → FHIR Patient](CF-patient.html) - Added guidance for `raceCode/originalText` as well as mappings for `guardian`, `languageCommunication/modeCode`, and `languageCommunication/proficiencyLevelCode`.
- [C-CDA → Probelms](CF-problems.html) - Added `Age Observation` and `Supporting Observations (e.g. Assessment Scale Observation)`.

### 1.2.0 STU 1 (First Mapping Ballot)
- Mapping Background
- Bidirectional mappings for the following content:
  - Allergies
  - Immunizations
  - Medications
  - Patient
  - Problems
  - Procedures
- Structural Guidance
  - Identifiers
  - Time/Dates
  - Coding/CodeableConcept
  - Quantity
  - Provenance (high-level)
  - Name/Address/Telecom
  - Missing Data
  - Narrative Text