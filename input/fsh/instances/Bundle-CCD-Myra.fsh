Instance: Bundle-CCD-Myra
InstanceOf: Bundle
Title: "CCD Document Bundle Example (Myra Jones)"
Usage: #example
Description: "Complete FHIR document for the Myra Jones CCD: Composition-CCD-Myra as the first entry, followed by every resource reachable from it (SUSHI copies the shared standalone instances in, so the bundle can never drift from them). Conforms to the FHIR Clinical Documents bundle profile; Bundle.identifier carries the ClinicalDocument/id per the header map; timestamp equals Composition.date."
* meta.profile = "http://hl7.org/fhir/uv/fhir-clinical-document/StructureDefinition/clinical-document-bundle"
* identifier
  * system = "urn:ietf:rfc:3986"
  * value = "urn:uuid:973c7e16-05dd-484f-a780-e80904fd8ff0"
* type = #document
* timestamp = "2016-10-03T18:27:10+00:00"
* entry[0]
  * fullUrl = "http://example.org/fhir/Composition/Composition-CCD-Myra"
  * resource = Composition-CCD-Myra
* entry[+]
  * fullUrl = "http://example.org/fhir/Patient/FHIR-Output-Patient"
  * resource = FHIR-Output-Patient
* entry[+]
  * fullUrl = "http://example.org/fhir/Encounter/FHIR-Output-Encounter"
  * resource = FHIR-Output-Encounter
* entry[+]
  * fullUrl = "http://example.org/fhir/Condition/FHIR-Output-Condition-EncounterDx"
  * resource = FHIR-Output-Condition-EncounterDx
* entry[+]
  * fullUrl = "http://example.org/fhir/AllergyIntolerance/FHIR-Output-AllergyIntolerance"
  * resource = FHIR-Output-AllergyIntolerance
* entry[+]
  * fullUrl = "http://example.org/fhir/MedicationRequest/FHIR-Output-MedicationRequest"
  * resource = FHIR-Output-MedicationRequest
* entry[+]
  * fullUrl = "http://example.org/fhir/Medication/FHIR-Output-Medication"
  * resource = FHIR-Output-Medication
* entry[+]
  * fullUrl = "http://example.org/fhir/Practitioner/Myra-Practitioner-Sixer"
  * resource = Myra-Practitioner-Sixer
* entry[+]
  * fullUrl = "http://example.org/fhir/Condition/FHIR-Output-Condition"
  * resource = FHIR-Output-Condition
* entry[+]
  * fullUrl = "http://example.org/fhir/DiagnosticReport/FHIR-Output-DiagnosticReport"
  * resource = FHIR-Output-DiagnosticReport
* entry[+]
  * fullUrl = "http://example.org/fhir/Observation/FHIR-Output-Observation-Lab"
  * resource = FHIR-Output-Observation-Lab
* entry[+]
  * fullUrl = "http://example.org/fhir/Specimen/FHIR-Output-Specimen"
  * resource = FHIR-Output-Specimen
* entry[+]
  * fullUrl = "http://example.org/fhir/Observation/FHIR-Output-Observation-SmokingStatus"
  * resource = FHIR-Output-Observation-SmokingStatus
* entry[+]
  * fullUrl = "http://example.org/fhir/Observation/FHIR-Output-Observation-HeartRate"
  * resource = FHIR-Output-Observation-HeartRate
* entry[+]
  * fullUrl = "http://example.org/fhir/Organization/Document-Organization-1"
  * resource = Document-Organization-1
