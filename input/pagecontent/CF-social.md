<link rel="stylesheet" href="colors.css">

This page provides a mapping from CDA to FHIR. <!-- For the FHIR to CDA mapping, please refer to [Results FHIR → CDA](./FC-results.html). --> For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html).

Social History is a category of several templates in C-CDA and several profiles in US Core. At a high-level, mappings between CDA `<observation>` acts and FHIR Observation resources are similar and are represented by the top table. Differences are documented on the proceeding tables.

Note that some observations in C-CDA map to extensions on the patient or elsewhere in FHIR. In these cases, a FHIR Observation should not be created; instead, the corresponding extension should be used.

- [C-CDA Birth Sex Observation](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-BirthSexObservation.html) ↔ [US Core Birth Sex Extension](https://www.hl7.org/fhir/us/core/StructureDefinition-us-core-birthsex.html)
- [C-CDA Gender Identity Observation](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-GenderIdentityObservation.html) ↔ [US Core Gender Identity Extension](https://www.hl7.org/fhir/us/core/StructureDefinition-us-core-genderIdentity.html)
- [C-CDA Sex Observation](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-SexObservation.html) ↔ [US Core Sex Extension](https://www.hl7.org/fhir/us/core/StructureDefinition-us-core-sex.html)
- [C-CDA Tribal Affiliation Observation](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-TribalAffiliationObservation.html) ↔ [US Core Tribal Affiliation Extension](https://www.hl7.org/fhir/us/core/StructureDefinition-us-core-tribal-affiliation.html)

### C-CDA Social History Observation to FHIR Observation
This maps to US Core version 6's Simple Observation. Previous versions of US Core did not define a generic observation, but the following guidance can still be used to create a generic FHIR observation regardless of the version of US Core being targeted.

|C-CDA<br/>[Social History Observation](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-SocialHistoryObservation.html)|FHIR<br/>[Simple Observation](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-simple-observation.html)|Transform Steps|
|:----|:----|:----|
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
||.category|Set to `social-history` from [Observation Category Codes](https://build.fhir.org/ig/HL7/UTG/CodeSystem-observation-category.html)<br/>Additional SDOH categories may be set as well, depending on the code of the observation. 
|/code |.code|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/statusCode|.status|[CDA Result Status → FHIR Observation Status](./ConceptMap-CF-ResultStatus.html)
|/effectiveTime|.effectiveDateTime<br/>or<br/>.effectivePeriod|Prefer effectiveDateTime<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/value[xsi:type=PQ]|.valueQuantity|[CDA ↔ FHIR Quantity](mappingGuidance.html#cda--fhir-quantity)
|/value[xsi:type=IVL_PQ]|.valueQuantity<br/>or<br/>.valueRange|[Ranges of Physical Quantities](mappingGuidance.html#ranges-of-physical-quantities)
|/value[xsi:type=CD]<br/>(or CE, CV, CO, CS)|.valueCodeableConcept|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/value[xsi:type=INT]|.valueInteger|
|/value[xsi:type=REAL]|.valueQuantity|Leave unit fields empty
|/value[xsi:type=ST]|.valueString|

Additional fields, such as `.interpretationCode`, `.referenceRange`, `.performer` are not documented in C-CDA but can be mapped in the same manner as [Results](./CF-results.html).

### C-CDA Smoking Status / Tobacco Use to FHIR Observation
In C-CDA 3.0, the Smoking Status - MU and Tobacco Use templates were merged into a single template to better match US Core's Smoking Status template.

|C-CDA<br/>[Smoking Status - MU](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-SmokingStatusMeaningfulUse.html) (Deprecated)<br/>[Tobacco Use](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-TobaccoUse.html) (Decprecated)<br/>[Smoking Status](https://build.fhir.org/ig/HL7/CDA-ccda/StructureDefinition-SmokingStatus.html) (C-CDA 3.0)²|FHIR<br/>[Smoking Status Observation](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-smokingstatus.html)|Transform Steps|
|:----|:----|:----|
|/code|.code|Prior to US Core 7, the code should be `72166-2 (Tobacco smoking status NCIS)`, but this is an extensible value set.<br/>In US Core 7, the value set remains extensible, but contains the same 4 concepts allowed in the C-CDA R3.0's Smoking Status value set.
|/effectiveTime|.effectiveDateTime<br/>or<br/>.effectivePeriod|Smoking Status - MU required a timestamp; Tobacco Use required a time range; Smoking Status (3.0) combines the two templates into one and allows for either.

### C-CDA Pregnancy Observation to FHIR Pregnancy Status Observation
In US Core, Pregnancy Observation was first defined in version 6.

|C-CDA<br/>[Pregnancy Observation](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-PregnancyObservation.html)|FHIR<br/>[Pregnancy Status](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-observation-pregnancystatus.html)|Transform Steps|
|:----|:----|:----|
|.moodCode||The C-CDA moodCode is `EVN` which is why this maps to FHIR's Pregnancy Status rather than Pregnancy Intent.
||.code|`82810-3 (Pregnancy Status)` - C-CDA uses `ASSERTION`, but FHIR clarifies the code to be used.
|/effectiveTime/@value<br/>or<br/>/effectiveTime/low/@value<br/>or<br/>/effectiveTime/high/@value<br/>or<br/>/author/time|.effectiveDateTime|FHIR only allows a single timestamp. Send the first element from the first column with a populated timestamp.<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/value|.valueCodeableConcept|Value sets are the same<br/>[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/value/@nullFlavor=UNK|.valueCodeableConcept|Unknown becomes an actual value with system = `http://terminology.hl7.org/CodeSystem/v3-NullFlavor`. Any other nullFlavors should use a data-absent-reason extension.
|**[Estimated Date of Delivery](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-EstimatedDateofDelivery.html)**<br/>/entryRelationship/observation[code/@code="11778-8"]/value|.component.code<br/>.component.valueDateTime|Set code to `11778-8` and map value to `.valueDateTime`.<br/>Note that while C-CDA hard-codes this to a single value (`11778-8`), there are other, more specific, EDD LOINC codes that could be used as well (see [EDD Including Method](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113883.11.20.9.81/expansion)). These might be communicated as translations on the entryRelationship/observation/code, as the methodCode, or sent as entirely custom observations. Any of these codes can also reasonably be included as a component to a Pregnancy Observation to represent the estimated date of delivery.

### C-CDA Pregnancy Intention in Next Year to FHIR Pregnancy Intent Observation
In US Core, Pregnancy Intent was first defined in version 6.

|C-CDA<br/>[Pregnancy Intention](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-PregnancyIntentionInNextYear.html)|FHIR<br/>[Pregnancy Intent](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-pregnancyintent.html)|Transform Steps|
|:----|:----|:----|
|.moodCode||The C-CDA moodCode is `INT` which is why this maps to FHIR's Pregnancy Status rather than Pregnancy Intent.
|/code|.code|In both standards, the code is `86645-9`
|/effectiveTime/low/@value|.effectiveDateTime|FHIR only allows a single timestamp which corresponds to C-CDA's "low" 
|/value|.valueCodeableConcept|Value sets are the same<br/>[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/value/@nullFlavor=UNK|.valueCodeableConcept|Unknown becomes an actual value with system = `http://terminology.hl7.org/CodeSystem/v3-NullFlavor`. Any other nullFlavors should use a data-absent-reason extension.

### Example: General Social History Observation

The following is a general social history comparison between C-CDA and FHIR

<table><tr><th>CDA Example</th><th>FHIR Resource</th></tr>
<tr><td>
...
</td><td>
...
</td></tr></table>

### Example: Smoking Status

<table><tr><th>CDA Example</th><th>FHIR Resource</th></tr>
<tr><td>
...
</td><td>
...
</td></tr></table>

### Example: Pregnancy Observation

<table><tr><th>CDA Example</th><th>FHIR Resource</th></tr>
<tr><td>
...
</td><td>
...
</td></tr></table>