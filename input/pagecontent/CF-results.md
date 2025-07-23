<link rel="stylesheet" href="colors.css">

This page provides a mapping from CDA to FHIR. <!-- For the FHIR to CDA mapping, please refer to [Results FHIR → CDA](./FC-results.html). --> For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html).

Results in C-CDA are collected into `<organizer>` elements containing one or more result `<observation>` element. This corresponds to one FHIR DiagnosticReport for the `<organizer>` which multiple `.result` references to FHIR Observation resources, one for each CDA `<observation>`.

Observation values are generic - they can be of any CDA type in CDA, and *almost* any DataType in FHIR. In CDA, the type is represented by the `xsi:type` attribute on the `<value>` element. In FHIR, the type is represented by the `.value[x]` element; the `[x]` represents a choice among data types, so `.valueQuantity` represents a quantity data type, `.valueInteger` represents a numeric whole number, etc. Not every CDA type is a 1:1 match for a FHIR type, but significant differences have been included in the tables below.

### C-CDA Organizer to FHIR Diagnostic Report

|C-CDA¹<br/>[Result Organizer](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-ResultOrganizer.html)|FHIR<br/>Diagnostic Report ([Lab](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-diagnosticreport-lab.html)) ([Reports](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-diagnosticreport-note.html))|Transform Steps|
|:----|:----|:----|
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/code|.code<br/>&amp;<br/>.category|Map to code using [CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept).<br/>Category (and target FHIR Profile) may be identified by looking up a LOINC code's CLASSTYPE (see process in next table).<br/>Alternatively, an extension for `<sdtc:category>` is being developed for CDA Organizer which, if present, will map directly to this field.
|/statusCode|.status|[CDA Result Status → FHIR Report Status](./ConceptMap-CF-ResultReportStatus.html)
|/effectiveTime|.effectiveDateTime<br/>or<br/>.effectivePeriod|If low and high are identical, use effectiveDateTime. If organizer/effectiveTime is missing, use the earliest and latest observation/effectiveTime as the source of the mapping.<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/specimen|.specimen|[See below](#c-cda-specimen-to-fhir-specimen)
|/author|**[Provenance](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-provenance.html)**|[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|**[Result Observation](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-ResultObservation.html)**<br/>/component/observation|.result|See following table
|**[Specimen Collection Procedure](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-SpecimenCollectionProcedure.html)**<br/>/component/procedure[code/@code=17636008]|.specimen|[See below](#c-cda-specimen-to-fhir-specimen)

### C-CDA Observation to FHIR Observation

|C-CDA¹<br/>[Result Observation](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-ResultObservation.html)|FHIR<br/>[Lab Result Observation](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-observation-lab.html)|Transform Steps|
|:----|:----|:----|
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
||.category|If the code is LOINC, the category can be inferred from the LOINC code CLASSTYPE. Query a FHIR server via `{endpoint}CodeSystem/$lookup?system=http://loinc.org&code={code}&&property=CLASSTYPE` and set the category according to the CLASSTYPE property:<br/>1=Laboratory class (laboratory); 2=Clinical class (clinical-test); 3=Claims attachments (not mapped); 4=Surveys (survey)
|/code |.code|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/statusCode|.status|[CDA Result Status → FHIR Observation Status](./ConceptMap-CF-ResultStatus.html)
|/effectiveTime|.effectiveDateTime<br/>or<br/>.effectivePeriod|Prefer effectiveDateTime<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/value[xsi:type=PQ]|.valueQuantity|[CDA ↔ FHIR Quantity](mappingGuidance.html#cda--fhir-quantity)
|/value[xsi:type=IVL_PQ]|.valueQuantity<br/>or<br/>.valueRange|[Ranges of Physical Quantities](mappingGuidance.html#ranges-of-physical-quantities)
|/value[xsi:type=CD]<br/>(or CE, CV, CO, CS)|.valueCodeableConcept|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/value[xsi:type=ED]|`.extension:[http://hl7.org/fhir/5.0/StructureDefinition/extension-Observation.value].valueAttachment`<br/>See [Extensions for converting between versions](http://hl7.org/fhir/5.0/StructureDefinition/extension-Observation.valueAttachment)|[CDA ED ↔ FHIR Attachment](mappingGuidance.html#cda-ed--fhir-attachment)<br/>Note: if the ED references narrative content that is simple text, this could also be represented using `.valueString`. Additionally, if the Result Organizer contains only a single observation with an ED value, implementers may consider sending only the DiagnosticReport with `.presentedForm` representing the attachment, but such mapping is beyond the scope of this guide.|
|/value[xsi:type=INT]|.valueInteger|
|/value[xsi:type=REAL]|.valueQuantity|Leave unit fields empty
|/value[xsi:type=ST]|.valueString|
|/interpretationCode|.interpretation|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/methodCode|.method|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/targetSiteCode|.bodySite|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/specimen|.specimen|[See below](#c-cda-specimen-to-fhir-specimen)
|/author|**[Provenance](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-provenance.html)**|[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|/referenceRange/observationRange/interpretationCode|**Not Supported**|FHIR expects reference ranges to be "normal" ranges. If C-CDA includes multiple reference ranges, only map the one with interpretationCode = `"N"`.
|/referenceRange/observationRange/value[xsi:type=IVL_PQ]|.referenceRange.low<br/>&<br/>.referenceRange.high|
|/referenceRange/observationRange/value[xsi:type=ST]<br/>or<br/>/referenceRange/observationRange/text|.referenceRange.text|

### C-CDA Specimen to FHIR Specimen

The CDA [Specimen](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-Specimen.html) class may be present on either a Result Organizer or a Result Observation. If present on the organizer, the FHIR Specimen resource can be attached to the DiagnosticReport as well as each of the child Observation resources. If present only on a C-CDA Results Observation, it should only be attached at the FHIR Observation level.

C-CDA also defines a [Specimen Collection Procedure](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-SpecimenCollectionProcedure.html) which can be present in the Result Organizer. The information in this procedure can be combined with information from the Specimen class and attached to the FHIR DiagnosticReport and Observation resources.

|CDA<br/>[Specimen](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-Specimen.html)|FHIR<br/>[Specimen](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-specimen.html)|Transform Steps|
|:----|:----|:----|
|/specimenRole/id|.identifier<br/>or<br/>.accessionIdentifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/specimenRole/specimenPlayingEntity/code|.type|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/specimenRole/specimenPlayingEntity/name|.type.text|If there is no `<code>`. If code already exists, name may also go in `.note`
|/specimenRole/specimenPlayingEntity/quantity|.collection.quantity|[CDA ↔ FHIR Quantity](mappingGuidance.html#cda--fhir-quantity)|
|/specimenRole/specimenPlayingEntity/desc|.note|
|**C-CDA [Specimen Collection Procedure](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-SpecimenCollectionProcedure.html)**<br/>/targetSiteCode|.collection.bodySite|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|**C-CDA [Specimen Condition Observation](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-SpecimenConditionObservation.html)**<br/>/value|.condition|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|

### Example

<table><tr><th>CDA Result Example</th><th>FHIR DiagnosticReport and Observation Resources</th></tr>
<tr><td>
<div id="cda" class="border codeArea">&lt;<span class="field">organizer</span> <span class="attrib">classCode=</span><span class="value">"BATTERY"</span> <span class="attrib">moodCode=</span><span class="value">"EVN"</span>&gt;
  &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.1"</span> <span class="attrib">extension=</span><span class="value">"2015-08-01"</span>/&gt;
  &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.1"</span>/&gt;
  &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"<mark class="color10">1.3.6.1.4.1.22812.20.1.1.4.5</mark>"</span> <span class="attrib">extension=</span><span class="value">"<mark class="color11">R123</mark>"</span>/&gt;
  &lt;<span class="field">code</span> 
    <span class="attrib">code=</span><span class="value">"<mark class="color12">24357-6</mark>"</span> 
    <span class="attrib">codeSystem=</span><span class="value">"<mark class="color13">2.16.840.1.113883.6.1</mark>"</span>&gt;
    &lt;<span class="field">originalText</span>&gt;
      <span class="comment">&lt;!-- Resolves to: <mark class="color22">Urinanalysis macro (dipstick) panel</mark> --&gt;</span>
      &lt;<span class="field">reference</span> <span class="attrib">value=</span><span class="value">"#_panel1Name"</span>/&gt;
    &lt;/<span class="field">originalText</span>&gt;
  &lt;/<span class="field">code</span>&gt;
  &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"completed"</span>/&gt;
  &lt;<span class="field">effectiveTime</span> <span class="attrib">xsi:type=</span><span class="value">"IVL_TS"</span>&gt;
    &lt;<span class="field">low</span> <span class="attrib">value=</span><span class="value">"<mark class="color14">20150622</mark>"</span>/&gt;
    &lt;<span class="field">high</span> <span class="attrib">value=</span><span class="value">"<mark class="color14">20150622</mark>"</span>/&gt;
  &lt;/<span class="field">effectiveTime</span>&gt;
  <span class="comment">&lt;!-- Becomes a FHIR reference: <mark class="color23">Practitioner/62f17e2ae0231200076884d0</mark> --&gt;</span>
  &lt;<span class="field">performer</span> <span class="attrib">typeCode=</span><span class="value">"PRF"</span>&gt;
    &lt;<span class="field">assignedEntity</span>&gt;
      &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.19.5"</span>/&gt;
      &lt;<span class="field">representedOrganization</span>&gt;
        &lt;<span class="field">name</span>&gt;Value Labs&lt;/<span class="field">name</span>&gt;
      &lt;/<span class="field">representedOrganization</span>&gt;
    &lt;/<span class="field">assignedEntity</span>&gt;
  &lt;/<span class="field">performer</span>&gt;
  <span class="comment">&lt;!-- components removed to simplify example --&gt;</span>
  &lt;<span class="field">component</span>&gt;
    &lt;<span class="field">observation</span> <span class="attrib">classCode=</span><span class="value">"OBS"</span> <span class="attrib">moodCode=</span><span class="value">"EVN"</span>&gt;
      &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.2"</span> 
        <span class="attrib">extension=</span><span class="value">"2015-08-01"</span>/&gt;
      &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.2"</span>/&gt;
      &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"<mark class="color10">1.3.6.1.4.1.22812.20.1.1.4.5</mark>"</span> <span class="attrib">extension=</span><span class="value">"<mark class="color15">OBS13</mark>"</span>/&gt;
      &lt;<span class="field">code</span> 
        <span class="attrib">code=</span><span class="value">"<mark class="color16">5811-5</mark>"</span> 
        <span class="attrib">codeSystem=</span><span class="value">"<mark class="color13">2.16.840.1.113883.6.1</mark>"</span> 
        <span class="attrib">displayName=</span><span class="value">"<mark class="color17">Specific gravity of Urine by Test strip</mark>"</span>&gt;
        &lt;<span class="field">originalText</span>&gt;
          <span class="comment">&lt;!-- reference the text of the coded component --&gt;</span>
          &lt;<span class="field">reference</span> <span class="attrib">value=</span><span class="value">"#_ea838e08-d5eb-4ed4-a176-e5f9a831a780"</span>/&gt;
        &lt;/<span class="field">originalText</span>&gt;
      &lt;/<span class="field">code</span>&gt;
      &lt;<span class="field">text</span>&gt;
        <span class="comment">&lt;!-- reference the entire text of the component --&gt;</span>
        &lt;<span class="field">reference</span> <span class="attrib">value=</span><span class="value">"#_13a52df8-79ed-4689-a9da-14c5905de830"</span>/&gt;
      &lt;/<span class="field">text</span>&gt;
      &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"completed"</span>/&gt;
      &lt;<span class="field">effectiveTime</span> <span class="attrib">value=</span><span class="value">"<mark class="color14">20150622</mark>"</span>/&gt;
      &lt;<span class="field">value</span> <span class="attrib">xsi:type=</span><span class="value">"PQ"</span> <span class="attrib">value=</span><span class="value">"<mark class="color18">1.015</mark>"</span> <span class="attrib">unit=</span><mark class="color19"><span class="value">"1"</span></mark>/&gt;
      &lt;<span class="field">referenceRange</span>&gt;
        &lt;<span class="field">observationRange</span>&gt;
          &lt;<span class="field">text</span>&gt;
            <span class="comment">&lt;!-- reference the text of the reference range --&gt;</span>
            &lt;<span class="field">reference</span> <span class="attrib">value=</span><span class="value">"#_08b7d0ee-aff1-4144-a3a5-c89d56d855ad"</span>/&gt;
          &lt;/<span class="field">text</span>&gt;
          &lt;<span class="field">value</span> <span class="attrib">xsi:type=</span><span class="value">"IVL_PQ"</span>&gt;
            &lt;<span class="field">low</span> <span class="attrib">value=</span><span class="value">"<mark class="color20">1.005</mark>"</span> <span class="attrib">unit=</span><mark class="color19"><span class="value">"1"</span></mark>/&gt;
            <span class="comment">&lt;!-- Note this will create a precision extension with 
          url: <mark class="color24">http://hl7.org/fhir/StructureDefinition/quantity-precision</mark> --&gt;</span>
            &lt;<span class="field">high</span> <span class="attrib">value=</span><span class="value">"<mark class="color21">1.030</mark>"</span> <span class="attrib">unit=</span><mark class="color19"><span class="value">"1"</span></mark>/&gt;
          &lt;/<span class="field">value</span>&gt;
        &lt;/<span class="field">observationRange</span>&gt;
      &lt;/<span class="field">referenceRange</span>&gt;
    &lt;/<span class="field">observation</span>&gt;
  &lt;/<span class="field">component</span>&gt;
  <span class="comment">&lt;!-- components removed to simplify example --&gt;</span>
&lt;/<span class="field">organizer</span>&gt;</div>
</td><td>
<b>Note:</b> The following shows a DiagnosticReport resource with an Observation resource embedded in its contained property. This was done for ease of creating a single, visual, highlighted example, but implementers may choose to create separate, external resources according to their own policy.
<br/>

<div id="fhir" class="border codeArea">{
  "<span class="field">resourceType</span>": "<span class="value">DiagnosticReport</span>",
  "<span class="field">id</span>": "<span class="value">62f17e2aa2392d0008fbb236</span>",
  "<span class="field">identifier</span>": [{
    "<span class="field">value</span>": "<span class="value"><mark class="color11">R123</mark></span>",
    "<span class="field">system</span>": "<span class="value">urn:oid:<mark class="color10">1.3.6.1.4.1.22812.20.1.1.4.5</mark></span>"
  }],
  "<span class="field">status</span>": "<span class="value">final</span>",
  "<span class="field">category</span>": [{
    "<span class="field">coding</span>": [{
      "<span class="field">system</span>": "<span class="value">http://terminology.hl7.org/CodeSystem/v2-0074</span>",
      "<span class="field">code</span>": "<span class="value">LAB</span>",
      "<span class="field">display</span>": "<span class="value">Laboratory</span>"
    }]
  }],
  "<span class="field">code</span>": {
    "<span class="field">coding</span>": [{
      "<span class="field">system</span>": "<span class="value"><mark class="color13">http://loinc.org</mark></span>",
      "<span class="field">code</span>": "<span class="value"><mark class="color12">24357-6</mark></span>"
    }],
    "<span class="field">text</span>": "<span class="value"><mark class="color22">Urinanalysis macro (dipstick) panel</mark></span>"
  },
  "<span class="field">subject</span>": {
    "<span class="field">reference</span>": "<span class="value">Patient/62f17e29b7532c0009e217b7</span>"
  },
  "<span class="field">effectiveDateTime</span>": "<span class="value"><mark class="color14">2015-06-22</mark></span>",
  "<span class="field">issued</span>": {
    "<span class="field">extension</span>": [{
      "<span class="field">url</span>": "<span class="value">http://hl7.org/fhir/extension-data-absent-reason</span>",
      "<span class="field">valueCode</span>": "<span class="value">unknown</span>"
    }]
  },
  "<span class="field">performer</span>": [{
    "<span class="field">reference</span>": "<span class="value"><mark class="color23">Practitioner/62f17e2ae0231200076884d0</mark></span>"
  }],
  "<span class="field">result</span>": [{
    "<span class="field">reference</span>": "<span class="value">#exampleObs</span>"
  }],
  "<span class="field">contained</span>": [{
    "<span class="field">resourceType</span>": "<span class="value">Observation</span>",
    "<span class="field">id</span>": "<span class="value">exampleObs</span>",
    "<span class="field">identifier</span>": [{
      "<span class="field">system</span>": "<span class="value">urn:oid:<mark class="color10">1.3.6.1.4.1.22812.20.1.1.4.5</mark></span>",
      "<span class="field">value</span>": "<span class="value"><mark class="color15">OBS13</mark></span>"
    }],
    "<span class="field">status</span>": "<span class="value">final</span>",
    "<span class="field">category</span>": [{
      "<span class="field">coding</span>": [{
        "<span class="field">system</span>": "<span class="value">http://terminology.hl7.org/CodeSystem/observation-category</span>",
        "<span class="field">code</span>": "<span class="value">laboratory</span>",
        "<span class="field">display</span>": "<span class="value">Laboratory</span>"
      }]
    }],
    "<span class="field">code</span>": {
      "<span class="field">coding</span>": [{
        "<span class="field">system</span>": "<span class="value"><mark class="color13">http://loinc.org</mark></span>",
        "<span class="field">code</span>": "<span class="value"><mark class="color16">5811-5</mark></span>",
        "<span class="field">display</span>": "<span class="value"><mark class="color17">Specific gravity of Urine by Test strip</mark></span>"
      }],
      "<span class="field">text</span>": "<span class="value"><mark class="color17">Specific gravity of Urine by Test strip</mark></span>"
    },
    "<span class="field">subject</span>": {
      "<span class="field">reference</span>": "<span class="value">Patient/62f17e29b7532c0009e217b7</span>"
    },
    "<span class="field">effectiveDateTime</span>": "<span class="value"><mark class="color14">2015-06-22</mark></span>",
    "<span class="field">valueQuantity</span>": {
      "<span class="field">value</span>": <mark class="color18">1.015</mark>,
      "<span class="field">unit</span>": <mark class="color19">"1"</mark>
    },
    "<span class="field">referenceRange</span>": [{
      "<span class="field">low</span>": {
        "<span class="field">value</span>": <mark class="color20">1.005</mark>,
        "<span class="field">unit</span>": <mark class="color19">"1"</mark>
      },
      "<span class="field">high</span>": {
        "<span class="field">value</span>": <mark class="color21">1.03</mark>,
        "<span class="field">unit</span>": <mark class="color19">"1"</mark>,
        "<span class="field">_value</span>": {
          "<span class="field">extension</span>": [{
            "<span class="field">url</span>": "<span class="value"><mark class="color24">http://hl7.org/fhir/StructureDefinition/quantity-precision</mark></span>",
            "<span class="field">valueInteger</span>": 3
          }]
        }
      }
    }]
  }]
}</div>
</td></tr></table>

