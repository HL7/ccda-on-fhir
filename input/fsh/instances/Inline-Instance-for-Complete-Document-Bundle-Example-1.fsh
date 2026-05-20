Instance: Inline-Instance-for-Complete-Document-Bundle-Example-1
InstanceOf: Composition
Usage: #inline
* id = "Care-Plan-Example"
* language = #en-US
* extension[0]
  * url = "http://hl7.org/fhir/us/ccda/StructureDefinition/DataEntererExtension"
  * valueReference = Reference(urn:uuid:23d3a2c1-44ae-491b-94d3-764d2a9d8f8c)
  * valueReference.type = "PractitionerRole"
* extension[+]
  * url = "http://hl7.org/fhir/us/ccda/StructureDefinition/VersionNumber"
  * valueInteger = 1
* identifier
  * system = "urn:ietf:rfc:3986"
  * value = "urn:uuid:39067866-6319-4008-9c6d-3f0176d6826c"
* status = #preliminary
* type = $loinc#18776-5 "Plan of care note"
* subject = Reference(urn:uuid:d0dbd5a1-0bd7-4205-b936-09482c02c6d9) "Amy V. Shaw"
* date = "2016-06-15T09:10:14Z"
* author = Reference(urn:uuid:23d3a2c1-44ae-491b-94d3-764d2a9d8f8c) "Brenda Jennings Richard MD"
* title = "Care Plan Example"
* attester
  * mode = #legal
  * time = "2016-06-15T09:10:14Z"
  * party = Reference(urn:uuid:23d3a2c1-44ae-491b-94d3-764d2a9d8f8c) "Ronald Boone, MD"
  * party.type = "PractitionerRole"
* custodian = Reference(urn:uuid:58d390ba-6348-4b0d-b85f-7fbd94223718) "Acme Lab"
* event
  * code = $sct#73761001 "Colonoscopy"
  * period
    * start = "2016-06-15"
    * end = "2016-09-18"
* section[0]
  * title = "Health Concerns Section"
  * code = $loinc#75310-3 "Health concerns Document"
  * text
    * status = #additional
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Concern</b></td><td><b>Status</b></td><td><b>Date</b></td></tr><tr><td>Current every day smoker</td><td>Active</td><td>Concern from June 16, 2015</td></tr><tr><td>Respiratory insufficiency</td><td>Completed</td><td>Concern from June 13, 2015</td></tr><tr><td>Pneumonia</td><td>Completed</td><td>June 16, 2015</td></tr></table></div>"
* section[+]
  * title = "Goals Section"
  * code = $loinc#61146-7 "Goals"
  * text
    * status = #additional
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Goal</b></td><td><b>Value</b></td><td><b>Date</b></td></tr><tr><td>Pulse oximetry</td><td>92%</td><td>September 2, 2015</td></tr></table></div>"
* section[+]
  * title = "Interventions Section"
  * code = $loinc#62387-6 "Interventions Narrative"
  * text
    * status = #additional
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Planned Intervention</b></td><td><b>Status</b></td><td><b>Date</b></td></tr><tr><td>Elevate head of bed</td><td>active</td><td>June 18, 2016</td></tr><tr><td>Oxygen administration by nasal cannula</td><td>active</td><td>June 18, 2016</td></tr><tr><td>pulse oximetry monitoring</td><td>active</td><td>June 18, 2016</td></tr></table></div>"
* section[+]
  * title = "Health Status Evaluations and Outcomes Section"
  * code = $loinc#11383-7 "Patient problem outcome"
  * text
    * status = #additional
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Item</b></td><td><b>Outcome</b></td><td><b>Date</b></td></tr><tr><td>Pulse oximetry</td><td>95%</td><td>June 20, 2016</td></tr></table></div>"