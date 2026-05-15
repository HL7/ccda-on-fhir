Instance: Operative-Note-Example
InstanceOf: Composition
Usage: #example
* meta
  * versionId = "4"
  * lastUpdated = "2020-08-12T21:30:19.501+00:00"
  * source = "#csn482LCsnDWyxbW"
  * profile = "http://hl7.org/fhir/us/ccda/StructureDefinition/Operative-Note"
* language = #en-US
* identifier
  * system = "urn:ietf:rfc:3986"
  * value = "urn:uuid:75a12dcd-f85d-4c7f-b1de-38a1a2b7498f"
* status = #preliminary
* type = $loinc#11504-8 "Surgical operation note"
* subject = Reference(example) "Amy V. Shaw"
* date = "2016-06-15T09:10:14Z"
* author = Reference(ccda-practitionerrole-example) "Ronald Bone, MD"
* title = "Operative Note"
* attester
  * mode = #legal
  * time = "2016-06-15T09:10:14Z"
  * party = Reference(ccda-practitionerrole-example) "Ronald Boone, MD"
* custodian = Reference(organization-1) "Community Health and Hospitals"
* event
  * code = $sct#73761001 "Colonoscopy"
  * period
    * start = "2016-06-15"
    * end = "2016-06-15"
* section[0]
  * title = "Anesthesia Section"
  * code = $loinc#59774-0 "Anesthesia"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Conscious sedation with propofol 200 mg IV</p></div>"
* section[+]
  * title = "Complications Section"
  * code = $loinc#55109-3 "Complications Document"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Asthmatic symptoms while under general anesthesia.</p></div>"
  * entry = Reference(condition-problem)
* section[+]
  * title = "Preoperative Diagnosis Section"
  * code = $loinc#10219-4 "Surgical operation note preoperative diagnosis Narrative"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Appendicitis</p></div>"
* section[+]
  * title = "Operative Note Surgical Procedure Section"
  * code = $loinc#10223-6 "Surgical operation note surgical procedure Narrative"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Laparoscopic Appendectomy</p></div>"
* section[+]
  * title = "Planned Procedure Section"
  * code = $loinc#59772-4 "Planned procedure"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Colonoscopy</p></div>"
* section[+]
  * title = "Procedure Indications Section"
  * code = $loinc#59768-2 "Procedure indications [Interpretation] Narrative"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>The procedure is performed for screening in a low risk\r\n                                individual.</p></div>"
* section[+]
  * title = "Procedure Description Section"
  * code = $loinc#29554-3 "Procedure Narrative"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>The patient was brought to the operating room, placed in the supine\r\n                                position, and general anesthesia was induced. A detailed technical\r\n                                narrative of a laparoscopic appendectomy from initial incision to\r\n                                placement of any dressings follows. </p></div>"
* section[+]
  * title = "Procedure Estimated Blood Loss Section"
  * code = $loinc#59770-8 "Procedure estimated blood loss Narrative"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Minimal</p></div>"
* section[+]
  * title = "Procedure Findings Section"
  * code = $loinc#59776-5 "Procedure findings Narrative"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>A 6 mm sessile polyp was found in the ascending colon and removed by\r\n                                snare, no cautery. Bleeding was controlled. Moderate diverticulosis\r\n                                and hemorrhoids were incidentally noted.</p></div>"
  * entry = Reference(condition-problem)
* section[+]
  * title = "Procedure Specimens Taken Section"
  * code = $loinc#59773-2 "Procedure specimens taken Narrative"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Ascending colon polyp</p></div>"
* section[+]
  * title = "Operative Note Fluids Section"
  * code = $loinc#10216-0 "Operative Note Fluids"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>250 ML Ringers Lactate</p></div>"
* section[+]
  * title = "Surgical Drains Section"
  * code = $loinc#11537-8 "Surgical Drains"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Penrose drain placed</p></div>"
* section[+]
  * title = "Procedure Implants Section"
  * code = $loinc#59771-6 "Procedure implants Narrative"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>No implants were placed.</p></div>"
* section[+]
  * title = "Procedure Disposition Section"
  * code = $loinc#59775-7 "Procedure disposition Narrative"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>The patient was taken to the Endoscopy Recovery Unit in stable\r\n                                condition.</p></div>"
* section[+]
  * title = "Postoperative Diagnosis Section"
  * code = $loinc#10218-6 "Surgical operation note postoperative diagnosis Narrative"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Appendicitis with periappendiceal abscess</p></div>"
* section[+]
  * title = "Plan of Treatment Section"
  * code = $loinc#18776-5 "Plan of care note"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Planned Activity</b></td><td><b>Period</b></td><td><b>Status</b></td></tr><tr><td>Colonoscopy</td><td>2016/09/17 - 2010/09/17</td><td>Planned</td></tr><tr><td>Recommendation to Exercise</td><td>2016/06/25</td><td>Ongoing</td></tr></table></div>"