Instance: Continuity-of-Care-Document-Example
InstanceOf: Composition
Usage: #example
* meta
  * versionId = "3"
  * lastUpdated = "2020-08-12T21:30:17.571+00:00"
  * source = "#csn482LCsnDWyxbW"
  * profile = "http://hl7.org/fhir/us/ccda/StructureDefinition/Continuity-of-Care-Document"
* language = #en-US
* identifier
  * system = "urn:ietf:rfc:3986"
  * value = "urn:uuid:7e63fe21-7285-46c6-b72f-e58a61341195"
* status = #preliminary
* type = $loinc#34133-9 "Summary of episode note"
* subject = Reference(example) "Amy V. Shaw"
* date = "2016-02-28T09:10:14Z"
* author = Reference(ccda-practitionerrole-example) "Ronald Bone, MD"
* title = "Continuity of Care Document Example"
* attester
  * mode = #legal
  * time = "2016-06-15T09:10:14Z"
  * party = Reference(ccda-practitionerrole-example) "Ronald Boone, MD"
* custodian = Reference(organization-2) "Acme Clinic"
* event
  * code = $v3-ActClass#PCPR "Care Provision"
  * period
    * start = "2016-06-15"
    * end = "2016-08-20"
* section[0]
  * title = "Allergies and Intolerances Section"
  * code = $loinc#48765-2 "Allergies and adverse reactions Document"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Substance</b></td><td><b>Overall Severity</b></td><td><b>Reaction</b></td><td><b>Reaction Severity</b></td><td><b>Status</b></td></tr><tr><td>Cashew Nut</td><td>Severe</td><td>Anaphylactic reaction</td><td>Mild</td><td>Active</td></tr></table></div>"
  * entry = Reference(allergy-intolerance)
* section[+]
  * title = "Medication Section"
  * code = $loinc#10160-0 "History of Medication use Narrative"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Medication</b></td><td><b>Directions</b></td><td><b>Start Date</b></td><td><b>Status</b></td><td><b>Indications</b></td><td><b>Fill Instructions</b></td></tr><tr><td>Amoxicillin</td><td>Amoxicillin Powder, for Suspension 250mg/5ml</td><td>2016/02/28</td><td>Active</td><td>Pneumonia</td><td>Generic substitution allowed</td></tr></table></div>"
  * entry = Reference(medication-statement)
* section[+]
  * title = "Problem Section"
  * code = $loinc#11450-4 "Problem list - Reported"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Problem Name</b></td><td><b>Type</b></td><td><b>Onset Date</b></td><td><b>Abatement Date</b></td><td><b>Status</b></td></tr><tr><td>Fever</td><td>Condition</td><td>2016/02/28</td><td>2016/03/01</td><td>Complete</td></tr></table></div>"
  * entry = Reference(condition-problem)
* section[+]
  * title = "Procedures Section"
  * code = $loinc#47519-4 "History of Procedures Document"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Procedure Name</b></td><td><b>Body Site</b></td><td><b>Performer</b></td><td><b>Date Performed</b></td><td><b>Reason</b></td></tr><tr><td>Appendectomy (Procedure)</td><td>Abdomen</td><td>Dr. Adam Everyman</td><td>2016/06/15</td><td>Generalized abdominal pain 24 hours. Localized in RIF with\r\n                                        rebound and guarding</td></tr></table></div>"
  * entry = Reference(procedure-rehab)
* section[+]
  * title = "Results Section"
  * code = $loinc#30954-2 "Relevant diagnostic tests/laboratory data note"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Result Type</b></td><td><b>Quantity Value</b></td><td><b>Date</b></td><td><b>Status</b></td></tr><tr><td>Glucose [Moles/volume] in Blood</td><td>6.3 mmol/l</td><td>2016/06/15</td><td>Final</td></tr></table></div>"
  * entry = Reference(observation-lab-urine)
* section[+]
  * title = "Advance Directives Section"
  * code = $loinc#42348-3 "Advance healthcare directives"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Name</b></td><td><b>Applies Period</b></td></tr><tr><td>Resuscitation</td><td>2010/01/01 - 2025/01/01</td></tr></table></div>"
* section[+]
  * title = "Encounters Section"
  * code = $loinc#46240-8 "History of Hospitalizations+Outpatient visits Narrative"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Encounter</b></td><td><b>Performer</b></td><td><b>Location</b></td><td><b>Date</b></td></tr><tr><td>Checkup Examination</td><td>Dr. S. Steene</td><td>Community Urgent Care Center</td><td>2016/04/18</td></tr></table></div>"
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
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Functional or Cognitive Finding</b></td><td><b>Observation</b></td><td><b>Observation Date</b></td><td><b>Condition Status</b></td></tr><tr><td>Ambulation (Dependent to Independent</td><td>Independently able</td><td>2016/06/15</td><td>Active</td></tr><tr><td>Finding of Functional Performance and Activity</td><td>Dyspnea</td><td>2016/06/15</td><td>Active</td></tr><tr><td>Cognitive Function Finding</td><td>Memory Impairment</td><td>2010/04/17</td><td>Active</td></tr></table></div>"
* section[+]
  * title = "Immunizations Section"
  * code = $loinc#11369-6 "History of Immunization note"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Vaccine</b></td><td><b>Date</b></td><td><b>Status</b></td></tr><tr><td>Fluvax (Influenza)</td><td>2014/05/29</td><td>Completed</td></tr></table></div>"
  * entry = Reference(immunization)
* section[+]
  * title = "Nutrition Section"
  * code = $loinc#61144-2 "Diet and nutrition Narrative"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Date</b></td><td><b>Nutritional Status</b></td><td><b>Diet</b></td></tr><tr><td>2016/06/15</td><td>Well nourished</td><td>Low sodium diet, excessive carbohydrate</td></tr><tr><td>2016/06/15</td><td>Slight dehydration</td><td>High protein, low fibre</td></tr></table></div>"
* section[+]
  * title = "Mental Status Section"
  * code = $loinc#10190-7 "Mental status"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Date</b></td><td><b>Mental Status</b></td><td><b>Support System</b></td></tr><tr><td>2016/06/15</td><td>Good</td><td>Not required</td></tr><tr><td>2012/04/29</td><td>Dimentia</td><td>Daily Home Care</td></tr></table></div>"
* section[+]
  * title = "Social History Section"
  * code = $loinc#29762-2 "Social history note"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Social History Element</b></td><td><b>Description</b></td><td><b>Effective Dates</b></td></tr><tr><td>Smoking</td><td>1 pack tobacco per day</td><td>2010/01/01 - 2016/06/15</td></tr></table></div>"
  * entry = Reference(observation-smoker)
* section[+]
  * title = "Plan of Treatment Section"
  * code = $loinc#18776-5 "Plan of care note"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Planned Activity</b></td><td><b>Period</b></td><td><b>Status</b></td></tr><tr><td>Colonoscopy</td><td>2016/06/15 - 2015/06/15</td><td>Completed</td></tr><tr><td>Recommendation to Exercise</td><td>2016/06/15</td><td>Ongoing</td></tr></table></div>"
* section[+]
  * title = "Payers Section"
  * code = $loinc#48768-6 "Payment sources Document"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Payer Name</b></td><td><b>Policy ID</b></td><td><b>Policy Holder</b></td></tr><tr><td>United Healthcare</td><td>12341</td><td>Self</td></tr><tr><td>Cigna</td><td>53123</td><td>Spouse</td></tr></table></div>"
* section[+]
  * title = "Medical Equipment Section"
  * code = $loinc#46264-8 "History of medical device use"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Supply/Device</b></td><td><b>Date Supplied</b></td></tr><tr><td>Automatic Implantable cardioverter/defbrillator</td><td>2015/05/29</td></tr><tr><td>Wheelchair</td><td>2016/06/15</td></tr></table></div>"
* section[+]
  * title = "Vital Signs Section"
  * code = $loinc#8716-3 "Vital signs note"
  * text
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Vital Sign</b></td><td><b>Date</b></td><td><b>Value</b></td></tr><tr><td>Temperature</td><td>2016/06/15</td><td>39 Degrees Celcius</td></tr></table></div>"
  * entry = Reference(Observation/observation-vitals-temp)