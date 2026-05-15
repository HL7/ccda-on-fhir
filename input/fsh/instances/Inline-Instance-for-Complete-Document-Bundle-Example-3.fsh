Instance: Inline-Instance-for-Complete-Document-Bundle-Example-3
InstanceOf: Patient
Usage: #inline
* id = "example"
* extension[0]
  * extension[0]
    * url = "ombCategory"
    * valueCoding = urn:oid:2.16.840.1.113883.6.238#2106-3 "White"
  * extension[+]
    * url = "ombCategory"
    * valueCoding = urn:oid:2.16.840.1.113883.6.238#1002-5 "American Indian or Alaska Native"
  * extension[+]
    * url = "ombCategory"
    * valueCoding = urn:oid:2.16.840.1.113883.6.238#2028-9 "Asian"
  * extension[+]
    * url = "detailed"
    * valueCoding = urn:oid:2.16.840.1.113883.6.238#1586-7 "Shoshone"
  * extension[+]
    * url = "detailed"
    * valueCoding = urn:oid:2.16.840.1.113883.6.238#2036-2 "Filipino"
  * extension[+]
    * url = "text"
    * valueString = "Mixed"
  * url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-race"
* extension[+]
  * extension[0]
    * url = "ombCategory"
    * valueCoding = urn:oid:2.16.840.1.113883.6.238#2135-2 "Hispanic or Latino"
  * extension[+]
    * url = "detailed"
    * valueCoding = urn:oid:2.16.840.1.113883.6.238#2184-0 "Dominican"
  * extension[+]
    * url = "detailed"
    * valueCoding = urn:oid:2.16.840.1.113883.6.238#2148-5 "Mexican"
  * extension[+]
    * url = "text"
    * valueString = "Hispanic or Latino"
  * url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity"
* extension[+]
  * url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex"
  * valueCode = #F
* identifier
  * use = #usual
  * type = $v2-0203#MR "Medical Record Number"
    * text = "Medical Record Number"
  * system = "http://hospital.smarthealthit.org"
  * value = "1032702"
* active = true
* name
  * family = "Shaw"
  * given[0] = "Amy"
  * given[+] = "V."
* telecom[0]
  * system = #phone
  * value = "555-555-5555"
  * use = #home
* telecom[+]
  * system = #email
  * value = "amy.shaw@example.com"
* gender = #female
* birthDate = "2007-02-20"
* address
  * line = "49 Meadow St"
  * city = "Mounds"
  * state = "OK"
  * postalCode = "74047"
  * country = "US"