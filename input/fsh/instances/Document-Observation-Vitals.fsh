Instance: Document-Observation-Vitals
InstanceOf: $vitalsigns
Usage: #example
* meta
  * versionId = "6"
  * lastUpdated = "2020-08-12T21:30:21.122+00:00"
  * source = "#csn482LCsnDWyxbW"
* status = #final
* category = $observation-category#vital-signs "Vital Signs"
  * text = "Vital Signs"
* code = $loinc#8310-5 "Body temperature"
  * text = "temperature"
* subject
  * reference = "Patient/Document-Patient"
  * display = "Amy Shaw"
* effectiveDateTime = "1999-07-02"
* valueQuantity = 36.55556 'Cel' "Cel"
