<style>
td, th {
   border: 1px solid black!important;
}
</style>

This page provides a mapping from CDA to FHIR. For the FHIR to CDA mapping, please refer to [Procedures FHIR → CDA](./FC-procedures.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html)
<br>
C-CDA 2.1 describes three templates for Procedures: Procedure Activity Act, Procedure Activity Observation, and Procedure Activity Procedure. Procedure Activity Procedure is the most complete, containing everything the other two contain except Observation.value, and several properties not contained by the others. The [C-CDA 2.1 Companion Guide](www.hl7.org/ccdasearch/pdfs/Companion_Guide.pdf) points out that "most vendors successfully and exclusively use the . . . Procedure Activity Procedure," and it then specifies this template for "all interventional, non-interventional, surgical, diagnostic, or therapeutic procedures or treatments pertinent to the patient historically at the time the document is generated." 
<br>
For this reason, we provide maps from FHIR to the Procedure Activity Procedure only. From C-CDA, we begin with this most common pattern: additional guidance for the other two templates will be forthcoming.

<br />
<br />
### C-CDA to FHIR

|C-CDA¹<br/>[Procedure Activity procedure](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.14.html)|FHIR<br/>[Procedure](http://hl7.org/fhir/us/core/StructureDefinition-us-core-procedure.html)|Transform Steps|
|:----|:----|:----|
|/@negationInd="true"|set status="not-done"||
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/code|.code|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/statusCode|.status|[CDA statusCode → FHIR status](./ConceptMap-CF-ProcedureStatus.html)|
|/effectiveTime|.performedDateTime|**Constraint**: Use this when effectiveTime@value is populated<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates) <br/> If no effectiveTime content is provided, put the FHIR [`data-absent-reason`] (https://hl7.org/fhir/R4/extension-data-absent-reason.html) extension on the performedDateTime element.|
|/effectiveTime/low|.performedPeriod.start|**Constraint**: Use this when effectiveTime@value is not populated<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/effectiveTime/high|.performedPeriod.end|**Constraint**: Use this when effectiveTime@value is not populated<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/targetSiteCode|.bodySite|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/author|.recorder<br/>&<br/>**[Provenance](http://hl7.org/fhir/us/core/StructureDefinition-us-core-procedure.html)**|<br/>[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance) <br/>If a latest author can be identified, map to .recorder.
<br/>Any author with a time can be put in Provenance.|
|/performer/assignedEntity|.performer|[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|/performer/assignedEntity/representedOrganization|.performer.onBehalfOf|[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|**[Service Delivery Location](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.32.html)**<br/>/participant[@typeCode="LOC"]/participantRole|.location||
|**[Indication](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.19.html)**<br/>/entryRelationship[@typeCode="RSON"]/observation/value|.reasonCode|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|**[Comment Activity](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.64.html)**<br/>/entryRelationship/act[code/@code="48767-8"]/text|**[Annotation](https://hl7.org/fhir/datatypes.html#Annotation)**<br/>.note|

1\. XPath abbrievated for C-CDA Procedure as: <br/> ClinicalDocument/component/structuredBody/component/section[code/@code="47519-4"]/entry/procedure

### Illustrative example

{% include examplebutton.html example="CF_procedure_example" b_title = "Click on Here To See Highlighted Example" %}

#### Links to example content

The consensus mapping example developed through multiple vendors are available below:
* [Procedure CDA example](./Binary-CF-procedure.html)
* [Procedure FHIR example](./Procedure-CF-procedure.html)


### Prior work and Expanded Spreadsheets

As reviewed in the methodology, a more comprehensive review was performed via spreadsheets. These spreadsheets have been consolidated and further revised in the tables above but are provided for [reference here](https://github.com/HL7/ccda-on-fhir/blob/Feb2023/mappings/CF/CCDA-FHIR%20Procedure.csv) 