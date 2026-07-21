Instance: FHIR-Input-Immunization
InstanceOf: Immunization
Usage: #example
Description: "FHIR resource used as input for the Immunization FHIR-to-CDA mapping example."
* meta.security = $v3-Confidentiality#N
* contained = FHIR-Input-Immunization-Performer
* identifier
  * system = "urn:ietf:rfc:3986"
  * value = "urn:uuid:e6f1ba43-c0ed-4b9b-9f12-f435d8ad8f92"
* status = #completed
* vaccineCode = $cvx#88 "influenza virus vaccine, unspecified formulation"
  * text = "Influenza Virus Vaccine"
* patient = Reference(FHIR-Input-Patient)
* occurrenceDateTime = "2010-08-15"
* recorded = "2010-08-15"
* lotNumber = "1"
* performer.actor = Reference(FHIR-Input-Immunization-Performer)
