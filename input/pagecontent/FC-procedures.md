<style>
td, th {
   border: 1px solid black!important;
}
</style>

{% include stu-note-cerner.xml %}

This page provides a mapping from FHIR to CDA. For the CDA to FHIR mapping, please refer to [Procedures CDA → FHIR](./CF-procedures.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html)

### FHIR to C-CDA

|FHIR<br/>[Procedure]()|C-CDA¹<br/>[Procedure Activity procedure]()|Transform Steps|
|:----|:----|:----|
|.identifier|/id|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|.status|/statusCode|[FHIR status → CDA statusCode](./ConceptMap-FC-ProcedureStatus.html)|
|.code|/code|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|.performedDateTime|/effectiveTime@value|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|.performedPeriod.start|/effectiveTime/low|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|.performedPeriod.end|/effectiveTime/high|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|.performer.actor|/performer|[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|.performer.onBehalfOf|/perfomer/assignedEntity/representedOrganization|[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|.location|**[Service Delivery Location]()**<br/>```participant@typeCode="LOC"```<br/>participant/participantRole||
|.reasonCode|**[Indication]()**<br/>```entryRelationship@typeCode="RSON"```<br/>[/entryRelationship/observation/value]()|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|.bodySite|/targetSiteCode|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|.report|/reference/externalDocument||
|.note|**[Comment Activity]()**<br/>```entryRelationship/act/code@code="48767-8"```<br/>/entryRelationship/act/text||

1\. XPath abbrievated for C-CDA Procedure as: <br/> ```ClinicalDocument/component/structuredBody/component/section[(@code="47519-4")]/entry/procedure```

### Illustrative example

#### Links to example content