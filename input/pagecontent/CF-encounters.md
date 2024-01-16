<style>
td, th {
   border: 1px solid black!important;
}
</style>

This page provides a mapping from CDA to FHIR. For the FHIR to CDA mapping, please refer to [Encounters FHIR → CDA](./FC-encounters.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html).

...

### C-CDA to FHIR

|C-CDA¹<br/>[Encounter](https://hl7.org/cda/us/ccda/2024Jan/StructureDefinition-EncounterActivity.html)|FHIR<br/>[Encounter](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-encounter.html)|Transform Steps|
|:----|:----|:----|
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/code |.class<br/>&<br/>.type|If the root code or any translation is from V3 ActCode, it maps to .class. Place all remaining codes in .type.<br/>If the code cannot be converted to V3 ActCode, use the [Data Absent Reason](http://hl7.org/fhir/StructureDefinition/data-absent-reason) extension.<br/>[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/statusCode|.status|**TODO: ConceptMap for CPT->ActCode?**<br/>**Note:** statusCode is optional in C-CDA. If missing, fallback to effectiveTime mapping.
|/effectiveTime|.status|If effectiveTime is a single timestamp or contains a high, status = `"finished"`.<br/>If low is present and high is missing, the status may be `"in-progress"` but implementers should take care to evaluate historical values and interpret as `"finished"` if appropriate.
|/effectiveTime/@value<br/>/effectiveTime/low/@value|.period.start
|/effectiveTime/high/@value|.period.end
|/sdtc:dischargeDispositionCode|.hospialization.dischargeDisposition|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)
|/performer|.participant|*TODO: Mapping Guidance for general performers (Participant vs ParticipantRole vs Organization)*
|/participant[@typeCode="LOC"]|.location
|**[Indication](https://hl7.org/cda/us/ccda/2024Jan/StructureDefinition-Indication.html)**<br/>/entryRelationship[@typeCode="RSON"]/observation|.reasonCode<br/>or<br/>.reasonReference|If the id of the indication references a problem in the document that has been converted to a FHIR resource, populate .reasonReference with a reference to that resource. Otherwise, map observation/value to .reasonCode.<br/>[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)
|**[Encounter Diagnosis](https://hl7.org/cda/us/ccda/2024Jan/StructureDefinition-EncounterDiagnosis.html)**<br/>/entryRelationship/act[code/@code="29308-4"]/observation|.diagnosis.condition|Map similar to [CDA → FHIR Problems](./CF-problems.html).


### Illustrative example
...
### Links to example content
...
### Prior work and Expanded Spreadsheets
...