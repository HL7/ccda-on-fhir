Instance: FC-medication
InstanceOf: MedicationRequest
Usage: #example
* meta.security = $v3-Confidentiality#N
* identifier
  * system = "urn:ietf:rfc:3986"
  * value = "urn:uuid:cdbd33f0-6cde-11db-9fe1-0800200c9a66"
* status = #active
* intent = #order
* medicationCodeableConcept = $rxnorm#252298 "albuterol 0.1 MG Inhalation Powder"
  * text = "albuterol 0.1 MG Inhalation Powder"
* subject = Reference(CF-patient)
* groupIdentifier
  * system = "urn:ietf:rfc:3986"
  * value = "urn:uuid:2a620155-9d11-439e-92b3-5d9815ff4ee8"
* dosageInstruction
  * sequence = 1
  * timing.repeat.boundsPeriod.start = "2012-08-06"
  * asNeededBoolean = false
  * doseAndRate.doseQuantity.value = 1