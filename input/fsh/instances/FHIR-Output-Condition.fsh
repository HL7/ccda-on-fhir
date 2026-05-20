Instance: FHIR-Output-Condition
InstanceOf: Condition
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-condition-problems-health-concerns"
* identifier
  * system = "urn:oid:1.3.6.1.4.1.22812.3.2009316.3.4.1.2.1"
  * value = "545069300001"
* clinicalStatus = $condition-clinical#active
* category = $condition-category#problem-list-item
* code
  * coding[0] = $sct#233604007 "Pneumonia"
  * coding[+] = $icd-9-cm#486 "Pneumonia, organism unspecified"
  * coding[+] = $icd-10-cm#J18.9 "Pneumonia, unspecified organism"
  * coding[+] = urn:oid:2.16.840.1.113883.3.247.1.1#87580
  * text = "Pneumonia"
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/condition-assertedDate"
  * valueDateTime = "2012-08-06"
* subject = Reference(FHIR-Output-Patient)
* onsetDateTime = "2012-08-06"
