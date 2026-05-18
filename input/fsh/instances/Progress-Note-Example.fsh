Instance: Progress-Note-Example
InstanceOf: Composition
Usage: #example
* meta
  * versionId = "4"
  * lastUpdated = "2020-08-12T21:30:13.524+00:00"
  * source = "#csn482LCsnDWyxbW"
  * profile = "http://hl7.org/fhir/us/ccda/StructureDefinition/Progress-Note"
* language = #en-US
* identifier
  * system = "urn:ietf:rfc:3986"
  * value = "urn:uuid:e51b38c1-0a51-4fab-b16e-dc3c3563d052"
* status = #preliminary
* type = $loinc#11506-3 "Progress note"
* subject = Reference(example) "Amy V. Shaw"
* date = "2016-06-15T09:10:14Z"
* author = Reference(ccda-practitionerrole-example) "Ronald Bone, MD"
* title = "Progress Note Example"
* attester
  * mode = #legal
  * time = "2012-01-04T09:10:14Z"
  * party = Reference(practitioner-1) "Ronald Boone, MD"
* custodian = Reference(organization-1) "Community Health and Hospitals"
* section[0]
  * title = "Allergies and Intolerances Section"
  * code = $loinc#48765-2 "Allergies and adverse reactions Document"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Substance</b></td><td><b>Overall Severity</b></td><td><b>Reaction</b></td><td><b>Reaction Severity</b></td><td><b>Status</b></td></tr><tr><td>Cashew Nut</td><td>Severe</td><td>Anaphylactic reaction</td><td>Mild</td><td>Active</td></tr></table></div>"
  * entry = Reference(allergy-intolerance)
* section[+]
  * title = "Assessment Section"
  * code = $loinc#51848-0 "Evaluation note"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Obesity.</p><p>Uncontrolled brittle Type II diabetic.</p><p>Shortness of breath, mild wheezing.</p><p>Pressure ulder on left knee.</p></div>"
* section[+]
  * title = "Assessment and Plan Section"
  * code = $loinc#51847-2 "Evaluation + Plan note"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Recurrent GI bleed of unknown etiology; hypotension perhaps secondary\r\n                                to this but as likely secondary to polypharmacy</p><p>Acute on chronic anemia secondary to #1.</p><p>Azotemia, acute renal failure with volume loss secondary tom#1.</p><p>Hyperkalemia secondary to #3 and on ACE and K+ supplement.</p><p>Other chronic diagnoses as noted above, currently stable.</p></div>"
* section[+]
  * title = "Chief Complaint Section"
  * code = $loinc#10154-3 "Chief complaint Narrative - Reported"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Dark Stools</p></div>"
* section[+]
  * title = "Instructions Section"
  * code = $loinc#69730-0 "Instructions"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Patient may have low grade fever, mild joint pain and injection area\r\n                                tenderness.</p></div>"
* section[+]
  * title = "Interventions Section"
  * code = $loinc#62387-6 "Interventions Narrative"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Planned Intervention</b></td><td><b>Status</b></td><td><b>Date</b></td></tr><tr><td>Elevate head of bed</td><td>active</td><td>September 2, 2016</td></tr><tr><td>Oxygen administration by nasal cannula</td><td>active</td><td>September 1, 2016</td></tr><tr><td>pulse oximetry monitoring</td><td>active</td><td>September 3, 2016</td></tr></table></div>"
* section[+]
  * title = "Nutrition Section"
  * code = $loinc#61144-2 "Diet and nutrition Narrative"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Date</b></td><td><b>Nutritional Status</b></td><td><b>Diet</b></td></tr><tr><td>2005/12/29</td><td>Well nourished</td><td>Low sodium diet, excessive carbohydrate</td></tr><tr><td>2010/05/26</td><td>Slight dehydration</td><td>High protein, low fibre</td></tr></table></div>"
* section[+]
  * title = "Physical Exam Section"
  * code = $loinc#29545-1 "Physical findings note"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>HEENT: All normal to examination.</p><p>&gt;HEART: RRR, no murmur.</p><p>THORAX &amp; LUNGS: Clear without rhonchi or wheeze.</p><p>ABDOMEN: Marked distension and tenderness, slightly obese, pos\r\n                                bowelsounds.</p><p>BACK: Normal to inspection and palpation, without tenderness; no\r\n                                presacral edema.</p><p>EXTREMITIES: Doughy edema bilaterally, chronic stasis changes, no\r\n                                asymmetrical swelling.</p></div>"
* section[+]
  * title = "Objective Section"
  * code = $loinc#61149-1 "Objective"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Chest: clear to ausc. No rales, normal breath sounds</p><p>Heart: RR, PMI in normal location and no heave or evidence\r\n                                ofcardiomegaly,normal heart sounds, no murm or gallop</p></div>"
* section[+]
  * title = "Subjective Section"
  * code = $loinc#61150-9 "Subjective"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Complaints of rectal bleeding, fatigue and a change in bowel\r\n                                patterns.</p><p>Has several days of constipation alternating with diarrhea.</p></div>"
* section[+]
  * title = "Review of Systems Section"
  * code = $loinc#10187-3 "Review of systems"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Patient denies recent history of fever or malaise. Positive for\r\n                                weakness and shortness of breath. Several episodes of abdominal\r\n                                tenderness. No recent headaches. Positive for osteoarthritis in\r\n                                hips, knees and hands. </p></div>"
* section[+]
  * title = "Medication Section"
  * code = $loinc#10160-0 "History of Medication use Narrative"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Medication</b></td><td><b>Directions</b></td><td><b>Start Date</b></td><td><b>Status</b></td><td><b>Indications</b></td><td><b>Fill Instructions</b></td></tr><tr><td>Amoxicillin</td><td>Amoxicillin Powder, for Suspension 250mg/5ml</td><td>20160401</td><td>Active</td><td>Pneumonia</td><td>Generic substitution allowed</td></tr></table></div>"
  * entry = Reference(medication-statement)
* section[+]
  * title = "Plan of Treatment Section"
  * code = $loinc#18776-5 "Plan of care note"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Planned Activity</b></td><td><b>Period</b></td><td><b>Status</b></td></tr><tr><td>Colonoscopy</td><td>2010/08/16 - 2010/08/16</td><td>Completed</td></tr><tr><td>Recommendation to Exercise</td><td>2015/10/29</td><td>Ongoing</td></tr></table></div>"
* section[+]
  * title = "Problem Section"
  * code = $loinc#11450-4 "Problem list - Reported"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Problem Name</b></td><td><b>Type</b></td><td><b>Onset Date</b></td><td><b>Abatement Date</b></td><td><b>Status</b></td></tr><tr><td>Fever</td><td>Condition</td><td>2016-04-01</td><td>2016-04-14</td><td>Complete</td></tr></table></div>"
  * entry = Reference(condition-problem)
* section[+]
  * title = "Results Section"
  * code = $loinc#30954-2 "Relevant diagnostic tests/laboratory data note"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Result Type</b></td><td><b>Quantity Value</b></td><td><b>Date</b></td><td><b>Status</b></td></tr><tr><td>Glucose [Moles/volume] in Blood</td><td>6.3 mmol/l</td><td>2016/06/15</td><td>Final</td></tr></table></div>"
  * entry = Reference(observation-lab-urine)
* section[+]
  * title = "Vital Signs Section"
  * code = $loinc#8716-3 "Vital signs note"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Vital Sign</b></td><td><b>Date</b></td><td><b>Value</b></td></tr><tr><td>Temperature</td><td>2016/06/15</td><td>39 Degrees Celcius</td></tr></table></div>"
  * entry = Reference(Observation/observation-vitals-temp)