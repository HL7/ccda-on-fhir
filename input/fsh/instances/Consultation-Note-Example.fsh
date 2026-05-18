Instance: Consultation-Note-Example
InstanceOf: Composition
Usage: #example
* meta
  * versionId = "4"
  * lastUpdated = "2020-08-12T21:30:19.090+00:00"
  * source = "#csn482LCsnDWyxbW"
  * profile = "http://hl7.org/fhir/us/ccda/StructureDefinition/Consultation-Note"
* language = #en-US
* identifier
  * system = "urn:ietf:rfc:3986"
  * value = "urn:uuid:e28fefc8-5aac-427c-93d7-f0bc7d633a9a"
* status = #preliminary
* type = $loinc#11488-4 "Consult Note"
* subject = Reference(example) "Amy V. Shaw"
* encounter = Reference(encounter-1) "Encounter with patient Amy V. Shaw"
* date = "2016-02-28T09:10:14Z"
* author = Reference(ccda-practitionerrole-example) "Ronald Bone, MD"
* title = "Consultation Note Example"
* attester
  * mode = #legal
  * time = "2012-01-04T09:10:14Z"
  * party = Reference(ccda-practitionerrole-example) "Ronald Boone, MD"
* custodian = Reference(acme-lab) "Acme Labs"
* event
  * code = $v3-ActClass#PCPR "Care Provision"
  * period
    * start = "2015-11-18"
    * end = "2015-12-12"
* section[0]
  * title = "Advance Directives Section"
  * code = $loinc#42348-3 "Advance healthcare directives"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Name</b></td><td><b>Applies Period</b></td></tr><tr><td>Resuscitation</td><td>2015/01/01 - 2016/12/31</td></tr></table></div>"
* section[+]
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
  * title = "Chief Complaint and Reason for Visit Section"
  * code = $loinc#46239-0 "Chief complaint+Reason for visit Narrative"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Cramping, bloating, and constipation.</p></div>"
* section[+]
  * title = "Chief Complaint Section"
  * code = $loinc#10154-3 "Chief complaint Narrative - Reported"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Dark Stools</p></div>"
* section[+]
  * title = "Family History Section"
  * code = $loinc#10157-6 "History of family member diseases note"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Relationship</b></td><td><b>Diagnosis</b></td><td><b>Age at Onset</b></td></tr><tr><td>Father</td><td>Myocardial Infarction(cause of Death)</td><td>57</td></tr><tr><td>Father</td><td>Diabetes</td><td>40</td></tr></table></div>"
* section[+]
  * title = "Functional Status Section"
  * code = $loinc#47420-5 "Functional status assessment note"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Functional or Cognitive Finding</b></td><td><b>Observation</b></td><td><b>Observation Date</b></td><td><b>Condition Status</b></td></tr><tr><td>Ambulation (Dependent to Independent</td><td>Independently able</td><td>2010/03/11</td><td>Active</td></tr><tr><td>Finding of Functional Performance and Activity</td><td>Dyspnea</td><td>2008/02/16</td><td>Active</td></tr><tr><td>Cognitive Function Finding</td><td>Memory Impairment</td><td>2014/04/29</td><td>Active</td></tr></table></div>"
* section[+]
  * title = "General Status Section"
  * code = $loinc#10210-3 "Physical findings of General status Narrative"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Alert and in good spirits, no acute distress.</p></div>"
* section[+]
  * title = "Past Medical History Section"
  * code = $loinc#11348-0 "History of Past illness note"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>See History of Present Illness</p></div>"
* section[+]
  * title = "History of Present Illness Section"
  * code = $loinc#10164-2 "History of Present illness Narrative"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>This patient was only recently discharged for a recurrent GI bleed as\r\n                                described below. </p><p>He presented to the ER today c/o a dark stool yesterday but a normal\r\n                                brown stool today. On exam he was hypotensive in the 80?s resolved\r\n                                after .... .... .... </p><p>Lab at discharge: Glucose 112, BUN 16, creatinine 1.1, electrolytes\r\n                                normal. H. pylori antibody pending. Admission hematocrit 16%,\r\n                                discharge hematocrit 29%. WBC 7300, platelet count 256,000.\r\n                                Urinalysis normal. Urine culture: No growth. INR 1.1, PTT 40. </p><p>He was transfused with 6 units of packed red blood cells with ....\r\n                                .... .... </p><p>GI evaluation 12 September: Colonoscopy showed single red clot in\r\n                                .... ........ </p></div>"
* section[+]
  * title = "Immunizations Section"
  * code = $loinc#11369-6 "History of Immunization note"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Vaccine</b></td><td><b>Date</b></td><td><b>Status</b></td></tr><tr><td>Fluvax (Influenza)</td><td>2016-04-05</td><td>Completed</td></tr></table></div>"
  * entry = Reference(immunization)
* section[+]
  * title = "Medical Equipment Section"
  * code = $loinc#46264-8 "History of medical device use"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Supply/Device</b></td><td><b>Date Supplied</b></td></tr><tr><td>Automatic Implantable cardioverter/defbrillator</td><td>2008/11/16</td></tr><tr><td>Wheelchair</td><td>1999/12/01</td></tr></table></div>"
* section[+]
  * title = "Medication Section"
  * code = $loinc#10160-0 "History of Medication use Narrative"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Medication</b></td><td><b>Directions</b></td><td><b>Start Date</b></td><td><b>Status</b></td><td><b>Indications</b></td><td><b>Fill Instructions</b></td></tr><tr><td>Amoxicillin</td><td>Amoxicillin Powder, for Suspension 250mg/5ml</td><td>20160401</td><td>Active</td><td>Pneumonia</td><td>Generic substitution allowed</td></tr></table></div>"
  * entry = Reference(medication-statement)
* section[+]
  * title = "Mental Status Section"
  * code = $loinc#10190-7 "Mental status"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table border=\"1\" width=\"100%\"><thead><tr><td><b>Mental Status Findings</b></td><td><b>Effective Dates</b></td><td><b>Condition Status</b></td></tr></thead><tr><td>Mental Function</td><td>July 31, 2013</td><td>Impaired</td></tr><tr><td>Cognitive Abilities</td><td>July 31, 2013</td><td>Judgement, Intact</td></tr><tr><td>Cognitive Function</td><td>July 31, 2013</td><td>Aggressive Behavior</td></tr><tr><td>Cognitive Function</td><td>July 31, 2013</td><td>Difficulty understanding own emotions</td></tr><tr><td>Cognitive Function</td><td>July 31, 2013</td><td>Difficulty communicating Thoughts </td></tr></table></div>"
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
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Problem Name</b></td><td><b>Type</b></td><td><b>Onset Date</b></td><td><b>Abatement Date</b></td><td><b>Status</b></td></tr><tr><td>Liveborn born in hospital</td><td>Condition</td><td/><td/><td>Complete</td></tr></table></div>"
  * entry = Reference(condition-problem)
* section[+]
  * title = "Procedures Section"
  * code = $loinc#47519-4 "History of Procedures Document"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Procedure Name</b></td><td><b>Body Site</b></td><td><b>Performer</b></td><td><b>Date Performed</b></td><td><b>Reason</b></td></tr><tr><td>Appendectomy (Procedure)</td><td>Abdomen</td><td>Dr. Adam Everyman</td><td>20160405</td><td>Generalized abdominal pain 24 hours. Localized in RIF with\r\n                                        rebound and guarding</td></tr></table></div>"
  * entry = Reference(procedure-rehab)
* section[+]
  * title = "Reason for Visit Section"
  * code = $loinc#29299-5 "Reason for visit"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Tenderness of lower abdomen</p></div>"
* section[+]
  * title = "Results Section"
  * code = $loinc#30954-2 "Relevant diagnostic tests/laboratory data note"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Result Type</b></td><td><b>Quantity Value</b></td><td><b>Date</b></td><td><b>Status</b></td></tr><tr><td>Glucose [Moles/volume] in Blood</td><td>6.3 mmol/l</td><td>2016/04/01</td><td>Final</td></tr></table></div>"
  * entry = Reference(observation-lab-urine)
* section[+]
  * title = "Review of Systems Section"
  * code = $loinc#10187-3 "Review of systems"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Patient denies recent history of fever or malaise. Positive for\r\n                                weakness and shortness of breath. Several episodes of abdominal\r\n                                tenderness. No recent headaches. Positive for osteoarthritis in\r\n                                hips, knees and hands. </p></div>"
* section[+]
  * title = "Social History Section"
  * code = $loinc#29762-2 "Social history note"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Social History Element</b></td><td><b>Description</b></td><td><b>Effective Dates</b></td></tr><tr><td>Smoking</td><td>1 pack tobacco per day</td><td>2005/05/01 - 2010/02/28</td></tr></table></div>"
  * entry = Reference(observation-smoker)
* section[+]
  * title = "Vital Signs Section"
  * code = $loinc#8716-3 "Vital signs note"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Vital Sign</b></td><td><b>Date</b></td><td><b>Value</b></td></tr><tr><td>Temperature</td><td>2016/04/05</td><td>39 Degrees Celcius</td></tr></table></div>"
  * entry = Reference(Observation/observation-vitals-temp)