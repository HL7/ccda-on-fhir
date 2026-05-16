Profile: HistoryAndPhysical
Parent: USRealmHeader
Id: History-and-Physical
Title: "History and Physical"
Description: """A History and Physical (H&P) note is a medical report that documents the current and past conditions of the patient. It contains essential information that helps determine an individual's health status.  

The first portion of the report is a current collection of organized information unique to an individual. This is typically supplied by the patient or the caregiver, concerning the current medical problem or the reason for the patient encounter. This information is followed by a description of any past or ongoing medical issues, including current medications and allergies. Information is also obtained about the patient's lifestyle, habits, and diseases among family members.
The next portion of the report contains information obtained by physically examining the patient and gathering diagnostic information in the form of laboratory tests, imaging, or other diagnostic procedures.
 
The report ends with the clinician's assessment of the patient's situation and the intended plan to address those issues.
 
A History and Physical Examination is required upon hospital admission as well as before operative procedures. An initial evaluation in an ambulatory setting is often documented in the form of an H&P note."""
* ^meta.versionId = "9"
* ^meta.lastUpdated = "2020-08-19T06:52:52.893+00:00"
* ^meta.source = "#NprCJyaq05GzNeOJ"
* ^publisher = "Lantana Consulting Group"
* ^contact.name = "Sarah Gaunt"
* ^contact.telecom[0].system = #phone
* ^contact.telecom[=].value = "+6 141-029-2506"
* ^contact.telecom[=].use = #work
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "sarah.gaunt@lantanagroup.com"
* ^contact.telecom[=].use = #work
* ^jurisdiction = urn:iso:std:iso:3166#US
* ^abstract = false
* type from $2.16.840.1.113883.1.11.20.22 (required)
  * ^label = "History and Physical"
  * ^short = "History and Physical"
* section ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "code"
  * ^slicing.rules = #open
* section contains
    allergies_and_intolerances_section 1..1 and
    family_history_section 1..1 MS and
    general_status_section 1..1 MS and
    medications_section 1..1 MS and
    past_medical_history_section 0..1 MS and
    physical_exam_section 1..1 and
    results_section 1..1 MS and
    review_of_systems_section 1..1 MS and
    social_history_section 1..1 MS and
    vital_signs_section 1..1 MS and
    history_of_present_illness_section 0..1 MS and
    assessment_and_plan_section 0..1 MS and
    assessment_section 0..1 MS and
    chief_complaint_and_reason_for_visit_section 0..1 MS and
    chief_complaint_section 0..1 MS and
    immunizations_section 0..1 MS and
    plan_of_treatment_section 0..1 MS and
    problem_section 0..1 MS and
    procedures_section 0..1 MS and
    reason_for_visit_section 0..1 MS and
    instructions_section 0..1 MS
* section[allergies_and_intolerances_section] ^label = "Allergies and Intolerances Section"
  * ^short = "Allergies and Intolerances Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#48765-2
    * ^label = "Allergies, adverse reactions, alerts"
    * ^short = "Allergies, adverse reactions, alerts"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains allergies_and_intolerances_entry 0..*
  * entry[allergies_and_intolerances_entry] only Reference($us-core-allergyintolerance)
    * ^sliceName = "allergies_and_intolerances_entry"
    * ^mustSupport = true
* section[family_history_section] ^label = "Family History Section"
  * ^short = "Family History Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#10157-6
    * ^label = "Family History"
    * ^short = "Family History"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains family_history_section_entry 0..*
  * entry[family_history_section_entry] only Reference($us-core-allergyintolerance)
    * ^sliceName = "family_history_section_entry"
    * ^mustSupport = true
* section[general_status_section] ^label = "General Status Section"
  * ^short = "General Status Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#10210-3
    * ^label = "General Status"
    * ^short = "General Status"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[medications_section] ^label = "Medications Section"
  * ^short = "Medications Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#10160-0
    * ^label = "History of medication use"
    * ^short = "History of medication use"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains medications_section_entry 0..*
  * entry[medications_section_entry] only Reference(MedicationStatement or $us-core-medication or $us-core-medicationrequest)
    * ^sliceName = "medications_section_entry"
    * ^mustSupport = true
* section[past_medical_history_section] ^label = "Past Medical History Section"
  * ^short = "Past Medical History Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#11348-0
    * ^short = "code"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains past_medical_history_entry 0..*
  * entry[past_medical_history_entry] only Reference($us-core-condition)
    * ^sliceName = "past_medical_history_entry"
    * ^mustSupport = true
* section[physical_exam_section] ^label = "Physical Exam Section"
  * ^short = "Physical Exam Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#29545-1
    * ^label = "Physical Findings"
    * ^short = "Physical Findings"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains physical_exam_entry 0..*
  * entry[physical_exam_entry] only Reference(Observation)
    * ^sliceName = "physical_exam_entry"
    * ^short = "This section contains unprofiled resources not covered by US Core. Please refer to C-CDA R2.1 for guidance on terminology, etc."
    * ^mustSupport = true
* section[results_section] ^label = "Results Section"
  * ^short = "Results Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#30954-2
    * ^label = "Relevant diagnostic tests and/or laboratory data"
    * ^short = "Relevant diagnostic tests and/or laboratory data"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains results_entry 0..*
  * entry[results_entry] only Reference($us-core-observation-lab)
    * ^sliceName = "results_entry"
    * ^mustSupport = true
* section[review_of_systems_section] ^label = "Review of Systems Section"
  * ^short = "Review of Systems Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#10187-3
    * ^label = "Review of Systems"
    * ^short = "Review of Systems"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[social_history_section] ^label = "Social History Section"
  * ^short = "Social History Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#29762-2
    * ^label = "Social History"
    * ^short = "Social History"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains smoking_status_entry 0..*
  * entry[smoking_status_entry] only Reference($us-core-smokingstatus)
    * ^sliceName = "smoking_status_entry"
    * ^short = "Smoking status"
    * ^mustSupport = true
* section[vital_signs_section] ^label = "Vital Signs Section"
  * ^short = "Vital Signs Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#8716-3
    * ^label = "Vital Signs"
    * ^short = "Vital Signs"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains vital_signs_entry 0..*
  * entry[vital_signs_entry] only Reference($vitalsigns)
    * ^sliceName = "vital_signs_entry"
    * ^short = "This section contains unprofiled resources not covered by US Core. Please refer to C-CDA R2.1 for guidance on terminology, etc."
    * ^mustSupport = true
* section[history_of_present_illness_section] ^label = "History of Present Illness Section"
  * ^short = "History of Present Illness Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#10164-2
    * ^label = "History of Present Illness"
    * ^short = "History of Present Illness"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[assessment_and_plan_section] ^label = "Assessment and Plan Section"
  * ^short = "Assessment and Plan Section. This section represents the clinicianâs conclusions and working assumptions that will guide treatment of the patient. The Assessment and Plan Section may be combined or separated to meet local policy requirements."
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#51847-2
    * ^label = "Assessment and Plan"
    * ^short = "Assessment and Plan"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
  * entry contains assessment_and_plan_entry 0..*
  * entry[assessment_and_plan_entry] only Reference($us-core-condition or Observation or Communication)
    * ^sliceName = "assessment_and_plan_entry"
    * ^short = "This section contains unprofiled resources not covered by US Core. Please refer to C-CDA R2.1 for guidance on terminology, etc."
    * ^mustSupport = true
* section[assessment_section] ^label = "Assessment Section"
  * ^short = "Assessment Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#51848-0
    * ^label = "Assessments"
    * ^short = "Assessments"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[chief_complaint_and_reason_for_visit_section] ^label = "Chief Complaint and Reason for Visit Section"
  * ^short = "Chief Complaint and Reason for Visit Section. This section records the patient's chief complaint (the patient's own description) and/or the reason for the patient's visit (the provider's description of the reason for visit). Local policy determines whether the information is divided into two sections or recorded in one section serving both purposes."
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#46239-0
    * ^label = "Chief Complaint and Reason for Visit"
    * ^short = "Chief Complaint and Reason for Visit"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[chief_complaint_section] ^label = "Chief Complaint Section"
  * ^short = "Chief Complaint Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#10154-3
    * ^label = "Chief Complaint"
    * ^short = "Chief Complaint"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[immunizations_section] ^label = "Immunizations Section"
  * ^short = "Immunizations Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#11369-6
    * ^label = "Immunizations"
    * ^short = "Immunizations"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains immunizations_entry 0..*
  * entry[immunizations_entry] only Reference($us-core-immunization)
    * ^sliceName = "immunizations_entry"
* section[plan_of_treatment_section] ^label = "Plan of Treatment Section"
  * ^short = "Plan of Treatment Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#18776-5
    * ^label = "Plan of Treatment"
    * ^short = "Plan of Treatment"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains plan_of_treatment_entry 0..*
  * entry[plan_of_treatment_entry] only Reference($us-core-goal or $us-core-medicationrequest or $us-core-encounter or Communication or Appointment or CommunicationRequest or DeviceRequest or NutritionOrder or Task or ServiceRequest or VisionPrescription or RequestGroup)
    * ^short = "This section contains unprofiled resources not covered by US Core. Please refer to C-CDA R2.1 for guidance on terminology, etc."
* section[problem_section] ^label = "Problem Section"
  * ^short = "Problem Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#11450-4
    * ^label = "Problem List"
    * ^short = "Problem List"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains problem_entry 0..*
  * entry[problem_entry] only Reference($us-core-condition)
    * ^sliceName = "problem_entry"
    * ^mustSupport = true
* section[procedures_section] ^label = "Procedures Section"
  * ^short = "Procedures Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#47519-4
    * ^label = "History of Procedures"
    * ^short = "History of Procedures"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains procedures_entry 0..*
  * entry[procedures_entry] only Reference($us-core-procedure)
    * ^sliceName = "procedures_entry"
    * ^mustSupport = true
* section[reason_for_visit_section] ^label = "Reason for Visit Section"
  * ^short = "Reason for Visit Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#29299-5
    * ^label = "Reason for Visit"
    * ^short = "Reason for Visit"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[instructions_section] ^label = "Instructions Section"
  * ^short = "Instructions Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#69730-0
    * ^label = "Instructions"
    * ^short = "Instructions"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
