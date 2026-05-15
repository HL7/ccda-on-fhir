Instance: FC-immunization
InstanceOf: Immunization
Usage: #example
* meta.security = $v3-Confidentiality#N
* contained = 1
* identifier
  * system = "urn:ietf:rfc:3986"
  * value = "urn:uuid:e6f1ba43-c0ed-4b9b-9f12-f435d8ad8f92"
* status = #completed
* vaccineCode = $cvx#88 "influenza virus vaccine, unspecified formulation"
  * text = "Influenza Virus Vaccine"
* patient = Reference(CF-patient)
* occurrenceDateTime = "2010-08-15"
* recorded = "2010-08-15"
* lotNumber = "1"
* performer.actor = Reference(1)