Extension: InformationRecipientExtension
Id: InformationRecipientExtension
Title: "Information Recipient Extension"
Description: """The Information Recipient Extension records the intended recipient of the information at the time the document was created.

For further information see the C-CDA specification here: http://www.hl7.org/implement/standards/product_brief.cfm?product_id=408."""
Context: Composition
* ^meta.versionId = "4"
* ^meta.lastUpdated = "2020-08-12T21:30:12.856+00:00"
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
* ^jurisdiction = urn:iso:std:iso:3166#US
* valueReference 1.. MS
* valueReference only Reference($us-core-practitioner or $us-core-practitionerrole or $us-core-patient)
  * ^sliceName = "valueReference"