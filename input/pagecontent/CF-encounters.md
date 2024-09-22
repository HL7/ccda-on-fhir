<style>
td, th {
   border: 1px solid black!important;
}
</style>

This page provides a mapping from CDA to FHIR. For the FHIR to CDA mapping, please refer to [Encounters FHIR → CDA](./FC-encounters.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html).

Encounter Activities in the Encounters Section (or elsewhere in the document, such as `<entryReference>` on Clinical Notes) correspond FHIR Encounter resources. If the document itself contains a `componentOf/encompassingEncounter`, this should also be converted to a FHIR Encounter resource. In all cases, when the same encounter is referenced multiple times (such as the `encompassingEncounter` and an Encounter Activity in the Encounters Section containing the same `<id>`), it should be converted to the same FHIR resource.

### C-CDA Encounter to FHIR
<sup>(b)</sup> - indicates element is only present in Encounter Activity in the body of the document<br/><sup>(h)</sup> - indicates element is only present in EncompassingEncounter in the header of the document

|C-CDA¹<br/>[Encounter Activity](https://hl7.org/cda/us/ccda/2024Jan/StructureDefinition-EncounterActivity.html) or [EncompassingEncounter](https://hl7.org/cda/stds/core/2.0.0-sd-snapshot1/StructureDefinition-EncompassingEncounter.html)|FHIR<br/>[Encounter](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-encounter.html)|Transform Steps|
|:----|:----|:----|
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/code |.class|Only the V3 ActCode system, which may be present in the root element or any `<translation>`.<br/>Other code systems may map to V3 ActCode (for example CPT codes 99211-99215 map to `AMB`, 99221-99223 to `IMP`, 99281-99285 to `EMER`, etc), but if this mapping is not possible, use the [Data Absent Reason](http://hl7.org/fhir/StructureDefinition/data-absent-reason) extension.|
|/code|.type|The remaining codes besides V3 ActCode<br/>[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)
|/statusCode <sup>(b)</sup>|.status|*TODO: ActStatus to Encounter Status ConceptMap*<br/>**Note:** statusCode is optional in C-CDA. If missing, fallback to effectiveTime mapping.
|/effectiveTime|.status|If effectiveTime is a single timestamp or contains a high, status = `"finished"`.<br/>If low is present and high is missing, the status may be `"in-progress"` but implementers may choose to evaluate historical values as `"finished"` or `"unknown"` if appropriate.
|/effectiveTime/@value<br/>/effectiveTime/low/@value|.period.start|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/effectiveTime/high/@value|.period.end
|/sdtc:dischargeDispositionCode <sup>(b)</sup><br/>/dischargeDispositionCode <sup>(h)</sup>|.hospialization.dischargeDisposition|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)
|/performer <sup>(b)</sup><br/>/encounterParticipant <sup>(h)</sup>|.participant|*TODO: Mapping Guidance for general performers (Participant vs ParticipantRole vs Organization)*
|/performer/sdtc:functionCode <sup>(b)</sup>|.participant.type|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)
|/participant[@typeCode="LOC"] <sup>(b)</sup><br/>/location <sup>(h)</sup>|.location
|**[Indication](https://hl7.org/cda/us/ccda/2024Jan/StructureDefinition-Indication.html)** <sup>(b)</sup><br/>/entryRelationship[@typeCode="RSON"]/observation|.reasonCode<br/>or<br/>.reasonReference|If the id of the indication references a problem in the document that has been converted to a FHIR resource, populate .reasonReference with a reference to that resource. Otherwise, map observation/value to .reasonCode.<br/>[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)
|**[Encounter Diagnosis](https://hl7.org/cda/us/ccda/2024Jan/StructureDefinition-EncounterDiagnosis.html)** <sup>(b)</sup><br/>/entryRelationship/act[code/@code="29308-4"]/observation|**[Encounter Diagnosis](https://hl7.org/fhir/us/core/StructureDefinition-us-core-condition-encounter-diagnosis.html)**<br/>&<br/>.diagnosis.condition|The observation maps identically to [CDA → FHIR Problems](./CF-problems.html).<br/>Since this is an encounter diagnosis, the `Observation.category` should be set to `encounter-diagnosis`.


### Illustrative example
...
### Links to example content
...
### Prior work and Expanded Spreadsheets
...