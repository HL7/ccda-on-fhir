Extension: DataEntererExtension
Id: DataEntererExtension
Title: "Data Enterer Extension"
Description: """The Data Enterer Extension represents the person who transferred the content, written or dictated, into the clinical document. To clarify, an author provides the content, subject to their own interpretation; a dataEnterer adds an author's information to the electronic system.

For further information see the C-CDA specification here: http://www.hl7.org/implement/standards/product_brief.cfm?product_id=408."""
Context: Composition
* ^meta.versionId = "4"
* ^meta.lastUpdated = "2020-08-12T21:30:14.222+00:00"
* ^meta.source = "#csn482LCsnDWyxbW"
* ^publisher = "Lantana Consulting Group"
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
* valueReference only Reference($us-core-practitioner or $us-core-practitionerrole)
  * ^sliceName = "valueReference"