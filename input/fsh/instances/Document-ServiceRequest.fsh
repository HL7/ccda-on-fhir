Instance: Document-ServiceRequest
InstanceOf: ServiceRequest
Usage: #example
* meta
  * versionId = "2"
  * lastUpdated = "2020-08-12T19:18:12.918+00:00"
  * source = "#hVY6YnnbJ9SDswTw"
* status = #completed
* intent = #order
* code = $sct#73761001 "Colonoscopy (procedure)"
  * text = "Colonoscopy"
* subject = Reference(Document-Patient)
* requester = Reference(Document-PractitionerRole) "Dr. Brenda Jennings Richard"
* performer = Reference(Document-PractitionerRole) "Dr. Brenda Jennings Richard"
