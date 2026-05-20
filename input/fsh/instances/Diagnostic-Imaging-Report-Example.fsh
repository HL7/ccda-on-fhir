Instance: Diagnostic-Imaging-Report-Example
InstanceOf: Composition
Usage: #example
* meta
  * versionId = "4"
  * lastUpdated = "2020-08-12T21:30:12.638+00:00"
  * source = "#csn482LCsnDWyxbW"
  * profile = "http://hl7.org/fhir/us/ccda/StructureDefinition/Diagnostic-Imaging-Report"
* language = #en-US
* identifier
  * system = "urn:ietf:rfc:3986"
  * value = "urn:uuid:895f6f22-f7d6-4feb-90d4-dbfd49b5471e"
* status = #preliminary
* type = $loinc#18748-4 "Diagnostic imaging study"
* subject = Reference(Document-Patient) "Amy V. Shaw"
* date = "2016-05-16T09:10:14Z"
* author = Reference(Document-PractitionerRole) "Ronald Bone, MD"
* title = "Diagnostic Imaging Report Example"
* attester
  * mode = #legal
  * time = "2016-06-15T09:10:14Z"
  * party = Reference(Document-PractitionerRole) "Ronald Boone, MD"
* custodian = Reference(Document-Organization-Lab) "Acme Labs"
* event
  * code = $sct#399208008 "Plain X-ray of chest"
  * period
    * start = "2016-06-15"
    * end = "2016-06-15"
* section[0]
  * title = "Findings Section"
  * code = $DCM#121070 "Findings"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>The cardiomediastinum is within normal limits. The trachea is\r\n                                midline. The previously described opacity at the medial right lung\r\n                                base has cleared. There are no new infiltrates. There is a new round\r\n                                density at the left hilus, superiorly (diameter about 45mm). A CT\r\n                                scan is recommended for further evaluation. The pleural spaces are\r\n                                clear. The visualized musculoskeletal structures and the upper\r\n                                abdomen are stable and unremarkable.</p></div>"
* section[+]
  * title = "DICOM Object Catalog Section"
  * code = $DCM#121181 "DICOM Object Catalog"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Computed Radiography Image Storage</p></div>"