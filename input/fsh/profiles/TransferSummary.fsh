Profile: TransferSummary
Parent: USRealmHeader
Id: Transfer-Summary
Title: "Transfer Summary"
Description: "This profile describes constraints for a Transfer Summary. The Transfer Summary standardizes critical information for exchange of information between providers of care when a patient moves between health care settings. Standardization of information used in this form will promote interoperability; create information suitable for reuse in quality measurement, public health, research, and for reimbursement."
* ^meta.versionId = "13"
* ^meta.lastUpdated = "2020-08-19T06:56:59.904+00:00"
* ^meta.source = "#DpnmBKyxdzf8noQR"
* ^publisher = "Lantana Consulting Group"
* ^contact[0].name = "Corey Spears"
* ^contact[=].telecom.system = #email
* ^contact[=].telecom.value = "spears.corey@gmail.com"
* ^contact[=].telecom.use = #work
* ^contact[+].name = "Rick Geimer"
* ^contact[=].telecom.system = #email
* ^contact[=].telecom.value = "rick.geimer@lantanagroup.com"
* ^contact[=].telecom.use = #work
* ^jurisdiction = urn:iso:std:iso:3166#US
* ^abstract = false
* type MS
* type from $2.16.840.1.113883.1.11.20.2.4 (required)
  * ^label = "Transfer Summary"
  * ^short = "Transfer Summary"
* event 1..1 MS
  * ^short = "event"
* section ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "code"
  * ^slicing.rules = #open
* section contains
    allergies_and_intolerances_section 1..1 MS and
    medications_section 1..1 MS and
    problem_section 1..1 MS and
    results_section 1..1 MS and
    vital_signs_section 1..1 MS and
    reason_for_referral_section 1..1 MS and
    advance_directives_section 0..1 MS and
    discharge_diagnosis_section 1..1 MS and
    social_history_section 1..1 MS and
    procedures_section 0..1 MS and
    nutrition_section 0..1 MS and
    mental_status_section 0..1 MS and
    history_of_present_illness_section 0..* MS and
    functional_status_section 0..1 MS and
    assessment_section 0..* MS and
    admission_medications_section 0..1 MS and
    encounters_section 0..1 MS and
    general_status_section 0..* MS and
    immunizations_section 0..1 MS and
    medical_equipment_section 0..1 MS and
    past_medical_history_section 0..1 MS and
    payers_section 0..* MS and
    plan_of_treatment_section 0..1 MS and
    family_history_section 0..1 MS and
    admission_diagnosis_section 0..* MS and
    assessment_and_plan_section 0..1 MS
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
  * entry contains allergies_and_intolerances_entry 0..*
  * entry[allergies_and_intolerances_entry] only Reference($us-core-allergyintolerance)
    * ^sliceName = "allergies_and_intolerances_entry"
    * ^mustSupport = true
* section[medications_section] ^label = "Medications Section"
  * ^short = "Medications Section"
  * ^comment = "Medications Section"
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
* section[problem_section] ^label = "Problem Section"
  * ^short = "Problem Section"
  * ^comment = "Problem Section"
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
* section[results_section] ^label = "Results Section"
  * ^short = "Results Section"
  * ^comment = "Results Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#30954-2
    * ^label = "Relevant diagnostic tests and laboratory data"
    * ^short = "Relevant diagnostic tests and laboratory data"
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
* section[vital_signs_section] ^label = "Vital Signs Section"
  * ^short = "Vital Signs Section"
  * ^comment = "Vital Signs Section"
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
* section[reason_for_referral_section] ^label = "Reason for Referral Section"
  * ^short = "Reason for Referral Section"
  * title 1.. MS
    * ^short = "title"
  * code = $loinc#42349-1
  * code MS
    * ^short = "code"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains reason_for_referral_entry 0..*
  * entry[reason_for_referral_entry] only Reference(ServiceRequest)
    * ^sliceName = "reason_for_referral_entry"
    * ^short = "This section contains unprofiled resources not covered by US Core. Please refer to C-CDA R2.1 for guidance on terminology, etc."
    * ^mustSupport = true
* section[advance_directives_section] ^label = "Advance Directives Section"
  * ^short = "Advance Directives Section"
  * ^comment = "Advance Directives Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#42348-3
    * ^label = "Advance directives"
    * ^short = "Advance directives"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
  * entry contains advance_directive_entry 0..*
  * entry[advance_directive_entry] only Reference(Consent)
    * ^sliceName = "advance_directive_entry"
    * ^mustSupport = true
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
  * entry MS
    * ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains discharge_diagnosis_entry 0..*
  * entry[discharge_diagnosis_entry] only Reference($us-core-condition)
    * ^sliceName = "discharge_diagnosis_entry"
    * ^mustSupport = true
* section[social_history_section] ^label = "Social History Section"
  * ^short = "Social History Section"
  * ^comment = "Social History Section"
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
  * entry contains social_history_entry 0..*
  * entry[social_history_entry] only Reference($us-core-smokingstatus)
    * ^sliceName = "social_history_entry"
    * ^short = "Smoking status"
    * ^mustSupport = true
* section[procedures_section] ^label = "Procedures Section"
  * ^short = "Procedures Section"
  * ^comment = "Procedures Section"
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
  * entry contains procedures_entry 0..*
  * entry[procedures_entry] only Reference($us-core-procedure)
    * ^sliceName = "procedures_entry"
    * ^mustSupport = true
* section[nutrition_section] ^label = "Nutrition Section"
  * ^short = "Nutrition Section"
  * ^comment = "Nutrition Section"
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
* section[mental_status_section] ^label = "Mental Status Section"
  * ^short = "Mental Status Section"
  * ^comment = "Mental Status Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#10190-7
    * ^label = "Mental status"
    * ^short = "Mental status"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains mental_status_entry 0..*
  * entry[mental_status_entry] only Reference(Observation)
    * ^sliceName = "mental_status_entry"
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
* section[functional_status_section] ^label = "Functional Status Section"
  * ^short = "Functional Status Section"
  * ^comment = "Functional Status Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#47420-5
    * ^label = "Functional status assessment"
    * ^short = "Functional status assessment"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains functional_status_entry 0..*
  * entry[functional_status_entry] only Reference(Observation)
    * ^sliceName = "functional_status_entry"
    * ^short = "This section contains unprofiled resources not covered by US Core. Please refer to C-CDA R2.1 for guidance on terminology, etc."
    * ^mustSupport = true
* section[assessment_section] ^label = "Assessment Section"
  * ^short = "Assessment Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#51848-0
    * ^short = "code"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
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
* section[encounters_section] ^label = "Encounters Section"
  * ^short = "Encounters Section"
  * ^comment = "Encounters Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#46240-8
    * ^label = "Encounters"
    * ^short = "Encounters"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains encounters_entry 0..*
  * entry[encounters_entry] only Reference($us-core-encounter)
    * ^sliceName = "encounters_entry"
    * ^short = "This section contains unprofiled resources not covered by US Core. Please refer to C-CDA R2.1 for guidance on terminology, etc."
    * ^mustSupport = true
* section[general_status_section] ^label = "General Status Section"
  * ^short = "General Status Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#10210-3
    * ^short = "code"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[immunizations_section] ^label = "Immunizations Section"
  * ^short = "Immunizations Section"
  * ^comment = "Immunizations Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#11369-6
    * ^label = "History of immunization"
    * ^short = "History of immunization"
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
* section[medical_equipment_section] ^label = "Medical Equipment Section"
  * ^short = "Medical Equipment Section"
  * ^comment = "Medical Equipment Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#46264-8
    * ^label = "Medical equipment"
    * ^short = "Medical equipment"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains medical_equipment_entry 0..*
  * entry[medical_equipment_entry] only Reference(Device or $us-core-procedure)
    * ^sliceName = "medical_equipment_entry"
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
* section[payers_section] ^label = "Payers Section"
  * ^short = "Payers Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#48768-6
    * ^short = "code"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains payers_entry 0..*
  * entry[payers_entry] only Reference(Coverage)
    * ^sliceName = "payers_entry"
    * ^short = "This section contains unprofiled resources not covered by US Core. Please refer to C-CDA R2.1 for guidance on terminology, etc."
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
* section[family_history_section] ^label = "Family History Section"
  * ^short = "Family History Section"
  * ^comment = "Family History Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#10157-6
    * ^label = "History of family member diseases"
    * ^short = "History of family member diseases"
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
* section[admission_diagnosis_section] ^label = "Admission Diagnosis Section"
  * ^short = "Admission Diagnosis Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#46241-6
    * ^short = "code"
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
* section[assessment_and_plan_section] ^label = "Assessment and Plan Section"
  * ^short = "Assessment and Plan Section. This section represents the clinicianâs conclusions and working assumptions that will guide treatment of the patient. The Assessment and Plan Section may be combined or separated to meet local policy requirements."
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#51847-2
    * ^short = "code"
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
