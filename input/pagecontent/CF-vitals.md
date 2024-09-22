<style>
td, th {
   border: 1px solid black!important;
}
</style>

This page provides a mapping from CDA to FHIR. For the FHIR to CDA mapping, please refer to [Vitals FHIR → CDA](./FC-vitals.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html).

C-CDA vitals are typically grouped into a Vital Signs Organizer to group one or more vitals readings together. This has been mapped to an additional FHIR Observation for the panel of vital signs. This panel contains a `.hasMember` field which references each observation mapped from the original C-CDA Vital Signs Organizer.

### C-CDA Vital Signs Organizer to FHIR Observation Panel

|C-CDA¹<br/>[Vital SignsOrganizer](https://hl7.org/cda/us/ccda/2024Jan/StructureDefinition-VitalSignsOrganizer.html)|FHIR<br/>[Vital Signs Observation](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-vital-signs.html)|Transform Steps|
|:----|:----|:----|
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
||.category|Set to `vital-signs` from [Vital Signs value set](https://hl7.org/fhir/us/core/STU4/ValueSet-us-core-vital-signs.html)
||.code|Set to `85353-1` [CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/statusCode|.status|*TODO: ConceptMap*
|/effectiveTime|.effectiveDateTime<br/>or<br/>.effectivePeriod|If low and high are identical, use effectiveDateTime. If organizer/effectiveTime is missing, use the earliest and latest observation/effectiveTime as the source of the mapping.<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
||.hasMember|Reference to each vital sign observation mapped from CDA

### C-CDA Vital Signs Observation to FHIR Observation

|C-CDA¹<br/>[Vital Sign Observation](https://hl7.org/cda/us/ccda/2024Jan/StructureDefinition-VitalSignObservation.html)|FHIR<br/>[Vital Signs Observation](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-vital-signs.html)|Transform Steps|
|:----|:----|:----|
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
||.category|Set to `vital-signs` from [Vital Signs value set](https://hl7.org/fhir/us/core/STU4/ValueSet-us-core-vital-signs.html)
|/code |.code|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/effectiveTime|.effectiveDateTime<br/>or<br/>.effectivePeriod|Prefer effectiveDateTime<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|value|.valueQuantity|[CDA ↔ FHIR Quantity](mappingGuidance.html#cda--fhir-quantity)
|/interpretationCode|.interpretation|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/methodCode|.method|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/targetSiteCode|.bodySite|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/author||*TODO*
|/referenceRange/observationRange/interpretationCode|**Not Supported**|FHIR expects reference ranges to be "normal" ranges. If C-CDA includes multiple reference ranges, only map the one with interpretationCode = `"N"`.
|/referenceRange/observationRange/value[xsi:type=IVL_PQ]|.referenceRange.low<br/>&<br/>.referenceRange.high|[CDA ↔ FHIR Quantity](mappingGuidance.html#cda--fhir-quantity)
|/referenceRange/observationRange/value[xsi:type=ST]<br/>or<br/>/referenceRange/observationRange/text|.referenceRange.text|

### Illustrative example
...
### Links to example content
...
### Prior work and Expanded Spreadsheets
...