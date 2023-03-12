<style>
td, th {
   border: 1px solid black!important;
}
</style>

{% include stu-note-cerner.xml %}

This page provides a mapping from FHIR to CDA. For the CDA to FHIR mapping, please refer to [Problems CDA → FHIR](./CF-problems.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html)

### FHIR to C-CDA

|FHIR<br/>[Condition]()|C-CDA¹<br/>[Problem observation]()|Transform Steps|
|:----|:----|:----|
|.identifier|/id|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|.clinicalStatus|/act/statusCode (parent to observation)<br/>&<br/>**[Problem Status]()**<br/>```observation/code@code="33999-4"```<br/>/entryRelationship/observation/value|[FHIR clinicalStatus → CDA Problem Status Observation value](./ConceptMap-FC-ProblemStatus.html)|
|.category|/code<br/>This also affects the C-CDA document section:<br/>**[Problems]()**<br/>**[Health Concerns]()**<br/>**[Encounters]()**|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>[FHIR category → CDA section](ConceptMap-FC-ProblemCategory.html)|
|.code|/value|**Constraint**: When FHIR concept does not represent negated concept<br/>[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|.code|/value<br/>&<br/>set @negationInd="true"|**Constraint**: When FHIR concept represents negated concept|
|.onsetDateTime|/effectiveTime/low|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|.onsetPeriod.start|/effectiveTime/low|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)<br/>effectiveTime/high should not be mapped from onsetPeriod|
|.abatementDateTime|/effectiveTime/high|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|.recordedDate|**[Date of Diagnosis]()**<br/>```entryRelationship/act/code@code="77975-1"```<br/>/entryRelationship/act/effectiveTime<br/>&<br/>/assignedAuthor/time|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|.recorder|/assignedAuthor|[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|.asserter|/informant|[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|.note|**[Comment Activity]()**<br/>```entryRelationship/act/code@code="48767-8"```<br/>/entryRelationship/act/text||

1\. XPath abbrievated for C-CDA Problem observation as: <br/> ```ClinicalDocument/component/structuredBody/component/section[(@code="11450-4")]/entry/act/entryRelationship/observation```


### Illustrative example

#### Links to example content