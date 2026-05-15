Instance: Care-Plan-Example
InstanceOf: Composition
Usage: #example
* meta
  * versionId = "6"
  * lastUpdated = "2020-08-19T04:55:46.030+00:00"
  * source = "#jOiomrQ69OIQipUi"
  * profile = "http://hl7.org/fhir/us/ccda/StructureDefinition/Care-Plan-Document"
* language = #en-US
* extension[0]
  * url = "http://hl7.org/fhir/us/ccda/StructureDefinition/DataEntererExtension"
  * valueReference = Reference(ccda-practitionerrole-example)
* extension[+]
  * url = "http://hl7.org/fhir/us/ccda/StructureDefinition/VersionNumber"
  * valueInteger = 1
* identifier
  * system = "urn:ietf:rfc:3986"
  * value = "urn:uuid:39067866-6319-4008-9c6d-3f0176d6826c"
* status = #preliminary
* type = $loinc#18776-5 "Plan of care note"
* subject = Reference(example) "Amy V. Shaw"
* date = "2016-06-15T09:10:14Z"
* author = Reference(ccda-practitionerrole-example) "Ronald Bone, MD"
* title = "Care Plan"
* attester
  * mode = #legal
  * time = "2016-06-15T09:10:14Z"
  * party = Reference(ccda-practitionerrole-example) "Ronald Boone, MD"
* custodian = Reference(acme-lab) "Acme Lab"
* event
  * code = $sct#73761001 "Colonoscopy"
  * period
    * start = "2016-06-15"
    * end = "2016-09-18"
* section[0]
  * title = "Health Concerns Section"
  * code = $loinc#75310-3 "Health concerns Document"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Concern</b></td><td><b>Status</b></td><td><b>Date</b></td></tr><tr><td>Current every day smoker</td><td>Active</td><td>Concern from June 16, 2015</td></tr><tr><td>Respiratory insufficiency</td><td>Completed</td><td>Concern from June 13, 2015</td></tr><tr><td>Pneumonia</td><td>Completed</td><td>June 16, 2015</td></tr></table></div>"
* section[+]
  * title = "Goals Section"
  * code = $loinc#61146-7 "Goals"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Goal</b></td><td><b>Value</b></td><td><b>Date</b></td></tr><tr><td>Pulse oximetry</td><td>92%</td><td>September 2, 2015</td></tr></table></div>"
* section[+]
  * title = "Interventions Section"
  * code = $loinc#62387-6 "Interventions Narrative"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Planned Intervention</b></td><td><b>Status</b></td><td><b>Date</b></td></tr><tr><td>Elevate head of bed</td><td>active</td><td>June 18, 2016</td></tr><tr><td>Oxygen administration by nasal cannula</td><td>active</td><td>June 18, 2016</td></tr><tr><td>pulse oximetry monitoring</td><td>active</td><td>June 18, 2016</td></tr></table></div>"
* section[+]
  * title = "Health Status Evaluations and Outcomes Section"
  * code = $loinc#11383-7 "Patient problem outcome"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Item</b></td><td><b>Outcome</b></td><td><b>Date</b></td></tr><tr><td>Pulse oximetry</td><td>95%</td><td>June 20, 2016</td></tr></table></div>"