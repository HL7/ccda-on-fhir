<style>
td, th {
   border: 1px solid black!important;
}
</style>

{% include stu-note-cerner.xml %}

This page provides a mapping from FHIR to CDA. For the CDA to FHIR mapping, please refer to [Medications CDA → FHIR](./CF-medications.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html)

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
|.note|**[Comment Activity](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.64.html)**<br/>```entryRelationship/act/code@code="48767-8"```<br/>/entryRelationship/act/text||
|.dosageInstruction.text<br/>&<br/>.dosageInstruction.patientInstruction|**[Free text sig](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.147.html)**<br/>```entryRelationship/substanceAdministration/code@code="76662-6"```<br/>/entryRelationship/substanceAdministration/text||
|.dosageInstruction.additionalInstruction|**[Instruction](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.20.html)**<br/>```entryRelationship@typeCode="SUBJ"```<br/>/entryRelationship/act/code|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|.dosageInstruction.timing.repeat.boundsPeriod.start|effectiveTime[0]/low|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)v|
|.dosageInstruction.timing.repeat.boundsPeriod.end|effectiveTime[0]/high|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|.dosageInstruction.timing.repeat.frequency<br/>&<br/>.dosageInstruction.timing.repeat.period<br/>&<br/>.dosageInstruction.timing.repeat.periodUnit<br/>|/effectiveTime[1]|This can be complex|
|.dosageInstruction.site|/approachSiteCode|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|.dosageInstruction.route|/routeCode|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|.dosageInstruction.doseAndRate.doseQuantity|/doseQuantity||
|.dosageInstruction.doseAndRate.rateQuantity|/rateQuantity||
|.dosageInstruction.maxDosePerPeriod|/maxDoseQuantity||

1\. XPath abbrievated for C-CDA Medication Activity as: <br/> ```ClinicalDocument/component/structuredBody/component/section[(@code="10160-0")]/entry/substanceAdministration```

### Illustrative example

#### Links to example content