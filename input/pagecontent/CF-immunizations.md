<link rel="stylesheet" href="colors.css">

This page provides a mapping from CDA to FHIR. For the FHIR to CDA mapping, please refer to [Immunizations FHIR → CDA](./FC-immunizations.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html)

Mapping is from `@moodCode="EVN"` (i.e. historical) immunizations, not `INT` (future / planned) immunizations.

<br />
<br />
### C-CDA to FHIR

|C-CDA¹<br/>[Immunization Activity substanceAdministration](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-ImmunizationActivity.html)|FHIR<br/>[Immunization](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-immunization.html#profile)|Transform Steps|
|:----|:----|:----|
|/@negationInd="true"||Set ```.status="not-done"``` when @negationInd="true"|
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/statusCode|.status|[CDA statusCode → FHIR status](./ConceptMap-CF-ImmunizationStatus.html)|
|/effectiveTime/@value<br/>or<br/>/effectiveTime/low/@value|.occurrenceDateTime|EVN immunizations typically only contain a value, but if effectiveTime contains low/high, the occurenceDateTime should come from low.<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/repeatNumber/@value|.protocolApplied.doseNumberPositiveInt|**Note:** for @moodCode=EVN immunizations only|
|/routeCode|.route|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/approachSiteCode|.site|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/doseQuantity|.doseQuantity|[CDA ↔ FHIR Quantity](mappingGuidance.html#cda--fhir-quantity)|
|/consumable/manufacturedProduct/manufacturedMaterial/code|.vaccineCode|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)
|/consumable/manufacturedMaterial/lotNumberText|.lotNumber||
|/consumable/manufacturedMaterial/manufacturerOrganization|.manufacturer|
|N/A|.primarySource|Since this is unavailable in CDA, when mapping to a FHIR profile that requires the element (such as USCore prior to Release 6), include a [data-absent-reason extension](http://hl7.org/fhir/StructureDefinition/data-absent-reason).
|/author|**[Provenance](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-provenance.html)**|[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|/author/time|.recorded|Earliest, if more than one.<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/performer|.performer|Set ```performer.function="AP"```
|**[Immunization Refusal Reason](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-ImmunizationRefusalReason.html)**<br/>/entryRelationship[@typeCode="RSON"]²/observation/code<br/>(only if code is from ValueSet [No Immunization Reason](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113883.1.11.19717/expansion/Latest))|.statusReason|[CDA refusal → FHIR statusReason](ConceptMap-CF-ImmunizationRefusal.html)<br/>Indicates the reason the immunization event was **not** performed. This is generally only used for the status of "not-done".|
|**[Indication](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-Indication.html)**<br/>/entryRelationship[@typeCode="RSON"]²/observation/value<br/>(only if observation/code is from ValueSet [Problem Type](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113883.3.88.12.3221.7.2/expansion/Latest))|.reasonCode|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|**[Reaction](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-ReactionObservation.html)**<br/>/entryRelationship[@typeCode="MFST"]/observation/value|.reaction|It is recommended that reaction observation value be mapped to reaction detail (Observation) valueCodeable concept. Comments are welcome on how this may be best implemented.
|**[Comment Activity](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-CommentActivity.html)**<br/>/entryRelationship/act[code/@code="48767-8"]/text|**[Annotation](https://hl7.org/fhir/datatypes.html#Annotation)**<br/>.note||


1\. XPath abbrievated for C-CDA Immunization Activity as: <br/> ClinicalDocument/component/structuredBody/component/section[code/@code="11369-6"]/entry/substanceAdministration<br/>
2\. Both indication and refusal reason are observations related by @typeCode="RSON". Typically templateIds should not be used to identify content, but the Indication template does not require a specific code. If the observation/code comes from ValueSet [No Immunization Reason](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113883.1.11.19717/expansion/Latest), then it is clearly a refusal reason. If it comes from ValueSet [Problem Type](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113883.3.88.12.3221.7.2/expansion/Latest), then it is an indication. But if the code comes from neither value set, the observation is *possibly* an indication, but the only way to know is to check the templateId.

### Illustrative example

<table><tr><th>CDA Immunization Example</th><th>FHIR Immunization Resource</th></tr>
<tr><td>
<div id="cda" class="border codeArea">&lt;<span class="field">substanceAdministration</span> <span class="attrib">classCode=</span><span class="value">"SBADM"</span> <span class="attrib">moodCode=</span><span class="value">"EVN"</span> <span class="attrib">negationInd=</span><span class="value">"false"</span>&gt;
  <span class="comment">&lt;!-- ** Immunization activity ** --&gt;</span>
  &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.52"</span>/&gt;
  &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.52"</span> <span class="attrib">extension=</span><span class="value">"2015-08-01"</span>/&gt;
  &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"<mark class="color10">e6f1ba43-c0ed-4b9b-9f12-f435d8ad8f92</mark>"</span>/&gt;
  &lt;<span class="field">text</span>&gt;
    &lt;<span class="field">reference</span> <span class="attrib">value=</span><span class="value">"#immun1"</span>/&gt;
  &lt;/<span class="field">text</span>&gt;
  <span class="comment">&lt;!-- Indicates the status of the substanceAdministartion --&gt;</span>
  &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"<mark class="color11">completed</mark>"</span>/&gt;
  &lt;<span class="field">effectiveTime</span> <span class="attrib">value=</span><span class="value">"<mark class="color12">20100815</mark>"</span>/&gt;
  &lt;<span class="field">repeatNumber</span> <span class="attrib">value=</span><mark class="color13"><span class="value">"1"</span></mark>/&gt;
  &lt;<span class="field">routeCode</span> 
    <span class="attrib">code=</span><span class="value">"<mark class="color14">C28161</mark>"</span> 
    <span class="attrib">codeSystem=</span><span class="value">"2.16.840.1.113883.3.26.1.1"</span> 
    <span class="attrib">codeSystemName=</span><span class="value">"National Cancer Institute (NCI) Thesaurus"</span> 
    <span class="attrib">displayName=</span><span class="value">"<mark class="color15">Intramuscular Route of Administration</mark>"</span> /&gt;
  &lt;<span class="field">approachSiteCode</span> 
    <span class="attrib">code=</span><span class="value">"<mark class="color16">700022004</mark>"</span> 
    <span class="attrib">codeSystem=</span><span class="value">"<mark class="color17">2.16.840.1.113883.6.96</mark>"</span> 
    <span class="attrib">codeSystemName=</span><span class="value">"<mark class="color17"><mark class="color17">SNOMED</mark> CT</mark>"</span> 
    <span class="attrib">displayName=</span><span class="value">"<mark class="color18">Muscle and/or tendon structure of upper limb</mark>"</span> /&gt;
  &lt;<span class="field">doseQuantity</span> <span class="attrib">value=</span><mark class="color19"><span class="value">"60"</span></mark> unit=<mark class="color20"><span class="value">"ug"</span></mark> /&gt;
  &lt;<span class="field">administrationUnitCode</span> 
    <span class="attrib">code=</span><span class="value">"C44278"</span> 
    <span class="attrib">codeSystem=</span><span class="value">"2.16.840.1.113883.3.26.1.1"</span> 
    <span class="attrib">codeSystemName=</span><span class="value">"National Cancer Institute (NCI) Thesaurus"</span> 
    <span class="attrib">displayName=</span><span class="value">"Unit"</span>/&gt;
  &lt;<span class="field">consumable</span>&gt;
    &lt;<span class="field">manufacturedProduct</span> <span class="attrib">classCode=</span><span class="value">"MANU"</span>&gt;
      <span class="comment">&lt;!-- ** Immunization medication information ** --&gt;</span>
      &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.54"</span>/&gt;
      &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.54"</span> <span class="attrib">extension=</span><span class="value">"2014-06-09"</span>/&gt;
      &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"5823d446-9066-11ee-b9d1-0242ac120002"</span>/&gt;
      &lt;<span class="field">manufacturedMaterial</span>&gt;
        &lt;<span class="field">code</span> 
          <span class="attrib">code=</span><mark class="color21"><span class="value">"88"</span></mark> 
          <span class="attrib">codeSystem=</span><span class="value">"<mark class="color22">2.16.840.1.113883.12.292</mark>"</span> 
          <span class="attrib">displayName=</span><span class="value">"<mark class="color23">Influenza virus vaccine</mark>"</span> 
          <span class="attrib">codeSystemName=</span><span class="value">"CVX"</span>&gt;
          &lt;<span class="field">originalText</span>&gt;
            &lt;<span class="field">reference</span> <span class="attrib">value=</span><span class="value">"#ImmunizationProduct_100"</span>/&gt;
          &lt;/<span class="field">originalText</span>&gt;
          &lt;<span class="field">translation</span> 
            <span class="attrib">code=</span><span class="value">"<mark class="color24">49281-0422-50</mark>"</span> 
            <span class="attrib">codeSystem=</span><span class="value">"<mark class="color25">2.16.840.1.113883.6.69</mark>"</span> 
            <span class="attrib">codeSystemName=</span><span class="value">"NDC"</span> 
            <span class="attrib">displayName=</span><span class="value">"<mark class="color26">Influenza vaccine</mark>"</span>/&gt;
        &lt;/<span class="field">code</span>&gt;
        &lt;<span class="field">lotNumberText</span>&gt;1&lt;/<span class="field">lotNumberText</span>&gt;
      &lt;/<span class="field">manufacturedMaterial</span>&gt;
      &lt;<span class="field">manufacturerOrganization</span>&gt;
        &lt;<span class="field">name</span>&gt;<mark class="color27">Health LS - Immuno Inc.</mark>&lt;/<span class="field">name</span>&gt;
      &lt;/<span class="field">manufacturerOrganization</span>&gt;
    &lt;/<span class="field">manufacturedProduct</span>&gt;
  &lt;/<span class="field">consumable</span>&gt;
  <span class="comment">&lt;!-- Optional Performer --&gt;</span>
  <span class="comment">&lt;!-- Creates resource: <mark class="color30">PractitionerRole/AmandaAtGoodHealthClinics</mark> --&gt;</span>
  <span class="comment">&lt;!-- With functionCode:<mark class="color31"> AP </mark>--&gt;</span>
  &lt;<span class="field">performer</span>&gt;
    &lt;<span class="field">assignedEntity</span>&gt;
      &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.19.5.9999.456"</span> <span class="attrib">extension=</span><span class="value">"2981824"</span>/&gt;
      &lt;<span class="field">addr</span>&gt;
        &lt;<span class="field">streetAddressLine</span>&gt;1021 Health Drive&lt;/<span class="field">streetAddressLine</span>&gt;
        &lt;<span class="field">city</span>&gt;Ann Arbor&lt;/<span class="field">city</span>&gt;
        &lt;<span class="field">state</span>&gt;MI&lt;/<span class="field">state</span>&gt;
        &lt;<span class="field">postalCode</span>&gt;99099&lt;/<span class="field">postalCode</span>&gt;
      &lt;/<span class="field">addr</span>&gt;
      &lt;<span class="field">telecom</span> <span class="attrib">nullFlavor=</span><span class="value">"UNK"</span>/&gt;
      &lt;<span class="field">assignedPerson</span>&gt;
        &lt;<span class="field">name</span>&gt;
          &lt;<span class="field">given</span>&gt;Amanda&lt;/<span class="field">given</span>&gt;
          &lt;<span class="field">family</span>&gt;Assigned&lt;/<span class="field">family</span>&gt;
        &lt;/<span class="field">name</span>&gt;
      &lt;/<span class="field">assignedPerson</span>&gt;
      &lt;<span class="field">representedOrganization</span>&gt;
        &lt;<span class="field">name</span>&gt;Good Health Clinic&lt;/<span class="field">name</span>&gt;
      &lt;/<span class="field">representedOrganization</span>&gt;
    &lt;/<span class="field">assignedEntity</span>&gt;
  &lt;/<span class="field">performer</span>&gt;
  <span class="comment">&lt;!-- Optional Author --&gt;</span>
  &lt;<span class="field">author</span>&gt;
    &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.119"</span>/&gt;
    &lt;<span class="field">time</span> <span class="attrib">value=</span><span class="value">"<mark class="color12">20100815</mark>"</span>/&gt;
    &lt;<span class="field">assignedAuthor</span>&gt;
      &lt;<span class="field">id</span> <span class="attrib">extension=</span><span class="value">"99999999"</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.4.6"</span>/&gt;
      &lt;<span class="field">telecom</span> <span class="attrib">use=</span><span class="value">"WP"</span> <span class="attrib">value=</span><span class="value">"tel:555-555-1002"</span>/&gt;
      &lt;<span class="field">assignedPerson</span>&gt;
        &lt;<span class="field">name</span>&gt;
          &lt;<span class="field">given</span>&gt;Henry&lt;/<span class="field">given</span>&gt;
          &lt;<span class="field">family</span>&gt;Seven&lt;/<span class="field">family</span>&gt;
        &lt;/<span class="field">name</span>&gt;
      &lt;/<span class="field">assignedPerson</span>&gt;
    &lt;/<span class="field">assignedAuthor</span>&gt;
  &lt;/<span class="field">author</span>&gt;
  &lt;<span class="field">entryRelationship</span> <span class="attrib">typeCode=</span><span class="value">"RSON"</span>&gt;
    &lt;<span class="field">observation</span> <span class="attrib">classCode=</span><span class="value">"OBS"</span> <span class="attrib">moodCode=</span><span class="value">"EVN"</span>&gt;
      <span class="comment">&lt;!-- Indication (V2) --&gt;</span>
      &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.19"</span> <span class="attrib">extension=</span><span class="value">"2014-06-09"</span>/&gt;
      &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.19"</span>/&gt;
      &lt;<span class="field">code</span> 
        <span class="attrib">codeSystem=</span><span class="value">"2.16.840.1.113883.6.96"</span> 
        <span class="attrib">codeSystemName=</span><span class="value">"SNOMED CT"</span> 
        <span class="attrib">code=</span><span class="value">"404684003"</span> 
        <span class="attrib">displayName=</span><span class="value">"Clinical finding"</span>/&gt;
      &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"completed"</span>/&gt;
      &lt;<span class="field">value</span> <span class="attrib">xsi:type=</span><span class="value">"CD"</span> 
        <span class="attrib">code=</span><span class="value">"<mark class="color28">195967001</mark>"</span> 
        <span class="attrib">codeSystem=</span><span class="value">"<mark class="color17">2.16.840.1.113883.6.96</mark>"</span> 
        <span class="attrib">displayName=</span><span class="value">"<mark class="color29">asthma</mark>"</span> /&gt;
    &lt;/<span class="field">observation</span>&gt;
  &lt;/<span class="field">entryRelationship</span>&gt;
  <span class="comment">&lt;!-- Reaction becomes Observation with id: <mark class="color32">Observation/WithCode247472004Wheal</mark> --&gt;</span>
  &lt;<span class="field">entryRelationship</span> <span class="attrib">typeCode=</span><span class="value">"MFST"</span> <span class="attrib">inversionInd=</span><span class="value">"true"</span>&gt;
    &lt;<span class="field">observation</span> <span class="attrib">classCode=</span><span class="value">"OBS"</span> <span class="attrib">moodCode=</span><span class="value">"EVN"</span>&gt;
      &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.9"</span> <span class="attrib">extension=</span><span class="value">"2014-06-09"</span> /&gt;
      &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.9"</span> /&gt;
      &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"37006474-947a-11ee-b9d1-0242ac120002"</span>/&gt;
      &lt;<span class="field">code</span> <span class="attrib">code=</span><span class="value">"ASSERTION"</span> <span class="attrib">codeSystem=</span><span class="value">"2.16.840.1.113883.5.4"</span> /&gt;
      &lt;<span class="field">text</span>&gt;
        &lt;<span class="field">reference</span> <span class="attrib">value=</span><span class="value">"#_8a7ed342-967a-400e-88d5-2f8c2b7cdda0"</span> /&gt;
      &lt;/<span class="field">text</span>&gt;
      &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"completed"</span> /&gt;
      &lt;<span class="field">effectiveTime</span>&gt;
        &lt;<span class="field">low</span> <span class="attrib">value=</span><span class="value">"20080501"</span>/&gt;
        &lt;<span class="field">high</span> <span class="attrib">value=</span><span class="value">"20080501"</span>/&gt;
      &lt;/<span class="field">effectiveTime</span>&gt;
      &lt;<span class="field">value</span> <span class="attrib">xsi:type=</span><span class="value">"CD"</span> 
        <span class="attrib">code=</span><span class="value">"247472004"</span> 
        <span class="attrib">codeSystem=</span><span class="value">"2.16.840.1.113883.6.96"</span> 
        <span class="attrib">displayName=</span><span class="value">"Wheal"</span> /&gt;
    &lt;/<span class="field">observation</span>&gt;
  &lt;/<span class="field">entryRelationship</span>&gt;
&lt;/<span class="field">substanceAdministration</span>&gt;</div>
</td><td>
<div id="fhir" class="border codeArea">{
  "<span class="field">resourceType</span>": "<span class="value">Immunization</span>",
  "<span class="field">id</span>": "<span class="value">2b622767-4560-46ba-a1ac-58092fcdcdda</span>",
  "<span class="field">status</span>": "<span class="value"><mark class="color11">completed</mark></span>",
  "<span class="field">identifier</span>": [
    {
      "<span class="field">system</span>": "<span class="value">urn:ietf:rfc:3986</span>",
      "<span class="field">value</span>": "<span class="value">urn:uuid:<mark class="color10">e6f1ba43-c0ed-4b9b-9f12-f435d8ad8f92</mark></span>"
    }
  ],
  "<span class="field">vaccineCode</span>": {
    "<span class="field">coding</span>": [
      {
        "<span class="field">system</span>": "<span class="value"><mark class="color22">http://hl7.org/fhir/sid/cvx</mark></span>",
        "<span class="field">code</span>": <mark class="color21">"88"</mark>,
        "<span class="field">display</span>": "<span class="value"><mark class="color23">Influenza virus vaccine</mark></span>"
      },
      {
        "<span class="field">system</span>": "<span class="value"><mark class="color25">http://hl7.org/fhir/sid/ndc</mark></span>",
        "<span class="field">code</span>": "<span class="value"><mark class="color24">49281-0422-50</mark></span>",
        "<span class="field">display</span>": "<span class="value"><mark class="color26">Influenza vaccine</mark></span>"
      }
    ],
    "<span class="field">text</span>": "<span class="value"><mark class="color23">Influenza virus vaccine</mark></span>"
  },
  "<span class="field">doseQuantity</span>": {
    "<span class="field">unit</span>": <mark class="color20">"ug"</mark>,
    "<span class="field">value</span>": <mark class="color19">60,</mark>
    "<span class="field">system</span>": "<span class="value">http://unitofmeasure.org</span>",
    "<span class="field">code</span>": <mark class="color20">"ug"</mark>
  },
  "<span class="field">lotNumber</span>": <mark class="color13">"1"</mark>,
  "<span class="field">recorded</span>": "<span class="value"><mark class="color12">2010-08-15</mark></span>",
  "<span class="field">performer</span>": [
    {
      "<span class="field">actor</span>": {
        "<span class="field">reference</span>": "<span class="value"><mark class="color30">PractitionerRole/AmandaAtGoodHealthClinics</mark></span>"
      },
      "<span class="field">function</span>": {
        "<span class="field">coding</span>": [
          {
            "<span class="field">system</span>": "<span class="value">http://terminology.hl7.org/CodeSystem/v2-0443</span>",
            "<span class="field">code</span>": <mark class="color31">"AP"</mark>,
            "<span class="field">display</span>": "<span class="value">Administering Provider</span>"
          }
        ]
      }
    }
  ],
  "<span class="field">reasonCode</span>": [
    {
      "<span class="field">coding</span>": [
        {
          "<span class="field">system</span>": "<span class="value"><mark class="color17">http://snomed.info/sct</mark></span>",
          "<span class="field">code</span>": "<span class="value"><mark class="color28">195967001</mark></span>",
          "<span class="field">display</span>": "<span class="value"><mark class="color29">asthma</mark></span>"
        }
      ]
    }
  ],
  "<span class="field">_primarySource</span>": {
    "<span class="field">extension</span>": [
      {
        "<span class="field">url</span>": "<span class="value">http://hl7.org/fhir/StructureDefinition/data-absent-reason</span>",
        "<span class="field">valueCode</span>": "<span class="value">unknown</span>"
      }
    ]
  },
  "<span class="field">manufacturer</span>": {
    "<span class="field">display</span>": "<span class="value"><mark class="color27">Health LS - Immuno Inc.</mark></span>"
  },
  "<span class="field">site</span>": {
    "<span class="field">coding</span>": [
      {
        "<span class="field">system</span>": "<span class="value"><mark class="color17">http://snomed.info/sct</mark></span>",
        "<span class="field">code</span>": "<span class="value"><mark class="color16">700022004</mark></span>",
        "<span class="field">display</span>": "<span class="value"><mark class="color18">Muscle and/or tendon structure of upper limb</mark></span>"
      }
    ]
  },
  "<span class="field">route</span>": {
    "<span class="field">coding</span>": [
      {
        "<span class="field">system</span>": "<span class="value">http://ncithesaurus-stage.nci.nih.gov</span>",
        "<span class="field">code</span>": "<span class="value"><mark class="color14">C28161</mark></span>",
        "<span class="field">display</span>": "<span class="value"><mark class="color15">Intramuscular Route of Administration</mark></span>"
      }
    ]
  },
  "<span class="field">patient</span>": {
    "<span class="field">reference</span>": "<span class="value">Patient/6581e92eb6ff5dadc088eae5</span>"
  },
  "<span class="field">protocolApplied</span>": [
    {
      "<span class="field">doseNumberPositiveInt</span>": <mark class="color13">1
</mark>    }
  ],
  "<span class="field">occurrenceDateTime</span>": "<span class="value"><mark class="color12">2010-08-15</mark></span>",
  "<span class="field">reaction</span>": [
    {
      "<span class="field">detail</span>": {
        "<span class="field">reference</span>": "<span class="value"><mark class="color32">Observation/WithCode247472004Wheal</mark></span>"
      }
    }
  ]
}</div>
</td></tr></table>

### Example: Refused Immunization

<table><tr><th>CDA Refused Immunization Example</th><th>FHIR Immunization Resource</th></tr>
<tr><td>
<div id="cda" class="border codeArea">&lt;<span class="field">entry</span> <span class="attrib">typeCode=</span><span class="value">"COMP"</span>&gt;
  <span class="comment">&lt;!-- negationInd=true indicates substance was NOT given at this date--&gt;</span>
  &lt;<span class="field">substanceAdministration</span> <span class="attrib">classCode=</span><span class="value">"SBADM"</span> <span class="attrib">moodCode=</span><span class="value">"EVN"</span> <mark class="color10">negationInd=<span class="value">"true"</span></mark>&gt;
    <span class="comment">&lt;!-- ** Immunization activity ** --&gt;</span>
    &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.52"</span>/&gt;
    &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.52"</span> <span class="attrib">extension=</span><span class="value">"2015-08-01"</span>/&gt;
    &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"<mark class="color11">8d5942f9-5413-4486-af89-dcc5603dbec7</mark>"</span>/&gt;
    &lt;<span class="field">text</span>&gt;
      &lt;<span class="field">reference</span> <span class="attrib">value=</span><span class="value">"#immun2"</span>/&gt;
    &lt;/<span class="field">text</span>&gt;
    <span class="comment">&lt;!-- Indicates the status of the substanceAdministartion --&gt;</span>
    &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"completed"</span>/&gt;
    &lt;<span class="field">effectiveTime</span> <span class="attrib">value=</span><span class="value">"<mark class="color12">20151115</mark>"</span>/&gt;
    &lt;<span class="field">consumable</span>&gt;
      &lt;<span class="field">manufacturedProduct</span> <span class="attrib">classCode=</span><span class="value">"MANU"</span>&gt;
        <span class="comment">&lt;!-- ** Immunization medication information ** --&gt;</span>
        &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.54"</span>/&gt;
        &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.54"</span> <span class="attrib">extension=</span><span class="value">"2014-06-09"</span>/&gt;
        &lt;<span class="field">manufacturedMaterial</span>&gt;
          &lt;<span class="field">code</span> 
            <span class="attrib">code=</span><mark class="color13"><span class="value">"43"</span></mark> 
            <span class="attrib">codeSystem=</span><span class="value">"<mark class="color14">2.16.840.1.113883.12.292</mark>"</span> 
            <span class="attrib">displayName=</span><span class="value">"<mark class="color15">hepatitis B vaccine, adult dosage</mark>"</span> 
            <span class="attrib">codeSystemName=</span><span class="value">"CVX"</span>&gt;
            &lt;<span class="field">originalText</span>&gt;hepatitis B vaccine&lt;/<span class="field">originalText</span>&gt;
          &lt;/<span class="field">code</span>&gt;
          &lt;lotNumberText<mark class="color16">&gt;2&lt;</mark>/lotNumberText&gt;
        &lt;/<span class="field">manufacturedMaterial</span>&gt;
      &lt;/<span class="field">manufacturedProduct</span>&gt;
    &lt;/<span class="field">consumable</span>&gt;
    &lt;<span class="field">entryRelationship</span> <span class="attrib">typeCode=</span><span class="value">"RSON"</span>&gt;
      &lt;<span class="field">observation</span> <span class="attrib">classCode=</span><span class="value">"OBS"</span> <span class="attrib">moodCode=</span><span class="value">"EVN"</span>&gt;
        <span class="comment">&lt;!-- Immunization Refusal Reason  --&gt;</span>
        <span class="comment">&lt;!-- Included the reason since it may be relevant 
        to a future clinician or quality measurement --&gt;</span>
        &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.53"</span>/&gt;
        &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"c1296315-9a6d-45a2-aac0-ee225d375409"</span>/&gt;
        &lt;<span class="field">code</span> 
          <span class="attrib">displayName=</span><span class="value">"<mark class="color17">patient objection</mark>"</span> 
          <span class="attrib">code=</span><span class="value">"<mark class="color18">PATOBJ</mark>"</span> 
          <span class="attrib">codeSystemName=</span><span class="value">"HL7 ActNoImmunizationReason"</span> 
          <span class="attrib">codeSystem=</span><span class="value">"<mark class="color19">2.16.840.1.113883.5.8</mark>"</span>/&gt;
        &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"completed"</span>/&gt;
      &lt;/<span class="field">observation</span>&gt;
    &lt;/<span class="field">entryRelationship</span>&gt;
  &lt;/<span class="field">substanceAdministration</span>&gt;
&lt;/<span class="field">entry</span>&gt;</div>
</td><td>
<div id="fhir" class="border codeArea">{
  "<span class="field">id</span>": "<span class="value">f122ceadccaa4a9accdc117634a89dda</span>",
  "<span class="field">resourceType</span>": "<span class="value">Immunization</span>",
  "<span class="field">vaccineCode</span>": {
    "<span class="field">coding</span>": [{
      "<span class="field">code</span>": <mark class="color13">"43"</mark>,
      "<span class="field">display</span>": "<span class="value"><mark class="color15">hepatitis B vaccine, adult dosage</mark></span>",
      "<span class="field">system</span>": "<span class="value"><mark class="color14">http://hl7.org/fhir/sid/cvx</mark></span>"
    }]
  },
  "<span class="field">identifier</span>": [{
    "<span class="field">system</span>": "<span class="value">urn:ietf:rfc:3986</span>",
    "<span class="field">value</span>": "<span class="value">urn:uuid:<mark class="color11">8d5942f9-5413-4486-af89-dcc5603dbec7</mark></span>"
  }],
  "<span class="field">lotNumber</span>": <mark class="color16">"2"</mark>,
  "<span class="field">occurrenceDateTime</span>": "<span class="value"><mark class="color12">2015-11-15</mark></span>",
  "<span class="field">patient</span>": {
    "<span class="field">reference</span>": "<span class="value">Patient/fff</span>"
  },
  "<span class="field">_primarySource</span>": {
    "<span class="field">extension</span>": [{
      "<span class="field">url</span>": "<span class="value">http://hl7.org/fhir/StructureDefinition/data-absent-reason</span>",
      "<span class="field">valueCode</span>": "<span class="value">unknown</span>"
    }]
  },
  "<span class="field">status</span>": "<span class="value"><mark class="color10">not-done</mark></span>",
  "<span class="field">statusReason</span>": {
    "<span class="field">coding</span>": [{
      "<span class="field">code</span>": "<span class="value"><mark class="color18">PATOBJ</mark></span>",
      "<span class="field">display</span>": "<span class="value"><mark class="color17">patient objection</mark></span>",
      "<span class="field">system</span>": "<span class="value"><mark class="color19">http://terminology.hl7.org/CodeSystem/v3-ActReason</mark></span>"
    }]
  }
}</div>
</td></tr></table>

#### Links to example content

The consensus mapping example developed through multiple vendors are available below:
* [Immuniztion CDA example](./Binary-CF-immunization.html)
* [Immuniztion FHIR example](./Immunization-CF-immunization.html)