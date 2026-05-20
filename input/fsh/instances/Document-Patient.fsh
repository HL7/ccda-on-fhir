Instance: Document-Patient
InstanceOf: Patient
Usage: #example
* meta
  * versionId = "9"
  * lastUpdated = "2020-09-09T21:58:13.238+00:00"
  * source = "#T77feouCUwFbnN3H"
  * profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"
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
  * value = "900"
* active = true
* name
  * family = "Noelle"
  * given = "Paticia"
* telecom[0]
  * system = #phone
  * value = "555-555-2003"
  * use = #home
* telecom[+]
  * system = #email
  * value = "Patricia.Noelle@example.com"
* gender = #female
* birthDate = "1954-10-17"
* address
  * line = "7247 Main St"
  * city = "Springfield"
  * state = "OK"
  * postalCode = "62707"
  * country = "US"
