Instance: colonoscopy
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
* subject = Reference(example)
* requester = Reference(ccda-practitionerrole-example) "Dr. Brenda Jennings Richard"
* performer = Reference(ccda-practitionerrole-example) "Dr. Brenda Jennings Richard"