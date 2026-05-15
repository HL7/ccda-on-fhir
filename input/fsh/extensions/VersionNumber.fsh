Extension: VersionNumber
Id: VersionNumber
Title: "Version Number"
Description: """The CCDA on FHIR VersionNumber Extension represents a numeric value used to version successive replacement documents.

For further information see the C-CDA specification here: http://www.hl7.org/implement/standards/product_brief.cfm?product_id=408."""
Context: Composition
* ^meta.versionId = "5"
* ^meta.lastUpdated = "2020-08-12T21:30:20.034+00:00"
* ^meta.source = "#csn482LCsnDWyxbW"
* ^publisher = "HL7 Structured Documents Working Group"
* ^contact.name = "Meenaxi Gosai"
* ^contact.telecom[0].system = #phone
* ^contact.telecom[=].value = "604-467-8997"
* ^contact.telecom[=].use = #work
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "meenaxi.gosai@lantanagroup.com"
* ^contact.telecom[=].use = #work
* valueInteger only integer
* valueInteger MS
  * ^sliceName = "valueInteger"