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

This page provides a mapping from FHIR to CDA. For the CDA to FHIR mapping, please refer to [Medications CDA → FHIR](./CF-medications.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html).

See guidance on timing mappings on [Medications CDA → FHIR](./CF-medications.html).

### FHIR to C-CDA

|FHIR<br>[MedicationRequest](http://hl7.org/fhir/us/core/StructureDefinition-us-core-medicationrequest.html)|C-CDA¹<br>[Medication Activity substanceAdministration](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.16.html)|Transform Steps|
|:----|:----|:----|
|.identifier|/id|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|.status|/status|[FHIR status → CDA statusCode](ConceptMap-FC-MedicationStatus.html)|
|.category|/code|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>code is not generally used in CDA|
|.doNotPerform|@negationInd||
|.medicationCodeableConcept|consumable/manufacturedProduct/manufacturedMaterial/code|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|.medicationReference|(see above)|CDA embeds medication codes directly inside medication activity|
|.authoredOn|/author/time|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|.requester|/assignedAuthor|[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|.performer|/performer|[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|.reasonCode|**[Indication](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.19.html)**<br/>```entryRelationship@typeCode="RSON"```<br/>/entryRelationship/observation/value|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|**[Annotation](https://hl7.org/fhir/datatypes.html#Annotation)**<br/>.note|**[Comment Activity](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.64.html)**<br/>```entryRelationship/act/code@code="48767-8"```<br/>/entryRelationship/act/text||
|.dosageInstruction.text<br/>&<br/>.dosageInstruction.patientInstruction|**[Free text sig](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.147.html)**<br/>```entryRelationship/substanceAdministration/code@code="76662-6"```<br/>/entryRelationship/substanceAdministration/text||
|.dosageInstruction.additionalInstruction|**[Instruction](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.20.html)**<br/>```entryRelationship@typeCode="SUBJ"```<br/>/entryRelationship/act/code|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|.dosageInstruction.timing.repeat.boundsPeriod.start|effectiveTime[1]/low|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)<br/>Note in XPath, `[1]` is the first instance; there is no `[0]` in XPath.|
|.dosageInstruction.timing.repeat.boundsPeriod.end|effectiveTime[1]/high|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|.dosageInstruction.timing.repeat.frequency<br/>&<br/>.dosageInstruction.timing.repeat.period<br/>&<br/>.dosageInstruction.timing.repeat.periodUnit<br/>|```/effectiveTime[2]/...```<br/>/@operator='A'<br/>/@xsi:type='PIVL_TS'<br/>/@institutionSpecified<br/>/period|Compare:<br/>[C-CDA Common Medication Frequencies](http://cdasearch.hl7.org/examples/view/9588687865c0f945a326364a9449321690c7a7ef) and <br/>[FHIR Timing Data Type](http://hl7.org/fhir/R4/datatypes.html#Timing)|
|.dosageInstruction.timing.repeat.when<br/>&<br/>.dosageInstruction.timing.repeat.offset|```/effectiveTime[2]/...```<br/>/@operator='A'<br/>/@xsi:type='EIVL_TS'<br/>/event/@code<br/>/offset|FHIR when matches event/@code vocabulary<br />CDA Offset is a PhysicalQuantity, while FHIR is an integer representing minutes.
|.dosageInstruction.site|/approachSiteCode|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|.dosageInstruction.route|/routeCode|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|.dosageInstruction.doseAndRate.doseQuantity|/doseQuantity||
|.dosageInstruction.doseAndRate.rateQuantity|/rateQuantity||
|.dosageInstruction.maxDosePerPeriod|/maxDoseQuantity||

1\. XPath abbrievated for C-CDA Medication Activity as: <br/> ```ClinicalDocument/component/structuredBody/component/section[(@code="10160-0")]/entry/substanceAdministration```

### Illustrative example

#### Links to example content

Note that these mappings have only been implemented by a single vendor to date. 
* [MedicationRequest FHIR example](./MedicationRequest-FC-medication.html)
* [Medication CDA example](./Binary-FC-medication.html)

### Prior work and Expanded Spreadsheets

As reviewed in the methodology, a more comprehensive review was performed via spreadsheets. These spreadsheets have been consolidated and further revised in the tables above but are provided for [reference here](https://github.com/HL7/ccda-on-fhir/blob/Feb2023/mappings/FC/FHIR-CCDA%20MedicationRequest.csv)