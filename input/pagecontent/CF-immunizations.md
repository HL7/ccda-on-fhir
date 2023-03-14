<style>
td, th {
   border: 1px solid black!important;
}
</style>

This page provides a mapping from CDA to FHIR. For the FHIR to CDA mapping, please refer to [Immunizations FHIR → CDA](./FC-immunizations.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html)

### C-CDA to FHIR

|C-CDA¹<br/>[Immunization Activity substanceAdministration](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.52.html)|FHIR<br/>[Immunization](http://hl7.org/fhir/us/core/StructureDefinition-us-core-immunization.html#profile)|Transform Steps|
|:----|:----|:----|
|@negationInd="true"|set status="not-done"||
|/id|identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/statusCode|status|[CDA statusCode → FHIR status](./ConceptMap-CF-ImmunizationStatus.html)|
|/effectiveTime|occurrenceDateTime|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|/repeatNumber|protocolApplied.doseNumberPositiveInt|<mark>Not in examples</mark>|
|/routeCode|route|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/doseQuantity|doseQuantity||
|/consumable/manufacturedProduct/manufacturedMaterial/code|.vaccineCode|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)
|/consumable/manufacturedMaterial/lotNumberText|.lotNumber||
|/author|**[Provenance](http://hl7.org/fhir/us/core/StructureDefinition-us-core-procedure.html)**|<mark>Not in examples</mark><br/>[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|/performer|.performer<br/>&<br/>set ```performer.function="AP"```|
|**[Immunization Refusal Reason](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.53.html)**<br/>```entryRelationship@typeCode="RSON"```<br/>/entryRelationship/observation/code|statusReason|[CDA refusal → FHIR statusReason](ConceptMap-CF-ImmunizationRefusal.html)|
|**[Comment Activity](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.64.html)**<br/>```entryRelationship/act/code@code="48767-8"```<br/>/entryRelationship/act/text|.note||
|**[Reaction](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.9.html)**<br/>```entryRelationship@typeCode="MFST"```<br/>/entryRelationship/observation|.reaction|It is recommended that reaction observation value be mapped to reaction detail (Observation) valueCodeable concept. Comments are welcome on how this may be best implemented.

1\. XPath abbrievated for C-CDA Immunization Activity as: <br/> ```ClinicalDocument/component/structuredBody/component/section[(@code="11369-6")]/entry/substanceAdministration```

### Illustrative example

{% include examplebutton.html example="CF_immunization_example" b_title = "Click on Here To See Highlighted Example" %}

#### Links to example content

The consensus mapping example developed through multiple vendors are available below:
* [Immuniztion CDA example](./Binary-CF-immunization.html)
* [Immuniztion FHIR example](./Immunization-CF-immunization.html)

### Prior work and Expanded Spreadsheets

As reviewed in the methodology, a more comprehensive review was performed via spreadsheets. These spreadsheets have been consolidated and further revised in the tables above but are provided for [reference here](https://github.com/HL7/ccda-on-fhir/blob/Feb2023/mappings/CF/CCDA-FHIR%20Immunization.csv) 