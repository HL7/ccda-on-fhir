<style>
td, th {
   border: 1px solid black!important;
}
</style>

This page provides a mapping from CDA to FHIR. For the FHIR to CDA mapping, please refer to [Allergies FHIR → CDA](./FC-allergies.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html)

### C-CDA to FHIR

| C-CDA¹ <br/>[Allergy Intolerance observation](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.7.html)| FHIR <br/>[AllergyIntolerance](http://hl7.org/fhir/us/core/StructureDefinition-us-core-allergyintolerance.html)| Transform Steps & Notes|
|:-------|:------|:---------|
|@negationInd||See constraints under /participant 
|/id|.identifier| [CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/effectiveTime/low|.onsetDateTime|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)<br/>effectiveTime/high should not be mapped within onset (DateTime or Period)|
|/value|.type<br/>&<br/>.category|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>[CDA value → FHIR type](ConceptMap-CF-AllergyIntoleranceType.html) <br/> [CDA value → FHIR category](./ConceptMap-CF-AllergyIntoleranceCategory.html)|
|/author|.recorder<br/>&<br/>**[Provenance](http://hl7.org/fhir/us/core/StructureDefinition-us-core-provenance.html)**|**Constraint:** Only map single CDA author to FHIR recorder<br/>[Guidance on CDA ↔ FHIR Provenance](http://hl7.org/fhir/us/core/StructureDefinition-us-core-procedure.html)|
|/author/time|.recorded|**Constraint:** Only map earliest author/time <br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|/participant/participantRole<br/>/playingEntity/code|.code|**Constraint:** When CDA negation is absent or false<br/>[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/participant/participantRole<br/>/playingEntity/code|.code|**Constraint:** When CDA negation is true<br/><mark>[Negated CDA allergy codes → FHIR allergy codes]()</mark>|
|**[Status](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.28.html)**<br/>```observation/code@code="33999-4"```<br/>/entryRelationship/observation/value|.clinicalStatus|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)
|**[Reaction](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.9.html)**<br/>```entryRelationship@typeCode="MFST"```<br/>/entryRelationship/observation/id|.reaction.id<br/>
|/entryRelationship/observation<br/>/effectiveTime/low|.reaction.onset|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)<br/>effectiveTime/high should not be mapped within onset
|/entryRelationship/observation/value|.reaction.manifestation|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>Both use SNOMED clinical findings with minor valueSet definition differences
|**[Severity](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.8.html)**```nested inside Reaction entryRelationship/code@code="SEV"```/entryRelationship/observation/entryRelationship/observation/value||<mark>Not in examples</mark><br/>[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>This should be nested in CDA within the respective allergic reaction observation
|**[Criticality](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.145.html)**<br/>```observation/code@code="82606-5"```<br/>/entryRelationship/observation/value|.criticality|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>[Allergy Criticality value → Criticality](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.145.html)
|**[Comment Activity](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.64.html)**<br/>```entryRelationship/act/code@code="48767-8"```<br/>/entryRelationship/act/text|.note||


1\. XPath abbrievated for C-CDA Allergy Intolerance as: <br/> ```ClinicalDocument/component/structuredBody/component/section[(@code="48765-2")]/entry/act/entryRelationship/observation```

### Illustrative example

{% include examplebutton.html example="CF_allergy_example" b_title = "Click on Here To See Highlighted Example" %}

#### Links to example content

The consensus mapping example developed through multiple vendors are available below:
* [Allergy CDA example](./Binary-CF-allergy.html)
* [Allergy FHIR example](./AllergyIntolerance-CF-allergy.html)

### Prior work and Expanded Spreadsheets

As reviewed in the methodology, a more comprehensive review was performed via spreadsheets. These spreadsheets have been consolidated and further revised in the tables above but are provided for [reference here](https://github.com/HL7/ccda-on-fhir/blob/Feb2023/mappings/CF/CCDA-FHIR%20Allergy.csv)