<style>
td, th {
   border: 1px solid black!important;
}
</style>

<div style="border: 1px solid maroon; padding: 10px; background-color: #fffbf7; min-height: 160px;">
  <img src="assets/images/dragon.png" width="150" style="float:left; mix-blend-mode: multiply; margin-right: 10px;" title="Here Be Dragons!" height="150">
  <b>FHIR US Core → C-CDA Mapping</b>
  <p class="warning">
    While multiple vendors participated in CDA → FHIR mappings at a connectathon, only a single vendor (Cerner/Oracle) has participated in the FHIR → CDA mapping. We welcome feedback on these mappings which represent less than a multi-vendor consensus at this time.
  </p>
</div>
<br/>

This page provides a mapping from FHIR to CDA. For the CDA to FHIR mapping, please refer to [Allergies CDA → FHIR](./CF-allergies.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html)

### FHIR to C-CDA

|FHIR<br/>[AllergyIntolerance](http://hl7.org/fhir/us/core/StructureDefinition-us-core-allergyintolerance.html#profile)|C-CDA¹<br/>[Allergy Intolerance observation](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.7.html)|Transform Steps|
|:----|:----|:----|
|.identifier|/id|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|.clinicalStatus|(act parent to observation) ../../statusCode <br/>&<br />**[Allergy Status](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.28.html)**<br/>```/entryRelationship/observation[code/@code="33999-4"]```<br/>/value|[FHIR clinicalStatus → CDA Allergy Status Observation value](./ConceptMap-FC-AllergyStatus.html)<br/>For more information on how status is managed in Allergy Concern Act wrapper, refer to [C-CDA guidance, see 5.2.7.1](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=447)|
|.type<br/>&<br/>.category|/value|[FHIR type → CDA value](ConceptMap-FC-AllergyIntoleranceType.html)<br/>[FHIR category → CDA value](ConceptMap-FC-AllergyIntoleranceCategory.html)|
|.criticality|**[Criticality](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.145.html)**<br/>```/entryRelationship/observation[code/@code="82606-5"]```<br/>/value|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>[FHIR criticality → CDA Criticality value](ConceptMap-FC-Criticality.html)|
|.code|/participant/participantRole/playingEntity/code|**Constraint**: When FHIR concept is not a negated concept<br/>[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|.code|/participant/participantRole/playingEntity/code or /value<br/>&<br/>set @negationInd="true"|**Constraint**: When FHIR concept represents general negated concept (e.g. no known allergy)<br/>[FHIR code → CDA No Known Allergy](ConceptMap-FC-NoKnownAllergies.html)<br/>In case where a specific refutation is coded (no latex allergy), use text or a mapped concept.|
|.encounter|```/entryRelationship[@typeCode="REFR"]```<br/>/act/id||
|.onsetDateTime|/effectiveTime/low|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|.onsetPeriod.start|/effectiveTime/low|effectiveTime/high should not be mapped from onsetPeriod|
|.recordedDate|/assignedAuthor/time|These are not necessarily the same author|
|.recorder|/assignedAuthor|[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)<br/>Time and author are not necessarily the same|
|**[Annotation](https://hl7.org/fhir/datatypes.html#Annotation)**<br/>.note|**[Comment Activity](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.64.html)**<br/>```entryRelationship/act[code/@code="48767-8"]```<br/>/text||
|.reaction.manifestation|**[Reaction](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.9.html)**<br/>``` entryRelationship[@typeCode="MFST"]```<br/>/observation/value|Both use SNOMED clinical findings with minor valueSet definition differences
|.reaction.onset|/effectiveTime/low|Constraint: This should only be used in event that AlleryIntolerance.onset was not available|
|.reaction.severity|**[Severity](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.8.html)**<br/>```entryRelationship/observation[code/@code="SEV"]```<br/>/value|[FHIR severity → CDA severity value ](ConceptMap-FC-Criticality.html)<br/>This should be nested in CDA within the respective allergic reaction observation|

1\. XPath abbrievated for C-CDA Allergy Intolerance as: <br/> ```ClinicalDocument/component/structuredBody/component/section[code/@code="48765-2"]/entry/act/entryRelationship/observation```

### Illustrative example

#### Links to example content

Note that these mappings have only been implemented by a single vendor to date. 
* [Allergy FHIR example](./AllergyIntolerance-FC-allergy.html)
* [Allergy CDA example](./Binary-FC-allergy.html)

### Prior work and Expanded Spreadsheets

As reviewed in the methodology, a more comprehensive review was performed via spreadsheets. These spreadsheets have been consolidated and further revised in the tables above but are provided for [reference here](https://github.com/HL7/ccda-on-fhir/blob/master/mappings/FC/FHIR-CCDA%20Allergy.csv) 