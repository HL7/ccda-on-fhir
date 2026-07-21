Instance: FHIR-Output-Immunization
InstanceOf: Immunization
Usage: #example
Description: "FHIR resource produced by the CDA-to-FHIR mapping example for Immunization."
* identifier
  * value = "urn:uuid:e6f1ba43-c0ed-4b9b-9f12-f435d8ad8f92"
  * system = "urn:ietf:rfc:3986"
* status = #completed
* vaccineCode.coding[0] = $cvx#88 "influenza virus vaccine, unspecified formulation"
* vaccineCode.text = "Influenza Virus Vaccine"
* patient = Reference(FHIR-Output-Patient)
* occurrenceDateTime = "2010-08-15"
* recorded = "2010-08-15"
* primarySource.extension
  * url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
  * valueCode = #unknown
* route = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C28161 "INTRAMUSCULAR"
* site = $sct#700022004 "Muscle and/or tendon structure of upper limb"
* doseQuantity = 60 'ug' "ug"
* manufacturer.display = "Health LS - Immuno Inc."
* lotNumber = "1"
* performer.actor.display = "Amanda Assigned"
