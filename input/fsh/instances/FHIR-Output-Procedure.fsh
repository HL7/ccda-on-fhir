Instance: FHIR-Output-Procedure
InstanceOf: Procedure
Usage: #example
Description: "FHIR resource produced by the CDA-to-FHIR mapping example for Procedure. Faithful map of the Myra Jones (v8) procedure entry (radiographic imaging history, SNOMED 416940007 with ICD-9/ICD-10/local translations)."
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-procedure"
* identifier[0]
  * system = "urn:oid:1.3.6.1.4.1.22812.3.2009316.3.4.7"
  * value = "545069400001"
* identifier[+]
  * system = "urn:oid:1.3.6.1.4.1.22812.3.2009316.3.4.7"
  * value = "545069400003"
* status = #completed
* code
  * coding[0] = $sct#416940007 "History of Procedure (situation)"
  * coding[+] = $icd-9-cm#V15.89 "Other specified personal history presenting hazards to health"
  * coding[+] = $icd-10-cm#Z92.89 "Personal history of other medical treatment"
  * coding[+] = urn:oid:2.16.840.1.113883.3.247.1.1#2782946
* subject = Reference(FHIR-Output-Patient)
* performedDateTime = "2012-08-16"
* bodySite = $sct#416550000 "Chest and/or abdomen structure"
* performer.actor.display = "Amanda Assigned"
