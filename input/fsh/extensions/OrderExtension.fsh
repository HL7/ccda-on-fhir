Extension: OrderExtension
Id: OrderExtension
Title: "Order Extension"
Description: "The Order Extension represents orders that are fulfilled by this document such as a radiologists report of an x-ray."
Context: Composition
* ^meta.versionId = "4"
* ^meta.lastUpdated = "2020-08-12T21:30:19.839+00:00"
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
* valueReference only Reference(ServiceRequest)
  * ^sliceName = "valueReference"