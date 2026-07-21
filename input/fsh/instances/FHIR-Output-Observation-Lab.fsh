Instance: FHIR-Output-Observation-Lab
InstanceOf: Observation
Usage: #example
Description: "FHIR resource produced by the CDA-to-FHIR mapping example for a lab result observation (Myra Jones v8 urine specific gravity)."
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-lab"
* identifier
  * system = "urn:oid:1.3.6.1.4.1.22812.20.1.1.4.5"
  * value = "13"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory "Laboratory"
* code = $loinc#5811-5 "Specific gravity of Urine by Test strip"
* subject = Reference(FHIR-Output-Patient)
* effectiveDateTime = "2015-06-22"
* valueQuantity = 1.015 '1' "1"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#N "Normal"
* specimen = Reference(FHIR-Output-Specimen)
* referenceRange
  * low = 1.005 '1' "1"
  * high = 1.030 '1' "1"
