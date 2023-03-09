<style>
td, th {
   border: 1px solid black!important;
}
</style>

This page provides a mapping from CDA to FHIR. For the FHIR to CDA mapping, please refer to [Allergies FHIR → CDA](./FC-allergies.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html)

### C-CDA to FHIR

| C-CDA¹ <br/>([Allergy Intolerance Observation](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.7.html)) | FHIR <br/>([AllergyIntolerance](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-allergyintolerance.html))| Transform Steps & Notes<br />([How to read](mappingGuidance.html#how-to-read-mapping-tables-and-transform-steps)) |
|:-------|:------|:---------|
|[/id](https://build.fhir.org/ig/HL7/CDA-ccda-2.1-sd/StructureDefinition-2.16.840.1.113883.10.20.22.4.7-definitions.html#diff_Observation.id)|[.identifier](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-allergyintolerance-definitions.html#AllergyIntolerance.id)| [CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|[/effectiveTime/low]()|[.onsetDateTime]()|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)<br/>EffectiveTime/high should not be mapped within onset (DateTime or Period)|
|[/value]()|[.type]()<br/>&<br/> [.category]()|[CDA CD ↔ FHIR CodeableConcept]()<br/>[CDA value → FHIR type]() <br/> [CDA value → FHIR category](./ConceptMap-CF-AllergyIntoleranceCategory.html)|
|[/author]()|[.recorder]()<br/>&<br/>[Provenance]()|**Constraint:** Only map single CDA author to FHIR recorder<br/>[Guidance on CDA ↔ FHIR Provenance]()|
|[/author/time]()|[.recorded]()|**Constraint:** Only map earliest author/time <br/>[CDA ↔ FHIR Time/Dates]()|
|[/participant/participantRole<br/>/playingEntity/code]()|[.code]()|**Constraint:** When CDA negation is absent or false<br/>[CDA CD ↔ FHIR CodeableConcept]()|
|[/participant/participantRole<br/>/playingEntity/code]()|[.code]()|**Constraint:** When CDA negation is true<br/>[Negated CDA allergy codes → FHIR allergy codes]() |
|**Status**<br/>(```observation/code@code="33999-4"```)<br/>[/entryRelationship/observation/value]()|[.clinicalStatus]()|[CDA CD ↔ FHIR CodeableConcept]()
|**Reaction**<br/>(```entryRelationship@typeCode="MFST"```)<br/>[/entryRelationship/observation/id]()|[.reaction[x].id]()<br/>
|[/entryRelationship/observation<br/>/effectiveTime/low]()|[.reaction[x].onset]()|[CDA ↔ FHIR Time/Dates]()<br/>effectiveTime/high should not be mapped within onset
|[/entryRelationship/observation/value]()|[.reaction[x].manifestation]()|[CDA CD ↔ FHIR CodeableConcept]()<br/>Both  use SNOMED clinical findings with minor valueSet definition differences
|**Criticality**<br/>(```observation/code@code="82606-5"```)<br/>[/entryRelationship/observation/value]()|[.criticality]()|[CDA CD ↔ FHIR CodeableConcept]()<br/>[Allergy Criticality value → criticality]()

1\. XPath abbrievated for CDA Allergy Intolerance as: <br/> ```ClinicalDocument/component/structuredBody/component/section[(@code="48765-2")]/entry/act/entryRelationship/observation```

### Illustrative example

{% include examplebutton.html example="allergy_example" b_title = "Click on Here To See Highlighted Example" %}

#### Links to example content

The consensus mapping example developed through multiple vendors are available below:
* [Allergy CDA example]()
* [Allergy FHIR example](./AllergyIntolerance-allergy-intolerance-mapped-to-FHIR.html)