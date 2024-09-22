<style>
td, th {
   border: 1px solid black!important;
   max-width:500px;
}
</style>

This page provides a mapping from CDA to FHIR. For the FHIR to CDA mapping, please refer to [Allergies FHIR → CDA](./FC-allergies.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html)

**Uncommon use case:** Multiple C-CDA Allergy Intolerance observations inside a single Allergy Concern act should map to separate and distinct FHIR AllergyIntolerance resources. The C-CDA Companion Guide ([see 5.2.7.1](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=447)) actively discourages the practice of multiple observations inside a single act. It may occur, however, since Allergy Concern act allows for multiple Allergy Intolerance observations in C-CDA. Lossless transformations may not be possible without the use of extensions ([see 3.1 of this guide](./mappingBackground.html)).

<br />
### C-CDA to FHIR

| C-CDA¹ <br/>[Allergy Concern act](https://hl7.org/cda/us/ccda/2024Jan/StructureDefinition-AllergyConcernAct.html)| FHIR <br/>[AllergyIntolerance](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-allergyintolerance.html)|Transform Steps & Notes|
|:-------|:------|:---------|
|/statusCode|.clinicalStatus|For more information on how status is managed in Allergy Concern Act wrapper, refer to [C-CDA guidance, see 5.2.7.1](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=447)<br/>Also see Status entryRelationship mapping below|
| All of the following are a **[Allergy Intolerance observation](https://hl7.org/cda/us/ccda/2024Jan/StructureDefinition-AllergyIntoleranceObservation.html)** nested inside the **[Allergy Concern act](https://hl7.org/cda/us/ccda/2024Jan/StructureDefinition-AllergyConcernAct.html)**. Each observation should become a distinct FHIR **[AllergyIntolerance](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-allergyintolerance.html)** resource.<br/>Include /entryRelationship[@typeCode="SUBJ"]/observation prefix to rows below²|
|/@negationInd||See constraints under /participant 
|/id|.identifier| [CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/effectiveTime/low|.onsetDateTime|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)<br/>effectiveTime/high should not be mapped within onset (DateTime or Period)|
|/value|.type<br/>&<br/>.category|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>[CDA value → FHIR type](ConceptMap-CF-AllergyIntoleranceType.html) <br/> [CDA value → FHIR category](./ConceptMap-CF-AllergyIntoleranceCategory.html)|
|/author|.recorder<br/>&<br/>**[Provenance](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-provenance.html)**|**Constraint:** Only map single CDA author to FHIR recorder<br/>[Guidance on CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|/author/time|.recordedDate|**Constraint:** Only map earliest author/time <br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|/participant/participantRole/playingEntity/code|.code|**Constraint:** When CDA negation is absent or false<br/>[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/participant/participantRole/playingEntity/code<br/>&<br/>/value|.code|**Constraint:** When CDA negation is true and nullFlavor is used in playingEntity/code<br/>[CDA No known allergy → FHIR code](ConceptMap-CF-NoKnownAllergies.html)<br/> When negation is true and playingEntity/code is populated, use equivalent negated concept (e.g. map latex substance to no known latex allergy [1003774007, SNOMED CT]) if available. If not, use the [substanceExposureRisk extension](https://hl7.org/fhir/extensions/StructureDefinition-allergyintolerance-substanceExposureRisk.html), placing the substance in the substance sub-extension and setting the exposureRisk sub-extension to `no-known-reaction-risk`. Note that when using this extension, the AllergyIntolerance resource will not be a conformant US Core AllergyIntolerance since the extension prohibits the required .code element.|
|**[Status](https://hl7.org/cda/us/ccda/2024Jan/StructureDefinition-AllergyStatusObservation.html)**<br/>/entryRelationship/observation[code/@code="33999-4"]/value³|.clinicalStatus|[CDA Allergy Status Observation value → FHIR clinicalStatus](./ConceptMap-CF-AllergyStatus.html)
|**[Reaction](https://hl7.org/cda/us/ccda/2024Jan/StructureDefinition-ReactionObservation.html)**<br/>/entryRelationship[@typeCode="MFST"]/observation/value³|.reaction.manifestation|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>Both use SNOMED clinical findings with minor valueSet definition differences
|**[Severity](https://hl7.org/cda/us/ccda/2024Jan/StructureDefinition-SeverityObservation.html)** (nested inside Reaction)<br/>/entryRelationship[@typeCode="MFST"]/observation/entryRelationship/observation[code/@code="SEV"]/value³|.reaction.severity|[CDA Severity value → FHIR Severity](./ConceptMap-CF-Severity.html)<br/>**Note:** CDA documents should not assign severity at the Allergy level.<br/><br/>In cases where CDA assigns severity only to the Allergy rather than the reaction, map the severity to FHIR reaction severity, even if there are more than one. This means assuming that the same severity applies to all child reactions.<br/><br/>If severity is assigned at both levels, the reaction level should be used.
|**[Criticality](https://hl7.org/cda/us/ccda/2024Jan/StructureDefinition-CriticalityObservation.html)**<br/>/entryRelationship/observation[code/@code="82606-5"]/value³|.criticality|[CDA Criticality value → FHIR Criticality](./ConceptMap-CF-Criticality.html)
|**[Comment Activity](https://hl7.org/cda/us/ccda/2024Jan/StructureDefinition-CommentActivity.html)**<br/>/entryRelationship/act[code/@code="48767-8"]/text³|**[Annotation](https://hl7.org/fhir/datatypes.html#Annotation)**<br/>.note||


1\. XPath abbreviated for C-CDA Allergy Concern act as: <br/> ClinicalDocument/component/structuredBody/component/section[code/@code="48765-2"]/entry/act/

2\. XPath abbreviated for C-CDA Allergy Intolerance observation as: <br/> ClinicalDocument/component/structuredBody/component/section[code/@code="48765-2"]/entry/act/entryRelationship[@typeCode="SUBJ"]/observation

3\. Note that these entryRelationships will also have inversionInd="true" in CDA

When authors or other provenance are recorded in the parentƒ [Allergy Concern Act](https://hl7.org/cda/us/ccda/2024Jan/StructureDefinition-AllergyConcernAct.html), it is recommended that those data be mapped to the FHIR AllergyIntolerance. 

### Illustrative example

{% include examplebutton.html example="CF_allergy_example" b_title = "Click on Here To See Highlighted Example" %}

#### Links to example content

The consensus mapping example developed through multiple vendors are available below:
* [Allergy CDA example](./Binary-CF-allergy.html)
* [Allergy FHIR example](./AllergyIntolerance-CF-allergy.html)

### Prior work and Expanded Spreadsheets

As reviewed in the methodology, a more comprehensive review was performed via spreadsheets. These spreadsheets have been consolidated and further revised in the tables above but are provided for [reference here](https://github.com/HL7/ccda-on-fhir/blob/master/mappings/CF/CCDA-FHIR%20Allergy.csv)