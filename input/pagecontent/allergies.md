<style>
td, th {
   border: 1px solid black!important;
}
</style>

### C-CDA to FHIR

| C-CDA¹ <br/>([Allergy Intolerance Observation](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.7.html)) | FHIR <br/>([AllergyIntolerance](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-allergyintolerance.html))| Transform Steps & Notes<br />([How to read](mappingGuidance.html#how-to-read-transform-steps-column)) |
|:-------|:------|:---------|
|[/id](https://build.fhir.org/ig/HL7/CDA-ccda-2.1-sd/StructureDefinition-2.16.840.1.113883.10.20.22.4.7-definitions.html#diff_Observation.id)|[.identifier](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-allergyintolerance-definitions.html#AllergyIntolerance.id)| [CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|[/effectiveTime/low]()|[.onsetDateTime]()|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)<br/>EffectiveTime/high should not be mapped within onset (DateTime or Period)|
|[/value]()|[.type]()<br/>&<br/> [.category]()|[CDA CD ↔ FHIR CodeableConcept]()<br/>[CDA value → FHIR type]() <br/> [CDA value → FHIR category]()|
|[/author]()|[.recorder]()<br/>&<br/>[Provenance]()|**Constraint:** Only map single CDA author to FHIR recorder<br/>[Guidance on CDA ↔ FHIR Provenance]()|
|[/author/time]()|[.recorded]()|**Constraint:** Only map earliest author/time <br/>[CDA ↔ FHIR Time/Dates]()|
|[/participant/participantRole<br/>/playingEntity/code]()|[.code]()|**Constraint:** Only when CDA negation not present<br/>[CDA CD ↔ FHIR CodeableConcept]()|
|**Status**<br/>(```observation/code@code="33999-4"```)<br/>[/entryRelationship/observation/value]()|[.clinicalStatus]()|[CDA CD ↔ FHIR CodeableConcept]()
|**Reaction**<br/>(```entryRelationship@typeCode="MFST"```)<br/>[/entryRelationship/observation/id]()|[.reaction[x].id]()<br/>
|[/entryRelationship/observation<br/>/effectiveTime/low]()|[.reaction[x].onset]()|[CDA ↔ FHIR Time/Dates]()<br/>effectiveTime/high should not be mapped within onset
|[/entryRelationship/observation/value]()|[.reaction[x].manifestation]()|[CDA CD ↔ FHIR CodeableConcept]()<br/>Both  use SNOMED clinical findings with minor valueSet definition differences
|**Criticality**<br/>(```observation/code@code="82606-5"```)<br/>[/entryRelationship/observation/value]()|[.criticality]()|[CDA CD ↔ FHIR CodeableConcept]()<br/>[Allergy Criticality value → criticality]()

1\. XPath abbrievated for CDA Allergy Intolerance as: ```ClinicalDocument/structuredBody/component/structuredBody/component/section[(@code="48765-2")]/entry/act/entryRelationship/observation```

### FHIR to C-CDA

<span style="color:red; font-weight:bold; font-size:2em">Table Below Proposed for removal</span> 

| FHIR <br/>([AllergyIntolerance](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-allergyintolerance.html))| C-CDA <br/>([observation](http://hl7.org/cda/stds/core/draft1/StructureDefinition-Observation.html))| Transform Steps & Notes|
|:-------|:------|:---------|
|[.identifier](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-allergyintolerance-definitions.html#AllergyIntolerance.id)|[/id](https://build.fhir.org/ig/HL7/CDA-ccda-2.1-sd/StructureDefinition-2.16.840.1.113883.10.20.22.4.7-definitions.html#diff_Observation.id)|**Guidance:** [CDA id <> FHIR identifier]()|
|[.onsetDateTime]()|[/effectiveTime/low]()|**Guidance**: [CDA <> FHIR Time/Dates]()
|[.type]()<br/>&<br/> [.category]()|[/value]()|**Guidance:** [CDA CD <> FHIR CodeableConcept]()<br/>**ConceptMap:** [Allergy value <> category ConceptMap]()<br/>**ConceptMap:** [Allergy value <> type ConceptMap]()|
|[.recorder]()<br/>&<br/>[Provenance]()|[/author]()|**Guidance:** [Generalized guidance on CDA and FHIR provenance]()|
|[.recorded]()|[/author/time]()|**Guidance:** [CDA <> FHIR Time/Dates]()|
|[/participant/participantRole<br/>/playingEntity/code]()|[.code]()|**Guidance**: [CDA CD <> FHIR CodeableConcept]()|
|[.clinicalStatus]()|**Status**<br/>(observation/code@code="33999-4")<br/>[/entryRelationship/observation/value]()|**Guidance:** [CDA CD <> FHIR CodeableConcept]()
|[.reaction[x].id]()|**Reaction**<br/>[/entryRelationship/observation/id]()
|[.reaction[x].onset]()|[/entryRelationship/observation<br/>/effectiveTime/low]()|**Guidance:** [CDA <> FHIR Time/Dates]()<br/>**Note:** effectiveTime/high should not be mapped within onset
|[.reaction[x].manifestation]()|[/entryRelationship/observation/value]()|**Guidance:** [CDA CD <> FHIR CodeableConcept]()<br/>**Note:** Both  use SNOMED clinical findings with minor valueSet definition differences
|[.criticality]()|**Criticality**<br/>(observation/code@code="82606-5")<br/>[/entryRelationship/observation/value]()|**Guidance:** [CDA CD <> FHIR CodeableConcept]()<br/>**ConceptMap:** [Allergy Criticality value <> criticality]()

### Illustrative example

Make example expandable
https://build.fhir.org/ig/HL7/US-Core/screening-and-assessments.html#searching-for-screening-and-assessment-data

An illustrative example with higlighting is shown below based on the consensus of mapping and guidance above. Not all possible elements in CDA or FHIR may be represented 

<img src="allergy_example.png" />

Source data for the above example is available: 
* [LEFT: Allergy CDA example]()
* [RIGHT: Allergy FHIR example](./AllergyIntolerance-allergy-intolerance-mapped-to-FHIR.html)