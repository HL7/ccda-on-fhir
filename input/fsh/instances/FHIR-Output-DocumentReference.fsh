Instance: FHIR-Output-DocumentReference
InstanceOf: DocumentReference
Usage: #example
Description: "FHIR resource produced by the CDA-to-FHIR mapping example for a Note Activity (Myra Jones v8 consultation note). attachment.data carries the note narrative resolved from the CDA text reference (excerpt); contentType text/plain per the map's narrative-conversion rule."
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-documentreference"
* status = #current
* type = $loinc#11488-4 "Consult note"
* category = http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category#clinical-note "Clinical Note"
* subject = Reference(FHIR-Output-Patient)
* date = "2016-09-08T08:32:15-05:00"
* author.display = "Dr. Specialist"
* content.attachment
  * contentType = #text/plain
  * data = "RHIuIFNwZWNpYWxpc3QgLSBTZXB0ZW1iZXIgOCwgMjAxNiBEZWFyIERyLiBIZW5yeSBMZXZlbjogVGhhbmsgeW91IGZvciByZWZlcnJpbmcgTXMuIEpvbmVzIGZvciBldmFsdWF0aW9uLiBBcHByb3hpbWF0ZWx5IDE4IHllYXJzIGFnbywgc2hlIHdhcyBob3NwaXRhbGl6ZWQgd2l0aCBhIGJsZWVkaW5nIHVsY2VyLiBTaGUgaGFkIGEgQ1Qgc2NhbiBvZiB0aGUgYWJkb21lbiwgd2hpY2ggcmV2ZWFsZWQgZmluZGluZ3MgY29uc2lzdGVudCB3aXRoIGZvY2FsIG5vZHVsYXIgaHlwZXJwbGFzaWEgKEZOSCkuIFNoZSBoYXMgaGFkIGVwaWdhc3RyaWMgYWJkb21pbmFsIHBhaW4gYXMgd2VsbCBhcyBhIHNpZ25pZmljYW50IGNoYW5nZSBpbiBoZXIgYm93ZWwgbW92ZW1lbnRzIGZyb20gYmFzZWxpbmUgY29uc3RpcA=="
* context.period.start = "2016-09-08"
