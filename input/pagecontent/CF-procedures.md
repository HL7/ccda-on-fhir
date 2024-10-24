<link rel="stylesheet" href="colors.css">

This page provides a mapping from CDA to FHIR. For the FHIR to CDA mapping, please refer to [Procedures FHIR → CDA](./FC-procedures.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html)
<br/><br/>
#### Note on template selection
C-CDA 2.1 describes three templates for Procedures: Procedure Activity Act, Procedure Activity Observation, and Procedure Activity Procedure. Procedure Activity Procedure is the most complete, containing everything the other two contain except Observation.value, and several properties not contained by the others. The [C-CDA 2.1 Companion Guide](https://www.hl7.org/ccdasearch/pdfs/Companion_Guide.pdf) points out that "most vendors successfully and exclusively use the . . . Procedure Activity Procedure," and it then specifies this template for "all interventional, non-interventional, surgical, diagnostic, or therapeutic procedures or treatments pertinent to the patient historically at the time the document is generated." For this reason, we begin with this most common pattern in this publication. Additional guidance for the other two templates (which will be very similar) will be forthcoming.

<br />
<br />
### C-CDA to FHIR

|C-CDA¹<br/>[Procedure Activity procedure](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-ProcedureActivityProcedure.html)|FHIR<br/>[Procedure](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-procedure.html)|Transform Steps|
|:----|:----|:----|
|/@negationInd="true"|set status="not-done"||
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/code|.code|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/statusCode|.status|[CDA statusCode → FHIR status](./ConceptMap-CF-ProcedureStatus.html)|
|/effectiveTime|.performedDateTime|**Constraint**: Use this when effectiveTime@value is populated<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates) <br/> If no effectiveTime content is provided, put the FHIR [`data-absent-reason`] (https://hl7.org/fhir/R4/extension-data-absent-reason.html) extension on the performedDateTime element.|
|/effectiveTime/low|.performedPeriod.start|**Constraint**: Use this when effectiveTime@value is not populated<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/effectiveTime/high|.performedPeriod.end|**Constraint**: Use this when effectiveTime@value is not populated<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/targetSiteCode|.bodySite|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/author|.recorder<br/>&<br/>**[Provenance](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-procedure.html)**|<br/>[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance) <br/>If a latest author can be identified, map to .recorder.<br/>Any author with a time can be put in Provenance.|
|/performer/assignedEntity|.performer.actor|May map to Practitioner, PractitionerRole, or Organization<br/>onBehalfOf should not be used when actor is a Practitioner or PractitionerRole |
|**[Service Delivery Location](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-ServiceDeliveryLocation.html)**<br/>/participant[@typeCode="LOC"]/participantRole|.location||
|**[Indication](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-Indication.html)**<br/>/entryRelationship[@typeCode="RSON"]/observation/value|.reasonCode|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|**[Comment Activity](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-CommentActivity.html)**<br/>/entryRelationship/act[code/@code="48767-8"]/text|**[Annotation](https://hl7.org/fhir/datatypes.html#Annotation)**<br/>.note|

1\. XPath abbrievated for C-CDA Procedure as: <br/> ClinicalDocument/component/structuredBody/component/section[code/@code="47519-4"]/entry/procedure

### Example

<table><tr><th>CDA Procedure Example</th><th>FHIR Procedure Resource</th></tr>
<tr><td>
<div id="cda" class="border codeArea">&lt;<span class="field">procedure</span> <span class="attrib">classCode=</span><span class="value">"PROC"</span> <span class="attrib">moodCode=</span><span class="value">"EVN"</span>&gt;
  &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.14"</span> <span class="attrib">extension=</span><span class="value">"2014-06-09"</span> /&gt;
  &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.14"</span> /&gt;
  &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"<mark class="color10">1.3.6.1.4.1.22812.3.2009316.3.4.7</mark>"</span> <span class="attrib">extension=</span><span class="value">"<mark class="color11">545069400001</mark>"</span> /&gt;
  &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"<mark class="color10">1.3.6.1.4.1.22812.3.2009316.3.4.7</mark>"</span> <span class="attrib">extension=</span><span class="value">"<mark class="color12">545069400003</mark>"</span> /&gt;
  &lt;<span class="field">code</span> 
    <span class="attrib">code=</span><span class="value">"<mark class="color13">80146002</mark>"</span> 
    <span class="attrib">codeSystem=</span><span class="value">"<mark class="color14">2.16.840.1.113883.6.96</mark>"</span> 
    <span class="attrib">displayName=</span><span class="value">"<mark class="color15">Excision of appendix</mark>"</span>&gt;
    &lt;<span class="field">originalText</span>&gt;
      &lt;<span class="field">reference</span> <span class="attrib">value=</span><span class="value">"#_dfcf353c-538f-498a-9a53-80dda209e456"</span> /&gt;
    &lt;/<span class="field">originalText</span>&gt;
    &lt;<span class="field">translation</span> 
      <span class="attrib">code=</span><span class="value">"<mark class="color16">0DBJ4ZZ</mark>"</span> 
      <span class="attrib">codeSystem=</span><span class="value">"2.16.840.1.113883.6.90"</span> 
      <span class="attrib">displayName=</span><span class="value">"<mark class="color17">Excision of appendix, Percutaneous Endoscopic Approach</mark>"</span>/&gt;
  &lt;/<span class="field">code</span>&gt;
  &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"<mark class="color18">completed</mark>"</span> /&gt;
  &lt;<span class="field">effectiveTime</span> <span class="attrib">value=</span><span class="value">"<mark class="color19">20120806</mark>"</span>/&gt;
&lt;/<span class="field">procedure</span>&gt;</div>
</td><td>
<div id="fhir" class="border codeArea">{
  "<span class="field">resourceType</span>" : "<span class="value">Procedure</span>",
  "<span class="field">identifier</span>" : [{
    "<span class="field">system</span>" : "<span class="value">urn:oid:<mark class="color10">1.3.6.1.4.1.22812.3.2009316.3.4.7</mark></span>",
    "<span class="field">value</span>" : "<span class="value"><mark class="color11">545069400001</mark></span>"
  },
  {
    "<span class="field">system</span>" : "<span class="value">urn:oid:<mark class="color10">1.3.6.1.4.1.22812.3.2009316.3.4.7</mark></span>",
    "<span class="field">value</span>" : "<span class="value"><mark class="color12">545069400003</mark></span>"
  }],
  "<span class="field">status</span>" : "<span class="value"><mark class="color18">completed</mark></span>",
  "<span class="field">code</span>" : {
    "<span class="field">coding</span>" : [{
      "<span class="field">system</span>" : "<span class="value"><mark class="color14">http://snomed.info/sct</mark></span>",
      "<span class="field">code</span>" : "<span class="value"><mark class="color13">80146002</mark></span>",
      "<span class="field">display</span>" : "<span class="value"><mark class="color15">Excision of appendix</mark></span>"
    },
    {
      "<span class="field">system</span>" : "<span class="value">http://www.cms.gov/Medicare/Coding/ICD10</span>",
      "<span class="field">code</span>" : "<span class="value"><mark class="color16">0DBJ4ZZ</mark></span>",
      "<span class="field">display</span>" : "<span class="value"><mark class="color17">Excision of appendix, Percutaneous Endoscopic Approach</mark></span>"
    }],
    "<span class="field">text</span>" : "<span class="value"><mark class="color15">Excision of appendix</mark></span>"
  },
  "<span class="field">subject</span>" : {
    "<span class="field">reference</span>" : "<span class="value">Patient/CF-patient</span>"
  },
  "<span class="field">performedDateTime</span>" : "<span class="value"><mark class="color19">2012-08-06</mark></span>"
}</div>
</td></tr></table>

#### Links to example content

The consensus mapping example developed through multiple vendors are available below:
* [Procedure CDA example](./Binary-CF-procedure.html)
* [Procedure FHIR example](./Procedure-CF-procedure.html)