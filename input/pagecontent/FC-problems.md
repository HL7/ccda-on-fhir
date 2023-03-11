<style>
td, th {
   border: 1px solid black!important;
}
</style>

{% include stu-note.xml %}

This page provides a mapping from FHIR to CDA. For the CDA to FHIR mapping, please refer to [Problems CDA → FHIR](./CF-problems.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html)

### FHIR to C-CDA

|FHIR|CDA|Transform Steps|
|:----|:----|:----|
|identifier|id||
|Condition.clinicalStatus|value||
|Condition.category|/code|Value sets are different but bindings are loose enough|
|Condition.code|/value||
|Condition.code|/value||
|Condition.onsetDateTime|/effectiveTime/low||
|Condition.onsetPeriod.start|effectiveTime/low|Onset.end is not supported|
|Condition.abatementDateTime|effectiveTime/high||
|Condition.recorder||"We cannot assert recorder and record date refer to the same act|
|Condition.asserter|||
|Condition.note|text|a complicated structure|

### Illustrative example

#### Links to example content