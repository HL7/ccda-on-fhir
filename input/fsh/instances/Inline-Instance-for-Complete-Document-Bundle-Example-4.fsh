Instance: Inline-Instance-for-Complete-Document-Bundle-Example-4
InstanceOf: Organization
Usage: #inline
* id = "acme-lab"
* identifier[0]
  * system = "http://hl7.org.fhir/sid/us-npi"
  * value = "1144221847"
* identifier[+]
  * system = "http://www.acme.org/organization"
  * value = "2523423456"
* active = true
* type = $organization-type#prov "Healthcare Provider"
* name = "Acme Labs"
* telecom[0]
  * system = #phone
  * value = "(+1) 734-677-7777"
* telecom[+]
  * system = #email
  * value = "hq@acme.org"
* address
  * line = "3300 Washtenaw Avenue, Suite 227"
  * city = "Amherst"
  * state = "MA"
  * postalCode = "01002"
  * country = "USA"