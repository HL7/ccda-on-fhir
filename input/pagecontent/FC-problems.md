<style>
td, th {
   border: 1px solid black!important;
}
</style>

{% include stu-note-cerner.xml %}

This page provides a mapping from FHIR to CDA. For the CDA to FHIR mapping, please refer to [Problems CDA → FHIR](./CF-problems.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html)

### FHIR to C-CDA

|FHIR<br/>[Condition and Health Concern](https://hl7.org/fhir/us/core/StructureDefinition-us-core-condition-problems-health-concerns.html)|C-CDA¹<br/>[Problem observation](https://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.4.html)|Transform Steps|
|:----|:----|:----|
|.identifier|/id|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|.clinicalStatus|(act parent to observation) ../../statusCode<br/>&<br/>**[Problem Status](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.6.html)**<br/>```observation/code@code="33999-4"```<br/>/entryRelationship/observation/value|[FHIR clinicalStatus → CDA Problem Status Observation value](./ConceptMap-FC-ProblemStatus.html)<br/>For more information on how status is managed in Problem Concern Act wrapper, refer to [C-CDA guidance, see 5.2.6.1](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=447)|
|.category|/code<br/>This also affects the C-CDA document section:<br/>**[Problems](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.2.5.1.html)**<br/>**[Health Concerns](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.2.58.html)**<br/>**[Encounters](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.2.22.1.html)**|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>[FHIR category → CDA section](ConceptMap-FC-ProblemCategory.html)|
|.code|/value|**Constraint**: When FHIR concept does not represent negated concept<br/>[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|.code|/value<br/>&<br/>set @negationInd="true"|**Constraint**: When FHIR concept represents negated concept|
|.onsetDateTime|/effectiveTime/low|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|.onsetPeriod.start|/effectiveTime/low|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)<br/>effectiveTime/high should not be mapped from onsetPeriod|
|.abatementDateTime|/effectiveTime/high|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|.recordedDate|**[Date of Diagnosis](https://www.hl7.org/ccdasearch/templates/2.16.840.1.113883.10.20.22.4.502.html)**<br/>```entryRelationship/act/code@code="77975-1"```<br/>/entryRelationship/act/effectiveTime<br/>&<br/>/assignedAuthor/time|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|.recorder|/assignedAuthor|[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|.asserter|/informant|[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|**[Annotation](https://hl7.org/fhir/datatypes.html#Annotation)**<br/>.note|**[Comment Activity](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.64.html)**<br/>```entryRelationship/act/code@code="48767-8"```<br/>/entryRelationship/act/text||

1\. XPath abbrievated for C-CDA Problem observation as: <br/> ```ClinicalDocument/component/structuredBody/component/section[(@code="11450-4")]/entry/act/entryRelationship/observation```


### Illustrative example

#### Links to example content

### Prior work and Expanded Spreadsheets

As reviewed in the methodology, a more comprehensive review was performed via spreadsheets. These spreadsheets have been consolidated and further revised in the tables above but are provided for [reference here](https://github.com/HL7/ccda-on-fhir/blob/Feb2023/mappings/FC/FHIR-CCDA%20Problem-Condition.csv) 