<style>
td, th {
   border: 1px solid black!important;
}
</style>

{% include stu-note.xml %}

This page provides a mapping from FHIR to CDA. For the CDA to FHIR mapping, please refer to [Procedures CDA → FHIR](./CF-procedures.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html)

### FHIR to C-CDA

|FHIR|CDA|Transform Steps|
|:----|:----|:----|
|id|identifier||
|identifier|identifier||
|status|statusCode||
|code|code||
|[performed[x]]performedDateTime|effectiveTime||
|performedPeriod.start|effectiveTime.low||
|performedPeriod.end|effectiveTime.high||
|[performer]actor|performer||
|onBehalfOf|perfomer.assignedEntity.representedOrganization||
|location|participant.serviceDeliveryLocation||
|reasonCode|entryRelationship.Indication.value||
|bodySite|targetSiteCode||
|report|reference.externalDocument||

### Illustrative example

#### Links to example content