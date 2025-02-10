<link rel="stylesheet" href="colors.css">

This page provides a mapping from CDA to FHIR. For the FHIR to CDA mapping, please refer to [Allergies FHIR → CDA](./FC-allergies.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html)

**Uncommon use case:** Multiple C-CDA Allergy Intolerance observations inside a single Allergy Concern act should map to separate and distinct FHIR AllergyIntolerance resources. The C-CDA Companion Guide ([see 5.2.7.1](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=447)) actively discourages the practice of multiple observations inside a single act. It may occur, however, since Allergy Concern act allows for multiple Allergy Intolerance observations in C-CDA. Lossless transformations may not be possible without the use of extensions ([see 3.1 of this guide](./mappingBackground.html)).

<br />
### C-CDA to FHIR

| C-CDA¹ <br/>[Allergy Concern act](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-AllergyConcernAct.html)| FHIR <br/>[AllergyIntolerance](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-allergyintolerance.html)|Transform Steps & Notes|
|:-------|:------|:---------|
|/statusCode|.clinicalStatus|For more information on how status is managed in Allergy Concern Act wrapper, refer to [C-CDA clinical statement status guidance](https://hl7.org/cda/us/ccda/3.0.0/generalguidance.html#assessing-the-status-of-a-clinical-statement)<br/>Also see Status entryRelationship mapping below|
| All of the following are a **[Allergy Intolerance observation](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-AllergyIntoleranceObservation.html)** nested inside the **[Allergy Concern act](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-AllergyConcernAct.html)**. Each observation should become a distinct FHIR **[AllergyIntolerance](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-allergyintolerance.html)** resource.<br/>Include /entryRelationship[@typeCode="SUBJ"]/observation prefix to rows below²|
|/@negationInd||See constraints under /participant 
|/id|.identifier| [CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/effectiveTime/low|.onsetDateTime|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)<br/>effectiveTime/high should not be mapped within onset (DateTime or Period)|
|/effectiveTime/high|.extension:[allergyintolerance-abatement](http://hl7.org/fhir/StructureDefinition/allergyintolerance-abatement)||
|/value|.type<br/>&<br/>.category|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>[CDA value → FHIR type](ConceptMap-CF-AllergyIntoleranceType.html) <br/> [CDA value → FHIR category](./ConceptMap-CF-AllergyIntoleranceCategory.html)|
|/author|.recorder<br/>&<br/>**[Provenance](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-provenance.html)**|**Constraint:** Only map last CDA author to FHIR recorder<br/>[Guidance on CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|/author/time|.recordedDate|**Constraint:** Only map earliest author/time <br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|/participant/participantRole/playingEntity/code|.code|**Constraint:** When CDA negation is absent or false<br/>[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/participant/participantRole/playingEntity/code<br/>&<br/>/value|.code|**Constraint:** When CDA negation is true and nullFlavor is used in playingEntity/code<br/>[CDA No known allergy → FHIR code](ConceptMap-CF-NoKnownAllergies.html)<br/> When negation is true and playingEntity/code is populated, use equivalent negated concept (e.g. map latex substance to no known latex allergy [1003774007, SNOMED CT]) if available. If not, use the [substanceExposureRisk extension](https://hl7.org/fhir/extensions/StructureDefinition-allergyintolerance-substanceExposureRisk.html), placing the substance in the substance sub-extension and setting the exposureRisk sub-extension to `no-known-reaction-risk`. Note that when using this extension, the AllergyIntolerance resource will not be a conformant US Core AllergyIntolerance since the extension prohibits the required .code element.|
|**[Status](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-AllergyStatusObservation.html)**<br/>/entryRelationship/observation[code/@code="33999-4"]/value³|.clinicalStatus|[CDA Allergy Status Observation value → FHIR clinicalStatus](./ConceptMap-CF-AllergyStatus.html)
|**[Reaction](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-ReactionObservation.html)**<br/>/entryRelationship[@typeCode="MFST"]/observation/value³|.reaction.manifestation|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>Both use SNOMED clinical findings with minor valueSet definition differences
|**[Severity](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-SeverityObservation.html)** (nested inside Reaction)<br/>/entryRelationship[@typeCode="MFST"]/observation/...<br/>&nbsp;&nbsp;&nbsp;...entryRelationship/observation[code/@code="SEV"]/value³|.reaction.severity|[CDA Severity value → FHIR Severity](./ConceptMap-CF-Severity.html)<br/>**Note:** CDA documents should not assign severity at the Allergy level.<br/><br/>In cases where CDA assigns severity only to the Allergy rather than the reaction, map the severity to FHIR reaction severity, even if there are more than one. This means assuming that the same severity applies to all child reactions.<br/><br/>If severity is assigned at both levels, the reaction level should be used.
|**[Criticality](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-CriticalityObservation.html)**<br/>/entryRelationship/observation[code/@code="82606-5"]/value³|.criticality|[CDA Criticality value → FHIR Criticality](./ConceptMap-CF-Criticality.html)
|**[Comment Activity](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-CommentActivity.html)**<br/>/entryRelationship/act[code/@code="48767-8"]/text³|**[Annotation](https://hl7.org/fhir/datatypes.html#Annotation)**<br/>.note|See [Comment → Annotation](mappingGuidance.html#comment--annotation)|


1\. XPath abbreviated for C-CDA Allergy Concern act as: <br/> ClinicalDocument/component/structuredBody/component/section[code/@code="48765-2"]/entry/act/

2\. XPath abbreviated for C-CDA Allergy Intolerance observation as: <br/> ClinicalDocument/component/structuredBody/component/section[code/@code="48765-2"]/entry/act/entryRelationship[@typeCode="SUBJ"]/observation

3\. Note that these entryRelationships will also have inversionInd="true" in CDA

When authors or other provenance are recorded only in the parent [Allergy Concern Act](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-AllergyConcernAct.html), it is recommended that those data be mapped to the FHIR AllergyIntolerance. 

### Example

<table><tr><th>CDA Allergy Act</th><th>FHIR AllergyIntolerance Resource</th></tr>
<tr><td>
<div id="cda" class="border codeArea">&lt;<span class="field">act</span> <span class="attrib">classCode=</span><span class="value">"ACT"</span> <span class="attrib">moodCode=</span><span class="value">"EVN"</span>&gt;
  &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.30"</span> <span class="attrib">extension=</span><span class="value">"2015-08-01"</span> /&gt;
  &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.30"</span> /&gt;
  &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"1.3.6.1.4.1.22812.3.2009316.3.4.10"</span> <span class="attrib">extension=</span><span class="value">"<mark class="color10">545077400001</mark>"</span> /&gt;
  &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"1.3.6.1.4.1.22812.3.2009316.3.4.10"</span> <span class="attrib">extension=</span><span class="value">"<mark class="color11">545077400003</mark>"</span> /&gt;
  &lt;<span class="field">code</span> <span class="attrib">code=</span><span class="value">"CONC"</span> <span class="attrib">codeSystem=</span><span class="value">"2.16.840.1.113883.5.6"</span> /&gt;
  &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"<mark class="color12">active</mark>"</span> /&gt;
  &lt;<span class="field">effectiveTime</span> <span class="attrib">xsi:type=</span><span class="value">"IVL_TS"</span>&gt;
    &lt;<span class="field">low</span> <span class="attrib">nullFlavor=</span><span class="value">"NI"</span> /&gt;
  &lt;/<span class="field">effectiveTime</span>&gt;
  &lt;<span class="field">entryRelationship</span> <span class="attrib">typeCode=</span><span class="value">"SUBJ"</span>&gt;
    &lt;<span class="field">observation</span> <span class="attrib">classCode=</span><span class="value">"OBS"</span> <span class="attrib">moodCode=</span><span class="value">"EVN"</span>&gt;
      &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.7"</span> <span class="attrib">extension=</span><span class="value">"2014-06-09"</span> /&gt;
      &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.7"</span> /&gt;
      &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"<mark class="color13">1.3.6.1.4.1.22812.3.2009316.3.4.10.2</mark>"</span> <span class="attrib">extension=</span><span class="value">"<mark class="color10">545077400001</mark>"</span> /&gt;
      &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"<mark class="color13">1.3.6.1.4.1.22812.3.2009316.3.4.10.2</mark>"</span> <span class="attrib">extension=</span><span class="value">"<mark class="color11">545077400003</mark>"</span> /&gt;
      &lt;<span class="field">code</span> <span class="attrib">code=</span><span class="value">"ASSERTION"</span> <span class="attrib">codeSystem=</span><span class="value">"2.16.840.1.113883.5.4"</span> /&gt;
      &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"completed"</span> /&gt;
      &lt;<span class="field">effectiveTime</span> <span class="attrib">xsi:type=</span><span class="value">"IVL_TS"</span>&gt;
        &lt;<span class="field">low</span> <span class="attrib">value=</span><span class="value">"<mark class="color14">20080501</mark>"</span> /&gt;
      &lt;/<span class="field">effectiveTime</span>&gt;
      &lt;<span class="field">value</span> <span class="attrib">xsi:type=</span><span class="value">"CD"</span> 
        <span class="attrib">code=</span><span class="value">"<mark class="color15">419511003</mark>"</span> 
        <span class="attrib">codeSystem=</span><span class="value">"<mark class="color16">2.16.840.1.113883.6.96</mark>"</span>&gt;
        &lt;<span class="field">originalText</span>&gt;
          &lt;<span class="field">reference</span> <span class="attrib">value=</span><span class="value">"#_6db75b62-deb2-4bab-b597-00c8ae86f6b4"</span> /&gt;
        &lt;/<span class="field">originalText</span>&gt;
      &lt;/<span class="field">value</span>&gt;
      &lt;<span class="field">participant</span> <span class="attrib">typeCode=</span><span class="value">"CSM"</span>&gt;
        &lt;<span class="field">participantRole</span> <span class="attrib">classCode=</span><span class="value">"MANU"</span>&gt;
          &lt;<span class="field">playingEntity</span> <span class="attrib">classCode=</span><span class="value">"MMAT"</span>&gt;
            &lt;<span class="field">code</span> 
              <span class="attrib">code=</span><span class="value">"<mark class="color17">1191</mark>"</span> 
              <span class="attrib">codeSystem=</span><span class="value">"<mark class="color18">2.16.840.1.113883.6.88</mark>"</span> 
              <span class="attrib">displayName=</span><span class="value">"<mark class="color19">Aspirin</mark>"</span>&gt;
              &lt;<span class="field">translation</span> 
                <span class="attrib">code=</span><span class="value">"<mark class="color20">293586001</mark>"</span> 
                <span class="attrib">codeSystem=</span><span class="value">"<mark class="color16">2.16.840.1.113883.6.96</mark>"</span> 
                <span class="attrib">displayName=</span><span class="value">"<mark class="color24">Allergy to Aspirin</mark>"</span>/&gt;
            &lt;/<span class="field">code</span>&gt;
          &lt;/<span class="field">playingEntity</span>&gt;
        &lt;/<span class="field">participantRole</span>&gt;
      &lt;/<span class="field">participant</span>&gt;
      &lt;<span class="field">entryRelationship</span> <span class="attrib">typeCode=</span><span class="value">"MFST"</span> <span class="attrib">inversionInd=</span><span class="value">"true"</span>&gt;
        &lt;<span class="field">observation</span> <span class="attrib">classCode=</span><span class="value">"OBS"</span> <span class="attrib">moodCode=</span><span class="value">"EVN"</span>&gt;
          &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.9"</span> <span class="attrib">extension=</span><span class="value">"2014-06-09"</span> /&gt;
          &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.9"</span> /&gt;
          &lt;<span class="field">id</span> <span class="attrib">nullFlavor=</span><span class="value">"NI"</span> /&gt;
          &lt;<span class="field">code</span> <span class="attrib">code=</span><span class="value">"ASSERTION"</span> <span class="attrib">codeSystem=</span><span class="value">"2.16.840.1.113883.5.4"</span> /&gt;
          &lt;<span class="field">text</span>&gt;
            &lt;<span class="field">reference</span> <span class="attrib">value=</span><span class="value">"#_8a7ed342-967a-400e-88d5-2f8c2b7cdda0"</span> /&gt;
          &lt;/<span class="field">text</span>&gt;
          &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"completed"</span> /&gt;
          &lt;<span class="field">value</span> <span class="attrib">xsi:type=</span><span class="value">"CD"</span> 
            <span class="attrib">code=</span><span class="value">"<mark class="color22">247472004</mark>"</span> 
            <span class="attrib">codeSystem=</span><span class="value">"<mark class="color16">2.16.840.1.113883.6.96</mark>"</span> 
            <span class="attrib">displayName=</span><span class="value">"<mark class="color23">Wheal</mark>"</span>&gt;
            &lt;<span class="field">originalText</span>&gt;
              &lt;<span class="field">reference</span> <span class="attrib">value=</span><span class="value">"#_8a7ed342-967a-400e-88d5-2f8c2b7cdda0"</span> /&gt;
            &lt;/<span class="field">originalText</span>&gt;
          &lt;/<span class="field">value</span>&gt;
          &lt;<span class="field">entryRelationship</span> <span class="attrib">typeCode=</span><span class="value">"SUBJ"</span> <span class="attrib">inversionInd=</span><span class="value">"true"</span>&gt;
            &lt;<span class="field">observation</span> <span class="attrib">classCode=</span><span class="value">"OBS"</span> <span class="attrib">moodCode=</span><span class="value">"EVN"</span>&gt;
              &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.8"</span> <span class="attrib">extension=</span><span class="value">"2014-06-09"</span> /&gt;
              &lt;<span class="field">templateId</span> <span class="attrib">root=</span><span class="value">"2.16.840.1.113883.10.20.22.4.8"</span> /&gt;
              &lt;<span class="field">code</span> <span class="attrib">code=</span><span class="value">"SEV"</span> <span class="attrib">codeSystem=</span><span class="value">"2.16.840.1.113883.5.4"</span> /&gt;
              &lt;<span class="field">text</span>&gt;Severe&lt;/<span class="field">text</span>&gt;
              &lt;<span class="field">statusCode</span> <span class="attrib">code=</span><span class="value">"completed"</span> /&gt;
              &lt;<span class="field">value</span> <span class="attrib">xsi:type=</span><span class="value">"CD"</span> 
                <span class="attrib">code=</span><span class="value">"24484000"</span> 
                <span class="attrib">codeSystem=</span><span class="value">"<mark class="color16">2.16.840.1.113883.6.96</mark>"</span> 
                <span class="attrib">displayName=</span><span class="value">"<mark class="color27">Severe</mark>"</span> /&gt;
            &lt;/<span class="field">observation</span>&gt;
          &lt;/<span class="field">entryRelationship</span>&gt;
        &lt;/<span class="field">observation</span>&gt;
      &lt;/<span class="field">entryRelationship</span>&gt;
    &lt;/<span class="field">observation</span>&gt;
  &lt;/<span class="field">entryRelationship</span>&gt;
&lt;/<span class="field">act</span>&gt;</div>
</td><td>

<div id="fhir" class="border codeArea">{
  "<span class="field">resourceType</span>": "<span class="value">AllergyIntolerance</span>",
  "<span class="field">identifier</span>": [
    {
      "<span class="field">system</span>": "<span class="value">urn:oid:<mark class="color13">1.3.6.1.4.1.22812.3.2009316.3.4.10.2</mark></span>",
      "<span class="field">value</span>": "<span class="value"><mark class="color10">545077400001</mark></span>"
    },
    {
      "<span class="field">system</span>": "<span class="value">urn:oid:<mark class="color13">1.3.6.1.4.1.22812.3.2009316.3.4.10.2</mark></span>",
      "<span class="field">value</span>": "<span class="value"><mark class="color11">545077400003</mark></span>"
    }
  ],
  "<span class="field">clinicalStatus</span>": {
    "<span class="field">coding</span>": [
      {
        "<span class="field">system</span>": "<span class="value">http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical</span>",
        "<span class="field">code</span>": "<span class="value"><mark class="color12">active</mark></span>"
      }
    ]
  },
  "<span class="field">category</span>": [
    "<mark class="color15">medication</mark>"
  ],
  "<span class="field">code</span>": {
    "<span class="field">coding</span>": [
      {
        "<span class="field">system</span>": "<span class="value"><mark class="color18">http://www.nlm.nih.gov/research/umls/rxnorm</mark></span>",
        "<span class="field">code</span>": "<span class="value"><mark class="color17">1191</mark></span>",
        "<span class="field">display</span>": "<span class="value"><mark class="color19">Aspirin</mark></span>"
      },
      {
        "<span class="field">system</span>": "<span class="value"><mark class="color16">http://snomed.info/sct</mark></span>",
        "<span class="field">code</span>": "<span class="value"><mark class="color20">293586001</mark></span>",
        "<span class="field">display</span>": "<span class="value"><mark class="color24">Allergy to Aspirin</mark></span>"
      }
    ],
    "<span class="field">text</span>": "<span class="value"><mark class="color19">Aspirin</mark></span>"
  },
  "<span class="field">patient</span>": {
    "<span class="field">reference</span>": "<span class="value">Patient/CF-patient</span>"
  },
  "<span class="field">onsetDateTime</span>": "<span class="value"><mark class="color14">2008-05-01</mark></span>",
  "<span class="field">reaction</span>": [
    {
      "<span class="field">manifestation</span>": [
        {
          "<span class="field">coding</span>": [
            {
              "<span class="field">system</span>": "<span class="value"><mark class="color16">http://snomed.info/sct</mark></span>",
              "<span class="field">code</span>": "<span class="value"><mark class="color22">247472004</mark></span>",
              "<span class="field">display</span>": "<span class="value"><mark class="color23">Wheal</mark></span>"
            }
          ],
          "<span class="field">text</span>": "<span class="value"><mark class="color23">Wheal</mark></span>"
        }
      ],
      "<span class="field">severity</span>": "<span class="value"><mark class="color27">severe</mark></span>"
    }
  ]
}</div>
</td></tr></table>

#### Links to example content

The consensus mapping example developed through multiple vendors are available below:
* [Allergy CDA example](./Binary-CF-allergy.html)
* [Allergy FHIR example](./AllergyIntolerance-CF-allergy.html)