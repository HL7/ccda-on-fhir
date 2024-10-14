<style>
td, th {
   border: 1px solid black!important;
}
</style>

This page provides a mapping from FHIR to CDA. For the CDA to FHIR mapping, please refer to [Vitals CDA → FHIR](./CF-vitals.html). For guidance on how to read the table below, see [Reading the FHIR ↔ C-CDA Mapping Pages](./mappingGuidance.html).

FHIR Vitals that are grouped into a panel using the memberOf property are mapped to a CDA Vital Signs Organizer. 

### FHIR Observation Panel to C-CDA Vital Signs Organizer

|FHIR<br/>[Vital Signs Observation](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-vital-signs.html)|C-CDA¹<br/>[Vital SignsOrganizer](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-VitalSignsOrganizer.html)|Transform Steps|
|:----|:----|:----|
|.identifier|/id|[FHIR identifier ↔ CDA id](mappingGuidance.html#cda-id--fhir-identifier)|
|.category = `vital-signs` from [Vital Signs value set](https://hl7.org/fhir/us/core/STU4/ValueSet-us-core-vital-signs.html)||
|.code = `85353-1` [CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|||
|.status|/statusCode|*TODO: ConceptMap*
|.effectiveDateTime|/effectiveTime|Use value
|.effectivePeriod|/effectiveTime|Use high and low <br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|.hasMember|component|Reference to each vital sign observation 

### FHIR Observation to C-CDA Vital Signs Observation

|FHIR<br/>[Vital Signs Observation](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-vital-signs.html)|C-CDA¹<br/>[Vital Sign Observation](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-VitalSignObservation.html)|Transform Steps|
|:----|:----|:----|
|.identifier|/id|[FHIR identifier ↔ CDA id](mappingGuidance.html#cda-id--fhir-identifier)|
|.code |/code|[FHIR CodeableConcept ↔ CDA coding ](mappingGuidance.html#fhir-codeableconcept--cda-coding)|
|.status|/statusCode|Set to completed
|.effectiveDateTime|/effectiveTime|Use value
|.effectivePeriod|/effectiveTime|Use high and low <br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|.valueQuantity|/value|If not null <br> [FHIR ↔ CDA Quantities](mappingGuidance.html#cda--fhir-quantity)
|.dataAbsentReason|/value@nullFlavor|If value is null<br>[FHIR DataAbsentReason ↔ CDA NullFlavor](ConceptMap-FC-DataAbsentReasonNullFlavor.html)
|.interpretation|/interpretationCode|[FHIR CodeableConcept ↔ CDA coding](mappingGuidance.html#fhir-codeableconcept--cda-coding)|
|.method|/methodCode|[FHIR CodeableConcept ↔ CDA coding](mappingGuidance.html#fhir-codeableconcept--cda-coding)|
|.bodySite|/targetSiteCode|[FHIR CodeableConcept ↔ CDA coding](mappingGuidance.html#fhir-codeableconcept--cda-coding)|
|||author-provenance: *TODO*


### Illustrative example