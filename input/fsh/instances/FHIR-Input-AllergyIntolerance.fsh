Instance: FHIR-Input-AllergyIntolerance
InstanceOf: AllergyIntolerance
Usage: #example
* meta.security = $v3-Confidentiality#N
* identifier[0]
  * system = "urn:oid:1.3.6.1.4.1.22812.3.2009316.3.4.10.2"
  * value = "545077400001"
* identifier[+]
  * system = "urn:oid:1.3.6.1.4.1.22812.3.2009316.3.4.10.2"
  * value = "545077400003"
* clinicalStatus = $allergyintolerance-clinical#active
* type = #intolerance
* category = #medication
* code
  * coding[0] = $rxnorm#1191
  * coding[+] = $sct#293586001
* patient = Reference(FHIR-Input-Patient)
* onsetDateTime = "2008-05-01"
* reaction
  * manifestation = $sct#247472004
    * text = "Hives"
  * severity = #severe
