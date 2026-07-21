Instance: FHIR-Output-Observation-HeartRate
InstanceOf: Observation
Usage: #example
Description: "FHIR resource produced by the CDA-to-FHIR mapping example for a vital sign (heart rate) from the Myra Jones (v8) Vital Signs organizer."
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-heart-rate"
* identifier
  * system = "urn:oid:2.16.840.1.113883.3.42.126.100001.19"
  * value = "216881330410151584"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"
* code = $loinc#8867-4 "Heart rate"
* subject = Reference(FHIR-Output-Patient)
* effectiveDateTime = "2014-05-20T19:36:05-06:00"
* valueQuantity = 80 '/min' "beats/min"
