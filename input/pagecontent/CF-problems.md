<style>
td, th {
   border: 1px solid black!important;
}
</style>

This page provides a mapping from CDA to FHIR. For the FHIR to CDA mapping, please refer to [Problems FHIR → CDA](./FC-problems.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html)


### C-CDA to FHIR

|C-CDA¹<br/>[Problem observation]()|FHIR<br/>[Condition]()|Transform Steps|
|:----|:----|:----|
|@negationInd=true|set verificationStatus="refuted" or adjust .code for negated concept| 
|(parent)section@code |.category|[CDA section → FHIR category](ConceptMap-CF-ProblemCategory.html)|
|(parent)act@statusCode|.clinicalStatus|
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/effectiveTime/low|.onsetDateTime|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|/effectiveTime/high|.abatementDateTime|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|/value|.code|**Constraint:** When CDA negation is absent or false<br/>[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/author|**[Provenance]()**|<mark>Not in examples</mark><br/>[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|**[Problem Status]()**<br/>```observation/code@code="33999-4"```<br/>/entryRelationship/observation/value|.clinicalStatus|[CDA Problem Status Observation value → FHIR clinicalStatus](./ConceptMap-CF-ProblemStatus.html)|
|**[Date of Diagnosis]()**<br/>```entryRelationship/act/code@code="77975-1"```<br/>/entryRelationship/act/effectiveTime<br/>&<br/>/assignedAuthor/time|.recordedDate|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|

1\. XPath abbrievated for C-CDA Problem observation as: <br/> ```ClinicalDocument/component/structuredBody/component/section[(@code="11450-4")]/entry/act/entryRelationship/observation```

### Illustrative example

#### Links to example content