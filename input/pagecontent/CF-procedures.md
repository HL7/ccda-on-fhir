<style>
td, th {
   border: 1px solid black!important;
}
</style>

This page provides a mapping from CDA to FHIR. For the FHIR to CDA mapping, please refer to [Procedures FHIR → CDA](./FC-procedures.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html)

### C-CDA to FHIR

|C-CDA¹<br/>[Procedure Activity procedure](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.14.html)|FHIR<br/>[Procedure](http://hl7.org/fhir/us/core/StructureDefinition-us-core-procedure.html)|Transform Steps|
|:----|:----|:----|
|@negationInd="true"|set status="not-done"||
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/code|.code|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/statusCode|.status|[CDA statusCode → FHIR status](./ConceptMap-CF-ProcedureStatus.html)|
|/effectiveTime|.performedDateTime|**Constraint**: Use this when effectiveTime@value is populated<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|/effectiveTime/low|.performedPeriod.start|**Constraint**: Use this when effectiveTime@value is not populated<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/effectiveTime/high|.performedPeriod.end|**Constraint**: Use this when effectiveTime@value is not populated<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/targetSiteCode|.bodySite|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/author|**[Provenance](http://hl7.org/fhir/us/core/StructureDefinition-us-core-procedure.html)**|<mark>Not in examples</mark><br/>[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|/performer/assignedEntity|.performer|[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|/performer/assignedEntity/representedOrganization|.performer.onBehalfOf|[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|**[Service Delivery Location](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.32.html)**<br/>```participant@typeCode="LOC"```<br/>/participant/participantRole|.location|<mark>Not in examples</mark>|
|/entryRelationship.act.code|.followUp|<mark>Not in examples</mark>|
|**[Indication](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.19.html)**|.reasonCode|<mark>Not in examples</mark>|
|**[Comment Activity](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.64.html)**<br/>```entryRelationship/act/code@code="48767-8"```<br/>/entryRelationship/act/text|.note||

1\. XPath abbrievated for C-CDA Procedure as: <br/> ```ClinicalDocument/component/structuredBody/component/section[(@code="47519-4")]/entry/procedure```

### Illustrative example

{% include examplebutton.html example="CF_procedure_example" b_title = "Click on Here To See Highlighted Example" %}

#### Links to example content

The consensus mapping example developed through multiple vendors are available below:
* [Procedure CDA example](./Binary-CF-procedure.html)
* [Procedure FHIR example](./Procedure-CF-procedure.html)


### Prior work and Expanded Spreadsheets

As reviewed in the methodology, a more comprehensive review was performed via spreadsheets. These spreadsheets have been consolidated and further revised in the tables above but are provided for [reference here](https://github.com/HL7/ccda-on-fhir/blob/Feb2023/mappings/CF/CCDA-FHIR%20Procedure.csv) 