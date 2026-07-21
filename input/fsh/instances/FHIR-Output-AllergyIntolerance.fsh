Instance: FHIR-Output-AllergyIntolerance
InstanceOf: AllergyIntolerance
Usage: #example
Description: "FHIR resource produced by the CDA-to-FHIR mapping example for AllergyIntolerance. Faithful map of the Myra Jones (v8) aspirin allergy concern act."
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-allergyintolerance"
* identifier[0]
  * system = "urn:oid:1.3.6.1.4.1.22812.3.2009316.3.4.10.2"
  * value = "545077400001"
* identifier[+]
  * system = "urn:oid:1.3.6.1.4.1.22812.3.2009316.3.4.10.2"
  * value = "545077400003"
* clinicalStatus = $allergyintolerance-clinical#active
* category = #medication
* criticality = #high
* code
  * coding[0] = $rxnorm#1191 "Aspirin"
  * coding[+] = $sct#293586001 "Allergy to aspirin"
  * text = "aspirin"
* patient = Reference(FHIR-Output-Patient)
* onsetDateTime = "2008-05-01"
* recordedDate = "2014-01-04"
* reaction
  * manifestation = $sct#247472004 "Wheal"
    * text = "Wheal"
  * severity = #severe
