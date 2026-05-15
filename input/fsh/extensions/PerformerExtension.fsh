Extension: PerformerExtension
Id: PerformerExtension
Title: "Performer Extension"
Description: "The Performer Extension represents clinicians who actually and principally carry out the clinical services being documented. In a transfer of care this represents the healthcare providers involved in the current or pertinent historical care of the patient. Preferably, the patients key healthcare care team members would be listed, particularly their primary physician and any active consulting physicians, therapists, and counselors."
Context: Composition
* ^meta.versionId = "4"
* ^meta.lastUpdated = "2020-08-12T21:30:13.162+00:00"
* ^meta.source = "#csn482LCsnDWyxbW"
* ^publisher = "HL7 Structured Documents Working Group"
* ^contact.name = "Sarah Gaunt"
* ^contact.telecom[0].system = #phone
* ^contact.telecom[=].value = "+6 141-029-2506"
* ^contact.telecom[=].use = #work
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "sarah.gaunt@lantanagroup.com"
* ^contact.telecom[=].use = #work
* ^jurisdiction = urn:iso:std:iso:3166#US
* valueReference 1.. MS
* valueReference only Reference($us-core-practitioner or $us-core-practitionerrole)
  * ^sliceName = "valueReference"