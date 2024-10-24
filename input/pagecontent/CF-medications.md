<link rel="stylesheet" href="colors.css">

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

|C-CDA¹<br>[Medication Activity substanceAdministration](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-MedicationActivity.html)|FHIR<br>[MedicationRequest](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-medicationrequest.html)|Transform Steps|
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
|**[Drug Vehicle](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-DrugVehicle.html)**<br/>/participant[@typeCode="CSM"]/playingEntity/code|Medication.ingredient|[See below](#c-cda-to-fhir-medication)
|**[Indication](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-Indication.html)**<br/>/entryRelationship[@typeCode="RSON"]/observation/value|.reasonCode|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|**[Free text sig](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-MedicationFreeTextSig.html)**<br/>/entryRelationship/substanceAdministration[code/@code="76662-6"]/text|.dosageInstruction.text||
|**[Instruction Activity](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-Instruction.html)**<br/>/entryRelationship[@typeCode="SUBJ" and @inversionInd="true"]/act|.dosageInstruction.patientInstruction<br/>.dosageInstruction.additionalInstruction|act/text or act/code/originalText can map to patientInstructions. If coded, can map to additionalInstruction.
|**[Supply Order](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-MedicationSupplyOrder.html)**<br/>/entryRelationship[@typeCode="REFR"]/substanceAdministration[@moodCode="INT"]||Note: moodCode=INT means supply, moodCode=EVN means dispense, which is not documented here.
|../effectiveTime/high|.dispenseRequest.validityPeriod.end|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)<br/>`low` would similarly map to `start`, but only high is called out in C-CDA.|
|../repeatNumber|.dispenseRequest.numberOfRepeatsAllowed|**Caution:** in CDA, repeatNumber indicates total number of dispenses allowed. In FHIR, this field is exclusive of the original dispense. So the `numberOfRepeatsAllowed` will be one less than `repeatNumber`.
|../quantity|.dispenseRequest.quantity|[CDA ↔ FHIR Quantity](mappingGuidance.html#cda--fhir-quantity)
|**[Comment Activity](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-CommentActivity.html)**<br/>/entryRelationship/act[code/@code="48767-8"]/text|**[Annotation](https://hl7.org/fhir/datatypes.html#Annotation)**<br/>.note||
|/precondition|.asNeededBoolean = true|The presence of a precondition element indicates asNeededBoolean should be true.<br/>More complex maps may be possible with .asNeededCodeableConcept.|

1\. XPath abbrievated for C-CDA Medication Activity as: <br/> ClinicalDocument/component/structuredBody/component/section[code/@code="10160-0"]/entry/substanceAdministration

### C-CDA to FHIR (Medication)
MedicationRequest (and other resources) may represent the medication as a simple CodeableConcept. But when additional information about the medication needs to be conveyed, a Medication resource should be created instead and referenced by the MedicationRequest resource. Implementers may also opt to always create Medication resources.

|C-CDA¹<br>[Medication Activity substanceAdministration](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-MedicationActivity.html)|FHIR<br>[Medication](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-medication.html)|Transform Steps|
|:----|:----|:----|
|/administrationUnitCode|.form|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)
|/consumable/manufacturedProduct/manufacturedMaterial/code|.code|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/consumable/manufacturedProduct/manufacturerOrganization|**[Organization](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-organization.html)**<br/>.manufacturer|
|**[Drug Vehicle](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-DrugVehicle.html)**<br/>/participant[@typeCode="CSM"]/playingEntity/code|.ingredient.itemCodeableConcept|Set `.isActive = false`<br/>[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)

### Example

<table><tr><th>CDA Medication Example</th><th>FHIR MedicationRequest and Medication Resources</th></tr>
<tr><td>
<div id="cda" class="border codeArea">&lt;<span class="field">substanceAdministration</span> <span class="attrib">classCode=</span><span class="value">"SBADM"</span> <span class="attrib">moodCode=</span><span class="value">"INT"</span>&gt;
  &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.16"</span> <span class="attrib">extension=</span><span class="value">"2014-06-09"</span>/&gt;
  &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.16"</span>/&gt;
  &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"<mark class="color10">cdbd33f0-6cde-11db-9fe1-0800200c9a66</mark>"</span>/&gt;
  &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"<mark class="color11">active</mark>"</span>/&gt;
  &lt;<span class="field">effectiveTime</span> <span class="attrib">xsi:type=</span><span class="value">"IVL_TS"</span>&gt;
    &lt;<span class="field">low</span> <span class="attrib">value=</span><span class="value">"20120806"</span>/&gt;
    &lt;<span class="field">high</span> <span class="attrib">nullFlavor=</span><span class="value">"UNK"</span>/&gt;
  &lt;/<span class="field">effectiveTime</span>&gt;
  &lt;<span class="field">effectiveTime</span> <span class="attrib">xsi:type=</span><span class="value">"PIVL_TS"</span> <span class="attrib">operator=</span>"A"&gt;
    &lt;<span class="field">period</span> <span class="attrib">xsi:type=</span><span class="value">"IVL_PQ"</span>&gt;
      &lt;<span class="field">low</span> <span class="attrib">value=</span><mark class="color13"><span class="value">"4"</span></mark> unit=<mark class="color14"><span class="value">"h"</span></mark>/&gt;
      &lt;<span class="field">high</span> <span class="attrib">value=</span><mark class="color15"><span class="value">"6"</span></mark> unit=<mark class="color14"><span class="value">"h"</span></mark>/&gt;
    &lt;/<span class="field">period</span>&gt;
  &lt;/<span class="field">effectiveTime</span>&gt;
  &lt;<span class="field">repeatNumber</span> <span class="attrib">value=</span><mark class="color16"><mark class="color40"><span class="value">"1"</span></mark></mark>/&gt;
  &lt;<span class="field">routeCode</span> 
    <span class="attrib">code=</span><span class="value">"<mark class="color17">C38288</mark>"</span> 
    <span class="attrib">codeSystem=</span><span class="value">"<mark class="color18">2.16.840.1.113883.3.26.1.1</mark>"</span> 
    <span class="attrib">codeSystemName=</span><span class="value">"NCI Thesaurus"</span> 
    <span class="attrib">displayName=</span><span class="value">"<mark class="color19">Oral Route of Administration</mark>"</span>/&gt;
  &lt;<span class="field">doseQuantity</span> <span class="attrib">value=</span><mark class="color16"><mark class="color40"><span class="value">"1"</span></mark></mark>/&gt;
  &lt;<span class="field">maxDoseQuantity</span> &gt;
    &lt;<span class="field">numerator</span> <span class="attrib">value=</span><mark class="color15"><span class="value">"6"</span></mark> <span class="attrib">unit=</span><span class="value">"<mark class="color20">{spray}</mark>"</span> /&gt;
    &lt;<span class="field">denominator</span> <span class="attrib">value=</span><mark class="color16"><mark class="color40"><span class="value">"1"</span></mark></mark> <span class="attrib">unit=</span><span class="value">"<mark class="color21">{day}</mark>"</span> /&gt;
  &lt;/<span class="field">maxDoseQuantity</span>&gt;
  &lt;<span class="field">administrationUnitCode</span> 
    <span class="attrib">code=</span><span class="value">"<mark class="color22">C48501</mark>"</span> 
    <span class="attrib">codeSystem=</span><span class="value">"<mark class="color18">2.16.840.1.113883.3.26.1.1</mark>"</span> 
    <span class="attrib">codeSystemName=</span><span class="value">"National Cancer Institute (NCI) Thesaurus"</span> 
    <span class="attrib">displayName=</span><span class="value">"<mark class="color23">Inhalation dosing unit</mark>"</span>/&gt;
  &lt;<span class="field">consumable</span>&gt;
    &lt;<span class="field">manufacturedProduct</span> <span class="attrib">classCode=</span><span class="value">"MANU"</span>&gt;
      &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.23"</span> <span class="attrib">extension=</span><span class="value">"2014-06-09"</span>/&gt;
      &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.23"</span>/&gt;
      &lt;<span class="field">manufacturedMaterial</span>&gt;
        &lt;<span class="field">code</span> 
          <span class="attrib">code=</span><span class="value">"<mark class="color24">1190220</mark>"</span> 
          <span class="attrib">codeSystem=</span><span class="value">"<mark class="color25">2.16.840.1.113883.6.88</mark>"</span> 
          <span class="attrib">codeSystemName=</span><span class="value">"<mark class="color25">RxNorm</mark>"</span> 
          <span class="attrib">displayName=</span><span class="value">"<mark class="color26">ACTUAT albuterol 0.1 MG/ACTUAT ... Spray</mark>"</span>/&gt;
      &lt;/<span class="field">manufacturedMaterial</span>&gt;
      &lt;<span class="field">manufacturerOrganization</span>&gt;
        &lt;<span class="field">name</span>&gt;<mark class="color27">Good Vaccines Inc</mark>&lt;/<span class="field">name</span>&gt;
      &lt;/<span class="field">manufacturerOrganization</span>&gt;
    &lt;/<span class="field">manufacturedProduct</span>&gt;
  &lt;/<span class="field">consumable</span>&gt;
  &lt;<span class="field">author</span>&gt;
    <span class="comment">&lt;!-- Time the author noted that patient is on medication --&gt;</span>
    &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.119"</span>/&gt;
    &lt;<span class="field">time</span> <span class="attrib">value=</span><span class="value">"<mark class="color28">201309111603-0700</mark>"</span>/&gt;
    &lt;<span class="field">assignedAuthor</span>&gt;
      <span class="comment">&lt;!-- Author maps to Provenance
          not included in this example --&gt;</span>
    &lt;/<span class="field">assignedAuthor</span>&gt;
  &lt;/<span class="field">author</span>&gt;
  &lt;<span class="field">participant</span> <span class="attrib">typeCode=</span><span class="value">"CSM"</span>&gt;
    &lt;<span class="field">participantRole</span> <span class="attrib">classCode=</span><span class="value">"MANU"</span>&gt;
      &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.24"</span>/&gt;
      &lt;<span class="field">code</span> <span class="attrib">code=</span><span class="value">"412307009"</span> 
        <span class="attrib">displayName=</span><span class="value">"Drug vehicle"</span> 
        <span class="attrib">codeSystem=</span><span class="value">"<mark class="color29">2.16.840.1.113883.6.96</mark>"</span>/&gt;
      &lt;<span class="field">playingEntity</span> <span class="attrib">classCode=</span><span class="value">"MMAT"</span>&gt;
        &lt;<span class="field">code</span> <span class="attrib">code=</span><span class="value">"<mark class="color30">387390002</mark>"</span> 
          <span class="attrib">displayName=</span><span class="value">"<mark class="color31">sodium chloride</mark>"</span> 
          <span class="attrib">codeSystem=</span><span class="value">"<mark class="color29">2.16.840.1.113883.6.96</mark>"</span> 
          <span class="attrib">codeSystemName=</span><span class="value">"<mark class="color29">SNOMED</mark>"</span>/&gt;
        &lt;<span class="field">name</span>&gt;<mark class="color31">sodium chloride</mark>&lt;/<span class="field">name</span>&gt;
      &lt;/<span class="field">playingEntity</span>&gt;
    &lt;/<span class="field">participantRole</span>&gt;
  &lt;/<span class="field">participant</span>&gt;
  &lt;<span class="field">entryRelationship</span> <span class="attrib">typeCode=</span><span class="value">"COMP"</span>&gt;
    <span class="comment">&lt;!-- Medication Free Text SIG --&gt;</span>
    &lt;<span class="field">substanceAdministration</span> <span class="attrib">classCode=</span><span class="value">"SBADM"</span> <span class="attrib">moodCode=</span><span class="value">"EVN"</span>&gt;
      &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.147"</span>/&gt;
      &lt;<span class="field">code</span> <span class="attrib">code=</span><span class="value">"76662-6"</span> <span class="attrib">codeSystem=</span><span class="value">"2.16.840.1.113883.6.1"</span>/&gt;
      &lt;<span class="field">text</span>&gt;
        <span class="comment">&lt;!-- Resolves to: <mark class="color39">2 puffs every 4-6 hours as needed</mark> --&gt;</span>
        &lt;<span class="field">reference</span> <span class="attrib">value=</span><span class="value">"#MedicationSig_PRN_222222"</span>/&gt;
      &lt;/<span class="field">text</span>&gt;
      &lt;<span class="field">consumable</span>&gt;
        &lt;<span class="field">manufacturedProduct</span>&gt;
          &lt;<span class="field">manufacturedLabeledDrug</span> <span class="attrib">nullFlavor=</span><span class="value">"NA"</span>/&gt;
        &lt;/<span class="field">manufacturedProduct</span>&gt;
      &lt;/<span class="field">consumable</span>&gt;
    &lt;/<span class="field">substanceAdministration</span>&gt;
  &lt;/<span class="field">entryRelationship</span>&gt;
  &lt;<span class="field">entryRelationship</span> <span class="attrib">typeCode=</span><span class="value">"RSON"</span>&gt;
    &lt;<span class="field">observation</span> <span class="attrib">classCode=</span><span class="value">"OBS"</span> <span class="attrib">moodCode=</span><span class="value">"EVN"</span>&gt;
      <span class="comment">&lt;!-- Indication (V2) --&gt;</span>
      &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.19"</span> <span class="attrib">extension=</span><span class="value">"2014-06-09"</span>/&gt;
      &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.19"</span>/&gt;
      &lt;<span class="field">id</span> <span class="attrib">extension=</span><span class="value">"44"</span> <span class="attrib">root=</span><span class="value">"1.3.6.1.4.1.22812.3.99930.3.4.1.3"</span>/&gt;
      &lt;<span class="field">code</span> 
        <span class="attrib">codeSystem=</span><span class="value">"<mark class="color29">2.16.840.1.113883.6.96</mark>"</span> 
        <span class="attrib">codeSystemName=</span><span class="value">"SNOMED CT"</span> 
        <span class="attrib">code=</span><span class="value">"404684003"</span> 
        <span class="attrib">displayName=</span><span class="value">"Clinical finding"</span>/&gt;
      &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"completed"</span>/&gt;
      &lt;<span class="field">effectiveTime</span>&gt;
        &lt;<span class="field">low</span> <span class="attrib">nullFlavor=</span><span class="value">"NI"</span>/&gt;
      &lt;/<span class="field">effectiveTime</span>&gt;
      &lt;<span class="field">value</span> <span class="attrib">xsi:type=</span><span class="value">"CD"</span> 
        <span class="attrib">code=</span><span class="value">"<mark class="color32">56018004</mark>"</span> 
        <span class="attrib">codeSystem=</span><span class="value">"<mark class="color29">2.16.840.1.113883.6.96</mark>"</span> 
        <span class="attrib">displayName=</span><span class="value">"<mark class="color33">wheezing</mark>"</span> /&gt;
    &lt;/<span class="field">observation</span>&gt;
  &lt;/<span class="field">entryRelationship</span>&gt;
  &lt;<span class="field">entryRelationship</span> <span class="attrib">typeCode=</span><span class="value">"SUBJ"</span> <span class="attrib">inversionInd=</span><span class="value">"true"</span>&gt;
    &lt;<span class="field">act</span> <span class="attrib">classCode=</span><span class="value">"ACT"</span> <span class="attrib">moodCode=</span><span class="value">"INT"</span>&gt;
      <span class="comment">&lt;!-- Instruction (V2) --&gt;</span>
      &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.20"</span> <span class="attrib">extension=</span><span class="value">"2014-06-09"</span>/&gt;
      &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.20"</span>/&gt;
      &lt;<span class="field">code</span> <span class="attrib">code=</span><span class="value">"<mark class="color34">1153465004</mark>"</span> 
        <span class="attrib">displayName=</span><span class="value">"<mark class="color35">Education about overdosing</mark>"</span> 
        <span class="attrib">codeSystem=</span><span class="value">"<mark class="color29">2.16.840.1.113883.6.96</mark>"</span> 
        <span class="attrib">codeSystemName=</span><span class="value">"<mark class="color29"><mark class="color29">SNOMED</mark> CT</mark>"</span>/&gt;
      &lt;<span class="field">text</span>&gt;<mark class="color36">Do not overtake</mark>&lt;/<span class="field">text</span>&gt;
      &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"completed"</span>/&gt;
    &lt;/<span class="field">act</span>&gt;
  &lt;/<span class="field">entryRelationship</span>&gt;
  &lt;<span class="field">entryRelationship</span> <span class="attrib">typeCode=</span><span class="value">"REFR"</span>&gt;
    &lt;<span class="field">supply</span> <span class="attrib">classCode=</span><span class="value">"SPLY"</span> <span class="attrib">moodCode=</span><span class="value">"EVN"</span>&gt;
      &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.18"</span> <span class="attrib">extension=</span><span class="value">"2014-06-09"</span> /&gt;
      &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.18"</span>/&gt;
      &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"1.2.3.4.56789.1"</span> <span class="attrib">extension=</span><span class="value">"cb734647-fc99-424c-a864-7e3cda82e704"</span> /&gt;
      &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"completed"</span> /&gt;
      &lt;<span class="field">effectiveTime</span>&gt;
        &lt;<span class="field">high</span> <span class="attrib">value=</span><span class="value">"<mark class="color37">20121106</mark>"</span> /&gt;
      &lt;/<span class="field">effectiveTime</span>&gt;
      <span class="comment">&lt;!-- Note in FHIR this is one less, so: 1 --&gt;</span>
      &lt;<span class="field">repeatNumber</span> <span class="attrib">value=</span><span class="value">"2"</span> /&gt;
      &lt;<span class="field">quantity</span> <span class="attrib">value=</span><mark class="color38"><span class="value">"3"</span></mark> /&gt;
      &lt;<span class="field">product</span>&gt;
        &lt;<span class="field">manufacturedProduct</span> <span class="attrib">classCode=</span><span class="value">"MANU"</span>&gt;
          &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.23"</span> <span class="attrib">extension=</span><span class="value">"2014-06-09"</span>/&gt;
          &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.23"</span>/&gt;
          &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"2a620155-9d11-439e-92b3-5d9815ff4ee8"</span>/&gt;
          &lt;<span class="field">manufacturedMaterial</span>&gt;
            &lt;<span class="field">code</span> 
            <span class="attrib">code=</span><span class="value">"<mark class="color24">1190220</mark>"</span> 
            <span class="attrib">codeSystem=</span><span class="value">"<mark class="color25">2.16.840.1.113883.6.88</mark>"</span> 
            <span class="attrib">codeSystemName=</span><span class="value">"<mark class="color25">RxNorm</mark>"</span> 
            <span class="attrib">displayName=</span><span class="value">"<mark class="color26">ACTUAT albuterol 0.1 MG/ACTUAT ... Spray</mark>"</span>/&gt;
          &lt;/<span class="field">manufacturedMaterial</span>&gt;
        &lt;/<span class="field">manufacturedProduct</span>&gt;
      &lt;/<span class="field">product</span>&gt;
    &lt;/<span class="field">supply</span>&gt;
  &lt;/<span class="field">entryRelationship</span>&gt;
  &lt;<span class="field">precondition</span> <span class="attrib">typeCode=</span><span class="value">"PRCN"</span>&gt;
    &lt;<span class="field">criterion</span>&gt;
      &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.25"</span> <span class="attrib">extension=</span><span class="value">"2014-06-09"</span> /&gt;
      &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.25"</span>/&gt;
      &lt;<span class="field">code</span> <span class="attrib">code=</span><span class="value">"ASSERTION"</span> <span class="attrib">codeSystem=</span><span class="value">"2.16.840.1.113883.5.4"</span> /&gt;
      &lt;<span class="field">value</span> <span class="attrib">xsi:type=</span><span class="value">"CD"</span> 
        <span class="attrib">code=</span><span class="value">"<mark class="color32">56018004</mark>"</span> 
        <span class="attrib">codeSystem=</span><span class="value">"<mark class="color29">2.16.840.1.113883.6.96</mark>"</span> 
        <span class="attrib">displayName=</span><span class="value">"<mark class="color33">Wheezing</mark>"</span> /&gt;
    &lt;/<span class="field">criterion</span>&gt;
  &lt;/<span class="field">precondition</span>&gt;
&lt;/<span class="field">substanceAdministration</span>&gt;</div>
</td><td>
<b>Note:</b> The following shows a MedicationRequest resource with a Medication resource embedded in its contained property. This was done for ease of creating a single, visual, highlighted example, but implementers may choose to create separate, external resources according to their own policy.

<div id="fhir" class="border codeArea">{
  "<span class="field">resourceType</span>": "<span class="value">MedicationRequest</span>",
  "<span class="field">id</span>": "<span class="value">7fc60296-0667-4a44-86e5-4c432403532e</span>",
  "<span class="field">identifier</span>": [
    {
      "<span class="field">system</span>": "<span class="value">urn:ietf:rfc:3986</span>",
      "<span class="field">value</span>": "<span class="value">urn:uuid:<mark class="color10">cdbd33f0-6cde-11db-9fe1-0800200c9a66</mark></span>"
    }
  ],
  "<span class="field">status</span>": "<span class="value"><mark class="color11">active</mark></span>",
  "<span class="field">intent</span>": "<span class="value">plan</span>",
  "<span class="field">medicationReference</span>": {
    "<span class="field">reference</span>": "<span class="value">#containedMed</span>"
  },
  <span class="comment">/* Only one of these can be sent. 
     If not including a Medication resource
     the code can just be sent in codeableConcept
  "<span class="field">medicationCodeableConcept</span>": {
    "<span class="field">coding</span>": [
      {
        "<span class="field">system</span>": "<span class="value"><mark class="color25">http://www.nlm.nih.gov/research/umls/rxnorm</mark></span>",
        "<span class="field">code</span>": "<span class="value"><mark class="color24">1190220</mark></span>",
        "<span class="field">display</span>": "<span class="value"><mark class="color26">ACTUAT albuterol 0.1 MG/ACTUAT ... Spray</mark></span>"
      }
    ]
  }, */
  </span>"<span class="field">subject</span>": {
    "<span class="field">reference</span>": "<span class="value">Patient/18025725</span>"
  },
  "<span class="field">authoredOn</span>": "<span class="value"><mark class="color28">2013-09-11T16:03:00-07:00</mark></span>",
  "<span class="field">reasonCode</span>": [
    {
      "<span class="field">coding</span>": [
        {
          "<span class="field">system</span>": "<span class="value"><mark class="color29">http://snomed.info/sct</mark></span>",
          "<span class="field">code</span>": "<span class="value"><mark class="color32">56018004</mark></span>",
          "<span class="field">display</span>": "<span class="value"><mark class="color33">wheezing</mark></span>"
        }
      ]
    }
  ],
  "<span class="field">dosageInstruction</span>": [
    {
      "<span class="field">text</span>": "<span class="value"><mark class="color39">2 puffs every 4-6 hours as needed</mark></span>",
      "<span class="field">patientInstruction</span>": "<span class="value"><mark class="color36">Do not overtake</mark></span>",
      "<span class="field">additionalInstruction</span>": [
        {
          "<span class="field">coding</span>": [
            {
              "<span class="field">system</span>": "<span class="value"><mark class="color29">http://snomed.info/sct</mark></span>",
              "<span class="field">code</span>": "<span class="value"><mark class="color34">1153465004</mark></span>",
              "<span class="field">display</span>": "<span class="value"><mark class="color35">Education about overdosing</mark></span>"
            }
          ]
        }
      ],
      "<span class="field">timing</span>": {
        "<span class="field">period</span>": <mark class="color13">4,</mark>
        "<span class="field">periodMax</span>": <mark class="color15">6,</mark>
        "<span class="field">periodUnit</span>": <mark class="color14">"h"</mark>
      },
      "<span class="field">asNeededCodeableConcept</span>": {
        "<span class="field">coding</span>": [
          {
            "<span class="field">system</span>": "<span class="value"><mark class="color29">http://snomed.info/sct</mark></span>",
            "<span class="field">code</span>": "<span class="value"><mark class="color32">56018004</mark></span>",
            "<span class="field">display</span>": "<span class="value"><mark class="color33">wheezing</mark></span>"
          }
        ]
      },
      "<span class="field">route</span>": {
        "<span class="field">coding</span>": [
          {
            "<span class="field">system</span>": "<span class="value">http://ncithesaurus-stage.nci.nih.gov</span>",
            "<span class="field">code</span>": "<span class="value"><mark class="color17">C38288</mark></span>",
            "<span class="field">display</span>": "<span class="value"><mark class="color19">Oral Route of Administration</mark></span>"
          }
        ]
      },
      "<span class="field">doseAndRate</span>": [
        {
          "<span class="field">doseQuantity</span>": {
            "<span class="field">value</span>": <mark class="color16"><mark class="color40">1
</mark></mark>          }
        }
      ],
      "<span class="field">maxDosePerPeriod</span>": {
        "<span class="field">numerator</span>": {
          "<span class="field">value</span>": <span class="value">6,</span>
          "<span class="field">unit</span>": "<span class="value"><mark class="color20">{spray}</mark></span>",
          "<span class="field">code</span>": "<span class="value"><mark class="color20">{spray}</mark></span>",
          "<span class="field">system</span>": "<span class="value">http://unitsofmeasure.org</span>"
        },
        "<span class="field">denominator</span>": {
          "<span class="field">value</span>": <span class="value">1,</span>
          "<span class="field">unit</span>": "<span class="value"><mark class="color21">{day}</mark></span>",
          "<span class="field">code</span>": "<span class="value"><mark class="color21">{day}</mark></span>",
          "<span class="field">system</span>": "<span class="value">http://unitsofmeasure.org</span>"
        }
      }
    }
  ],
  "<span class="field">dispenseRequest</span>": {
    "<span class="field">numberOfRepeatsAllowed</span>": <span class="value">1,</span>
    "<span class="field">validityPeriod</span>": {
      "<span class="field">end</span>": "<span class="value"><mark class="color37">2012-11-06</mark></span>"
    },
    "<span class="field">quantity</span>": {
      "<span class="field">value</span>": <mark class="color38">3
</mark>    }
  },
  "<span class="field">contained</span>": [{
    "<span class="field">resourceType</span>": "<span class="value">Medication</span>",
    "<span class="field">id</span>": "<span class="value">containedMed</span>",
    "<span class="field">code</span>": {
      "<span class="field">coding</span>": [{
        "<span class="field">system</span>": "<span class="value"><mark class="color25">http://www.nlm.nih.gov/research/umls/rxnorm</mark></span>",
        "<span class="field">code</span>": "<span class="value"><mark class="color24">1190220</mark></span>",
        "<span class="field">display</span>": "<span class="value"><mark class="color26">ACTUAT albuterol 0.1 MG/ACTUAT ... Spray</mark></span>"
      }]
    },
    "<span class="field">form</span>": {
      "<span class="field">coding</span>": [
        {
          "<span class="field">system</span>": "<span class="value"><mark class="color18">http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl</mark></span>",
          "<span class="field">code</span>": "<span class="value"><mark class="color22">C48501</mark></span>",
          "<span class="field">display</span>": "<span class="value"><mark class="color23">Inhalation dosing unit</mark></span>"
        }
      ]
    },
    "<span class="field">manufacturer</span>": {
      <span class="comment">// If more details exist, would map to Organization resource</span>
      "<span class="field">display</span>": "<span class="value"><mark class="color27">Good Vaccines Inc</mark></span>"
    },
    "<span class="field">ingredient</span>": [{
      "<span class="field">itemCodeableConcept</span>": {
        "<span class="field">coding</span>": [
          {
            "<span class="field">system</span>": "<span class="value"><mark class="color29">http://snomed.info/sct</mark></span>",
            "<span class="field">code</span>": "<span class="value"><mark class="color30">387390002</mark></span>",
            "<span class="field">display</span>": "<span class="value"><mark class="color31">sodium chloride</mark></span>"
          }
        ]
      }
    }]
  }]
}</div>
</td></tr></table>

#### Links to example content

The consensus mapping example developed through multiple vendors are available below:
* [Medication CDA example](./Binary-CF-medication.html)
* [MedicationRequest FHIR example](./MedicationRequest-CF-medication.html)