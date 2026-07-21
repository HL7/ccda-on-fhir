Instance: FHIR-Output-Condition-EncounterDx
InstanceOf: Condition
Usage: #example
Description: "FHIR resource produced by the CDA-to-FHIR mapping example for the Encounter Diagnosis act (Myra Jones v8), demonstrating us-core-condition-encounter-diagnosis."
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-condition-encounter-diagnosis"
* clinicalStatus = $condition-clinical#active
* category = $condition-category#encounter-diagnosis "Encounter Diagnosis"
* code = $sct#64109004 "Costochondritis"
* subject = Reference(FHIR-Output-Patient)
* encounter = Reference(FHIR-Output-Encounter)
