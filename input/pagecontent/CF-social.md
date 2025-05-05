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
In C-CDA 3.0, the Smoking Status - MU and Tobacco Use templates were merged into a single template to better match the [US Core V7](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-smokingstatus.html) Smoking Status template. In general, the mapping follows the standard Social History mapping above, but additional caveats are noted below. 

|C-CDA<br/>[Smoking Status - MU](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-SmokingStatusMeaningfulUse.html) (Deprecated)<br/>[Tobacco Use](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-TobaccoUse.html) (Decprecated)<br/>[Smoking Status](https://build.fhir.org/ig/HL7/CDA-ccda/StructureDefinition-SmokingStatus.html) (C-CDA 3.0)²|FHIR<br/>[Smoking Status Observation (US Core 4)](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-smokingstatus.html)|Transform Steps|
|:----|:----|:----|
|/code|.code|Prior to US Core 7, the code in FHIR should be `72166-2 (Tobacco smoking status NCIS)`, but this is an extensible value set, so other codes used in the older C-CDA templates may be used.<br/>In US Core 7, the value set remains extensible, but contains the same 4 concepts allowed in the C-CDA R3.0's Smoking Status value set.
|/effectiveTime|.effectiveDateTime<br/>or<br/>.effectivePeriod|Smoking Status - MU required a timestamp; Tobacco Use required a time range; Smoking Status (3.0) combines the two templates into one and allows for either.<br/>When mapping to US Core be aware of the requirements around effectiveTime. In v7, time can be either a period or a single value. Prior to v7, the Smoking Status Observation only allowed a single timestamp. If Mapping a C-CDA Tobacco Use template that contains a date range, use one of the following approaches:<br/>- Map to the US Core 7 version of the Smoking Status Observation<br/>- Map to a generic FHIR observation (i.e. do not assert conformance with US Core)<br/>- Omit the effectiveTime high value or create a non-conformant US Core Smoking Status Observation

### C-CDA Pregnancy Observation to FHIR Pregnancy Status Observation
In US Core, Pregnancy Observation was first defined in version 6.

|C-CDA<br/>[Pregnancy Observation](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-PregnancyObservation.html)|FHIR<br/>[Pregnancy Status](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-observation-pregnancystatus.html)|Transform Steps|
|:----|:----|:----|
|.moodCode||The C-CDA moodCode is `EVN` which is why this maps to FHIR's Pregnancy Status rather than Pregnancy Intent.<br/>Note: in C-CDA 4.0, the moodCode of both templates is `EVN`, but the `code` of Pregnancy Observation is updated from `ASSERTION` to `82810-3` which matches the FHIR template.
||.code|`82810-3 (Pregnancy Status)` - Note: prior to 4.0, C-CDA uses `ASSERTION`; after 4.0, C-CDA uses `82810-3`.
|/effectiveTime/@value<br/>or<br/>/effectiveTime/low/@value<br/>or<br/>/effectiveTime/high/@value<br/>or<br/>/author/time|.effectiveDateTime|FHIR only allows a single timestamp. Send the first element from the first column with a populated timestamp.<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/value|.valueCodeableConcept|Value sets are the same<br/>[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/value/@nullFlavor=UNK|.valueCodeableConcept|Unknown becomes an actual value with system = `http://terminology.hl7.org/CodeSystem/v3-NullFlavor`. Any other nullFlavors should use a data-absent-reason extension.
|**[Estimated Date of Delivery](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-EstimatedDateofDelivery.html)**<br/>/entryRelationship/observation[code/@code="11778-8"]/value|.component.code<br/>.component.valueDateTime|Set code to `11778-8` and map value to `.valueDateTime`.<br/>Note that while C-CDA hard-codes this to a single value (`11778-8`), there are other, more specific, EDD LOINC codes that could be used as well (see [EDD Including Method](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113883.11.20.9.81/expansion)). These might be communicated as translations on the entryRelationship/observation/code, as the methodCode, or sent as entirely custom observations. Any of these codes can also reasonably be included as a component to a Pregnancy Observation to represent the estimated date of delivery.

### C-CDA Pregnancy Intention in Next Year to FHIR Pregnancy Intent Observation
In US Core, Pregnancy Intent was first defined in version 6.

|C-CDA<br/>[Pregnancy Intention](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-PregnancyIntentionInNextYear.html)|FHIR<br/>[Pregnancy Intent](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-pregnancyintent.html)|Transform Steps|
|:----|:----|:----|
|.moodCode||The C-CDA moodCode is `INT` which is why this maps to FHIR's Pregnancy Intent rather than Pregnancy Status.<br/>Note: in C-CDA 4.0, the moodCode is `EVN`, but the `code` remains `86645-9`.
|/code|.code|In both standards, the code is `86645-9`
|/effectiveTime/low/@value|.effectiveDateTime|FHIR only allows a single timestamp which corresponds to C-CDA's "low" 
|/value|.valueCodeableConcept|Value sets are the same<br/>[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/value/@nullFlavor=UNK|.valueCodeableConcept|Unknown becomes an actual value with system = `http://terminology.hl7.org/CodeSystem/v3-NullFlavor`. Any other nullFlavors should use a data-absent-reason extension.

### Example: Smoking Status

The following is a comparison between C-CDA and FHIR Smoking Status Observations

<table><tr><th>CDA Example</th><th>FHIR Resource</th></tr>
<tr><td>
<div id="cda" class="border codeArea">&lt;<span class="field">observation</span> <span class="attrib">classCode=</span><span class="value">"OBS"</span> <span class="attrib">moodCode=</span><span class="value">"EVN"</span>&gt;
  &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.78"</span>/&gt;
  &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.78"</span> 
              <span class="attrib">extension=</span><span class="value">"2014-06-09"</span>/&gt;
  &lt;<span class="field">id</span> 
    <span class="attrib">extension=</span><span class="value">"<mark class="color10">123456789</mark>"</span> 
    <span class="attrib">root=</span><span class="value">"<mark class="color11">2.16.840.1.113883.19</mark>"</span> /&gt;
  &lt;<span class="field">code</span> 
    <span class="attrib">code=</span><span class="value">"<mark class="color12">72166-2</mark>"</span> 
    <span class="attrib">codeSystem=</span><span class="value">"<mark class="color13">2.16.840.1.113883.6.1</mark>"</span> 
    <span class="attrib">displayName=</span><span class="value">"<mark class="color14">Tobacco smoking status NHIS</mark>"</span>/&gt;
  &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"completed"</span>/&gt;
  &lt;<span class="field">effectiveTime</span> <span class="attrib">value=</span><span class="value">"<mark class="color15">20140606153200+0000</mark>"</span>/&gt;
  &lt;<span class="field">value</span> <span class="attrib">xsi:type=</span><span class="value">"CD"</span> 
    <span class="attrib">code=</span><span class="value">"<mark class="color16">449868002</mark>"</span>
    <span class="attrib">codeSystem=</span><span class="value">"<mark class="color17">2.16.840.1.113883.6.96</mark>"</span> 
    <span class="attrib">codeSystemName=</span><span class="value">"<mark class="color17"><mark class="color17">SNOMED</mark> CT</mark>"</span>  
    <span class="attrib">displayName=</span><span class="value">"<mark class="color18">Current every day smoker</mark>"</span>/&gt;
&lt;/<span class="field">observation</span>&gt;
</div>
</td><td>
<div id="fhir" class="border codeArea">{
  "<span class="field">resourceType</span>": "<span class="value">Observation</span>",
  "<span class="field">id</span>": "<span class="value">62f17e2aa2392d0008fbb23a</span>",
  "<span class="field">identifier</span>": [{
    "<span class="field">system</span>": "<span class="value">urn:oid:<mark class="color11">2.16.840.1.113883.19</mark></span>",
    "<span class="field">value</span>": "<span class="value"><mark class="color10">123456789</mark></span>"
  }],
  "<span class="field">status</span>": "<span class="value">final</span>",
  "<span class="field">category</span>": [{
    "<span class="field">coding</span>": [{
      "<span class="field">system</span>": "<span class="value">http://terminology.hl7.org/CodeSystem/observation-category</span>",
      "<span class="field">code</span>": "<span class="value">social-history</span>",
      "<span class="field">display</span>": "<span class="value">Social History</span>"
    }]
  }],
  "<span class="field">code</span>": {
    "<span class="field">coding</span>": [{
      "<span class="field">system</span>": "<span class="value"><mark class="color13">http://loinc.org</mark></span>",
      "<span class="field">code</span>": "<span class="value"><mark class="color12">72166-2</mark></span>",
      "<span class="field">display</span>": "<span class="value"><mark class="color14">Tobacco smoking status NHIS</mark></span>"
    }]
  },
  "<span class="field">subject</span>": {
    "<span class="field">reference</span>": "<span class="value">Patient/62f17e29b7532c0009e217b7</span>"
  },
  "<span class="field">effectiveDateTime</span>": "<span class="value"><mark class="color15">2014-06-06T15:32:00.000Z</mark></span>",
  "<span class="field">valueCodeableConcept</span>": {
    "<span class="field">coding</span>": [{
      "<span class="field">system</span>": "<span class="value"><mark class="color17">http://www.snomed.org/</mark></span>",
      "<span class="field">code</span>": "<span class="value"><mark class="color16">449868002</mark></span>",
      "<span class="field">display</span>": "<span class="value"><mark class="color18">Current every day smoker</mark></span>"
    }]
  }
}</div>
</td></tr></table>


### Example: Pregnancy Observation

<table><tr><th>CDA Example</th><th>FHIR Resource</th></tr>
<tr><td>
<div id="cda" class="border codeArea">&lt;<span class="field">observation</span> <span class="attrib">classCode=</span><span class="value">"OBS"</span> <span class="attrib">moodCode=</span><span class="value">"EVN"</span>&gt;
  &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.15.3.8"</span>/&gt;
  &lt;<span class="field">id</span> <span class="attrib">extension=</span><span class="value">"<mark class="color10">123456789</mark>"</span> <span class="attrib">root=</span><span class="value">"<mark class="color11">2.16.840.1.113883.19</mark>"</span>/&gt;
  <span class="comment">&lt;!-- ASSERTION maps to: <mark class="color19">82810-3</mark> --&gt;</span>
  &lt;<span class="field">code</span> <span class="attrib">code=</span><span class="value">"ASSERTION"</span> <span class="attrib">codeSystem=</span><span class="value">"2.16.840.1.113883.5.4"</span>/&gt;
  &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"completed"</span>/&gt;
  &lt;<span class="field">effectiveTime</span>&gt;
    &lt;<span class="field">low</span> <span class="attrib">value=</span><span class="value">"<mark class="color12">20220824103952+0000</mark>"</span>/&gt;
  &lt;/<span class="field">effectiveTime</span>&gt;
  &lt;<span class="field">value</span> <span class="attrib">xsi:type=</span><span class="value">"CD"</span> <span class="attrib">code=</span><span class="value">"<mark class="color13">77386006</mark>"</span> 
         <span class="attrib">displayName=</span><span class="value">"<mark class="color14">pregnant</mark>"</span> 
         <span class="attrib">codeSystem=</span><span class="value">"<mark class="color15">2.16.840.1.113883.6.96</mark>"</span>/&gt;
  &lt;<span class="field">entryRelationship</span> <span class="attrib">typeCode=</span><span class="value">"REFR"</span>&gt;
    &lt;<span class="field">observation</span> <span class="attrib">classCode=</span><span class="value">"OBS"</span> <span class="attrib">moodCode=</span><span class="value">"EVN"</span>&gt;
      &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.15.3.1"</span>/&gt;
      &lt;<span class="field">code</span> 
        <span class="attrib">code=</span><span class="value">"<mark class="color16">11778-8</mark>"</span>
        <span class="attrib">codeSystem=</span><span class="value">"<mark class="color17">2.16.840.1.113883.6.1</mark>"</span> 
        <span class="attrib">displayName=</span><span class="value">"Estimated date of delivery"</span>/&gt;
      &lt;<span class="field">text</span>&gt;
        &lt;<span class="field">reference</span> <span class="attrib">value=</span><span class="value">"#dod"</span> /&gt;
      &lt;/<span class="field">text</span>&gt;
      &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"completed"</span>/&gt;
      &lt;<span class="field">value</span> <span class="attrib">xsi:type=</span><span class="value">"TS"</span> <span class="attrib">value=</span><span class="value">"<mark class="color18">2023-02-14</mark>"</span> /&gt;
    &lt;/<span class="field">observation</span>&gt;
  &lt;/<span class="field">entryRelationship</span>&gt;
&lt;/<span class="field">observation</span>&gt;</div>
</td><td>
<div id="fhir" class="border codeArea">{
  "<span class="field">resourceType</span>": "<span class="value">Observation</span>",
  "<span class="field">id</span>": "<span class="value">pregnancy-status</span>",
  "<span class="field">identifier</span>": [{
    "<span class="field">system</span>": "<span class="value">urn:oid:<mark class="color11">2.16.840.1.113883.19</mark></span>",
    "<span class="field">value</span>": "<span class="value"><mark class="color10">123456789</mark></span>"
  }],
  "<span class="field">status</span>": "<span class="value">final</span>",
  "<span class="field">category</span>": [{
    "<span class="field">coding</span>": [{
      "<span class="field">system</span>": "<span class="value">http://terminology.hl7.org/CodeSystem/observation-category</span>",
      "<span class="field">code</span>": "<span class="value">social-history</span>",
      "<span class="field">display</span>": "<span class="value">Social History</span>"
    }]
  }],
  "<span class="field">code</span>": {
    "<span class="field">coding</span>": [{
      "<span class="field">system</span>": "<span class="value"><mark class="color17">http://loinc.org</mark></span>",
      "<span class="field">code</span>": "<span class="value"><mark class="color19">82810-3</mark></span>",
      "<span class="field">display</span>": "<span class="value">Pregnancy status</span>"
    }]
  },
  "<span class="field">subject</span>": { "reference": "<span class="value">Patient/example</span>" },
  "<span class="field">effectiveDateTime</span>": "<span class="value"><mark class="color12">2022-08-24T10:39:52Z</mark></span>",
  "<span class="field">valueCodeableConcept</span>": {
    "<span class="field">coding</span>": [{
      "<span class="field">system</span>": "<span class="value"><mark class="color15">http://snomed.info/sct</mark></span>",
      "<span class="field">code</span>": "<span class="value"><mark class="color13">77386006</mark></span>",
      "<span class="field">display</span>": "<span class="value"><mark class="color14">Pregnant</mark></span>"
    }]
  },
  "<span class="field">component</span>": [{
    "<span class="field">code</span>": {
      "<span class="field">coding</span>": [{
        "<span class="field">system</span>": "<span class="value"><mark class="color17">http://loinc.org</mark></span>",
        "<span class="field">code</span>": "<span class="value"><mark class="color16">11778-8</mark></span>",
        "<span class="field">display</span>": "<span class="value">Delivery date Estimated</span>"
      }]
    },
    "<span class="field">valueDateTime</span>": "<span class="value"><mark class="color18">2023-02-14</mark></span>"
  }]
}</div>
</td></tr></table>