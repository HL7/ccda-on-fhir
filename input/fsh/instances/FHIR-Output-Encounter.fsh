Instance: FHIR-Output-Encounter
InstanceOf: Encounter
Usage: #example
Description: "FHIR resource produced by the CDA-to-FHIR mapping example for Encounter (Myra Jones v8 urgent-care visit). class inferred from the outpatient encounter type (not directly mapped); status finished per EVN mood with a past effectiveTime."
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-encounter"
* identifier
  * system = "urn:ietf:rfc:3986"
  * value = "urn:uuid:2a620155-9d11-439e-92b3-5d9815ff4de8"
* status = #finished
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB "ambulatory"
* type = http://www.ama-assn.org/go/cpt#99213 "Office/outpatient established low mdm 20-29 min"
* subject = Reference(FHIR-Output-Patient)
* participant
  * individual.display = "Dr. Samir Khan"
* period.start = "2012-08-15T10:00:00-08:00"
* diagnosis.condition = Reference(FHIR-Output-Condition-EncounterDx)
* hospitalization.dischargeDisposition = http://www.nubc.org/patient-discharge#01 "Discharged to home"
* location.location.display = "Community Urgent Care"
