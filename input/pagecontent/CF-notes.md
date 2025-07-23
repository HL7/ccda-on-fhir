<link rel="stylesheet" href="colors.css">

This page provides a mapping from CDA to FHIR. <!-- For the FHIR to CDA mapping, please refer to [Notes FHIR → CDA](./FC-notes.html). --> For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html).

Clinical Notes may appear in their own section or as an entry in any open section. They are identified by an `<act>` with a `<code>` value of `34109-9` (Note).

### C-CDA to FHIR

|C-CDA¹<br/>[Note Activity](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-NoteActivity.html)|[DocumentReference](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-documentreference.html)|Transform Steps|
|:----|:----|:----|
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/code/translation|.type|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>**NOTE:** The root code in C-CDA is always `34109-9: Note`. A more specific code may be sent in translation which should be sent as the DocumentReference.type. If there is no translation, however, `34109-9` may be sent as the type.
||.category|Set to `clinical-note`.
|/text/@mediaType<br/>&<br/>/text/text()|.content.attachment.contentType<br/>&<br/>.content.attachment.data|If @mediaType is present, then representation should = B64, and the inner-text contents are embedded base64-encoded data. In this case, the mediaType and base64-encoded data map 1:1 to attachment.contentType and .data.
|/text/reference/@value|.content.attachment.contentType<br/>&<br/>.content.attachment.data|Convert the narrative element referenced by @value following [Narrative Text](mappingGuidance.html#narrative-text) guidance and use `application/xhtml+xml` as the contentType.<br/>If the narrative has minimal markup (i.e. only `<content>` and `<paragraph>` elements which can be converted to line breaks), it can be converted to `text/plain`.<br/>To send the raw CDA narrative without converting, use `application/cda+xml`, but this is less useful to receivers.
|/effectiveTime|.context.period|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/author|.author|[C-CDA → FHIR Participation](CF-participations.html)
|/author/time|.date|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/entryRelationship[@typeCode=COMP]/encounter<br/>or<br/>Parent `<encounter>` element<br/>or<br/>`<encompassingEncounter>`|.context.encounter|If the Note Activity includes an entryRelationship to an Encounter Activity (or an `<encounter>` element with an `<id>` referencing an Encounter Activity elsewhere in the document), that is the context.encounter. If no entryRelationship is present, but the Note Activity is itself an entryRelationship underneath an Encounter Activity, use that. If neither are true, but the document contains an `<encompassingEncounter>`, that is the encounter for entire document (see [context conduction](https://hl7.org/cda/stds/core/overview.html#technical-aspects-of-cda-context)) and should be used.<br/>[CDA → FHIR Encounters](CF-encounters.html)
|/reference/externalDocument/id|.relatesTo.target.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|

### Example

<table><tr><th>CDA Note Activity Example</th><th>FHIR DocumentReference Resource</th></tr>
<tr><td>
<div id="cda" class="border codeArea">&lt;<span class="field">act</span> <span class="attrib">classCode=</span><span class="value">"ACT"</span> <span class="attrib">moodCode=</span><span class="value">"EVN"</span>&gt;
  &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.202"</span> <span class="attrib">extension=</span><span class="value">"2016-11-01"</span>/&gt;
  &lt;<span class="field">code</span> 
    <span class="attrib">code=</span><span class="value">"<mark class="color10">34109-9</mark>"</span> 
    <span class="attrib">codeSystem=</span><span class="value">"<mark class="color11">2.16.840.1.113883.6.1</mark>"</span> 
    <span class="attrib">codeSystemName=</span><span class="value">"<mark class="color11">LOINC</mark>"</span>
    <span class="attrib">displayName=</span><span class="value">"<mark class="color12">Note</mark>"</span>&gt;
    <span class="comment">&lt;!-- Code must match or be equivalent to section code --&gt;</span>
    &lt;<span class="field">translation</span> 
      <span class="attrib">code=</span><span class="value">"<mark class="color13">11488-4</mark>"</span> 
      <span class="attrib">codeSystem=</span><span class="value">"<mark class="color11">2.16.840.1.113883.6.1</mark>"</span>
      <span class="attrib">codeSystemName=</span><span class="value">"<mark class="color11">LOINC</mark>"</span>
      <span class="attrib">displayName=</span><span class="value">"<mark class="color14">Consultation note</mark>"</span>/&gt;
  &lt;/<span class="field">code</span>&gt;
  &lt;<span class="field">text</span> <span class="attrib">mediaType=</span><span class="value">"<mark class="color16">application/rtf</mark>"</span> <span class="attrib">representation=</span><span class="value">"B64"</span>&gt;
    <mark class="color15">e1xydGYxXGFuc2kgSGVsbG8gd29ybGQhfQ==</mark>
    &lt;<span class="field">reference</span> <span class="attrib">value=</span><span class="value">"#ConsultNote1"</span>/&gt;
  &lt;/<span class="field">text</span>&gt;
  &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"completed"</span>/&gt;
  <span class="comment">&lt;!-- Clinically-relevant time of the note --&gt;</span>
  &lt;<span class="field">effectiveTime</span> <span class="attrib">value=</span><span class="value">"<mark class="color17">20160908</mark>"</span>/&gt;
  <span class="comment">&lt;!-- Author Participation --&gt;</span>
  &lt;<span class="field">author</span>&gt;
    &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.119"</span>/&gt;
    <span class="comment">&lt;!-- Time note was actually written --&gt;</span>
    &lt;<span class="field">time</span> <span class="attrib">value=</span><span class="value">"<mark class="color18">20160908083215-0500</mark>"</span>/&gt;
    &lt;<span class="field">assignedAuthor</span>&gt;
      <span class="comment">&lt;!-- Full author information is elsewhere in the document . --&gt;</span>
      &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"20cf14fb-b65c-4c8c-a54d-b0cca834c18c"</span>/&gt;
      <span class="comment">&lt;!-- Becomes reference: <mark class="color20">Practitioner/DrSpecialist</mark> --&gt;</span>
      &lt;<span class="field">assignedPerson</span>&gt;
        &lt;<span class="field">name</span>&gt;
          &lt;<span class="field">prefix</span>&gt;Dr.&lt;/<span class="field">prefix</span>&gt;
          &lt;<span class="field">family</span>&gt;Specialist&lt;/<span class="field">family</span>&gt;
        &lt;/<span class="field">name</span>&gt;
      &lt;/<span class="field">assignedPerson</span>&gt;
    &lt;/<span class="field">assignedAuthor</span>&gt;
  &lt;/<span class="field">author</span>&gt;
  &lt;<span class="field">entryRelationship</span> <span class="attrib">typeCode=</span><span class="value">"COMP"</span>&gt;
    <span class="comment">&lt;!-- Creates an encounter with reference: <mark class="color21">Encounter/123</mark> --&gt;</span>
    &lt;<span class="field">encounter</span>&gt;
      ...
    &lt;/<span class="field">encounter</span>&gt;
  &lt;/<span class="field">entryRelationship</span>&gt;
  &lt;<span class="field">reference</span> <span class="attrib">typeCode=</span><span class="value">"REFR"</span>&gt;
    &lt;<span class="field">externalDocument</span>&gt;
      &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"<mark class="color19">4dc41c26-43a4-48d9-b17e-067890006b29</mark>"</span> /&gt;
    &lt;/<span class="field">externalDocument</span>&gt;
  &lt;/<span class="field">reference</span>&gt;
&lt;/<span class="field">act</span>&gt;</div>
</td><td>
<div id="fhir" class="border codeArea">{
  "<span class="field">resourceType</span>": "<span class="value">DocumentReference</span>",
  "<span class="field">id</span>": "<span class="value">642ed1f93eec840007aaec72</span>",
  "<span class="field">language</span>": "<span class="value">en-US</span>",
  "<span class="field">status</span>": "<span class="value">current</span>",
  "<span class="field">type</span>": {
    "<span class="field">text</span>": "<span class="value"><mark class="color12">Note</mark></span>",
    "<span class="field">coding</span>": [{
      "<span class="field">code</span>": "<span class="value"><mark class="color10">34109-9</mark></span>",
      "<span class="field">system</span>": "<span class="value"><mark class="color11">http://loinc.org</mark></span>"
    },
    {
      "<span class="field">code</span>": "<span class="value"><mark class="color13">11488-4</mark></span>",
      "<span class="field">system</span>": "<span class="value"><mark class="color11">http://loinc.org</mark></span>",
      "<span class="field">display</span>": "<span class="value"><mark class="color14">Consultation Note</mark></span>"
    }]
  },
  "<span class="field">category</span>": [{
    "<span class="field">text</span>": "<span class="value">Clinical Note</span>",
    "<span class="field">coding</span>": [{
        "<span class="field">code</span>": "<span class="value">clinical-Note</span>",
      "<span class="field">system</span>": "<span class="value">http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category</span>",
      "<span class="field">display</span>": "<span class="value">Clinical Note</span>"
    }]
  }],
  "<span class="field">subject</span>": {
    "<span class="field">reference</span>": "<span class="value">urn:uuid:a4986486-6599-4bb2-a7fb-e2deb8d50b5e</span>"
  },
  "<span class="field">date</span>": "<span class="value"><mark class="color18">2016-09-08T08:32:15-05:00</mark></span>",
  "<span class="field">author</span>": [{
    "<span class="field">reference</span>": "<span class="value"><mark class="color20">Practitioner/DrSpecialist</mark></span>"
  }],
  "<span class="field">content</span>": [{
      "<span class="field">attachment</span>": {
      "<span class="field">data</span>": "<span class="value"><mark class="color15">e1xydGYxXGFuc2kgSGVsbG8gd29ybGQhfQ==</mark></span>",
      "<span class="field">contentType</span>": "<span class="value"><mark class="color16">application/rtf</mark></span>"
    }
  }],
  "<span class="field">context</span>": {
    "<span class="field">period</span>": {
      "<span class="field">start</span>": "<span class="value"><mark class="color17">2016-09-08</mark></span>"
    },
    "<span class="field">encounter</span>": [{
      "<span class="field">reference</span>": "<span class="value"><mark class="color21">Encounter/123</mark></span>"
    }]
  },
  "<span class="field">relatesTo</span>": {
    "<span class="field">target</span>": {
      "<span class="field">identifier</span>": {
        "<span class="field">system</span>": "<span class="value">urn:ietf:rfc:3986</span>",
        "<span class="field">value</span>": "<span class="value">urn:uuid:<mark class="color19">4dc41c26-43a4-48d9-b17e-067890006b29</mark></span>"
      }
    }
  }
}</div>
</td></tr></table>