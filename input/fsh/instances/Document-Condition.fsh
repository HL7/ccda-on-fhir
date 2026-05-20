Instance: Document-Condition
InstanceOf: Condition
Usage: #example
* meta
  * versionId = "5"
  * lastUpdated = "2020-08-12T21:30:13.114+00:00"
  * source = "#csn482LCsnDWyxbW"
  * profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-condition"
* clinicalStatus = $condition-clinical#active "Active"
  * text = "Active"
* category = $condition-category#problem-list-item "Problem List Item"
  * text = "Problem List Item"
* code = $sct#442311008 "Liveborn born in hospital"
  * text = "Single liveborn, born in hospital, delivered without mention of cesarean section"
* subject = Reference(Document-Patient) "Amy V. Shaw"
