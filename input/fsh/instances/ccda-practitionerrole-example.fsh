Instance: ccda-practitionerrole-example
InstanceOf: PractitionerRole
Usage: #example
* meta
  * versionId = "5"
  * lastUpdated = "2020-08-12T19:18:13.336+00:00"
  * profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitionerrole"
* practitioner = Reference(ccda-practitioner-example) "Brenda Jennings Richard MD"
* organization = Reference(organization-1) "Acme Labs"
* telecom[0]
  * system = #phone
  * value = "313-555-6868"
  * use = #home
* telecom[+]
  * system = #phone
  * value = "313-555-6443"
  * use = #work