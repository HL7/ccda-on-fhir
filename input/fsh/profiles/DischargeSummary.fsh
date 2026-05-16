Profile: DischargeSummary
Parent: USRealmHeader
Id: Discharge-Summary
Title: "Discharge Summary"
Description: """The Discharge Summary is a document which synopsizes a patient's admission to a hospital, LTPAC provider, or other setting. It provides information for the continuation of care following discharge. The Joint Commission requires the following information to be included in the Discharge Summary (http://www.jointcommission.org/):

  The reason for hospitalization (the admission) 

  The procedures performed, as applicable

  The care, treatment, and services provided

  The patients condition and disposition at discharge

  Information provided to the patient and family

  Provisions for follow-up care

The best practice for a Discharge Summary is to include the discharge disposition in the display of the header."""
* ^meta.versionId = "9"
* ^meta.lastUpdated = "2020-08-19T06:52:14.037+00:00"
* ^meta.source = "#tpHisPoQwM38OhgE"
* ^publisher = "Lantana Consulting Group"
* ^contact[0].name = "Sarah Gaunt"
* ^contact[=].telecom[0].system = #phone
* ^contact[=].telecom[=].value = "+6 141-029-2506"
* ^contact[=].telecom[=].use = #work
* ^contact[=].telecom[+].system = #email
* ^contact[=].telecom[=].value = "sarah.gaunt@lantanagroup.com"
* ^contact[=].telecom[=].use = #work
* ^contact[+].name = "Rick Geimer"
* ^contact[=].telecom.system = #email
* ^contact[=].telecom.value = "rick.geimer@lantanagroup.com"
* ^contact[=].telecom.use = #work
* ^jurisdiction = urn:iso:std:iso:3166#US
* ^abstract = false
* type MS
* type from $2.16.840.1.113883.11.20.4.1 (required)
  * ^label = "Discharge Summary"
  * ^short = "Discharge Summary"
* section ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "code"
  * ^slicing.rules = #open
* section contains
    allergies_and_intolerances_section 1..1 MS and
    hospital_course_section 1..1 MS and
    discharge_diagnosis_section 1..1 MS and
    plan_of_treatment_section 0..1 MS and
    discharge_medications_section 0..1 MS and
    admission_diagnosis_section 0..1 MS and
    admission_medications_section 0..1 MS and
    chief_complaint_and_reason_for_visit_section 0..1 MS and
    chief_complaint_section 0..1 MS and
    family_history_section 0..1 MS and
    functional_status_section 0..1 MS and
    history_of_present_illness_section 0..1 MS and
    hospital_consultations_section 0..1 MS and
    hospital_discharge_instructions_section 0..1 MS and
    hospital_discharge_physical_section 0..1 MS and
    hospital_discharge_studies_section 0..1 MS and
    immunizations_section 0..1 MS and
    nutrition_section 0..1 MS and
    past_medical_history_section 0..1 MS and
    problem_section 0..1 MS and
    procedures_section 0..1 MS and
    reason_for_visit_section 0..1 MS and
    review_of_systems_section 0..1 MS and
    social_history_section 0..1 MS and
    vital_signs_section 0..1 MS and
    goals_section 0..1 MS and
    health_concerns_section 0..1 MS
* section[allergies_and_intolerances_section] ^label = "Allergies and Intolerances Section"
  * ^short = "Allergies and Intolerances Section"
  * ^comment = "Allergies and Intolerances Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#48765-2
    * ^label = "Allergies and adverse reactions"
    * ^short = "Allergies and adverse reactions"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains allergy_entry 0..*
  * entry[allergy_entry] only Reference($us-core-allergyintolerance)
    * ^sliceName = "allergy_entry"
    * ^mustSupport = true
* section[hospital_course_section] ^label = "Hospital Course Section"
  * ^short = "Hospital Course Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#8648-8
    * ^short = "code"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[discharge_diagnosis_section] ^label = "Discharge Diagnosis Section"
  * ^short = "Discharge Diagnosis Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#11535-2
    * ^label = "Hospital discharge diagnosis"
    * ^short = "Hospital discharge diagnosis"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains discharge_diagnosis_entry 0..*
  * entry[discharge_diagnosis_entry] only Reference($us-core-condition)
    * ^sliceName = "discharge_diagnosis_entry"
    * ^mustSupport = true
* section[plan_of_treatment_section] ^label = "Plan of Treatment Section"
  * ^short = "Plan of Treatment Section"
  * ^comment = "Plan of Treatment Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#18776-5
    * ^label = "Plan of treatment"
    * ^short = "Plan of treatment"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains plan_of_treatment_entry 0..*
  * entry[plan_of_treatment_entry] only Reference($us-core-goal or $us-core-medicationrequest or $us-core-encounter or Communication or Appointment or CommunicationRequest or DeviceRequest or NutritionOrder or Task or ServiceRequest or VisionPrescription or RequestGroup)
    * ^short = "This section contains unprofiled resources not covered by US Core. Please refer to C-CDA R2.1 for guidance on terminology, etc."
* section[discharge_medications_section] ^label = "Discharge Medications Section"
  * ^short = "Discharge Medications Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#10183-2
    * ^label = "Hospital discharge medications"
    * ^short = "Hospital discharge medications"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains discharge_medications_entry 0..*
  * entry[discharge_medications_entry] only Reference(MedicationStatement or $us-core-medication or $us-core-medicationrequest)
    * ^sliceName = "discharge_medications_entry"
    * ^mustSupport = true
* section[admission_diagnosis_section] ^label = "Admission Diagnosis Section"
  * ^short = "Admission Diagnosis Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#46241-6
    * ^label = "Hospital admission diagnosis"
    * ^short = "Hospital admission diagnosis"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains admission_diagnosis_entry 0..*
  * entry[admission_diagnosis_entry] only Reference($us-core-condition)
    * ^sliceName = "admission_diagnosis_entry"
    * ^mustSupport = true
* section[admission_medications_section] ^label = "Admission Medications Section"
  * ^short = "Admission Medications Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#42346-7
    * ^label = "Medications on admission"
    * ^short = "Medications on admission"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains admission_medications_entry 0..*
  * entry[admission_medications_entry] only Reference(MedicationStatement or $us-core-medication or $us-core-medicationrequest)
    * ^sliceName = "admission_medications_entry"
    * ^mustSupport = true
* section[chief_complaint_and_reason_for_visit_section] ^label = "Chief Complaint and Reason for Visit Section"
  * ^short = "Chief Complaint and Reason for Visit Section. This section records the patient's chief complaint (the patientâs own description) and/or the reason for the patient's visit (the providerâs description of the reason for visit). Local policy determines whether the information is divided into two sections or recorded in one section serving both purposes."
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#46239-0
    * ^short = "code"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[chief_complaint_section] ^label = "Chief Complaint Section"
  * ^short = "Chief Complaint Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#10154-3
    * ^short = "code"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[family_history_section] ^label = "Family History Section"
  * ^short = "Family History Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#10157-6
    * ^short = "code"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains family_history_entry 0..*
  * entry[family_history_entry] only Reference(FamilyMemberHistory)
    * ^sliceName = "family_history_entry"
    * ^short = "This section contains unprofiled resources not covered by US Core. Please refer to C-CDA R2.1 for guidance on terminology, etc."
    * ^mustSupport = true
* section[functional_status_section] ^label = "Functional Status Section"
  * ^short = "Functional Status Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#47420-5
    * ^label = "Functional status"
    * ^short = "Functional status"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains functional_status_entry 0..*
  * entry[functional_status_entry] only Reference($us-core-condition or Observation or ClinicalImpression)
    * ^sliceName = "functional_status_entry"
    * ^short = "This section contains unprofiled resources not covered by US Core. Please refer to C-CDA R2.1 for guidance on terminology, etc."
    * ^mustSupport = true
* section[history_of_present_illness_section] ^label = "History of Present Illness Section"
  * ^short = "History of Present Illness Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#10164-2
    * ^short = "code"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[hospital_consultations_section] ^label = "Hospital Consultations Section"
  * ^short = "Hospital Consultations Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#18841-7
    * ^label = "Hospital consultations"
    * ^short = "Hospital consultations"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[hospital_discharge_instructions_section] ^label = "Hospital Discharge Instructions Section"
  * ^short = "Hospital Discharge Instructions Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#8653-8
    * ^label = "Hospital discharge instructions"
    * ^short = "Hospital discharge instructions"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[hospital_discharge_physical_section] ^label = "Hospital Discharge Physical Section"
  * ^short = "Hospital Discharge Physical Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#10184-0
    * ^label = "Hospital discharge physical"
    * ^short = "Hospital discharge physical"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[hospital_discharge_studies_section] ^label = "Hospital Discharge Studies Section"
  * ^short = "Hospital Discharge Studies Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#11493-4
    * ^label = "Hospital discharge studies summary"
    * ^short = "Hospital discharge studies summary"
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
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains nutrition_entry 0..*
  * entry[nutrition_entry] only Reference(Observation)
    * ^sliceName = "nutrition_entry"
    * ^short = "This section contains unprofiled resources not covered by US Core. Please refer to C-CDA R2.1 for guidance on terminology, etc."
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
* section[problem_section] ^label = "Problem Section"
  * ^short = "Problem Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#11450-4
    * ^label = "Problem list"
    * ^short = "Problem list"
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
    * ^label = "History of procedures"
    * ^short = "History of procedures"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains procedure_entry 0..*
  * entry[procedure_entry] only Reference($us-core-procedure)
    * ^sliceName = "procedure_entry"
    * ^mustSupport = true
* section[reason_for_visit_section] ^label = "Reason for Visit Section"
  * ^short = "Reason for Visit Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#29299-5
    * ^short = "code"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
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
* section[social_history_section] ^label = "Social History Section"
  * ^short = "Social History Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#29762-2
    * ^label = "Social history"
    * ^short = "Social history"
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
    * ^mustSupport = true
* section[goals_section] ^short = "Goals Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#61146-7
    * ^short = "Goals"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains goals_entry 0..*
  * entry[goals_entry] only Reference($us-core-goal)
    * ^sliceName = "goals_entry"
    * ^short = "entry"
    * ^mustSupport = true
* section[health_concerns_section] ^short = "Health Concerns Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#75310-3
    * ^short = "Health concerns section code"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains health_concerns_entry 0..*
  * entry[health_concerns_entry] only Reference($us-core-allergyintolerance or $us-core-condition or $us-core-observation-lab or $us-core-smokingstatus or $vitalsigns or ClinicalImpression or Observation or RiskAssessment or List or DocumentReference)
    * ^sliceName = "health_concerns_entry"
    * ^short = "This section contains unprofiled resources not covered by US Core. Please refer to C-CDA R2.1 for guidance on terminology, etc."
    * ^mustSupport = true
