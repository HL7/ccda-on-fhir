Instance: FHIR-Input-Patient
InstanceOf: Patient
Usage: #example
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
  * value = "FC-160920144139807"
  * system = "urn:oid:1.3.6.1.4.1.22812.3.2009316.3"
* name
  * use = #usual
  * family = "Jones"
  * given = "Myra"
* telecom[0]
  * system = #phone
  * value = "+1(565)867-5309"
  * use = #mobile
* telecom[+]
  * system = #email
  * value = "adam@diameterhealth.com"
  * use = #work
* gender = #female
* birthDate = "1947-05-01"
* address
  * use = #home
  * line = "1357 Amber Drive"
  * city = "Beaverton"
  * state = "OR"
  * postalCode = "97006"
* communication
  * language = urn:ietf:bcp:47#en
  * preferred = true
