Profile: ProgressNote
Parent: USRealmHeader
Id: Progress-Note
Title: "Progress Note"
Description: """This profile represents a patient's clinical status during a hospitalization, outpatient visit, treatment with a LTPAC provider, or other healthcare encounter.

Taber's medical dictionary defines a Progress Note as An ongoing record of a patient's illness and treatment. Physicians, nurses, consultants, and therapists record their notes concerning the progress or lack of progress made by the patient between the time of the previous note and the most recent note.

Mosby's medical dictionary defines a Progress Note as Notes made by a nurse, physician, social worker, physical therapist, and other health care professionals that describe the patient's condition and the treatment given or planned.

A Progress Note is not a re-evaluation note. A Progress Note is not intended to be a Progress Report for Medicare. Medicare B Section 1833(e) defines the requirements of a Medicare Progress Report."""
* ^meta.versionId = "8"
* ^meta.lastUpdated = "2020-08-19T06:55:19.264+00:00"
* ^meta.source = "#A9Jys0rnZ6U9uQpr"
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
* type MS
* type from $2.16.840.1.113883.11.20.8.1 (required)
  * ^short = "type"
* section ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "code"
  * ^slicing.rules = #open
* section contains
    assessment_section 0..1 MS and
    allergies_and_intolerances_section 0..1 MS and
    assessment_and_plan_section 0..1 MS and
    chief_complaint_section 0..1 MS and
    instructions_section 0..1 MS and
    interventions_section 0..1 MS and
    medications_section 0..1 MS and
    nutrition_section 0..1 MS and
    objective_section 0..1 MS and
    physical_exam_section 0..1 MS and
    plan_of_treatment_section 0..1 MS and
    problems_section 0..1 MS and
    results_section 0..1 MS and
    review_of_systems_section 0..1 MS and
    subjective_section 0..1 MS and
    vital_signs_section 0..1 MS
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
* section[allergies_and_intolerances_section] ^label = "Allergies and Intolerances Section"
  * ^short = "Allergies and Intolerances Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#48765-2
    * ^label = "Allergies, adverse reactions, alerts"
    * ^short = "Allergies, adverse reactions, alerts"
  * text 1..
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains allergies_and_intolerances_entry 0..*
  * entry[allergies_and_intolerances_entry] only Reference($us-core-allergyintolerance)
    * ^sliceName = "allergies_and_intolerances_entry"
    * ^mustSupport = true
* section[assessment_and_plan_section] ^label = "Assessment and Plan Section"
  * ^short = "Assessment and Plan Section. This section represents the clinicianâs conclusions and working assumptions that will guide treatment of the patient. The Assessment and Plan Section may be combined or separated to meet local policy requirements."
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#51847-2
    * ^label = "Assessment and plan"
    * ^short = "Assessment and plan"
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
* section[chief_complaint_section] ^label = "Chief Complaint Section"
  * ^short = "Chief Complaint Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#10154-3
    * ^label = "Chief complaint"
    * ^short = "Chief complaint"
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
* section[interventions_section] ^label = "Interventions Section"
  * ^short = "Interventions Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#62387-6
    * ^label = "Interventions provided"
    * ^short = "Interventions provided"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains interventions_section 0..*
  * entry[interventions_section] only Reference(List or RequestGroup)
    * ^sliceName = "interventions_section"
    * ^short = "This section contains unprofiled resources not covered by US Core. Please refer to C-CDA R2.1 for guidance on terminology, etc."
    * ^mustSupport = true
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
  * entry contains medications_entry 0..*
  * entry[medications_entry] only Reference(MedicationStatement or $us-core-medication or $us-core-medicationrequest)
    * ^sliceName = "medications_entry"
    * ^mustSupport = true
* section[nutrition_section] ^label = "Nutrition Section"
  * ^short = "Nutrition Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#61144-2
    * ^label = "Diet and nutrition"
    * ^short = "Diet and nutrition"
  * text 1.. MS
    * ^short = "text"
  * entry MS
    * ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains nutrition_entry 0..*
  * entry[nutrition_entry] only Reference(Observation)
    * ^sliceName = "nutrition_entry"
    * ^short = "This section contains unprofiled resources not covered by US Core. Please refer to C-CDA R2.1 for guidance on terminology, etc."
    * ^mustSupport = true
* section[objective_section] ^label = "Objective Section"
  * ^short = "Objective Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#61149-1
    * ^label = "Objective"
    * ^short = "Objective"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[physical_exam_section] ^label = "Physical Exam Section"
  * ^short = "Physical Exam Section"
  * ^comment = "Physical Exam Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#29545-1
    * ^label = "Physical findings"
    * ^short = "Physical findings"
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
* section[problems_section] ^label = "Problems Section"
  * ^short = "Problems Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#11450-4
    * ^label = "Problem list"
    * ^short = "Problem list"
  * text 1.. MS
    * ^short = "text"
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
  * entry MS
    * ^slicing.discriminator.type = #profile
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
    * ^label = "Review of systems"
    * ^short = "Review of systems"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[subjective_section] ^label = "Subjective Section"
  * ^short = "Subjective Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#61150-9
    * ^label = "Subjective"
    * ^short = "Subjective"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[vital_signs_section] ^label = "Vital Signs Section"
  * ^short = "Vital Signs Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#8716-3
    * ^label = "Vital signs"
    * ^short = "Vital signs"
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
