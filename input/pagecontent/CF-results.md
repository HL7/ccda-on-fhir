<style>
td, th {
   border: 1px solid black!important;
}
</style>

This page provides a mapping from CDA to FHIR. For the FHIR to CDA mapping, please refer to [Results FHIR → CDA](./FC-results.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html).

Results in C-CDA are collected into `<organizer>` elements containing one or more result `<observation>` element. This corresponds to one FHIR DiagnosticReport for the `<organizer>` which multiple `.result` references to FHIR Observation resources, one for each CDA `<observation>`.

Observation values are generic - they can be of any CDA type in CDA, and *almost* any DataType in FHIR. In CDA, the type is represented by the `xsi:type` attribute on the `<value>` element. In FHIR, the type is represented by the `.value[x]` element; the `[x]` represents a choice among data types, so `.valueQuantity` represents a quantity data type, `.valueInteger` represents a numeric whole number, etc. Not every CDA type is a 1:1 match for a FHIR type, but significant differences have been included in the tables below.

### C-CDA Organizer to FHIR Diagnostic Report

|C-CDA¹<br/>[Result Organizer](https://hl7.org/cda/us/ccda/2024Jan/StructureDefinition-ResultOrganizer.html)|FHIR<br/>Diagnostic Report ([Lab](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-diagnosticreport-lab.html)) ([Reports](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-diagnosticreport-note.html))|Transform Steps|
|:----|:----|:----|
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/code|.category|*TODO: Describe using LOINC classes to identify category*
|/code |.code|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/statusCode|.status|*TODO: ConceptMap*
|/effectiveTime|.effectiveDateTime<br/>or<br/>.effectivePeriod|If low and high are identical, use effectiveDateTime. If organizer/effectiveTime is missing, use the earliest and latest observation/effectiveTime as the source of the mapping.<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/specimen||*TODO*
|/author||*TODO*
|/component/observation|.result|See following table

### C-CDA Observation to FHIR Observation

|C-CDA¹<br/>[Result Observation](https://hl7.org/cda/us/ccda/2024Jan/StructureDefinition-ResultObservation.html)|FHIR<br/>[Lab Result Observation](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-observation-lab.html)|Transform Steps|
|:----|:----|:----|
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|(parent organizer)|.category|Use category from DiagnosticReport or map /code to a category similarly
|/code |.code|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/statusCode|.status|*TODO: ConceptMap*
|/effectiveTime|.effectiveDateTime<br/>or<br/>.effectivePeriod|Prefer effectiveDateTime<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/value[xsi:type=PQ]|.valueQuantity|[CDA ↔ FHIR Quantity](mappingGuidance.html#cda--fhir-quantity)
|/value[xsi:type=IVL_PQ]|.valueQuantity<br/>or<br/>.valueRange|[Ranges of Physical Quantities](mappingGuidance.html#ranges-of-physical-quantities)
|/value[xsi:type=CD]<br/>(or CE, CV, CO, CS)|.valueCodeableConcept|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/value[xsi:type=INT]|.valueInteger|
|/value[xsi:type=REAL]|.valueQuantity|Leave unit fields empty
|/interpretationCode|.interpretation|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/methodCode|.method|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/targetSiteCode|.bodySite|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/author||*TODO*
|/referenceRange/observationRange/interpretationCode|**Not Supported**|FHIR expects reference ranges to be "normal" ranges. If C-CDA includes multiple reference ranges, only map the one with interpretationCode = `"N"`.
|/referenceRange/observationRange/value[xsi:type=IVL_PQ]|.referenceRange.low<br/>&<br/>.referenceRange.high|
|/referenceRange/observationRange/value[xsi:type=ST]<br/>or<br/>/referenceRange/observationRange/text|.referenceRange.text|


### Illustrative example
...
### Links to example content
...
### Prior work and Expanded Spreadsheets
...