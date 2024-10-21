<link rel="stylesheet" href="colors.css">

This page provides a mapping from CDA to FHIR. For the FHIR to CDA mapping, please refer to [Vitals FHIR → CDA](./FC-vitals.html). For guidance on how to read the table 
below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html).

C-CDA vitals are typically grouped into a Vital Signs Organizer to group one or more vitals readings together. This has been mapped to an additional FHIR Observation for the panel of vital signs. This panel contains a `.hasMember` field which references each observation mapped from the original C-CDA Vital Signs Organizer.

### C-CDA Vital Signs Organizer to FHIR Observation Panel

|C-CDA¹<br/>[Vital SignsOrganizer](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-VitalSignsOrganizer.html)|FHIR<br/>[Vital Signs Observation](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-vital-signs.html)|Transform Steps|
|:----|:----|:----|
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
||.category|Set to `vital-signs` from [Vital Signs value set](https://hl7.org/fhir/us/core/STU4/ValueSet-us-core-vital-signs.html)
||.code|Set to `85353-1` [CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/statusCode|.status|`final` (C-CDA is fixed to `completed`)
|/effectiveTime|.effectiveDateTime<br/>or<br/>.effectivePeriod|If low and high are identical, use effectiveDateTime. If organizer/effectiveTime is missing, use the earliest and latest observation/effectiveTime as the source of the mapping.<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
||.hasMember|Reference to each vital sign observation mapped from CDA

### C-CDA Vital Signs Observation to FHIR Observation

|C-CDA¹<br/>[Vital Sign Observation](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-VitalSignObservation.html)|FHIR<br/>[Vital Signs Observation](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-vital-signs.html)|Transform Steps<br/>Note: US Core defines separate profiles for individual vitals such as [weight](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-body-weight.html), [heart rate](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-heart-rate.html), etc.|
|:----|:----|:----|
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
||.category|Set to `vital-signs` from [Vital Signs value set](https://hl7.org/fhir/us/core/STU4/ValueSet-us-core-vital-signs.html)
|/code |.code²|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/effectiveTime|.effectiveDateTime<br/>or<br/>.effectivePeriod|Prefer effectiveDateTime<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|value|.valueQuantity²|[CDA ↔ FHIR Quantity](mappingGuidance.html#cda--fhir-quantity)
|/interpretationCode|.interpretation²|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/methodCode|.method|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/targetSiteCode|.bodySite|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/author|.performer<br/>&<br/>**[Provenance](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-procedure.html)**|[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|/referenceRange/observationRange/interpretationCode|**Not Supported**|FHIR expects reference ranges to be "normal" ranges. If C-CDA includes multiple reference ranges, only map the one with interpretationCode = `"N"`.
|/referenceRange/observationRange/value[xsi:type=IVL_PQ]|.referenceRange.low²<br/>&<br/>.referenceRange.high²|[CDA ↔ FHIR Quantity](mappingGuidance.html#cda--fhir-quantity)
|/referenceRange/observationRange/value[xsi:type=ST]<br/>or<br/>/referenceRange/observationRange/text|.referenceRange.text²|

1\. XPath abbreviated for C-CDA Vital Signs Observation as: <br/> ClinicalDocument/component/structuredBody/component/section[code/@code="8716-3"]/entry/organizer/entryRelationship/component

2\. Some C-CDA observations need special handling when converting to FHIR. When recording the following vitals, the value, interpretation, and referenceRange should be placed in a `.component` element within a parent Observation.

**[Blood Pressure](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-blood-pressure.html)** (C-CDA observations with codes `8480-6` - systolic & `8462-4` - diastolic)
- Set `Observation.code` to `85354-9` (Blood Pressure Panel) and create 2 components for the systolic and diastolic readings. Both components are required.
- Do not send `Observation.valueQuantity`

**[Pulse Oximetry](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-pulse-oximetry.html)** (C-CDA observations with codes `3150-0` - Inhaled Oxygen Concentration,  `3151-8` - Inhaled Oxygen Flow Rate, `59408-5` - Oxygen saturation in Arterial blood by Pulse oximetry, or  `2708-6` - Oxygen saturation in Arterial blood)
- `Observation.code` should contain two coding values: `59408-5` & `2708-6`
- Observation.valueQuantity represents the Oxygen saturation (e.g. `98%`)
- Create individual components for `3150-0` - Inhaled Oxygen Concentration & `3151-8` - Inhaled Oxygen Flow Rate (only if values exist)

### Illustrative example

<table><tr><th>CDA Example</th><th>FHIR Resource</th></tr>
<tr><td>
...
</td><td>
...
</td></tr></table>

### Example: Blood Pressure

<table>
<tr><th>C-CDA Blood Pressure (Codes & Values Only)</th><th>FHIR Blood Pressure</th></tr>
<tr><td>
<div class="border codeArea">&lt;<span class="field">organizer</span>&gt;
  <span class="comment">&lt;!-- C-CDA Vital Signs Organizer --&gt;</span>
  &lt;<span class="field">templateId</span> 
    <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.26"</span> 
    <span class="attrib">extension=</span><span class="value">"2015-08-01"</span> /&gt;
  &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"..."</span> /&gt;
  &lt;<span class="field">code</span> 
    <span class="attrib">code=</span><span class="value">"<mark class="color10">46680005</mark>"</span> 
    <span class="attrib">codeSystem=</span><span class="value">"2.16.840.1.113883.6.96"</span> 
    <span class="attrib">codeSystemName=</span><span class="value">"SNOMED CT"</span>
    <span class="attrib">displayName=</span><mark class="color10"><span class="value">"Vital Signs"</span></mark> /&gt;
  &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"completed"</span> /&gt;
  <span class="comment">&lt;!-- effectiveTime, author, etc stripped --&gt;</span>
  &lt;<span class="field">component</span>&gt;
    &lt;<span class="field">observation</span>&gt;
      <span class="comment">&lt;!-- C-CDA Vital Signs Observation --&gt;</span>
      &lt;<span class="field">templateId</span> 
        <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.27"</span>
        <span class="attrib">extension=</span><span class="value">"2014-06-09"</span> /&gt;
      &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"..."</span> /&gt;
      &lt;<span class="field">code</span> 
        <span class="attrib">code=</span><span class="value">"<mark class="color11">8480-6</mark>"</span> 
        <span class="attrib">codeSystem=</span><span class="value">"<mark class="color12">2.16.840.1.113883.6.1</mark>"</span> 
        <span class="attrib">codeSystemName=</span><span class="value">"<mark class="color12">LOINC</mark>"</span>
        <span class="attrib">displayName=</span><span class="value">"<mark class="color13">Systolic blood pressure</mark>"</span> /&gt;
      &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"completed"</span> /&gt;
      &lt;<span class="field">value</span> <span class="attrib">xsi:type=</span><span class="value">"PQ"</span> 
        <span class="attrib">value=</span><mark class="color14"><span class="value">"115"</span></mark> 
        <span class="attrib">unit=</span><span class="value">"<mark class="color15">mm[Hg]</mark>"</span> /&gt;
    &lt;/<span class="field">observation</span>&gt;
  &lt;/<span class="field">component</span>&gt;
  &lt;<span class="field">component</span>&gt;
    &lt;<span class="field">observation</span>&gt;
      <span class="comment">&lt;!-- C-CDA Vital Signs Observation --&gt;</span>
      &lt;<span class="field">templateId</span> 
        <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.27"</span>
        <span class="attrib">extension=</span><span class="value">"2014-06-09"</span> /&gt;
      &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"..."</span> /&gt;
      &lt;<span class="field">code</span> 
        <span class="attrib">code=</span><span class="value">"<mark class="color16">8462-4</mark>"</span> 
        <span class="attrib">codeSystem=</span><span class="value">"<mark class="color12">2.16.840.1.113883.6.1</mark>"</span> 
        <span class="attrib">codeSystemName=</span><span class="value">"<mark class="color12">LOINC</mark>"</span>
        <span class="attrib">displayName=</span><span class="value">"<mark class="color17">Diastolic blood pressure</mark>"</span> /&gt;
      &lt;<span class="field">value</span> <span class="attrib">xsi:type=</span><span class="value">"PQ"</span> <span class="attrib">value=</span><mark class="color18"><span class="value">"75"</span></mark> <span class="attrib">unit=</span><span class="value">"<mark class="color15">mm[Hg]</mark>"</span> /&gt;
    &lt;/<span class="field">observation</span>&gt;
  &lt;/<span class="field">component</span>&gt;
&lt;/<span class="field">organizer</span>&gt;</div>
</td><td>
<div class="border codeArea">{
  "<span class="field">resourceType</span>" : "<span class="value">Observation</span>",
  "<span class="field">status</span>" : "<span class="value">final</span>",
  "<span class="field">category</span>" : [{
    "<span class="field">coding</span>" : [{
      "<span class="field">system</span>" : "<span class="value">http://terminology.hl7.org/CodeSystem/observation-category</span>",
      "<span class="field">code</span>" : "<span class="value"><mark class="color10">vital-signs</mark></span>"
    }]
  }],
  "<span class="field">code</span>" : {
    "<span class="field">coding</span>" : [{
      "<span class="field">system</span>" : "<span class="value"><mark class="color12">http://loinc.org</mark></span>",
      "<span class="field">code</span>" : "<span class="value">85354-9</span>",
      "<span class="field">display</span>" : "<span class="value">Blood pressure panel with all children optional</span>"
    }]
  },
  "<span class="field">component</span>" : [{
    "<span class="field">code</span>" : {
      "<span class="field">coding</span>" : [{
        "<span class="field">system</span>" : "<span class="value"><mark class="color12">http://loinc.org</mark></span>",
        "<span class="field">code</span>" : "<span class="value"><mark class="color11">8480-6</mark></span>",
        "<span class="field">display</span>" : "<span class="value"><mark class="color13">Systolic blood pressure</mark></span>"
      }],
      "<span class="field">text</span>" : "<span class="value"><mark class="color13">Systolic blood pressure</mark></span>"
    },
    "<span class="field">valueQuantity</span>" : {
      "<span class="field">value</span>" : <mark class="color14">115,</mark>
      "<span class="field">unit</span>" : "<span class="value">mmHg</span>",
      "<span class="field">system</span>" : "<span class="value">http://unitsofmeasure.org</span>",
      "<span class="field">code</span>" : "<span class="value"><mark class="color15">mm[Hg]</mark></span>"
    }
  },
  {
    "<span class="field">code</span>" : {
      "<span class="field">coding</span>" : [{
        "<span class="field">system</span>" : "<span class="value"><mark class="color12">http://loinc.org</mark></span>",
        "<span class="field">code</span>" : "<span class="value"><mark class="color16">8462-4</mark></span>",
        "<span class="field">display</span>" : "<span class="value"><mark class="color17">Diastolic blood pressure</mark></span>"
      }],
      "<span class="field">text</span>" : "<span class="value"><mark class="color17">Diastolic blood pressure</mark></span>"
    },
    "<span class="field">valueQuantity</span>" : {
      "<span class="field">value</span>" : <mark class="color18">75,</mark>
      "<span class="field">unit</span>" : "<span class="value">mmHg</span>",
      "<span class="field">system</span>" : "<span class="value">http://unitsofmeasure.org</span>",
      "<span class="field">code</span>" : "<span class="value"><mark class="color15">mm[Hg]</mark></span>"
    }
  }]
}</div>
</td></tr>

### Example: Pulse Oximetry

<tr><th>C-CDA Pulse Oximetry (Codes & Values Only)</th><th>FHIR Pulse Oximetry</th></tr>
<tr><td>
<div class="border codeArea">&lt;<span class="field">organizer</span>&gt;
  <span class="comment">&lt;!-- C-CDA Vital Signs Organizer --&gt;</span>
  &lt;<span class="field">templateId</span> 
    <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.26"</span> 
    <span class="attrib">extension=</span><span class="value">"2015-08-01"</span> /&gt;
  &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"..."</span> /&gt;
  &lt;<span class="field">code</span> 
    <span class="attrib">code=</span><span class="value">"<mark class="color10">46680005</mark>"</span> 
    <span class="attrib">codeSystem=</span><span class="value">"2.16.840.1.113883.6.96"</span> 
    <span class="attrib">codeSystemName=</span><span class="value">"SNOMED CT"</span>
    <span class="attrib">displayName=</span><mark class="color10"><span class="value">"Vital Signs"</span></mark> /&gt;
  &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"completed"</span> /&gt;
  <span class="comment">&lt;!-- effectiveTime, author, etc stripped --&gt;</span>
  &lt;<span class="field">component</span>&gt;
    &lt;<span class="field">observation</span>&gt;
      <span class="comment">&lt;!-- C-CDA Vital Signs Observation --&gt;</span>
      &lt;<span class="field">templateId</span> 
        <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.27"</span>
        <span class="attrib">extension=</span><span class="value">"2014-06-09"</span> /&gt;
      &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"..."</span> /&gt;
      &lt;<span class="field">code</span> 
        <span class="attrib">code=</span><span class="value">"<mark class="color11">2708-6</mark>"</span> 
        <span class="attrib">codeSystem=</span><span class="value">"<mark class="color12">2.16.840.1.113883.6.1</mark>"</span> 
        <span class="attrib">codeSystemName=</span><span class="value">"<mark class="color12">LOINC</mark>"</span>
        <span class="attrib">displayName=</span><span class="value">"Oxygen saturation"</span> /&gt;
      &lt;<span class="field">value</span> <span class="attrib">xsi:type=</span><span class="value">"PQ"</span> 
        <span class="attrib">value=</span><mark class="color13"><span class="value">"98"</span></mark> 
        <span class="attrib">unit=</span><mark class="color14"><span class="value">"%"</span></mark> /&gt;
    &lt;/<span class="field">observation</span>&gt;
    &lt;<span class="field">observation</span>&gt;
      <span class="comment">&lt;!-- C-CDA Vital Signs Observation --&gt;</span>
      &lt;<span class="field">templateId</span> 
        <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.27"</span>
        <span class="attrib">extension=</span><span class="value">"2014-06-09"</span> /&gt;
      &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"..."</span> /&gt;
      &lt;<span class="field">code</span> 
        <span class="attrib">code=</span><span class="value">"<mark class="color15">3151-8</mark>"</span> 
        <span class="attrib">codeSystem=</span><span class="value">"<mark class="color12">2.16.840.1.113883.6.1</mark>"</span>
        <span class="attrib">codeSystemName=</span><span class="value">"<mark class="color12">LOINC</mark>"</span>
        <span class="attrib">displayName=</span><span class="value">"Inhaled Oxygen Flow Rate"</span> /&gt;
      &lt;<span class="field">value</span> <span class="attrib">xsi:type=</span><span class="value">"PQ"</span> 
        <span class="attrib">value=</span><mark class="color16"><span class="value">"6"</span></mark> 
        <span class="attrib">unit=</span><span class="value">"<mark class="color17">L/min</mark>"</span> /&gt;
    &lt;/<span class="field">observation</span>&gt;
    &lt;<span class="field">observation</span>&gt;
      <span class="comment">&lt;!-- C-CDA Vital Signs Observation --&gt;</span>
      &lt;<span class="field">templateId</span> 
        <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.27"</span>
        <span class="attrib">extension=</span><span class="value">"2014-06-09"</span> /&gt;
      &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"..."</span> /&gt;
      &lt;<span class="field">code</span> 
        <span class="attrib">code=</span><span class="value">"<mark class="color18">3150-0</mark>"</span> 
        <span class="attrib">codeSystem=</span><span class="value">"<mark class="color12">2.16.840.1.113883.6.1</mark>"</span> 
        <span class="attrib">codeSystemName=</span><span class="value">"<mark class="color12">LOINC</mark>"</span>
        <span class="attrib">displayName=</span><span class="value">"<mark class="color19">Inhaled Oxygen Concentration</mark>"</span> /&gt;
      &lt;<span class="field">value</span> <span class="attrib">xsi:type=</span><span class="value">"PQ"</span> 
        <span class="attrib">value=</span><mark class="color20"><span class="value">"35"</span></mark> 
        <span class="attrib">unit=</span><mark class="color14"><span class="value">"%"</span></mark> /&gt;
    &lt;/<span class="field">observation</span>&gt;
  &lt;/<span class="field">component</span>&gt;
&lt;/<span class="field">organizer</span>&gt;</div>

</td><td>
<div class="border codeArea">{
  "<span class="field">resourceType</span>": "<span class="value">Observation</span>",
  "<span class="field">status</span>": "<span class="value">final</span>",
  "<span class="field">category</span>": [{
    "<span class="field">coding</span>": [{
      "<span class="field">system</span>": "<span class="value">http://terminology.hl7.org/CodeSystem/observation-category</span>",
      "<span class="field">code</span>": "<span class="value"><mark class="color10">vital-signs</mark></span>"
    }]
  }],
  "<span class="field">code</span>": {
    "<span class="field">coding</span>": [{
      "<span class="field">system</span>": "<span class="value"><mark class="color12">http://loinc.org</mark></span>",
      "<span class="field">code</span>": "<span class="value"><mark class="color11">2708-6</mark></span>",
      "<span class="field">display</span>": "<span class="value">Oxygen saturation in Arterial blood</span>"
    },
    {
      "<span class="field">system</span>": "<span class="value"><mark class="color12">http://loinc.org</mark></span>",
      "<span class="field">code</span>": "<span class="value">59408-5</span>",
      "<span class="field">display</span>": "<span class="value">Oxygen saturation in Arterial blood by Pulse oximetry</span>"
    }]
  },
  "<span class="field">valueQuantity</span>": {
    "<span class="field">value</span>": <mark class="color13">98,</mark>
    "<span class="field">unit</span>": <mark class="color14">"%"</mark>,
    "<span class="field">system</span>": "<span class="value">http://unitsofmeasure.org</span>",
    "<span class="field">code</span>": <mark class="color14">"%"</mark>
  },
  "<span class="field">component</span>": [{
    "<span class="field">code</span>": {
      "<span class="field">coding</span>": [{
        "<span class="field">system</span>": "<span class="value"><mark class="color12">http://loinc.org</mark></span>",
        "<span class="field">code</span>": "<span class="value"><mark class="color15">3151-8</mark></span>",
        "<span class="field">display</span>": "<span class="value">Inhaled oxygen flow rate</span>"
      }]
    },
    "<span class="field">valueQuantity</span>": {
      "<span class="field">value</span>": <mark class="color16">6,</mark>
      "<span class="field">unit</span>": "<span class="value">liters/min</span>",
      "<span class="field">system</span>": "<span class="value">http://unitsofmeasure.org</span>",
      "<span class="field">code</span>": "<span class="value"><mark class="color17">L/min</mark></span>"
    }
  },
  {
    "<span class="field">code</span>": {
      "<span class="field">coding</span>": [{
        "<span class="field">system</span>": "<span class="value"><mark class="color12">http://loinc.org</mark></span>",
        "<span class="field">code</span>": "<span class="value"><mark class="color18">3150-0</mark></span>",
        "<span class="field">display</span>": "<span class="value"><mark class="color19">Inhaled Oxygen Concentration</mark></span>"
      }]
    },
    "<span class="field">valueQuantity</span>": {
      "<span class="field">value</span>": <mark class="color20">35,</mark>
      "<span class="field">unit</span>": <mark class="color14">"%"</mark>,
      "<span class="field">system</span>": "<span class="value">http://unitsofmeasure.org</span>",
      "<span class="field">code</span>": <mark class="color14">"%"</mark>
    }
  }]
}</div>
</td></tr>
</table>
