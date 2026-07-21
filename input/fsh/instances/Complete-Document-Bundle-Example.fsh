Instance: Complete-Document-Bundle-Example
InstanceOf: Bundle
Usage: #example
Description: "Complete document Bundle example. Entries are copies of the shared standalone example instances (single source of truth); fullUrls use type/id form so the instances' relative references resolve within the bundle."
* identifier
  * system = "urn:ietf:rfc:3986"
  * value = "urn:uuid:a417cad7-57b3-47a6-bab8-33fdae616839"
* meta.profile = "http://hl7.org/fhir/uv/fhir-clinical-document/StructureDefinition/clinical-document-bundle"
* type = #document
* timestamp = "2016-06-15T09:10:14Z"
* entry[0]
  * fullUrl = "http://example.org/fhir/Composition/Care-Plan-Example"
  * resource = Care-Plan-Example
* entry[+]
  * fullUrl = "http://example.org/fhir/PractitionerRole/Document-PractitionerRole"
  * resource = Document-PractitionerRole
* entry[+]
  * fullUrl = "http://example.org/fhir/Patient/Document-Patient"
  * resource = Document-Patient
* entry[+]
  * fullUrl = "http://example.org/fhir/Organization/Document-Organization-Lab"
  * resource = Document-Organization-Lab
* entry[+]
  * fullUrl = "http://example.org/fhir/Practitioner/Document-Practitioner"
  * resource = Document-Practitioner
