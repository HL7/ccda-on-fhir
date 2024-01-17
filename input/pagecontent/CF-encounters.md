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
|/code |.class|Only the V3 ActCode system, which may be present in the root element or any `<translation>`.<br/>Other code systems may map to V3 ActCode (for example CPT codes 99211-99215 map to `AMB`, 99221-99223 to `IMP`, 99281-99285 to `EMER`, etc), but if this mapping is not possible, use the [Data Absent Reason](http://hl7.org/fhir/StructureDefinition/data-absent-reason) extension.|
|/code|.type|The remaining codes besides V3 ActCode<br/>[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)
|/statusCode|.status|*TODO: ActStatus to Encounter Status ConceptMap*<br/>**Note:** statusCode is optional in C-CDA. If missing, fallback to effectiveTime mapping.
|/effectiveTime|.status|If effectiveTime is a single timestamp or contains a high, status = `"finished"`.<br/>If low is present and high is missing, the status may be `"in-progress"` but implementers may choose to evaluate historical values as `"finished"` or `"unknown"` if appropriate.
|/effectiveTime/@value<br/>/effectiveTime/low/@value|.period.start|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/effectiveTime/high/@value|.period.end
|/sdtc:dischargeDispositionCode|.hospialization.dischargeDisposition|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)
|/performer|.participant|*TODO: Mapping Guidance for general performers (Participant vs ParticipantRole vs Organization)*
|/performer/sdtc:functionCode|.participant.type|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)
|/participant[@typeCode="LOC"]|.location
|**[Indication](https://hl7.org/cda/us/ccda/2024Jan/StructureDefinition-Indication.html)**<br/>/entryRelationship[@typeCode="RSON"]/observation|.reasonCode<br/>or<br/>.reasonReference|If the id of the indication references a problem in the document that has been converted to a FHIR resource, populate .reasonReference with a reference to that resource. Otherwise, map observation/value to .reasonCode.<br/>[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)
|**[Encounter Diagnosis](https://hl7.org/cda/us/ccda/2024Jan/StructureDefinition-EncounterDiagnosis.html)**<br/>/entryRelationship/act[code/@code="29308-4"]/observation|.diagnosis.condition|Map similar to [CDA → FHIR Problems](./CF-problems.html).<br/>*TODO: Rename to FHIR Conditions, add a note on that page about where it's coming from; update the category code.*


### Illustrative example
...
### Links to example content
...
### Prior work and Expanded Spreadsheets
...