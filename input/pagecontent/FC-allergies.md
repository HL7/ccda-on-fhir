<style>
td, th {
   border: 1px solid black!important;
}
</style>

{% include stu-note-cerner.xml %}

This page provides a mapping from FHIR to CDA. For the CDA to FHIR mapping, please refer to [Allergies CDA → FHIR](./CF-allergies.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html)

### FHIR to C-CDA

|FHIR<br/>[AllergyIntolerance](http://hl7.org/fhir/us/core/StructureDefinition-us-core-allergyintolerance.html#profile)|C-CDA¹<br/>[Allergy Intolerance observation](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.7.html)|Transform Steps|
|:----|:----|:----|
|.identifier|/id|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|.clinicalStatus|/act/statusCode (parent to observation)<br/>&<br />**[Allergy Status]()**<br/>```observation/code@code="33999-4"```<br/>/entryRelationship/observation/value|[FHIR clinicalStatus → CDA Allergy Status Observation value](./ConceptMap-FC-AllergyStatus.html)|
|.type<br/>&<br/>.category|/value|[FHIR type → CDA value](ConceptMap-FC-AllergyIntoleranceType.html)<br/>[FHIR category → CDA value](ConceptMap-FC-AllergyIntoleranceCategory.html)|
|.criticality|**[Criticality]()**<br/>```observation/code@code="82606-5"```<br/>/entryRelationship/observation/value|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>[FHIR criticality → CDA Criticality value ](ConceptMap-FC-Criticality.html)|
|.code|/participant/participantRole/playingEntity/code|**Constraint**: When FHIR concept is not a negated concept<br/>[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|.code|/participant/participantRole/playingEntity/code<br/>&<br/>set @negationInd="true"|**Constraint**: When FHIR concept represents negated concept|
|.encounter|```entryRelationship@typeCode="REFR"```<br/>/entryRelationship/act/id||
|.onsetDateTime|/effectiveTime/low|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|.onsetPeriod.start|/effectiveTime/low|effectiveTime/high should not be mapped from onsetPeriod|
|.recordedDate|/assignedAuthor/time|These are not necessarily the same author|
|.recorder|/assignedAuthor|[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)<br/>Time and author are not necessarily the same|
|.note|**[Comment Activity]()**<br/>```entryRelationship/act/code@code="48767-8"```<br/>/entryRelationship/act/text||
|.reaction.id|**[Reaction]()**<br/>``` entryRelationship@typeCode="MFST"```<br/>[/entryRelationship/observation/id]()|
|reaction.substance|manufacturedMaterial/code|<mark>**Needs clarification**</mark>
|reaction.manifestation|[/entryRelationship/observation/value]()|Both use SNOMED clinical findings with minor valueSet definition differences|
|.reaction.onset|/effectiveTime/low|Constraint: This should only be used in event that AlleryIntolerance.onset was not available|
|.reaction.severity|**[Severity]()**<br/>```entryRelationship/observation@code="SEV"```<br/>[/entryRelationship/observation/value]()|[FHIR severity → CDA severity value ](ConceptMap-FC-Criticality.html)<br/>This should be nested in CDA within the respective allergic reaction observation|

1\. XPath abbrievated for C-CDA Allergy Intolerance as: <br/> ```ClinicalDocument/component/structuredBody/component/section[(@code="48765-2")]/entry/act/entryRelationship/observation```

### Illustrative example

#### Links to example content