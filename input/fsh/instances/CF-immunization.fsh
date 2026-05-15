Instance: CF-immunization
InstanceOf: Immunization
Usage: #example
* identifier
  * value = "urn:uuid:e6f1ba43-c0ed-4b9b-9f12-f435d8ad8f92"
  * system = "urn:ietf:rfc:3986"
* status = #completed
* vaccineCode = $cvx#88 "influenza virus vaccine, unspecified formulation"
  * text = "Influenza Virus Vaccine"
* patient = Reference(CF-patient)
* occurrenceDateTime = "2010-08-15"
* recorded = "2010-08-16"
* primarySource.extension
  * url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
  * valueCode = #unknown
* lotNumber = "1"
* performer.actor = Reference(ccda-practitionerrole-example)