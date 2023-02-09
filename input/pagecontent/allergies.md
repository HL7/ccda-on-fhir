<style>
td, th {
   border: 1px solid black!important;
}
</style>

XPath abbrievated in table as follows: CDA &lt;base&gt; = ClinicalDocument/structuredBody/component/structuredBody/component/section[(@code="48765-2")]/entry/act/entryRelationship/observation

**Case:** Only perform the action under this constraint <br/>
**Guidance:** Generalized narrative guidance on transform between CDA and FHIR elements <br/>
**ConceptMap:** Link to computable map between CDA and FHIR vocabularies <br/>
**Note:** Note specific to this mapping <br/>

### C-CDA to FHIR

| C-CDA <br/>([observation](http://hl7.org/cda/stds/core/draft1/StructureDefinition-Observation.html)) | FHIR <br/>([AllergyIntolerance](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-allergyintolerance.html))| Transform Steps & Notes|
|:-------|:------|:---------|
|[&lt;base&gt;/id](https://build.fhir.org/ig/HL7/CDA-ccda-2.1-sd/StructureDefinition-2.16.840.1.113883.10.20.22.4.7-definitions.html#diff_Observation.id)|[.identifier](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-allergyintolerance-definitions.html#AllergyIntolerance.id)|**Guidance:** [CDA id <> FHIR identifier]()|
|[&lt;base&gt;/effectiveTime/low]()|[.onsetDateTime]()|**Guidance**: [CDA <> FHIR Time/Dates]()<br/>**Note:** EffectiveTime/high should not be mapped within onset (DateTime or Period)|
|[&lt;base&gt;/value]()|[.type]()<br/>&<br/> [.category]()|**Guidance:** [CDA CD <> FHIR CodeableConcept]()<br/>**ConceptMap:** [Allergy value <> category ConceptMap]()<br/>**ConceptMap:** [Allergy value <> type ConceptMap]()|
|[&lt;base&gt;/author]()|[.recorder]()<br/>&<br/>[Provenance]()|**Case:** Only map single CDA author to FHIR recorder<br/>**Guidance:** [Generalized guidance on CDA and FHIR provenance]()|
|[&lt;base&gt;/author/time]()|[.recorded]()|**Case:** Only map earliest author/time <br/>**Guidance:** [CDA <> FHIR Time/Dates]()|
|[&lt;base&gt;/participant/participantRole<br/>/playingEntity/code]()|[.code]()|**Case**: Only when CDA negation not present<br/>**Guidance**: [CDA CD <> FHIR CodeableConcept]()|
|**Status**<br/>(observation/code@code="33999-4")<br/>[&lt;base&gt;/entryRelationship/observation/value]()|[.clinicalStatus]()|**Guidance:** [CDA CD <> FHIR CodeableConcept]()
|**Reaction**<br/>[&lt;base&gt;/entryRelationship/observation/id]()|[.reaction[x].id]()<br/>
|[&lt;base&gt;/entryRelationship/observation<br/>/effectiveTime/low]()|[.reaction[x].onset]()|**Guidance:** [CDA <> FHIR Time/Dates]()<br/>**Note:** effectiveTime/high should not be mapped within onset
|[&lt;base&gt;/entryRelationship/observation/value]()|[.reaction[x].manifestation]()|**Guidance:** [CDA CD <> FHIR CodeableConcept]()<br/>**Note:** Both  use SNOMED clinical findings with minor valueSet definition differences
|**Criticality**<br/>(observation/code@code="82606-5")<br/>[&lt;base&gt;/entryRelationship/observation/value]()|[.criticality]()|**Guidance:** [CDA CD <> FHIR CodeableConcept]()<br/>**ConceptMap:** [Allergy Criticality value <> criticality]()

### FHIR to C-CDA

| FHIR <br/>([AllergyIntolerance](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-allergyintolerance.html))| C-CDA <br/>([observation](http://hl7.org/cda/stds/core/draft1/StructureDefinition-Observation.html))| Transform Steps & Notes|
|:-------|:------|:---------|
|[.identifier](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-allergyintolerance-definitions.html#AllergyIntolerance.id)|[&lt;base&gt;/id](https://build.fhir.org/ig/HL7/CDA-ccda-2.1-sd/StructureDefinition-2.16.840.1.113883.10.20.22.4.7-definitions.html#diff_Observation.id)|**Guidance:** [CDA id <> FHIR identifier]()|
|[.onsetDateTime]()|[&lt;base&gt;/effectiveTime/low]()|**Guidance**: [CDA <> FHIR Time/Dates]()
|[.type]()<br/>&<br/> [.category]()|[&lt;base&gt;/value]()|**Guidance:** [CDA CD <> FHIR CodeableConcept]()<br/>**ConceptMap:** [Allergy value <> category ConceptMap]()<br/>**ConceptMap:** [Allergy value <> type ConceptMap]()|
|[.recorder]()<br/>&<br/>[Provenance]()|[&lt;base&gt;/author]()|**Guidance:** [Generalized guidance on CDA and FHIR provenance]()|
|[.recorded]()|[&lt;base&gt;/author/time]()|**Guidance:** [CDA <> FHIR Time/Dates]()|
|[&lt;base&gt;/participant/participantRole<br/>/playingEntity/code]()|[.code]()|**Guidance**: [CDA CD <> FHIR CodeableConcept]()|
|[.clinicalStatus]()|**Status**<br/>(observation/code@code="33999-4")<br/>[&lt;base&gt;/entryRelationship/observation/value]()|**Guidance:** [CDA CD <> FHIR CodeableConcept]()
|[.reaction[x].id]()|**Reaction**<br/>[&lt;base&gt;/entryRelationship/observation/id]()
|[.reaction[x].onset]()|[&lt;base&gt;/entryRelationship/observation<br/>/effectiveTime/low]()|**Guidance:** [CDA <> FHIR Time/Dates]()<br/>**Note:** effectiveTime/high should not be mapped within onset
|[.reaction[x].manifestation]()|[&lt;base&gt;/entryRelationship/observation/value]()|**Guidance:** [CDA CD <> FHIR CodeableConcept]()<br/>**Note:** Both  use SNOMED clinical findings with minor valueSet definition differences
|[.criticality]()|**Criticality**<br/>(observation/code@code="82606-5")<br/>[&lt;base&gt;/entryRelationship/observation/value]()|**Guidance:** [CDA CD <> FHIR CodeableConcept]()<br/>**ConceptMap:** [Allergy Criticality value <> criticality]()

### Illustrative example

An illustrative example with higlighting is shown below based on the consensus of mapping and guidance above. Not all possible elements in CDA or FHIR may be represented 

<img src="allergy_example.png" />

Source data for the above example is available: 
* [LEFT: Allergy CDA example]()
* [RIGHT: Allergy FHIR example](./AllergyIntolerance-allergy-intolerance-mapped-to-FHIR.html)