Instance: FHIR-Output-MedicationRequest
InstanceOf: MedicationRequest
Usage: #example
Description: "FHIR resource produced by the CDA-to-FHIR mapping example for MedicationRequest. Faithful map of the Myra Jones (v8) albuterol/ipratropium Medication Activity (id cdbd33f0-...). NOTE: intent value is a placeholder pending MedMaps decisions (see decision log D-med-2)."
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-medicationrequest"
* identifier
  * system = "urn:ietf:rfc:3986"
  * value = "urn:uuid:cdbd33f0-6cde-11db-9fe1-0800200c9a66"
* status = #active
* intent = #plan
* medicationReference = Reference(FHIR-Output-Medication)
* subject = Reference(FHIR-Output-Patient)
* authoredOn = "2013-09-11"
* requester = Reference(Myra-Practitioner-Sixer) "Heartly Sixer, MD"
* reasonCode = $sct#56018004 "wheezing"
* note.text = "Patient reports improved symptom control with the combination inhaler."
* dosageInstruction
  * sequence = 1
  * text = "2 puffs every 4-6 hours as needed"
  * patientInstruction = "Do not overtake"
  * additionalInstruction = $sct#1153465004 "Education about overdosing"
  * asNeededBoolean = true
  * route = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C38288 "ORAL"
  * timing.repeat
    * boundsPeriod.start = "2012-08-06"
    * frequency = 1
    * period = 4
    * periodMax = 6
    * periodUnit = #h
  * doseAndRate.doseQuantity.value = 1
  * maxDosePerPeriod
    * numerator = 6 '{spray}' "spray"
    * denominator = 1 '{day}' "day"
* dispenseRequest
  * validityPeriod.end = "2012-11-06"
  * numberOfRepeatsAllowed = 1
  * quantity.value = 3
