Extension: AuthorizationExtension
Id: AuthorizationExtension
Title: "Authorization Extension"
Description: "The C-CDA on FHIR Authorization Extension contains the C-CDA on FHIR Consent profile which represents information about a patient's consents."
Context: Composition
* ^meta.versionId = "6"
* ^meta.lastUpdated = "2020-08-12T21:30:17.475+00:00"
* ^meta.source = "#csn482LCsnDWyxbW"
* ^publisher = "HL7 Structured Documents Working Group"
* ^contact[0].name = "Sarah Gaunt"
* ^contact[=].telecom[0].system = #phone
* ^contact[=].telecom[=].value = "+6 141-029-2506"
* ^contact[=].telecom[=].use = #work
* ^contact[=].telecom[+].system = #email
* ^contact[=].telecom[=].value = "sarah.gaunt@lantanagroup.com"
* ^contact[=].telecom[=].use = #work
* ^contact[+].name = "Rick Geimer"
* ^contact[=].telecom.system = #email
* ^contact[=].telecom.value = "rick.geimer@lantanagroup.com"
* ^contact[=].telecom.use = #work
* url MS
* valueReference 1.. MS
* valueReference only Reference(Consent)
  * ^sliceName = "valueReference"