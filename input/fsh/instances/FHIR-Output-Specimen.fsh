Instance: FHIR-Output-Specimen
InstanceOf: Specimen
Usage: #example
Description: "FHIR resource produced by the CDA-to-FHIR mapping example for the specimen of the lab result (Myra Jones v8 urine specimen)."
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-specimen"
* identifier
  * system = "urn:ietf:rfc:3986"
  * value = "urn:uuid:a7b2c3d4-e5f6-4a1b-8c9d-0e1f2a3b4c5d"
* type = $sct#122575003 "Urine specimen"
* subject = Reference(FHIR-Output-Patient)
