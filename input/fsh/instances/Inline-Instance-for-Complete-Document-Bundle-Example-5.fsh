Instance: Inline-Instance-for-Complete-Document-Bundle-Example-5
InstanceOf: $us-core-practitioner
Usage: #inline
* id = "ccda-practitioner-example"
* identifier
  * use = #official
  * type = $v2-0203#PRN "Provider number"
    * text = "US National Provider Identifier"
  * system = "http://hl7.org/fhir/sid/us-npi"
  * value = "9941339108"
* name
  * family = "Richard"
  * given[0] = "Brenda"
  * given[+] = "Jennings"
  * suffix = "MD"
* telecom[0]
  * system = #phone
  * value = "313-555-6868"
  * use = #home
* telecom[+]
  * system = #phone
  * value = "313-555-6443"
  * use = #work
* address
  * text = "346 W Plum Avenu Dearborn MI 48123"
  * line = "346 W Plum Avenue"
  * city = "Dearborn"
  * state = "MI"
  * postalCode = "48126"
* gender = #female
* birthDate = "1976-11-15"