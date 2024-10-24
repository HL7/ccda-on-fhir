<link rel="stylesheet" href="colors.css">

This page provides a mapping from CDA to FHIR. For the FHIR to CDA mapping, please refer to [Problems FHIR → CDA](./FC-problems.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html).

This mapping demonstrates how problems in the C-CDA Problems Section would map to FHIR Conditions. Problems in other sections will map similarly, but may map to different profiles (e.g. US Core Encounter Diagnosis) or have different categories (e.g. health-concern).

Note that C-CDA includes a Concern wrapper act from which status may be read; most of the elements are within the dependent Observation entry.
<br />
<br />
### C-CDA to FHIR

|C-CDA¹<br/>[Problem Concern Act](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-ProblemConcernAct.html)|FHIR<br/>[Condition and Health Concern](https://hl7.org/fhir/us/core/StructureDefinition-us-core-condition-problems-health-concerns.html)|Transform Steps|
|:----|:----|:----|
|From the parent section, use code@code|.category|[CDA section → FHIR category](ConceptMap-CF-ProblemCategory.html)<br/>**Note:** The section of a Problem Observation affects its FHIR category.|
|/statusCode|.clinicalStatus|/statusCode → .clinicalStatus is to be used only if the C-CDA Problem Status Observation (see below) is missing.<br/>For more information on how status is managed in Problem Concern Act wrapper, refer to [C-CDA guidance, see 5.2.6.1](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=447)<br/> [Concern Status → Condition Clinical Status](ConceptMap-CF-ConditionClinicalStatus.html)
|All of the following are a [Problem observation](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-ProblemObservation.html) nested inside the [Problem Concern act](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-ProblemConcernAct.html). Each observation should become a distinct FHIR Condition resource. <br/>/entryRelationship[@typeCode="SUBJ"]/observation prefix to rows below²|||
|/@negationInd=true|set .verificationStatus="refuted" or adjust .code for negated concept| 
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/code |.category|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/effectiveTime/low|.onsetDateTime|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|/effectiveTime/high|.abatementDateTime|If present (or `high/@nullFlavor=UNK`), the .clinicalStatus must be `inactive`, `remission`, or `resolved`. If C-CDA status fields map to .clinicalStatus of active, relapse, or recurrence, suggest setting .clinicalStatus to inactive for FHIR conformance.<br/>If `high/@nullFlavor=UNK`, populate ._abatementDateTime.extension with [Data Absent Reason](http://hl7.org/fhir/StructureDefinition/data-absent-reason), since in C-CDA, the "UNK" high effectiveTime has been the recommended way to indicate "resolved problem but unknown resolution date."<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|/value|.code|**Constraint:** When CDA negation is absent or false<br/>[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/author|.recorder<br/>&<br/>**[Provenance](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-procedure.html)**|.recorder should be authoritative (latest) author if there are multiple<br/>[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|/author/time|.recordedDate|Earliest, if more than one<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|**[Problem Status](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-ProblemStatus.html)**<br/>/entryRelationship/observation[code/@code="33999-4"]/value|.clinicalStatus|[CDA Problem Status Observation value → FHIR clinicalStatus](./ConceptMap-CF-ProblemStatus.html)|
|**[Date of Diagnosis](https://www.hl7.org/ccdasearch/templates/2.16.840.1.113883.10.20.22.4.502.html)**<br/>/entryRelationship/act[code/@code="77975-1"]/effectiveTime|.extension:[assertedDate](http://hl7.org/fhir/StructureDefinition/condition-assertedDate)|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)<br/>See **[US CORE Condition](https://hl7.org/fhir/us/core/StructureDefinition-us-core-condition-problems-health-concerns.html#mandatory-and-must-support-data-elements)** for additional guidance|
|**[Comment Activity](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-CommentActivity.html)**<br/>/entryRelationship/act[code/@code="48767-8"]/text|**[Annotation](https://hl7.org/fhir/datatypes.html#Annotation)**<br/>.note||
|**[Age Observation]()**<br/>/entryRelationship[@typeCode="SUBJ" and @inversionInd="true"]/observation[code/@code="445518008"]/value|.onsetAge|**CAUTION:** Only one of `onsetAge` or `onsetDateTime` may be present.<br/>[CDA ↔ FHIR Quantity](mappingGuidance.html#cda--fhir-quantity)
|**Supporting Observations (e.g. [Assessment Scale Observation](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-AssessmentScaleObservation.html))**<br/>/entryRelationship[@typeCode="SPRT"]/observation|.evidence.detail|Create an Observation resource, mapping fields like `id`, `code`, `effectiveTime`, `value` similar to [Results](CF-results.html). If the CDA observation is an SDOH observation, use the [US Core Observation Screening Assessment](https://www.hl7.org/fhir/us/core/StructureDefinition-us-core-observation-screening-assessment.html) profile.

1\. XPath abbreviated for C-CDA Problem Concern act as: <br/> ClinicalDocument/component/structuredBody/component/section[code/@code="11450-4"]/entry/act/

2\. XPath abbreviated for C-CDA Problem Observation as: <br/> ClinicalDocument/component/structuredBody/component/section[code/@code="11450-4"]/entry/act/entryRelationship[@typeCode="SUBJ"]/observation/

When authors or other provenance are recorded in the parent [Problem Concern Act](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-ProblemConcernAct.html), it is recommended that those data be mapped to the FHIR Condition. 

### Illustrative examples

<table><tr><th>CDA Problem Example</th><th>FHIR Condition Resource</th></tr>
<tr><td>
<div id="cda" class="border codeArea">&lt;<span class="field">act</span> <span class="attrib">classCode=</span><span class="value">"ACT"</span> <span class="attrib">moodCode=</span><span class="value">"EVN"</span>&gt;
  &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.3"</span> 
              <span class="attrib">extension=</span><span class="value">"2015-08-01"</span> /&gt;
  &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.3"</span> /&gt;
  &lt;<span class="field">id</span> <span class="attrib">extension=</span><span class="value">"<mark class="color10">545069300001</mark>"</span> <span class="attrib">root=</span><span class="value">"1.3.6.1.4.1.22812.3.2009316.3.4.1"</span> /&gt;
  &lt;<span class="field">code</span> <span class="attrib">code=</span><span class="value">"CONC"</span> <span class="attrib">codeSystem=</span><span class="value">"2.16.840.1.113883.5.6"</span> /&gt;
  &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"active"</span> /&gt;
  &lt;<span class="field">effectiveTime</span> &gt;
    &lt;<span class="field">low</span> <span class="attrib">value=</span><span class="value">"<mark class="color11">20120806</mark>"</span> /&gt;
  &lt;/<span class="field">effectiveTime</span>&gt;
  &lt;<span class="field">entryRelationship</span> <span class="attrib">typeCode=</span><span class="value">"SUBJ"</span>&gt;
    &lt;<span class="field">observation</span> <span class="attrib">classCode=</span><span class="value">"OBS"</span> <span class="attrib">moodCode=</span><span class="value">"EVN"</span>&gt;
      &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.4"</span> 
                  <span class="attrib">extension=</span><span class="value">"2015-08-01"</span> /&gt;
      &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.4"</span> /&gt;
      &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"<mark class="color12">1.3.6.1.4.1.22812.3.2009316.3.4.1.2.1</mark>"</span> 
          <span class="attrib">extension=</span><span class="value">"<mark class="color10">545069300001</mark>"</span>/&gt;
      &lt;<span class="field">code</span> <span class="attrib">code=</span><span class="value">"55607006"</span> <span class="attrib">codeSystem=</span><span class="value">"2.16.840.1.113883.6.96"</span>&gt;
        &lt;<span class="field">translation</span> <span class="attrib">nullFlavor=</span><span class="value">"NI"</span> /&gt;
      &lt;/<span class="field">code</span>&gt;
      &lt;<span class="field">text</span>&gt;
        &lt;<span class="field">reference</span> <span class="attrib">value=</span><span class="value">"#_5011447a-e27f-471d-9e1f-541148c5282f"</span> /&gt;
      &lt;/<span class="field">text</span>&gt;
      &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"completed"</span> /&gt;
      &lt;<span class="field">effectiveTime</span> &gt;
        &lt;<span class="field">low</span> <span class="attrib">value=</span><span class="value">"<mark class="color11">20120806</mark>"</span> /&gt;
      &lt;/<span class="field">effectiveTime</span>&gt;
      &lt;<span class="field">value</span> <span class="attrib">xsi:type=</span><span class="value">"CD"</span> 
        <span class="attrib">code=</span><span class="value">"<mark class="color14">233604007</mark>"</span> 
        <span class="attrib">codeSystem=</span><span class="value">"<mark class="color13">2.16.840.1.113883.6.96</mark>"</span> 
        <span class="attrib">displayName=</span><span class="value">"<mark class="color15">Pneumonia</mark>"</span>&gt;
        &lt;<span class="field">translation</span> <span class="attrib">code=</span><mark class="color16"><span class="value">"486"</span></mark> <span class="attrib">codeSystem=</span><span class="value">"<mark class="color17">2.16.840.1.113883.6.103</mark>"</span> /&gt;
        &lt;<span class="field">translation</span> <span class="attrib">code=</span><span class="value">"<mark class="color18">J18.9</mark>"</span> <span class="attrib">codeSystem=</span><span class="value">"<mark class="color19">2.16.840.1.113883.6.90</mark>"</span> /&gt;
        &lt;<span class="field">translation</span> <span class="attrib">code=</span><span class="value">"<mark class="color20">87580</mark>"</span> <span class="attrib">codeSystem=</span><span class="value">"<mark class="color21">2.16.840.1.113883.3.247.1.1</mark>"</span> /&gt;
      &lt;/<span class="field">value</span>&gt;
      <span class="comment">&lt;!-- Becomes recorder with reference: <mark class="color26">Practitioner/ProblemAuthor</mark> --&gt;</span>
      &lt;<span class="field">author</span>&gt;
        &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.119"</span>/&gt;
        &lt;<span class="field">time</span> <span class="attrib">value=</span><span class="value">"<mark class="color22">20140104</mark>"</span>/&gt;
        &lt;<span class="field">assignedAuthor</span>&gt;
          &lt;<span class="field">id</span> <span class="attrib">extension=</span><span class="value">"99999999"</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.4.6"</span>/&gt;
          &lt;<span class="field">telecom</span> <span class="attrib">use=</span><span class="value">"WP"</span> <span class="attrib">value=</span><span class="value">"tel:555-555-1002"</span>/&gt;
          &lt;<span class="field">assignedPerson</span>&gt;
            &lt;<span class="field">name</span>&gt;
              &lt;<span class="field">given</span>&gt;Henry&lt;/<span class="field">given</span>&gt;
              &lt;<span class="field">family</span>&gt;SevenObs&lt;/<span class="field">family</span>&gt;
            &lt;/<span class="field">name</span>&gt;
          &lt;/<span class="field">assignedPerson</span>&gt;
        &lt;/<span class="field">assignedAuthor</span>&gt;
      &lt;/<span class="field">author</span>&gt;
      &lt;<span class="field">entryRelationship</span> <span class="attrib">typeCode=</span><span class="value">"REFR"</span>&gt;
        &lt;<span class="field">observation</span> <span class="attrib">classCode=</span><span class="value">"OBS"</span> <span class="attrib">moodCode=</span><span class="value">"EVN"</span>&gt;
          &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.6"</span> 
            <span class="attrib">extension=</span><span class="value">"2019-06-20"</span> /&gt;
          &lt;<span class="field">code</span> <span class="attrib">code=</span><span class="value">"33999-4"</span> <span class="attrib">codeSystem=</span><span class="value">"2.16.840.1.113883.6.1"</span> /&gt;
          &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"completed"</span> /&gt;
          &lt;<span class="field">value</span> <span class="attrib">xsi:type=</span><span class="value">"CD"</span>
            <span class="attrib">code=</span><span class="value">"<mark class="color23">246455001</mark>"</span>
            <span class="attrib">codeSystem=</span><span class="value">"<mark class="color13">2.16.840.1.113883.6.96</mark>"</span>
            <span class="attrib">displayName=</span><span class="value">"<mark class="color23">Recurrence</mark>"</span> /&gt;
        &lt;/<span class="field">observation</span>&gt;
      &lt;/<span class="field">entryRelationship</span>&gt;
      &lt;<span class="field">entryRelationship</span> <span class="attrib">typeCode=</span><span class="value">"SUBJ"</span> <span class="attrib">inversionInd=</span><span class="value">"true"</span>&gt;
        &lt;<span class="field">observation</span> <span class="attrib">classCode=</span><span class="value">"OBS"</span> <span class="attrib">moodCode=</span><span class="value">"EVN"</span>&gt;
          &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.31"</span> /&gt;
          <span class="comment">&lt;!-- Age observation --&gt;</span>
          &lt;<span class="field">code</span> <span class="attrib">code=</span><span class="value">"445518008"</span> 
            <span class="attrib">codeSystem=</span><span class="value">"2.16.840.1.113883.6.96"</span> 
            <span class="attrib">displayName=</span><span class="value">"Age At Onset"</span> /&gt;
          &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"completed"</span> /&gt;
          &lt;<span class="field">value</span> <span class="attrib">xsi:type=</span><span class="value">"PQ"</span> <span class="attrib">value=</span><mark class="color24"><span class="value">"65"</span></mark> unit=<mark class="color25"><span class="value">"a"</span></mark> /&gt;
        &lt;/<span class="field">observation</span>&gt;
      &lt;/<span class="field">entryRelationship</span>&gt;
    &lt;/<span class="field">observation</span>&gt;
  &lt;/<span class="field">entryRelationship</span>&gt;
&lt;/<span class="field">act</span>&gt;</div>
</td><td>
<div id="fhir" class="border codeArea">{
  "<span class="field">resourceType</span>": "<span class="value">Condition</span>",
  "<span class="field">id</span>": "<span class="value">6581e92f2d59f701ecc0f914</span>",
  "<span class="field">identifier</span>": [{
    "<span class="field">system</span>": "<span class="value">urn:oid:<mark class="color12">1.3.6.1.4.1.22812.3.2009316.3.4.1.2.1</mark></span>",
    "<span class="field">value</span>": "<span class="value"><mark class="color10">545069300001</mark></span>"
  }],
  "<span class="field">clinicalStatus</span>": {
    "<span class="field">coding</span>": [{
      "<span class="field">system</span>": "<span class="value">http://terminology.hl7.org/CodeSystem/condition-clinical</span>",
      "<span class="field">code</span>": "<span class="value"><mark class="color23">recurrence</mark></span>",
      "<span class="field">display</span>": "<span class="value"><mark class="color23">recurrence</mark></span>"
    }]
  },
  "<span class="field">category</span>": [{
    "<span class="field">coding</span>": [{
      "<span class="field">system</span>": "<span class="value">http://terminology.hl7.org/CodeSystem/condition-category</span>",
      "<span class="field">code</span>": "<span class="value">problem-list-item</span>",
      "<span class="field">display</span>": "<span class="value">Problem List Item</span>"
    }]
  }],
  "<span class="field">code</span>": {
    "<span class="field">coding</span>": [
      {
        "<span class="field">system</span>": "<span class="value"><mark class="color13">http://snomed.info/sct</mark></span>",
        "<span class="field">code</span>": "<span class="value"><mark class="color14">233604007</mark></span>",
        "<span class="field">display</span>": "<span class="value"><mark class="color15">Pneumonia</mark></span>"
      },
      {
        "<span class="field">system</span>": "<span class="value"><mark class="color17">http://hl7.org/fhir/sid/icd-9-cm</mark></span>",
        "<span class="field">code</span>": <mark class="color16">"486"</mark>,
        "<span class="field">display</span>": "<span class="value"><mark class="color15">Pneumonia</mark>, organism unspecified</span>"
      },
      {
        "<span class="field">system</span>": "<span class="value"><mark class="color19">http://hl7.org/fhir/sid/icd-10-cm</mark></span>",
        "<span class="field">code</span>": "<span class="value"><mark class="color18">J18.9</mark></span>",
        "<span class="field">display</span>": "<span class="value"><mark class="color15">Pneumonia</mark>, unspecified organism</span>"
      },
      {
        "<span class="field">system</span>": "<span class="value">urn:oid:<mark class="color21">2.16.840.1.113883.3.247.1.1</mark></span>",
        "<span class="field">code</span>": "<span class="value"><mark class="color20">87580</mark></span>"
      }
    ],
    "<span class="field">text</span>": "<span class="value"><mark class="color15">Pneumonia</mark></span>"
  },
  "<span class="field">subject</span>": {
    "<span class="field">reference</span>": "<span class="value">Patient/6581e92eb6ff5dadc088eae5</span>",
    "<span class="field">display</span>": "<span class="value">Myra Jones</span>"
  },
  "<span class="field">onsetDate</span>": "<span class="value"><mark class="color11">2012-08-06</mark></span>",
  <span class="comment">/* Note only one of onsetDate or onsetAge is allowed */
  </span>"<span class="field">onsetAge</span>": {
    "<span class="field">value</span>": <mark class="color24">65,</mark>
    "<span class="field">unit</span>": "<span class="value">year</span>",
    "<span class="field">code</span>": <mark class="color25">"a"</mark>,
    "<span class="field">system</span>": "<span class="value">http://unitsofmeasure.org</span>"
  },
  "<span class="field">recordedDate</span>": "<span class="value"><mark class="color22">2014-01-04</mark></span>",
  "<span class="field">recorder</span>": {
    "<span class="field">reference</span>": "<span class="value"><mark class="color26">Practitioner/ProblemAuthor</mark></span>"
  }
}</div>
</td></tr></table>

### Example: SDOH Problem 

<table>
<tr><th>CDA SDOH Problem</th><th>FHIR Condition Resource</th></tr>
<tr><td>
<div id="cda" class="border codeArea">&lt;<span class="field">act</span> <span class="attrib">classCode=</span><span class="value">"ACT"</span> <span class="attrib">moodCode=</span><span class="value">"EVN"</span>&gt;
  &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.3"</span> <span class="attrib">extension=</span><span class="value">"2015-08-01"</span> /&gt;
  &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.3"</span> /&gt;
  &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"b46f0fc0-986f-11ee-b9d1-0242ac120002"</span>/&gt;
  &lt;<span class="field">code</span> <span class="attrib">code=</span><span class="value">"CONC"</span> <span class="attrib">codeSystem=</span><span class="value">"2.16.840.1.113883.5.6"</span>/&gt;
  &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"<mark class="color10">active</mark>"</span>/&gt;
  &lt;<span class="field">effectiveTime</span>&gt;
    &lt;<span class="field">low</span> <span class="attrib">value=</span><span class="value">"20130101"</span>/&gt;
  &lt;/<span class="field">effectiveTime</span>&gt;
  &lt;<span class="field">entryRelationship</span> <span class="attrib">typeCode=</span><span class="value">"SUBJ"</span>&gt;
    <span class="comment">&lt;!-- SDOH Problem --&gt;</span>
    &lt;<span class="field">observation</span> <span class="attrib">classCode=</span><span class="value">"OBS"</span> <span class="attrib">moodCode=</span><span class="value">"EVN"</span>&gt;
      &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.4"</span>/&gt;
      &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.4"</span> <span class="attrib">extension=</span><span class="value">"2015-08-01"</span>/&gt;
      &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.4"</span> <span class="attrib">extension=</span><span class="value">"2022-06-01"</span>/&gt;
      &lt;<span class="field">id</span> <span class="attrib">extension=</span><span class="value">"<mark class="color11">68993</mark>"</span> <span class="attrib">root=</span><span class="value">"<mark class="color12">1.2.840.114350.1.13.6289.1.7.2.768076</mark>"</span>/&gt;
      &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"093A5380-00CE-11E6-B4C5-0050568B000B"</span> <span class="attrib">extension=</span><span class="value">"1.1"</span>/&gt;
      &lt;<span class="field">code</span> <span class="attrib">code=</span><span class="value">"55607006"</span> <span class="attrib">codeSystem=</span><span class="value">"2.16.840.1.113883.6.96"</span> 
          <span class="attrib">codeSystemName=</span><span class="value">"SNOMED CT"</span> <span class="attrib">displayName=</span><span class="value">"Problem"</span>&gt;
        &lt;<span class="field">originalText</span>&gt;Problem&lt;/<span class="field">originalText</span>&gt;
        &lt;<span class="field">translation</span> <span class="attrib">code=</span><span class="value">"75326-9"</span> <span class="attrib">codeSystem=</span><span class="value">"2.16.840.1.113883.6.1"</span> 
            <span class="attrib">codeSystemName=</span><span class="value">"LOINC"</span> <span class="attrib">displayName=</span><span class="value">"Problem"</span>/&gt;
      &lt;/<span class="field">code</span>&gt;
      &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"completed"</span>/&gt;
      &lt;<span class="field">effectiveTime</span>&gt;
        &lt;<span class="field">low</span> <span class="attrib">value=</span><span class="value">"<mark class="color15">20100909</mark>"</span>/&gt;
      &lt;/<span class="field">effectiveTime</span>&gt;
      &lt;<span class="field">value</span> <span class="attrib">xsi:type=</span><span class="value">"CD"</span> 
        <span class="attrib">code=</span><span class="value">"<mark class="color16">445281000124101</mark>"</span> 
        <span class="attrib">displayName=</span><span class="value">"<mark class="color17">Nutrition impaired due to limited access to healthful foods</mark>"</span> 
        <span class="attrib">codeSystem=</span><span class="value">"<mark class="color13">2.16.840.1.113883.6.96</mark>"</span> 
        <span class="attrib">codeSystemName=</span><span class="value">"<mark class="color13"><mark class="color13">SNOMED</mark> CT</mark>"</span>&gt;
        &lt;<span class="field">translation</span> <span class="attrib">code=</span><span class="value">"<mark class="color18">Z59.48</mark>"</span> 
          <span class="attrib">codeSystem=</span><span class="value">"<mark class="color19">2.16.840.1.113883.6.90</mark>"</span> 
          <span class="attrib">codeSystemName=</span><span class="value">"<mark class="color19">ICD-10-CM</mark>"</span> 
          <span class="attrib">displayName=</span><span class="value">"<mark class="color20">Other specified lack of adequate food</mark>"</span>/&gt;
      &lt;/<span class="field">value</span>&gt;
      <span class="comment">&lt;!-- Assessment Scale Observation --&gt;</span>
      <span class="comment">&lt;!-- Creates observation referenced by evidence.detail --&gt;</span>
      <span class="comment">&lt;!-- This one: <mark class="color29">#sdoh1</mark> --&gt;</span>
      &lt;<span class="field">entryRelationship</span> <span class="attrib">typeCode=</span><span class="value">"SPRT"</span>&gt;
        &lt;<span class="field">observation</span> <span class="attrib">classCode=</span><span class="value">"OBS"</span> <span class="attrib">moodCode=</span><span class="value">"EVN"</span>&gt;
          &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.69"</span>/&gt;
          &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.69"</span>
                      <span class="attrib">extension=</span><span class="value">"2022-06-01"</span>/&gt;
          &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"f4dce790-8328-11db-9fe1-0800200c9a44"</span>/&gt;
          &lt;<span class="field">code</span> <span class="attrib">code=</span><span class="value">"<mark class="color21">88122-7</mark>"</span> 
            <span class="attrib">displayName=</span><span class="value">"(I/We) worried whether (my/our) food would run out..."</span>
            <span class="attrib">codeSystem=</span><span class="value">"<mark class="color14">2.16.840.1.113883.6.1</mark>"</span> 
            <span class="attrib">codeSystemName=</span><span class="value">"<mark class="color14">LOINC</mark>"</span>/&gt;
          &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"completed"</span>/&gt;
          &lt;<span class="field">effectiveTime</span> <span class="attrib">value=</span><span class="value">"<mark class="color15">20100909</mark>"</span>/&gt;
          &lt;<span class="field">value</span> <span class="attrib">xsi:type=</span><span class="value">"CD"</span> 
            <span class="attrib">code=</span><span class="value">"<mark class="color22">LA28397-0</mark>"</span> 
            <span class="attrib">displayName=</span><span class="value">"<mark class="color23">Often true</mark>"</span> 
            <span class="attrib">codeSystem=</span><span class="value">"<mark class="color14">2.16.840.1.113883.6.1</mark>"</span>&gt;
          &lt;/<span class="field">value</span>&gt;
        &lt;/<span class="field">observation</span>&gt;
      &lt;/<span class="field">entryRelationship</span>&gt;
      <span class="comment">&lt;!-- Creates observation referenced by evidence.detail --&gt;</span>
      <span class="comment">&lt;!-- This one: <mark class="color30">#sdoh2</mark> --&gt;</span>
      &lt;<span class="field">entryRelationship</span> <span class="attrib">typeCode=</span><span class="value">"SPRT"</span>&gt;
        &lt;<span class="field">observation</span> <span class="attrib">classCode=</span><span class="value">"OBS"</span> <span class="attrib">moodCode=</span><span class="value">"EVN"</span>&gt;
          &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.69"</span>/&gt;
          &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.69"</span> 
                      <span class="attrib">extension=</span><span class="value">"2022-06-01"</span>/&gt;
          &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"0e9c5b7c-9def-11ee-8c90-0242ac120002"</span>/&gt;
          &lt;<span class="field">code</span> <span class="attrib">code=</span><span class="value">"<mark class="color24">88124-3</mark>"</span> 
            <span class="attrib">displayName=</span><span class="value">"<mark class="color25">Food insecurity risk [HVS]</mark>"</span> 
            <span class="attrib">codeSystem=</span><span class="value">"<mark class="color14">2.16.840.1.113883.6.1</mark>"</span> 
            <span class="attrib">codeSystemName=</span><span class="value">"<mark class="color14">LOINC</mark>"</span>/&gt;
          &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"completed"</span>/&gt;
          &lt;<span class="field">effectiveTime</span> <span class="attrib">value=</span><span class="value">"<mark class="color15">20100909</mark>"</span>/&gt;
          &lt;<span class="field">value</span> <span class="attrib">xsi:type=</span><span class="value">"CD"</span> 
            <span class="attrib">code=</span><span class="value">"<mark class="color26">LA19952-3</mark>"</span> 
            <span class="attrib">displayName=</span><span class="value">"<mark class="color27">At risk</mark>"</span> 
            <span class="attrib">codeSystem=</span><span class="value">"<mark class="color14">2.16.840.1.113883.6.1</mark>"</span>/&gt;
        &lt;/<span class="field">observation</span>&gt;
      &lt;/<span class="field">entryRelationship</span>&gt;
      <span class="comment">&lt;!-- Date of Diagnosis Act --&gt;</span>
      &lt;<span class="field">entryRelationship</span> <span class="attrib">typeCode=</span><span class="value">"COMP"</span>&gt;
        &lt;<span class="field">act</span> <span class="attrib">classCode=</span><span class="value">"ACT"</span> <span class="attrib">moodCode=</span><span class="value">"EVN"</span>&gt;
          &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.502"</span> 
                      <span class="attrib">extension=</span><span class="value">"2022-06-01"</span>/&gt;
          &lt;<span class="field">code</span> <span class="attrib">code=</span><span class="value">"77975-1"</span> 
            <span class="attrib">codeSystem=</span><span class="value">"2.16.840.1.113883.6.1"</span> 
            <span class="attrib">codeSystemName=</span><span class="value">"LOINC"</span> 
            <span class="attrib">displayName=</span><span class="value">"Earliest date of diagnosis"</span>/&gt;
          &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"completed"</span>/&gt;
          <span class="comment">&lt;!-- SHALL to the year (MAY be more specific) --&gt;</span>
          &lt;<span class="field">effectiveTime</span> <span class="attrib">value=</span><span class="value">"<mark class="color28">20100101</mark>"</span>/&gt;
        &lt;/<span class="field">act</span>&gt;
      &lt;/<span class="field">entryRelationship</span>&gt;
    &lt;/<span class="field">observation</span>&gt;
  &lt;/<span class="field">entryRelationship</span>&gt;
&lt;/<span class="field">act</span>&gt;</div>
</td><td>
<div id="fhir" class="border codeArea">{
  "<span class="field">resourceType</span>": "<span class="value">Condition</span>",
  "<span class="field">language</span>": "<span class="value">en-US</span>",
  "<span class="field">identifier</span>": [{
    "<span class="field">system</span>": "<span class="value">urn:oid:<mark class="color12">1.2.840.114350.1.13.6289.1.7.2.768076</mark></span>",
    "<span class="field">value</span>": "<span class="value"><mark class="color11">68993</mark></span>"
  }],
  "<span class="field">clinicalStatus</span>": {
    "<span class="field">coding</span>": [{
      "<span class="field">system</span>": "<span class="value">http://terminology.hl7.org/CodeSystem/condition-clinical</span>",
      "<span class="field">code</span>": "<span class="value"><mark class="color10">active</mark></span>",
      "<span class="field">display</span>": "<span class="value"><mark class="color10">active</mark></span>"
    }]
  },
  "<span class="field">category</span>": [{
    "<span class="field">coding</span>": [{
      "<span class="field">system</span>": "<span class="value">http://terminology.hl7.org/CodeSystem/condition-category</span>",
      "<span class="field">code</span>": "<span class="value">problem-list-item</span>",
      "<span class="field">display</span>": "<span class="value">Problem List Item</span>"
    }]
  }],
  "<span class="field">code</span>": {
    "<span class="field">coding</span>": [{
      "<span class="field">system</span>": "<span class="value"><mark class="color13">http://snomed.info/sct</mark></span>",
      "<span class="field">code</span>": "<span class="value"><mark class="color16">445281000124101</mark></span>",
      "<span class="field">display</span>": "<span class="value"><mark class="color17">Nutrition impaired due to limited access to healthful foods</mark></span>"
    },
    {
      "<span class="field">system</span>": "<span class="value"><mark class="color19">http://hl7.org/fhir/sid/icd-10-cm</mark></span>",
      "<span class="field">code</span>": "<span class="value"><mark class="color18">Z59.48</mark></span>",
      "<span class="field">display</span>": "<span class="value"><mark class="color20">Other specified lack of adequate food</mark></span>"
    }
  ]},
  "<span class="field">subject</span>": {
    "<span class="field">reference</span>": "<span class="value">Patient/6581e92eb6ff5dadc088eae5</span>"
  },
  "<span class="field">onsetDateTime</span>": "<span class="value"><mark class="color15">2010-09-09</mark></span>",
  "<span class="field">extension</span>": [{
    "<span class="field">url</span>": "<span class="value">http://hl7.org/fhir/StructureDefinition/condition-assertedDate</span>",
    "<span class="field">valueDateTime</span>": "<span class="value"><mark class="color28">2010-01-01</mark></span>"
  }],
  "<span class="field">evidence</span>": [{
    "<span class="field">detail</span>": [{
      "<span class="field">reference</span>": "<span class="value"><mark class="color29">#sdoh1</mark></span>"
    }, {
      "<span class="field">reference</span>": "<span class="value"><mark class="color30">#sdoh2</mark></span>"
    }]
  }],
  "<span class="field">contained</span>": [{
    "<span class="field">resourceType</span>": "<span class="value">Observation</span>",
    "<span class="field">id</span>": "<span class="value">sdoh1</span>",
    "<span class="field">status</span>": "<span class="value">final</span>",
    "<span class="field">category</span>": [{
      "<span class="field">coding</span>": [{
        "<span class="field">code</span>": "<span class="value">survey</span>",
        "<span class="field">system</span>": "<span class="value">http://terminology.hl7.org/CodeSystem/observation-category</span>"
      }]
    }],
    "<span class="field">code</span>": {
      "<span class="field">coding</span>": [{
        "<span class="field">value</span>": "<span class="value"><mark class="color21">88122-7</mark></span>",
        "<span class="field">system</span>": "<span class="value"><mark class="color14">http://loinc.org</mark></span>"
      }]
    },
    "<span class="field">subject</span>": { "reference": "<span class="value">Patient/6581e92eb6ff5dadc088eae5</span>" },
    "<span class="field">effectiveDateTime</span>": "<span class="value"><mark class="color15">2010-09-09</mark></span>",
    "<span class="field">valueCodeableConcept</span>": {
      "<span class="field">coding</span>": [{
        "<span class="field">code</span>": "<span class="value"><mark class="color22">LA28397-0</mark></span>",
        "<span class="field">system</span>": "<span class="value"><mark class="color14">http://loinc.org</mark></span>",
        "<span class="field">display</span>": "<span class="value"><mark class="color23">Often true</mark></span>"
      }]
    }
  }, {
    "<span class="field">resourceType</span>": "<span class="value">Observation</span>",
    "<span class="field">id</span>": "<span class="value">sdoh2</span>",
    "<span class="field">status</span>": "<span class="value">final</span>",
    "<span class="field">category</span>": [{
      "<span class="field">coding</span>": [{
        "<span class="field">code</span>": "<span class="value">survey</span>",
        "<span class="field">system</span>": "<span class="value">http://terminology.hl7.org/CodeSystem/observation-category</span>"
      }]
    }],
    "<span class="field">code</span>": {
      "<span class="field">coding</span>": [{
        "<span class="field">value</span>": "<span class="value"><mark class="color24">88124-3</mark></span>",
        "<span class="field">system</span>": "<span class="value"><mark class="color14">http://loinc.org</mark></span>",
        "<span class="field">display</span>": "<span class="value"><mark class="color25">Food insecurity risk [HVS]</mark></span>"
      }]
    },
    "<span class="field">subject</span>": { "reference": "<span class="value">Patient/6581e92eb6ff5dadc088eae5</span>" },
    "<span class="field">effectiveDateTime</span>": "<span class="value"><mark class="color15">2010-09-09</mark></span>",
    "<span class="field">valueCodeableConcept</span>": {
      "<span class="field">coding</span>": [{
        "<span class="field">code</span>": "<span class="value"><mark class="color26">LA19952-3</mark></span>",
        "<span class="field">system</span>": "<span class="value"><mark class="color14">http://loinc.org</mark></span>",
        "<span class="field">display</span>": "<span class="value"><mark class="color27">At risk</mark></span>"
      }]
    }
  }]
}</div>
</td></tr></table>

#### Links to example content

The consensus mapping example developed through multiple vendors are available below:
* [Problem CDA example](./Binary-CF-problem.html)
* [Condition FHIR example](./Condition-CF-problem.html)