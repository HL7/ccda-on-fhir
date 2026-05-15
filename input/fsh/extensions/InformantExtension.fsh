Extension: InformantExtension
Id: InformantExtension
Title: "Informant Extension"
Description: "The C-CDA on FHIR Informant Extension describes an information source for any content within the clinical document. This informant is constrained for use when the source of information is an assigned health care provider for the patient."
Context: Composition
* ^meta.versionId = "3"
* ^meta.lastUpdated = "2020-08-12T21:30:13.192+00:00"
* ^meta.source = "#csn482LCsnDWyxbW"
* ^publisher = "Lantana Consulting Group"
* ^contact[0].name = "Sarah Gaunt"
* ^contact[=].telecom[0].system = #phone
* ^contact[=].telecom[=].value = "+6-141-029-2506"
* ^contact[=].telecom[=].use = #work
* ^contact[=].telecom[+].system = #email
* ^contact[=].telecom[=].value = "sarah.gaunt@lantanagroup.com"
* ^contact[=].telecom[=].use = #work
* ^contact[+].name = "Rick Geimer"
* ^contact[=].telecom.system = #email
* ^contact[=].telecom.value = "rick.geimer@lantanagroup.com"
* ^contact[=].telecom.use = #work
* valueReference 1.. MS
* valueReference only Reference($us-core-practitioner or $us-core-practitionerrole or $us-core-patient or RelatedPerson)
  * ^sliceName = "valueReference"