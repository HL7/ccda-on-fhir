Extension: ParticipantExtension
Id: ParticipantExtension
Title: "Participant Extension"
Description: "The C-CDA on FHIR Participant Extension identifies supporting entities, including parents, relatives, caregivers, insurance policyholders, guarantors, and others related in some way to the patient. A supporting person or organization is an individual or an organization with a relationship to the patient. A supporting person who is playing multiple roles would be recorded in multiple participants (e.g., emergency contact and next-of-kin)."
Context: Composition
* ^meta.versionId = "3"
* ^meta.lastUpdated = "2020-08-12T21:30:12.734+00:00"
* ^meta.source = "#csn482LCsnDWyxbW"
* ^publisher = "HL7 Structured Documents Working Group"
* ^contact.name = "Sarah Gaunt"
* ^contact.telecom[0].system = #phone
* ^contact.telecom[=].value = "+6 141-029-2506"
* ^contact.telecom[=].use = #work
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "sarah.gaunt@lantanagroup.com"
* ^contact.telecom[=].use = #work
* valueReference 1.. MS
* valueReference only Reference($us-core-practitioner or $us-core-practitionerrole or $us-core-patient or RelatedPerson)
  * ^sliceName = "valueReference"