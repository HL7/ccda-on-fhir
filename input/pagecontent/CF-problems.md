<style>
td, th {
   border: 1px solid black!important;
}
</style>

This page provides a mapping from CDA to FHIR. For the FHIR to CDA mapping, please refer to [Problems FHIR → CDA](./FC-problems.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html).

This mapping demonstrates how problems in the C-CDA Problems Section would map to FHIR Conditions. Problems in other sections will map similarly, but may map to different profiles (e.g. US Core Encounter Diagnosis) or have different categories (e.g. health-concern).

Note that C-CDA includes a Concern wrapper act from which status may be read; most of the elements are within the dependent Observation entry.
<br />
<br />
### C-CDA to FHIR

|C-CDA¹<br/>[Problem Concern Act](https://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.3.html)|FHIR<br/>[Condition and Health Concern](https://hl7.org/fhir/us/core/StructureDefinition-us-core-condition-problems-health-concerns.html)|Transform Steps|
|:----|:----|:----|
|From the parent section, use code@code|.category|[CDA section → FHIR category](ConceptMap-CF-ProblemCategory.html)<br/>**Note:** The section of a Problem Observation affects its FHIR category.|
|/statusCode|.clinicalStatus|To be used only if the C-CDA Problem Status Observation is missing.<br/>For more information on how status is managed in Problem Concern Act wrapper, refer to [C-CDA guidance, see 5.2.6.1](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=447)<br/> [Concern Status → Condition Clinical Status](ConceptMap-CF-ConditionClinicalStatus.html)<br/>Also see Status entryRelationship mapping below|
|All of the following are a [Problem observation](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.4.html) nested inside the [Problem Concern act](https://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.3.html). Each observation should become a distinct FHIR Condition resource. <br/>/entryRelationship[@typeCode="SUBJ"]/observation prefix to rows below²|||
|/@negationInd=true|set .verificationStatus="refuted" or adjust .code for negated concept| 
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/code |.category|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/effectiveTime/low|.onsetDateTime|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|/effectiveTime/high|.abatementDateTime|If present (or /@nullFlavor=UNK), the .clinicalStatus must be inactive, remission, or resolved. If C-CDA status fields map to .clinicalStatus of active, relapse, or recurrence, suggest setting .clinicalStatus to inactive for FHIR conformance.<br/>If /@nullFlavor=UNK, populate ._abatementDateTime.extension[DAR](https://build.fhir.org/ig/HL7/fhir-extensions/StructureDefinition-data-absent-reason.html), since in C-CDA, the "UNK" high effectiveTime has been the recommended way to indicate "resolved problem but unknown resolution date."<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|/value|.code|**Constraint:** When CDA negation is absent or false<br/>[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/author|.recorder<br/>&<br/>**[Provenance](http://hl7.org/fhir/us/core/StructureDefinition-us-core-procedure.html)**|[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|**[Problem Status](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.6.html)**<br/>/entryRelationship/observation[code/@code="33999-4"]/value|.clinicalStatus|[CDA Problem Status Observation value → FHIR clinicalStatus](./ConceptMap-CF-ProblemStatus.html)|
|**[Date of Diagnosis](https://www.hl7.org/ccdasearch/templates/2.16.840.1.113883.10.20.22.4.502.html)**<br/>/entryRelationship/act[code/@code="77975-1"]/effectiveTime<br/>&<br/>/assignedAuthor/time|.recordedDate<br/>or<br/>.extension:assertedDate<br/>or<br/>.onsetDate|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)<br/>**Note:** There is no single location in Condition that represents date of diagnosis. See **[US CORE Condition](https://hl7.org/fhir/us/core/StructureDefinition-us-core-condition-problems-health-concerns.html#mandatory-and-must-support-data-elements)** for additional guidance|
|**[Comment Activity](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.64.html)**<br/>/entryRelationship/act[code/@code="48767-8"]/text|**[Annotation](https://hl7.org/fhir/datatypes.html#Annotation)**<br/>.note||

1\. XPath abbrievated for C-CDA Problem Concern act as: <br/> ClinicalDocument/component/structuredBody/component/section[code/@code="11450-4"]/entry/act/

2\. XPath abbrievated for C-CDA Problem Observation as: <br/> ClinicalDocument/component/structuredBody/component/section[code/@code="11450-4"]/entry/act/entryRelationship[@typeCode="SUBJ"]/observation/

When authors or other provenance are recorded in the parent [Problem Concern Act](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.3.html), it is recommended that those data be mapped to the FHIR Condition. 

### Illustrative example

{% include examplebutton.html example="CF_problem_example" b_title = "Click on Here To See Highlighted Example" %}

#### Links to example content

The consensus mapping example developed through multiple vendors are available below:
* [Problem CDA example](./Binary-CF-problem.html)
* [Condition FHIR example](./Condition-CF-problem.html)

### Prior work and Expanded Spreadsheets

As reviewed in the methodology, a more comprehensive review was performed via spreadsheets. These spreadsheets have been consolidated and further revised in the tables above but are provided for [reference here](https://github.com/HL7/ccda-on-fhir/blob/Feb2023/mappings/CF/CCDA-FHIR%20Problem-Condition.csv) 