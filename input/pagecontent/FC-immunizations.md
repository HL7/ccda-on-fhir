<style>
td, th {
   border: 1px solid black!important;
}
</style>

{% include stu-note.xml %}

This page provides a mapping from FHIR to CDA. For the CDA to FHIR mapping, please refer to [Immunizations CDA → FHIR](./CF-immunizations.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html)

### FHIR to C-CDA

|FHIR|CDA|Transform Steps|
|:----|:----|:----|
|.identifier|id|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|.status|statusCode|**Constraint** when ```status.value="not-done"```<br/>Set negationInd to true in CDA observation|
|.status|statusCode|**Constraint** other values of status<br/>[FHIR status → CDA statusCode](ConceptMap-FC-ImmunizationStatus.html)|
|.statusReason|**Immunization Refusal Reason**<br/>```entryRelationship@typeCode="RSON"```<br/>entryRelationship/observation/code|[FHIR statusReason → CDA refusal](ConceptMap-FC-ImmunizationRefusal.html)|
|.vaccineCode|consumable/manufacturedProduct/manufacturedMaterial/code|[CDA CD ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|.occurrenceDateTime|effectiveTime@value|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|.location||"Possible to use entryReference from Encounter|
|.manufacturer|consumable/manufacturedProduct/manufacturerOrganization||
|.lotNumber|consumable/manufacturedMaterial/lotNumberText||
|.route|routeCode|[CDA CD ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|.doseQuantity|doseQuantity||
|.performer.actor|performer|**Constraint** when ```.performer.function="AP"``|
|reasonCode|**Indication**<br/>``` entryRelationship@typeCode="RSON"```<br/>[/entryRelationship/observation/value]()||
|.education.documentType|reference.ExternalDocument.code||
|.education.reference|.reference.ExternalDocument.id|undefined|
|reaction.id|**Reaction**<br/>``` entryRelationship@typeCode="MFST"```<br/>[/entryRelationship/observation/id]()||
|reaction.date|[/entryRelationship/observation/effectiveTime]()||
|.doseNumber[x].doseNumberPositiveInt|repeatNumber||


### Illustrative example

#### Links to example content