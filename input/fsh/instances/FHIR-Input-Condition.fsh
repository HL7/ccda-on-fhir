Instance: FHIR-Input-Condition
InstanceOf: Condition
Usage: #example
* meta
  * profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-condition-problems-health-concerns"
  * security = $v3-Confidentiality#N
* identifier
  * system = "urn:oid:1.3.6.1.4.1.22812.3.2009316.3.4.1.2.1"
  * value = "545069300001"
* clinicalStatus = $condition-clinical#active "Active"
  * text = "Active"
* category = $condition-category#problem-list-item "Problem List Item"
  * text = "Problem List Item"
* code
  * coding[0] = $sct#233604007
  * coding[+] = $icd-9-cm#486
  * coding[+] = $icd-10-cm#J18.9
  * coding[+] = urn:oid:2.16.840.1.113883.3.247.1.1#87580
  * text = "Pneumonia"
* subject = Reference(FHIR-Input-Patient)
* onsetDateTime = "2012-08-06"
