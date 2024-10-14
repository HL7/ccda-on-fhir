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

### C-CDA to FHIR (MedicationRequest)

|C-CDA¹<br>[Medication Activity substanceAdministration](https://hl7.org/cda/us/ccda/StructureDefinition-MedicationActivity.html)|FHIR<br>[MedicationRequest](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-medicationrequest.html)|Transform Steps|
|:----|:----|:----|
|/@negationInd="true"|set .doNotPerform=true||
|@moodCode|.intent|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept) <br/>[Mood to intent](ConceptMap-CF-MedActivityMood.html)|
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/statusCode|.status|Pay attention to the definitions of active and completed in the FHIR medicationrequest-status code system. C-CDA may list a medication state as “completed” (i.e. the prescription writing has been completed), but containing dates in the future. This may more align with a FHIR status of “active” than “completed” which indicates all actions implied by the prescription have been completed<br/>[CDA statusCode → FHIR status](./ConceptMap-CF-MedicationStatus.html)|
|/effectiveTime[1]/@value|.dosageInstruction.timing.event|**Constraint**: Use this when effectiveTime@value is populated<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|/effectiveTime[1]/low|.dosageInstruction.timing.repeat.boundsPeriod.start|**Constraint**: Use this when effectiveTime/@value is not populated<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|/effectiveTime[1]/high|.dosageInstruction.timing.repeat.boundsPeriod.end|**Constraint**: Use this when effectiveTime/@value is not populated<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|**Periodic Frequency**<br/>/effectiveTime[operator="A" and xsi:type="PIVL_TS"]<br/>.../@institutionSpecified<br/>.../period/@value<br/>.../period/@unit|.dosageInstruction.timing.repeat.frequency<br/>.dosageInstruction.timing.repeat.period<br/>.dosageInstruction.timing.repeat.periodUnit|Compare:<br/>[C-CDA Common Medication Frequencies](http://cdasearch.hl7.org/examples/view/9588687865c0f945a326364a9449321690c7a7ef) and <br/>[FHIR Timing Data Type](http://hl7.org/fhir/R4/datatypes.html#Timing) to determine whether `frequency` or `period` should be used.<br/>If CDA `period` contains `low` and `high` (e.g. a range like 4-6 hours or 3-4 times a day), map `low` the same as `@value` (e.g. to `repeat.period` or `repeat.frequency`) and map `high` to `repeat.periodMax` or `repeat.frequencyMax` depending on whether it is a frequency or period.
|**Event-Based Timing**<br/>/effectiveTime[operator="A" and xsi:type="EIVL_TS"]<br/>.../event/@code<br/>.../offset|.dosageInstruction.timing.repeat.when<br/>.dosageInstruction.timing.repeat.offset|@code vocabulary matches .when<br/>CDA offset must be converted to minutes for FHIR
|/routeCode|.dosageInstruction.route|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/approachSiteCode|.dosageInstruction.site|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/doseQuantity|.dosageInstruction.doseAndRate.doseQuantity|[CDA ↔ FHIR Quantity](mappingGuidance.html#cda--fhir-quantity)|
|/rateQuantity|.dosageInstruction.doseAndRate.rateQuantity|[CDA ↔ FHIR Quantity](mappingGuidance.html#cda--fhir-quantity)|
|/maxDoseQuantity/numerator|.dosageInstruction.maxDosePerPeriod.numerator|[CDA ↔ FHIR Quantity](mappingGuidance.html#cda--fhir-quantity)|
|/maxDoseQuantity/denominator|.dosageInstruction.maxDosePerPeriod.denominator|[CDA ↔ FHIR Quantity](mappingGuidance.html#cda--fhir-quantity)|
|/administrationUnitCode|Medication.form|[See below](#c-cda-to-fhir-medication)
|/consumable/manufacturedProduct/manufacturedMaterial/code|.medicationCodeableConcept<br/>OR<br/>.medicationReference|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>Only one of these fields may be populated. When generating a Medication resource ([see below](#c-cda-to-fhir-medication)), use the medicationReference field.|
|/consumable/manufacturedProduct/manufacturerOrganization|Medication.manufacturer|[See below](#c-cda-to-fhir-medication)
|/author|.requester<br/>&<br/>**[Provenance](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-procedure.html)**|[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|/author/time|.authoredOn|Earliest, if more than one.<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|**[Drug Vehicle](https://hl7.org/cda/us/ccda/StructureDefinition-DrugVehicle.html)**<br/>/participant[@typeCode="COV"]/playingEntity/code|Medication.ingredient|[See below](#c-cda-to-fhir-medication)
|**[Indication](https://hl7.org/cda/us/ccda/StructureDefinition-Indication.html)**<br/>/entryRelationship[@typeCode="RSON"]/observation/value|.reasonCode|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|**[Free text sig](https://hl7.org/cda/us/ccda/StructureDefinition-MedicationFreeTextSig.html)**<br/>/entryRelationship/substanceAdministration[code/@code="76662-6"]/text|.dosageInstruction.text||
|**[Instruction Activity](https://hl7.org/cda/us/ccda/StructureDefinition-Instruction.html)**<br/>/entryRelationship[@typeCode="SUBJ" and @inversionInd="true"]/act|.dosageInstruction.patientInstruction<br/>.dosageInstruction.additionalInstruction|act/text or act/code/originalText can map to patientInstructions. If coded, can map to additionalInstruction.
|**[Supply Order](https://hl7.org/cda/us/ccda/StructureDefinition-MedicationSupplyOrder.html)**<br/>/entryRelationship[@typeCode="REFR"]/substanceAdministration[@moodCode="INT"]||Note: moodCode=INT means supply, moodCode=EVN means dispense, which is not documented here.
|../effectiveTime/high|.dispenseRequest.period.end|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)<br/>`low` would similarly map to `start`, but only high is called out in C-CDA.|
|../repeatNumber|.dispenseRequest.numberOfRepeatsAllowed|**Caution:** in CDA, repeatNumber indicates total number of dispenses allowed. In FHIR, this field is exclusive of the original dispense. So the `numberOfRepeatsAllowed` will be one less than `repeatNumber`.
|../quantity|.dispenseRequest.quantity|[CDA ↔ FHIR Quantity](mappingGuidance.html#cda--fhir-quantity)
|**[Comment Activity](https://hl7.org/cda/us/ccda/StructureDefinition-CommentActivity.html)**<br/>/entryRelationship/act[code/@code="48767-8"]/text|**[Annotation](https://hl7.org/fhir/datatypes.html#Annotation)**<br/>.note||
|/precondition|.asNeededBoolean = true|The presence of a precondition element indicates asNeededBoolean should be true.<br/>More complex maps may be possible with .asNeededCodeableConcept.|

1\. XPath abbrievated for C-CDA Medication Activity as: <br/> ClinicalDocument/component/structuredBody/component/section[code/@code="10160-0"]/entry/substanceAdministration

### C-CDA to FHIR (Medication)
MedicationRequest (and other resources) may represent the medication as a simple CodeableConcept. But when additional information about the medication needs to be conveyed, a Medication resource should be created instead and referenced by the MedicationRequest resource. Implementers may also opt to always create Medication resources.

|C-CDA¹<br>[Medication Activity substanceAdministration](https://hl7.org/cda/us/ccda/StructureDefinition-MedicationActivity.html)|FHIR<br>[Medication](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-medication.html)|Transform Steps|
|:----|:----|:----|
|/administrationUnitCode|.form|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)
|/consumable/manufacturedProduct/manufacturedMaterial/code|.code|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/consumable/manufacturedProduct/manufacturerOrganization|**[Organization](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-organization.html)**<br/>.manufacturer|
|**[Drug Vehicle](https://hl7.org/cda/us/ccda/StructureDefinition-DrugVehicle.html)**<br/>/participant[@typeCode="COV"]/playingEntity/code|.ingredient.itemCodeableConcept|Set `.isActive = false`<br/>[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)

### Illustrative example

{% include examplebutton.html example="CF_medication_example" b_title = "Click Here To See Highlighted Example" %}

#### Links to example content

The consensus mapping example developed through multiple vendors are available below:
* [Medication CDA example](./Binary-CF-medication.html)
* [MedicationRequest FHIR example](./MedicationRequest-CF-medication.html)

### Prior work and Expanded Spreadsheets

As reviewed in the methodology, a more comprehensive review was performed via spreadsheets. These spreadsheets have been consolidated and further revised in the tables above but are provided for [reference here](https://github.com/HL7/ccda-on-fhir/blob/master/mappings/CF/CCDA-FHIR%20MedicationRequest.csv) 