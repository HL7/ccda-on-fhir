Instance: FHIR-Output-Observation-SmokingStatus
InstanceOf: Observation
Usage: #example
Description: "FHIR resource produced by the CDA-to-FHIR mapping example for Smoking Status, from the Myra Jones (v8) Social History section."
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-smokingstatus"
* identifier
  * system = "urn:oid:2.16.840.1.113883.19"
  * value = "123456789"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#social-history "Social History"
* code = $loinc#72166-2 "Tobacco smoking status"
* subject = Reference(FHIR-Output-Patient)
* effectiveDateTime = "2014-06-06T10:32:00-05:00"
* valueCodeableConcept = $sct#449868002 "Smokes tobacco daily"
