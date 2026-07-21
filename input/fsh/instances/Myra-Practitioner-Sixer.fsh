Instance: Myra-Practitioner-Sixer
InstanceOf: Practitioner
Usage: #example
Description: "Shared Myra Jones persona instance: Dr. Heartly Sixer (cardiologist), author/requester of the medication example (mapped from the Medication Activity author)."
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner"
* identifier
  * system = "http://hl7.org/fhir/sid/us-npi"
  * value = "1679576722"
* name
  * family = "Sixer"
  * given = "Heartly"
  * suffix = "MD"
* address
  * line = "6666 StreetName St."
  * city = "Silver Spring"
  * state = "MD"
  * postalCode = "20901"
  * country = "US"
* telecom
  * system = #phone
  * value = "+1(301)666-6666"
  * use = #work
* qualification.code = http://nucc.org/provider-taxonomy#207RC0000X "Cardiovascular Disease Physician"
