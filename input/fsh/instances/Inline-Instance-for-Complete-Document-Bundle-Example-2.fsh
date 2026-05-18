Instance: Inline-Instance-for-Complete-Document-Bundle-Example-2
InstanceOf: $us-core-practitionerrole
Usage: #inline
* id = "ccda-practitionerrole-example"
* practitioner = Reference(urn:uuid:51819bca-6cdd-4a9c-a76f-51b4f50e7fd2) "Brenda Jennings Richard MD"
* organization = Reference(urn:uuid:58d390ba-6348-4b0d-b85f-7fbd94223718) "Acme Lab"
* telecom[0]
  * system = #phone
  * value = "313-555-6868"
  * use = #home
* telecom[+]
  * system = #phone
  * value = "313-555-6443"
  * use = #work