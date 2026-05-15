Instance: example-1
InstanceOf: Encounter
Usage: #example
* meta
  * versionId = "19"
  * lastUpdated = "2020-08-19T05:30:01.023+00:00"
  * source = "#GNI3ZHMkjDg95t5Z"
  * profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-encounter"
* status = #finished
* class = $v3-ActCode#AMB "ambulatory"
* type = $sct#185349003
  * text = "Encounter for check up"
* subject = Reference(example)
* period
  * start = "2015-11-01T17:00:14-05:00"
  * end = "2015-11-01T18:00:14-05:00"