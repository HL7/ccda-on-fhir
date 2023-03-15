<style>
td, th {
   border: 1px solid black!important;
}
</style>

{% include stu-note-cerner.xml %}

This page provides a mapping from FHIR to CDA. For the CDA to FHIR mapping, please refer to [Immunizations CDA → FHIR](./CF-immunizations.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html)

### FHIR to C-CDA

|FHIR<br/>[Immunization](http://hl7.org/fhir/us/core/StructureDefinition-us-core-immunization.html#profile)|C-CDA¹<br/>[Immunization Activity substanceAdministration](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.52.html)|Transform Steps|
|:----|:----|:----|
||@moodCode="EVN"|All FHIR Immunizations should be set to EVN moodCode in 
|.identifier|/id|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|.status|/statusCode|**Constraint** when ```status.value="not-done"```<br/>Set negationInd to true in CDA observation|
|.status|/statusCode|**Constraint** all other values of status<br/>[FHIR status → CDA statusCode](ConceptMap-FC-ImmunizationStatus.html)|
|.statusReason|**[Immunization Refusal Reason](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.53.html)**<br/>```entryRelationship@typeCode="RSON"```<br/>/entryRelationship/observation/code|[FHIR statusReason → CDA refusal](ConceptMap-FC-ImmunizationRefusal.html)|
|.vaccineCode|/consumable/manufacturedProduct/manufacturedMaterial/code|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|.occurrenceDateTime|/effectiveTime@value|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|.manufacturer|/consumable/manufacturedProduct/manufacturerOrganization||
|.lotNumber|/consumable/manufacturedMaterial/lotNumberText||
|.site|/approachSiteCode|[FHIR site → CDA approachSiteCode](ConceptMap-FC-ImmunizationSite.html)
|.route|/routeCode|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|.doseQuantity|/doseQuantity||
|.performer.actor|/performer|**Constraint** when ```.performer.function="AP"```<br/>[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|**[Annotation](https://hl7.org/fhir/datatypes.html#Annotation)**<br/>.note|**[Comment Activity](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.64.html)**<br/>```entryRelationship/act/code@code="48767-8"```<br/>/entryRelationship/act/text||
|.reasonCode|**[Indication](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.19.html)**<br/>``` entryRelationship@typeCode="RSON"```<br/>/entryRelationship/observation/value||
|.education.documentType|reference/ExternalDocument/code||
|.education.reference|/reference/ExternalDocument/id||
|.reaction.id|**[Reaction](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.9.html)**<br/>```entryRelationship@typeCode="MFST"```<br/>/entryRelationship/observation/id|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|.reaction.date|/entryRelationship/observation/effectiveTime|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|.reaction.detail.valueCodeableConcept|/entryRelationship/observation/value|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|.doseNumber[x].doseNumberPositiveInt|/repeatNumber||

1\. XPath abbrievated for C-CDA Immunization Activity as: <br/> ```ClinicalDocument/component/structuredBody/component/section[(@code="11369-6")]/entry/substanceAdministration```

### Illustrative example

#### Links to example content

Note that these mappings have only been implemented by a single vendor to date. 
* [Immuniztion FHIR example](./Immunization-FC-immunization.html)
* [Immuniztion CDA example](./Binary-FC-immunization.html)

### Prior work and Expanded Spreadsheets

As reviewed in the methodology, a more comprehensive review was performed via spreadsheets. These spreadsheets have been consolidated and further revised in the tables above but are provided for [reference here](https://github.com/HL7/ccda-on-fhir/blob/Feb2023/mappings/FC/FHIR-CCDA%20Immunization.csv)