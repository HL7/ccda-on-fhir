Instance: CF-medication
InstanceOf: MedicationRequest
Usage: #example
* identifier
  * system = "urn:ietf:rfc:3986"
  * value = "urn:uuid:cdbd33f0-6cde-11db-9fe1-0800200c9a66"
* status = #active
* intent = #plan
* medicationCodeableConcept = $rxnorm#252298 "albuterol 0.1 MG Inhalation Powder"
* subject = Reference(CF-patient)
* dosageInstruction
  * sequence = 1
  * asNeededBoolean = false
  * doseAndRate.doseQuantity.value = 1
* requester = Reference(ccda-practitionerrole-example)