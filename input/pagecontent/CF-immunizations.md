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

|C-CDA¹<br/>[Immunization Activity substanceAdministration](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-ImmunizationActivity.html)|FHIR<br/>[Immunization](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-immunization.html#profile)|Transform Steps|
|:----|:----|:----|
|/@negationInd="true"||Set ```.status="not-done"``` when @negationInd="true"|
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/statusCode|.status|[CDA statusCode → FHIR status](./ConceptMap-CF-ImmunizationStatus.html)|
|/effectiveTime/@value<br/>or<br/>/effectiveTime/low/@value|.occurrenceDateTime|EVN immunizations typically only contain a value, but if effectiveTime contains low/high, the occurenceDateTime should come from low.<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/repeatNumber/@value|.protocolApplied.doseNumberPositiveInt|**Note:** for @moodCode=EVN immunizations only|
|/routeCode|.route|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/approachSiteCode|.site|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/doseQuantity|.doseQuantity|[CDA ↔ FHIR Quantity](mappingGuidance.html#cda--fhir-quantity)|
|/consumable/manufacturedProduct/manufacturedMaterial/code|.vaccineCode|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)
|/consumable/manufacturedMaterial/lotNumberText|.lotNumber||
|/consumable/manufacturedMaterial/manufacturerOrganization|.manufacturer|
|N/A|.primarySource|Since this is unavailable in CDA, when mapping to a FHIR profile that requires the element (such as USCore prior to Release 6), include a [data-absent-reason extension](http://hl7.org/fhir/StructureDefinition/data-absent-reason).
|/author|**[Provenance](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-provenance.html)**|[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|/author/time|.recorded|Earliest, if more than one.<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/performer|.performer|Set ```performer.function="AP"```
|**[Immunization Refusal Reason](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-ImmunizationRefusalReason.html)**<br/>/entryRelationship[@typeCode="RSON"]²/observation/code<br/>(only if code is from ValueSet [No Immunization Reason](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113883.1.11.19717/expansion/Latest))|.statusReason|[CDA refusal → FHIR statusReason](ConceptMap-CF-ImmunizationRefusal.html)<br/>Indicates the reason the immunization event was **not** performed. This is generally only used for the status of "not-done".|
|**[Indication](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-Indication.html)**<br/>/entryRelationship[@typeCode="RSON"]²/observation/value<br/>(only if observation/code is from ValueSet [Problem Type](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113883.3.88.12.3221.7.2/expansion/Latest))|.reasonCode|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|**[Reaction](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-ReactionObservation.html)**<br/>/entryRelationship[@typeCode="MFST"]/observation/value|.reaction|It is recommended that reaction observation value be mapped to reaction detail (Observation) valueCodeable concept. Comments are welcome on how this may be best implemented.
|**[Comment Activity](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-CommentActivity.html)**<br/>/entryRelationship/act[code/@code="48767-8"]/text|**[Annotation](https://hl7.org/fhir/datatypes.html#Annotation)**<br/>.note||


1\. XPath abbrievated for C-CDA Immunization Activity as: <br/> ClinicalDocument/component/structuredBody/component/section[code/@code="11369-6"]/entry/substanceAdministration<br/>
2\. Both indication and refusal reason are observations related by @typeCode="RSON". Typically templateIds should not be used to identify content, but the Indication template does not require a specific code. If the observation/code comes from ValueSet [No Immunization Reason](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113883.1.11.19717/expansion/Latest), then it is clearly a refusal reason. If it comes from ValueSet [Problem Type](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113883.3.88.12.3221.7.2/expansion/Latest), then it is an indication. But if the code comes from neither value set, the observation is *possibly* an indication, but the only way to know is to check the templateId.

### Illustrative example



#### Links to example content

The consensus mapping example developed through multiple vendors are available below:
* [Immuniztion CDA example](./Binary-CF-immunization.html)
* [Immuniztion FHIR example](./Immunization-CF-immunization.html)