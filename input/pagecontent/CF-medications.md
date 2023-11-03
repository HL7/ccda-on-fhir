<style>
td, th {
   border: 1px solid black!important;
}
</style>

This page provides a mapping from CDA to FHIR. For the FHIR to CDA mapping, please refer to [Medications FHIR → CDA](./FC-medications.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html)

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<blockquote class="stu-note">
		<b>Medications to MedicationRequest</b>
		<p>Medications shown below represent the moodCode="INT" in CDA. For mapping histories of medication use from CDA, no consensus was established. We welcome feedback on this topic. For more information, please see chat.fhir.org and related <a href="https://chat.fhir.org/#narrow/stream/179273-CCDA-.2F-FHIR-mapping-stream/topic/CCDA.20Medication.20moodCode.20EVN.20to.20FHIR">stream</a></p>
	</blockquote>
</div>


**Medication Timing and Frequency**

C-CDA represents both timing (start date / end date) and frequency (when and how often to take) using `<effectiveTime>` elements. The first (represented in XPath as `/effectiveTime[1]`) represents the timing. If it contains `<low>` and/or `<high>` timestamps, this represents the `.timing.repeat.boundsPeriod` information of `MedicationRequest.dosageInstruction`. If, instead, the first effectiveTime only contains a single `@value` attribute, it represents a `.timing.event` dateTime value.

The second `<effectiveTime>` represents the frequency and contains the attribute `@operator="A"` to indicate it is an intersection with the first effectiveTime. It must also have an `@xsi:type` attribute which identifies the type of frequency as `PIVL_TS` (Periodic Interval) or `EIVL_TS` (Episodic Interval). `PIVL_TS` is the most common and represents a frequency corresponding to `.timing.repeat.frequency` / `.timing.repeat.period` / `.timing.repeat.periodUnit`. These relationship of three fields is described in FHIR: "Event occurs frequency times per period". For example: "Every 8 hours" would become 1 / 8 / h (one time every eight hours), while "TID" would become 3 / 1 / d (three times every one day).

`EIVL_TS` represents an event-based frequency, such as "1 hour after meal". The CDA `<event code="xx">` corresponds to FHIR's `.timing.when` and the optional `<offset>` corresponds to `.timing.offset`.

The C-CDA Example Search site maintains a document of [Common Medication Frequencies](http://cdasearch.hl7.org/examples/view/9588687865c0f945a326364a9449321690c7a7ef) which can be cross-referenced with a similar table in FHIR's [Timing Data Type](http://hl7.org/fhir/R4/datatypes.html#Timing) to properly map CDA frequencies to FHIR timing values.


### C-CDA to FHIR

|C-CDA¹<br>[Medication Activity substanceAdministration](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.16.html)|FHIR<br>[MedicationRequest](http://hl7.org/fhir/us/core/StructureDefinition-us-core-medicationrequest.html)|Transform Steps|
|:----|:----|:----|
|@negationInd="true"|set .doNotPerform=true||
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/statusCode|.status|[CDA statusCode → FHIR status](./ConceptMap-CF-MedicationStatus.html)|
|/effectiveTime[1]@value|.dosageInstruction.timing.event|**Constraint**: Use this when effectiveTime@value is populated<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|/effectiveTime[1].low|.dosageInstruction.timing.repeat.boundsPeriod.start|**Constraint**: Use this when effectiveTime@value is not populated<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|/effectiveTime[1].high|.dosageInstruction.timing.repeat.boundsPeriod.end|**Constraint**: Use this when effectiveTime@value is not populated<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|**Periodic Frequency**<br/>```/effectiveTime[operator='A' and xsi:type='PIVL_TS']```<br/>/@institutionSpecified<br/>/period/@value<br/>/period/@unit|.dosageInstruction.timing.repeat.frequency<br/>.dosageInstruction.timing.repeat.period<br/>.dosageInstruction.timing.repeat.periodUnit|Compare:<br/>[C-CDA Common Medication Frequencies](http://cdasearch.hl7.org/examples/view/9588687865c0f945a326364a9449321690c7a7ef) and <br/>[FHIR Timing Data Type](http://hl7.org/fhir/R4/datatypes.html#Timing)
|**Event-Based Timing**<br/>```/effectiveTime[operator='A' and xsi:type='EIVL_TS']```<br/>/event/@code<br/>/offset|.dosageInstruction.timing.repeat.when<br/>.dosageInstruction.timing.repeat.offset|@code vocabulary matches .when<br/>CDA offset must be converted to minutes for FHIR
|/routeCode|.dosageInstruction.route|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/doseQuantity|.dosageInstruction.doseAndRate.doseQuantity||
|/rateQuantity|.dosageInstruction.doseAndRate.rateQuantity||
|/maxDoseQuantity|.dosageInstruction.maxDosePerAdministration||
|/consumable/manufacturedProduct/manufacturedMaterial/code|.medicationCodeableConcept|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/author|.requester<br/>&<br/>**[Provenance](http://hl7.org/fhir/us/core/StructureDefinition-us-core-procedure.html)**|[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|**[Indication](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.19.html)**<br/>```entryRelationship@typeCode="RSON"```<br/>/entryRelationship/observation/value|.reasonCode|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|**[Instruction](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.20.html)**<br/>```entryRelationship@typeCode="SUBJ"```<br/>/entryRelationship/act/code|.dosageInstruction.additionalInstruction|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|**[Free text sig](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.147.html)**<br/>```entryRelationship/substanceAdministration/code@code="76662-6"```<br/>/entryRelationship/substanceAdministration/text|.dosageInstruction.patientInstruction||
|**[Comment Activity](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.64.html)**<br/>```entryRelationship/act/code@code="48767-8"```<br/>/entryRelationship/act/text|**[Annotation](https://hl7.org/fhir/datatypes.html#Annotation)**<br/>.note||

1\. XPath abbrievated for C-CDA Medication Activity as: <br/> ```ClinicalDocument/component/structuredBody/component/section[(@code="10160-0")]/entry/substanceAdministration```


### Illustrative example

{% include examplebutton.html example="CF_medication_example" b_title = "Click on Here To See Highlighted Example" %}

#### Links to example content

The consensus mapping example developed through multiple vendors are available below:
* [Medication CDA example](./Binary-CF-medication.html)
* [MedicationRequest FHIR example](./MedicationRequest-CF-medication.html)

### Prior work and Expanded Spreadsheets

As reviewed in the methodology, a more comprehensive review was performed via spreadsheets. These spreadsheets have been consolidated and further revised in the tables above but are provided for [reference here](https://github.com/HL7/ccda-on-fhir/blob/master/mappings/CF/CCDA-FHIR%20MedicationRequest.csv) 