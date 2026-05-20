Instance: Document-Organization-Lab
InstanceOf: Organization
Usage: #example
* meta
  * versionId = "6"
  * lastUpdated = "2020-08-12T21:30:13.081+00:00"
  * source = "#csn482LCsnDWyxbW"
  * profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-organization"
* identifier
  * system = "http://hl7.org/fhir/sid/us-npi"
  * value = "1144221847"
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
