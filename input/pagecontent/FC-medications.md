<style>
td, th {
   border: 1px solid black!important;
}
</style>

{% include stu-note.xml %}

This page provides a mapping from FHIR to CDA. For the CDA to FHIR mapping, please refer to [Medications CDA → FHIR](./CF-medications.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html)

### FHIR to C-CDA

|FHIR|CDA|Transform Steps|
|:----|:----|:----|
|identifier|/id||
|status|/status||
|status|@moodCode||
|category|/code|"code is not generally used|
|doNotPerform|@negationInd||
|.medicationCodeableConcept|/manufacturedMaterial||
|medicationReference|/consumable||
|authoredOn|/time||
|requester|/assignedAuthor||
|performer|performer|CDA unclear|
|reasonCode|/value||
|dosageInstruction.text|/text||
|dosageInstruction.additionalInstruction|/code||
|dosageInstruction.patientInstruction|/text||
|dosageInstruction.timing|effectiveTime|This can be complex|
|dosageInstruction.site|/approachSiteCode|both use SNOMED CT|
|dosageInstruction.route|/routeCode||
|dosageInstruction.route|/routeCode||
|dosageInstruction.route|/routeCode/translation||
|[dosageInstruction.doseAndRate]dosageInstruction...doseRange|doseQuantity|do we need a type map for IVL[PQ]?|
|dosageInstruction...doseQuantity|doseQuantity||
|dosageInstruction...rateRange|rateQuantity||
|dosageInstruction...rateQuantity|rateQuantity||
|dosageInstruction.maxDosePerPeriod|maxDoseQuantity||
|[dispenseRequest].quantity|quantity||

### Illustrative example

#### Links to example content