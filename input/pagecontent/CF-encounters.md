<link rel="stylesheet" href="colors.css">

This page provides a mapping from CDA to FHIR. <!-- For the FHIR to CDA mapping, please refer to [Encounters FHIR → CDA](./FC-encounters.html). --> For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html).

Encounter Activities in the Encounters Section (or elsewhere in the document, such as `<entryReference>` on Clinical Notes) correspond FHIR Encounter resources. If the document itself contains a `componentOf/encompassingEncounter`, this should also be converted to a FHIR Encounter resource. In all cases, when the same encounter is referenced multiple times (such as the `encompassingEncounter` and an Encounter Activity in the Encounters Section containing the same `<id>`), it should be converted to a single FHIR resource.

### C-CDA Encounter to FHIR
<sup>(b)</sup> - indicates element is only present in Encounter Activity in the body of the document<br/><sup>(h)</sup> - indicates element is only present in EncompassingEncounter in the header of the document

|C-CDA¹<br/>[Encounter Activity](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-EncounterActivity.html) or [EncompassingEncounter](https://hl7.org/cda/stds/core/2.0.0-sd-snapshot1/StructureDefinition-EncompassingEncounter.html)|FHIR<br/>[Encounter](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-encounter.html)|Transform Steps|
|:----|:----|:----|
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/code |.class|Only the V3 ActCode system, which may be present in the root element or any `<translation>`.<br/>Other code systems may map to V3 ActCode (for example CPT codes 99211-99215 map to `AMB`, 99221-99223 to `IMP`, 99281-99285 to `EMER`, etc), but if this mapping is not possible, use the [Data Absent Reason](http://hl7.org/fhir/StructureDefinition/data-absent-reason) extension.|
|/code|.type|The remaining codes besides V3 ActCode<br/>[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)
|/statusCode <sup>(b)</sup>|.status|[CDA → FHIR encounter status](ConceptMap-CF-EncounterStatus.html)<br/>**Note:**  status is also mapped from effectiveTime below. The Concept Map should only be used for statusCode values other than `completed` and `active`, or in the event that the effectiveTime is missing or ambiguous.
|/effectiveTime|.status|If effectiveTime is a single timestamp or contains a high, status = `"finished"`.<br/>If low is present and high is missing, the status may be `"in-progress"` but implementers may choose to evaluate historical values as `"finished"` or `"unknown"` if appropriate.
|/effectiveTime/@value<br/>/effectiveTime/low/@value|.period.start|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/effectiveTime/high/@value|.period.end|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/sdtc:dischargeDispositionCode <sup>(b)</sup><br/>/dischargeDispositionCode <sup>(h)</sup>|.hospialization.dischargeDisposition|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)
|/performer <sup>(b)</sup><br/>/encounterParticipant <sup>(h)</sup>|.participant|[C-CDA → FHIR Participation](CF-participations.html)
|/performer/sdtc:functionCode <sup>(b)</sup>|.participant.type|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)
|/participant[@typeCode="LOC"] <sup>(b)</sup><br/>/location <sup>(h)</sup>|.location|[C-CDA → FHIR Participation](CF-participations.html)
|**[Indication](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-Indication.html)** <sup>(b)</sup><br/>/entryRelationship[@typeCode="RSON"]/observation|.reasonCode<br/>or<br/>.reasonReference|If the id of the indication references a problem in the document that has been converted to a FHIR resource, populate .reasonReference with a reference to that resource. Otherwise, map observation/value to .reasonCode.<br/>[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)
|**[Encounter Diagnosis](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-EncounterDiagnosis.html)** <sup>(b)</sup><br/>/entryRelationship/act[code/@code="29308-4"]/observation|**[Encounter Diagnosis](https://hl7.org/fhir/us/core/StructureDefinition-us-core-condition-encounter-diagnosis.html)**<br/>&<br/>.diagnosis.condition|The observation maps identically to [CDA → FHIR Problems](./CF-problems.html).<br/>Since this is an encounter diagnosis, the `Observation.category` should be set to `encounter-diagnosis`.


### Example: Encounter

<table><tr><th>CDA Encounter</th><th>FHIR Encounter Resource</th></tr>
<tr><td>
<div id="cda" class="border codeArea">&lt;<span class="field">encounter</span> <span class="attrib">classCode=</span><span class="value">"ENC"</span> <span class="attrib">moodCode=</span><span class="value">"EVN"</span>&gt;
  &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.49"</span> <span class="attrib">extension=</span><span class="value">"2015-08-01"</span>/&gt;
  &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.49"</span>/&gt;
  &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"<mark class="color10">2a620155-9d11-439e-92b3-5d9815ff4de8</mark>"</span>/&gt;
  &lt;<span class="field">code</span> <span class="attrib">code=</span><span class="value">"<mark class="color11"><mark class="color11">99213</mark></mark>"</span> <span class="attrib">displayName=</span><span class="value">"<mark class="color12">Office outpatient visit 15 minutes</mark>"</span>
    <span class="attrib">codeSystemName=</span><span class="value">"CPT"</span> <span class="attrib">codeSystem=</span><span class="value">"<mark class="color13">2.16.840.1.113883.6.12</mark>"</span>
    <span class="attrib">codeSystemVersion=</span><span class="value">"4"</span>&gt;
    &lt;<span class="field">originalText</span>&gt;
      &lt;<span class="field">reference</span> <span class="attrib">value=</span><span class="value">"#Encounter1_type"</span>/&gt;
    &lt;/<span class="field">originalText</span>&gt;
  &lt;/<span class="field">code</span>&gt;
  &lt;<span class="field">text</span>&gt;
    &lt;<span class="field">reference</span> <span class="attrib">value=</span><span class="value">"#Encounter1"</span>/&gt;
  &lt;/<span class="field">text</span>&gt;
  &lt;<span class="field">effectiveTime</span> <span class="attrib">value=</span><span class="value">"<mark class="color14">201208151000-0800</mark>"</span>/&gt;
  <span class="comment">&lt;!-- Maps to reference: <mark class="color16">Practitioner/62f17e2ae0231200076884d4</mark> --&gt;</span>
  &lt;<span class="field">performer</span>&gt;
    &lt;<span class="field">assignedEntity</span>&gt;
      ...
    &lt;/<span class="field">assignedEntity</span>&gt;
  &lt;/<span class="field">performer</span>&gt;
  &lt;<span class="field">entryRelationship</span> <span class="attrib">typeCode=</span><span class="value">"REFR"</span>&gt;
    &lt;<span class="field">act</span> <span class="attrib">classCode=</span><span class="value">"ACT"</span> <span class="attrib">moodCode=</span><span class="value">"EVN"</span>&gt;
      <span class="comment">&lt;!-- Encounter Diagnosis --&gt;</span>
      <span class="comment">&lt;!-- Creates reference: <mark class="color17">Condition/62f17e2aa2392d0008fbb232</mark> --&gt;</span>
      &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.80"</span> <span class="attrib">extension=</span><span class="value">"2015-08-01"</span> /&gt;
      &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.80"</span>/&gt;
      &lt;<span class="field">code</span> <span class="attrib">code=</span><span class="value">"29308-4"</span> <span class="attrib">displayName=</span><span class="value">"<mark class="color15">Diagnosis</mark>"</span>
        <span class="attrib">codeSystem=</span><span class="value">"2.16.840.1.113883.6.1"</span>
        <span class="attrib">codeSystemName=</span><span class="value">"LOINC"</span>/&gt;
      &lt;<span class="field">entryRelationship</span> <span class="attrib">typeCode=</span><span class="value">"SUBJ"</span>&gt;
        ...
      &lt;/<span class="field">entryRelationship</span>&gt;
    &lt;/<span class="field">act</span>&gt;
  &lt;/<span class="field">entryRelationship</span>&gt;
&lt;/<span class="field">encounter</span>&gt;</div>
</td><td>
<div id="fhir" class="border codeArea">{
  "<span class="field">resourceType</span>": "<span class="value">Encounter</span>",
  "<span class="field">id</span>": "<span class="value">62f17e2aa2392d0008fbb224</span>",
  "<span class="field">identifier</span>": [{
    "<span class="field">value</span>": "<span class="value">urn:uuid:<mark class="color10">2a620155-9d11-439e-92b3-5d9815ff4de8</mark></span>",
    "<span class="field">system</span>": "<span class="value">urn:ietf:rfc:3986</span>"
  }],
  "<span class="field">status</span>": "<span class="value">finished</span>",
  "<span class="field">class</span>": {
    "<span class="field">system</span>": "<span class="value">http://terminology.hl7.org/CodeSystem/v3-ActCode</span>",
    "<span class="field">code</span>": <mark class="color11">"AMB"</mark>,
    "<span class="field">display</span>": "<span class="value">ambulatory</span>"
  },
  "<span class="field">type</span>": [{
    "<span class="field">coding</span>": [{
      "<span class="field">system</span>": "<span class="value"><mark class="color13">http://www.ama-assn.org/go/cpt</mark></span>",
      "<span class="field">code</span>": "<span class="value"><mark class="color11">99213</mark></span>",
      "<span class="field">display</span>": "<span class="value"><mark class="color12">Office outpatient visit 15 minutes</mark></span>"
    }],
    "<span class="field">text</span>": "<span class="value">Office outpatient visit</span>"
  }],
  "<span class="field">subject</span>": { "reference": "<span class="value">Patient/62f17e29b7532c0009e217b7</span>" },
  "<span class="field">participant</span>": [{
    "<span class="field">individual</span>": {
      "<span class="field">reference</span>": "<span class="value"><mark class="color16">Practitioner/62f17e2ae0231200076884d4</mark></span>"
    }
  }],
  "<span class="field">period</span>": {
    "<span class="field">start</span>": "<span class="value"><mark class="color14">2012-08-15T10:00:00-08:00</mark></span>"
  },
  "<mark class="color15">diagnosis</mark>": [{
    "<span class="field">condition</span>": {
      "<span class="field">reference</span>": "<span class="value"><mark class="color17">Condition/62f17e2aa2392d0008fbb232</mark></span>"
    }
  }]
}</div>
</td></tr></table>

### Example: EncompassingEncounter

<table><tr><th>CDA EncompassingEncounter Example</th><th>FHIR Encounter Resource</th></tr>
<tr><td>
<div id="cda" class="border codeArea">&lt;<span class="field">encompassingEncounter</span>&gt;
  &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"<mark class="color10">2a620155-9d11-439e-92b3-5d9815ff4de8</mark>"</span>/&gt;
  &lt;<span class="field">code</span> <span class="attrib">code=</span><span class="value">"<mark class="color11"><mark class="color11">99213</mark></mark>"</span> <span class="attrib">displayName=</span><span class="value">"<mark class="color12">Office outpatient visit 15 minutes</mark>"</span>
    <span class="attrib">codeSystemName=</span><span class="value">"CPT"</span> <span class="attrib">codeSystem=</span><span class="value">"<mark class="color13">2.16.840.1.113883.6.12</mark>"</span>
    <span class="attrib">codeSystemVersion=</span><span class="value">"4"</span> /&gt;
  &lt;<span class="field">effectiveTime</span>&gt;
    &lt;<span class="field">low</span> <span class="attrib">value=</span><span class="value">"<mark class="color14">20120815100000-0800</mark>"</span> /&gt;
    &lt;<span class="field">high</span> <span class="attrib">value=</span><span class="value">"<mark class="color15">20120815101500-0800</mark>"</span> /&gt;
  &lt;/<span class="field">effectiveTime</span>&gt;
  <span class="comment">&lt;!-- Maps to reference: <mark class="color16">Practitioner/62f17e2ae0231200076884d4</mark> --&gt;</span>
  &lt;<span class="field">participant</span>&gt;
    ...
  &lt;/<span class="field">participant</span>&gt;
  <span class="comment">&lt;!-- Maps to reference: <mark class="color17">Location/sdLoc</mark> --&gt;</span>
  &lt;<span class="field">location</span>&gt;
    ...
  &lt;/<span class="field">location</span>&gt;
&lt;/<span class="field">encompassingEncounter</span>&gt;</div>
</td><td>
<div id="fhir" class="border codeArea">{
  "<span class="field">resourceType</span>": "<span class="value">Encounter</span>",
  "<span class="field">id</span>": "<span class="value">62f17e2aa2392d0008fbb224</span>",
  "<span class="field">identifier</span>": [{
    "<span class="field">value</span>": "<span class="value">urn:uuid:<mark class="color10">2a620155-9d11-439e-92b3-5d9815ff4de8</mark></span>",
    "<span class="field">system</span>": "<span class="value">urn:ietf:rfc:3986</span>"
  }],
  "<span class="field">status</span>": "<span class="value">finished</span>",
  "<span class="field">class</span>": {
    "<span class="field">system</span>": "<span class="value">http://terminology.hl7.org/CodeSystem/v3-ActCode</span>",
    "<span class="field">code</span>": <mark class="color11">"AMB"</mark>,
    "<span class="field">display</span>": "<span class="value">ambulatory</span>"
  },
  "<span class="field">type</span>": [{
    "<span class="field">coding</span>": [{
      "<span class="field">system</span>": "<span class="value"><mark class="color13">http://www.ama-assn.org/go/cpt</mark></span>",
      "<span class="field">code</span>": "<span class="value"><mark class="color11">99213</mark></span>",
      "<span class="field">display</span>": "<span class="value"><mark class="color12">Office outpatient visit 15 minutes</mark></span>"
    }]
  }],
  "<span class="field">subject</span>": { "reference": "<span class="value">Patient/62f17e29b7532c0009e217b7</span>" },
  "<span class="field">location</span>": [{
    "<span class="field">location</span>": { "reference": "<span class="value"><mark class="color17">Location/sdLoc</mark></span>" }
  }],
  "<span class="field">participant</span>": [{
    "<span class="field">individual</span>": { "reference": "<span class="value"><mark class="color16">Practitioner/62f17e2ae0231200076884d4</mark></span>" }
  }],
  "<span class="field">period</span>": {
    "<span class="field">start</span>": "<span class="value"><mark class="color14">2012-08-15T10:00:00-08:00</mark></span>",
    "<span class="field">end</span>": "<span class="value"><mark class="color15">2012-08-15T10:15:00-08:00</mark></span>"
  }
}
</div>
</td></tr></table>