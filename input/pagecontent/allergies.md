### Mapping Guidance

<style>
td, th {
   border: 1px solid black!important;
}
</style>

*Path abbrieviation within C-CDA allergies \<section\>  
// = entry/act/entryRelationship/observation/ (CDA)*

| C-CDA <br/>(observation) | FHIR <br/>(AllergyIntolerance)| Comments|
|:-------|:------|:---------|
|[//id](https://build.fhir.org/ig/HL7/CDA-ccda-2.1-sd/StructureDefinition-2.16.840.1.113883.10.20.22.4.7-definitions.html#diff_Observation.id)|[.identifier](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-allergyintolerance-definitions.html#AllergyIntolerance.id)|**Transform:** [CDA.id <>FHIR.identifiers]()|
|[//effectiveTime/low]()|[.onsetDateTime]()|EffectiveTime/high should not be mapped within onset (DateTime or Period) <br />**Transform**: [CDA <> FHIR Dates]() |
|[//value]()|[.type]()<br/>&<br/> [.category]()|Overlaps with .type <br/>**Translate**: [Allergy value <> type ConceptMap]()<br/>**Translate**: [Allergy value <> category ConceptMap]()|
|[//author]()|[.recorder]()<br/>&<br/>[Provenance]()|**Case**: Only 1 recorder can exist in FHIR. <br/> See [generalized guidance on provenance]()|
|[//author/time]()|[.recorded]()|**Case**: Only map earliest author/time|
|[//participant/participantRole<br/>/playingEntity/code]()|[.code]()|**Case**: Only when CDA negation is not present, otherwise see [guidance on handling negation]()<br/>**Transform**: [CDA to FHIR coding guidance]()|
|**Status** <br/>[//entryRelationship/observation]()|[.clinicalStatus]()|**Translate**: [Allergy Status ConceptMap]()
|**Reaction**<br/>[//entryRelationship/observation/id]()|[.reaction.id]()<br/>
|[//entryRelationship/observation<br/>/effectiveTime/low]()|[.reaction.onset]()|EffectiveTime/high should not be mapped within onset
|[//entryRelationship/observation/value]()|[.reaction<br/>.manifestation]()|Both  use SNOMED clinical findings but slight valueSet definition differences
|**Criticality** <br/>[//entryRelationship/observation/value]()|[.criticality]()|**Translate** [Allergy Criticality ConceptMap]()

### Illustrative example

An illustrative example with higlighting is shown below based on the consensus of mapping and guidance above. Not all possible elements in CDA or FHIR may be represented 

<img src="allergy_example.png" />

Source data for the above example is available: 
* [LEFT: Allergy CDA example]()
* [RIGHT: Allergy FHIR example]()