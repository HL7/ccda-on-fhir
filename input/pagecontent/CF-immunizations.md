<style>
td, th {
   border: 1px solid black!important;
}
</style>

This page provides a mapping from CDA to FHIR. For the FHIR to CDA mapping, please refer to [Immunizations FHIR → CDA](./FC-immunizations.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html)

Mapping is from `@moodCode="EVN"` (i.e. historical) immunizations, not `INT` (future / planned) immunizations.

<br />
<br />
### C-CDA to FHIR

|C-CDA¹<br/>[Immunization Activity substanceAdministration](https://hl7.org/cda/us/ccda/2024Jan/StructureDefinition-ImmunizationActivity.html)|FHIR<br/>[Immunization](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-immunization.html#profile)|Transform Steps|
|:----|:----|:----|
|/@negationInd="true"|set .status="not-done"||
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/statusCode|.status|[CDA statusCode → FHIR status](./ConceptMap-CF-ImmunizationStatus.html)|
|/effectiveTime/@value<br/>or<br/>/effectiveTime/low/@value|.occurrenceDateTime|EVN immunizations typically only contain a value, but if effectiveTime contains low/high, the occurenceDateTime should come from low.<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/repeatNumber/@value|.protocolApplied.doseNumberPositiveInt|**Note:** for @moodCode=EVN immunizations only|
|/routeCode|.route|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/approachSiteCode|.site|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/doseQuantity|.doseQuantity||
|/consumable/manufacturedProduct/manufacturedMaterial/code|.vaccineCode|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)
|/consumable/manufacturedMaterial/lotNumberText|.lotNumber||
|/author|**[Provenance](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-provenance.html)**|[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|/author/time|.recorded|Earliest, if more than one.<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/performer|.performer<br/>&<br/>set .performer.function="AP"|
|**[Immunization Refusal Reason](https://hl7.org/cda/us/ccda/2024Jan/StructureDefinition-ImmunizationRefusalReason.html)**<br/>/entryRelationship[@typeCode="RSON"]/observation/code|.statusReason|[CDA refusal → FHIR statusReason](ConceptMap-CF-ImmunizationRefusal.html)|
|**[Reaction](https://hl7.org/cda/us/ccda/2024Jan/StructureDefinition-ReactionObservation.html)**<br/>/entryRelationship[@typeCode="MFST"]/observation/value|.reaction|It is recommended that reaction observation value be mapped to reaction detail (Observation) valueCodeable concept. Comments are welcome on how this may be best implemented.
|**[Comment Activity](https://hl7.org/cda/us/ccda/2024Jan/StructureDefinition-CommentActivity.html)**<br/>/entryRelationship/act[code/@code="48767-8"]/text|**[Annotation](https://hl7.org/fhir/datatypes.html#Annotation)**<br/>.note||

1\. XPath abbrievated for C-CDA Immunization Activity as: <br/> ClinicalDocument/component/structuredBody/component/section[code/@code="11369-6"]/entry/substanceAdministration

### Illustrative example

{% include examplebutton.html example="CF_immunization_example" b_title = "Click Here To See Highlighted Example" %}

#### Links to example content

The consensus mapping example developed through multiple vendors are available below:
* [Immuniztion CDA example](./Binary-CF-immunization.html)
* [Immuniztion FHIR example](./Immunization-CF-immunization.html)

### Prior work and Expanded Spreadsheets

As reviewed in the methodology, a more comprehensive review was performed via spreadsheets. These spreadsheets have been consolidated and further revised in the tables above but are provided for [reference here](https://github.com/HL7/ccda-on-fhir/blob/master/mappings/CF/CCDA-FHIR%20Immunization.csv) 