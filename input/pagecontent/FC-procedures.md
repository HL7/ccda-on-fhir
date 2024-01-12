<style>
td, th {
   border: 1px solid black!important;
}
</style>

<div style="border: 1px solid maroon; padding: 10px; background-color: #fffbf7; min-height: 160px;">
  <img src="assets/images/dragon.png" width="150" style="float:left; mix-blend-mode: multiply; margin-right: 10px;" title="Here Be Dragons!" height="150">
  <b>FHIR US Core → C-CDA Mapping</b>
  <p class="warning">
    While multiple vendors participated in CDA → FHIR mappings at a connectathon, only a single vendor (Cerner/Oracle) has participated in the FHIR → CDA mapping. We welcome feedback on these mappings which represent less than a multi-vendor consensus at this time.
  </p>
</div>
<br/>

This page provides a mapping from FHIR to CDA. For the CDA to FHIR mapping, please refer to [Procedures CDA → FHIR](./CF-procedures.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html)

### FHIR to C-CDA

|FHIR<br/>[Procedure](http://hl7.org/fhir/us/core/StructureDefinition-us-core-procedure.html)|C-CDA¹<br/>[Procedure Activity procedure](https://hl7.org/cda/us/ccda/2024Jan/StructureDefinition-ProcedureActivityProcedure.html)|Transform Steps|
|:----|:----|:----|
|.identifier|/id|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|.status|/statusCode|[FHIR status → CDA statusCode](./ConceptMap-FC-ProcedureStatus.html)|
|.code|/code|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|.performedDateTime|/effectiveTime/@value|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|.performedPeriod.start|/effectiveTime/low|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|.performedPeriod.end|/effectiveTime/high|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|.performer.actor|/performer|[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|.performer.onBehalfOf|/perfomer/assignedEntity/representedOrganization|[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|.location|**[Service Delivery Location](https://hl7.org/cda/us/ccda/2024Jan/StructureDefinition-ServiceDeliveryLocation.html)**<br/>/participant[@typeCode="LOC"]<br/>/participantRole||
|.reasonCode|**[Indication](https://hl7.org/cda/us/ccda/2024Jan/StructureDefinition-Indication.html)**<br/>/entryRelationship[@typeCode="RSON"]<br/>/observation/value|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|.bodySite|/targetSiteCode|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|**[Annotation](https://hl7.org/fhir/datatypes.html#Annotation)**<br/>.note|**[Comment Activity](https://hl7.org/cda/us/ccda/2024Jan/StructureDefinition-CommentActivity.html)**<br/>entryRelationship/act[code@code="48767-8"]/entryRelationship/act/text||

1\. XPath abbrievated for C-CDA Procedure as: <br/> ClinicalDocument/component/structuredBody/component/section[code/@code="47519-4"]/entry/procedure

### Illustrative example

#### Links to example content

No examples available (of FHIR to C-CDA) at this time.  

### Prior work and Expanded Spreadsheets

As reviewed in the methodology, a more comprehensive review was performed via spreadsheets. These spreadsheets have been consolidated and further revised in the tables above but are provided for [reference here](https://github.com/HL7/ccda-on-fhir/blob/master/mappings/FC/FHIR-CCDA%20Procedure.csv) 