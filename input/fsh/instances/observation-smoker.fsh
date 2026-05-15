Instance: observation-smoker
InstanceOf: Observation
Usage: #example
* meta
  * versionId = "6"
  * lastUpdated = "2020-08-12T21:30:13.468+00:00"
  * source = "#csn482LCsnDWyxbW"
  * profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-smokingstatus"
* status = #final
* category = $observation-category#social-history "Social History"
  * text = "Social History"
* code = $loinc#72166-2 "Tobacco smoking status"
  * text = "Tobacco smoking status"
* subject = Reference(example) "Amy Shaw"
* effectiveDateTime = "2016-03-18T05:27:04Z"
* valueCodeableConcept = $sct#428041000124106
  * text = "Current some day smoker"