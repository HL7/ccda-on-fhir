Instance: Document-Observation-Lab
InstanceOf: Observation
Usage: #example
* meta
  * versionId = "6"
  * lastUpdated = "2020-08-12T21:30:20.811+00:00"
  * source = "#csn482LCsnDWyxbW"
  * profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-lab"
* status = #final
* category = $observation-category#laboratory "Laboratory"
  * text = "Laboratory"
* code = $loinc#5811-5 "Specific gravity of Urine by Test strip"
  * text = "SPEC GRAV"
* subject = Reference(Document-Patient) "Amy Shaw"
* effectiveDateTime = "2005-07-05"
* valueQuantity
  * value = 1.017
  * unit = "urine specific gravity"
* referenceRange
  * low
    * value = 1.003
    * unit = "urine specific gravity"
  * high
    * value = 1.035
    * unit = "urine specific gravity"
