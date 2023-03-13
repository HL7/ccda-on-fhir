<style>
td, th {
   border: 1px solid black!important;
}
</style>

This page provides a mapping from CDA to FHIR. For the FHIR to CDA mapping, please refer to [Procedures FHIR → CDA](./FC-procedures.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html)

### C-CDA to FHIR

|C-CDA¹<br/>[Procedure Activity procedure]()|FHIR<br/>[Procedure]()|Transform Steps|
|:----|:----|:----|
|@negationInd="true"|set status="not-done"||
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/code|.code|[CDA CD ↔ FHIR CodeableConcept]()|
|/statusCode|.status|[CDA statusCode → FHIR status](./ConceptMap-CF-ProcedureStatus.html)|
|/effectiveTime|.performedDateTime|**Constraint**: Use this when effectiveTime@value is populated<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|/effectiveTime/low|.performedPeriod.start|**Constraint**: Use this when effectiveTime@value is not populated<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/effectiveTime/high|.performedPeriod.end|**Constraint**: Use this when effectiveTime@value is not populated<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/targetSiteCode|.bodySite|[CDA CD ↔ FHIR CodeableConcept]()|
|/author|**[Provenance]()**|<mark>Not in examples</mark><br/>[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|/performer/assignedEntity|.performer|[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|/performer/assignedEntity/representedOrganization|.performer.onBehalfOf|[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|**[Service Delivery Location]()**<br/>```participant@typeCode="LOC"```<br/>/participant/participantRole|.location|<mark>Not in examples</mark>|
|/entryRelationship.act.code|.followUp|<mark>Not in examples</mark>|
|**[Indication]()**|.reasonCode|<mark>Not in examples</mark>|

1\. XPath abbrievated for C-CDA Procedure as: <br/> ```ClinicalDocument/component/structuredBody/component/section[(@code="47519-4")]/entry/procedure```

### Illustrative example

#### Links to example content