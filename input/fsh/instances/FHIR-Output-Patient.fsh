Instance: FHIR-Output-Patient
InstanceOf: Patient
Usage: #example
Description: "FHIR resource produced by the CDA-to-FHIR mapping example for Patient."
* extension[0]
  * extension[0]
    * url = "ombCategory"
    * valueCoding = urn:oid:2.16.840.1.113883.6.238#2135-2 "Hispanic or Latino"
  * extension[+]
    * url = "text"
    * valueString = "Hispanic or Latino"
  * url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity"
* extension[+]
  * extension[0]
    * url = "ombCategory"
    * valueCoding = urn:oid:2.16.840.1.113883.6.238#2106-3 "White"
  * extension[+]
    * url = "text"
    * valueString = "White"
  * url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-race"
* identifier
  * value = "160920144139807"
  * system = "urn:oid:1.3.6.1.4.1.22812.3.2009316.3"
* name[0]
  * use = #official
  * family = "Jones"
  * given = "Myra"
  * suffix = "Ph.D."
* name[+]
  * use = #old
  * family = "Gonzalez"
  * given = "Myra"
* telecom[0]
  * system = #phone
  * value = "+1(565)867-5309"
  * use = #mobile
* telecom[+]
  * system = #email
  * value = "myra.jones@email.com"
  * use = #home
* gender = #female
* birthDate = "1947-05-01"
* address
  * use = #home
  * line = "1357 Amber Drive"
  * city = "Beaverton"
  * state = "OR"
  * postalCode = "97006"
* maritalStatus = http://terminology.hl7.org/CodeSystem/v3-MaritalStatus#M "Married"
* communication
  * language = urn:ietf:bcp:47#en
  * preferred = true
* managingOrganization = Reference(Document-Organization-1)
