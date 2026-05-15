Profile: ReferralNote
Parent: USRealmHeader
Id: Referral-Note
Title: "Referral Note"
Description: """A Referral Note communicates pertinent information from a provider who is requesting services of another provider of clinical or non-clinical services. The information in this document includes the reason for the referral and additional information that would augment decision making and care delivery.
 
Examples of referral situations are: 
* When a patient is referred from a family physician to a cardiologist for cardiac evaluation.
* When patient is sent by a cardiologist to an emergency department for angina.
* When a patient is referred by a nurse practitioner to an audiologist for hearing screening.
* When a patient is referred by a hospitalist to social services."""
* ^meta.versionId = "16"
* ^meta.lastUpdated = "2020-08-19T06:56:14.356+00:00"
* ^meta.source = "#hZbRa2U1Vtc1M6i6"
* ^publisher = "River Rock Associates"
* ^contact[0].name = "Brett Marquard"
* ^contact[=].telecom[0].system = #phone
* ^contact[=].telecom[=].value = "4135496886"
* ^contact[=].telecom[=].use = #work
* ^contact[=].telecom[+].system = #email
* ^contact[=].telecom[=].value = "brett@riverrockassociates.com"
* ^contact[=].telecom[=].use = #work
* ^contact[+].name = "Rick Geimer"
* ^contact[=].telecom.system = #email
* ^contact[=].telecom.value = "rick.geimer@lantanagroup.com"
* ^contact[=].telecom.use = #work
* ^jurisdiction = urn:iso:std:iso:3166#US
* ^abstract = false
* type MS
* type from $2.16.840.1.113883.1.11.20.2.3 (required)
  * ^short = "type"
* section ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "code"
  * ^slicing.rules = #open
* section contains
    allergies_and_intolerances_section 1..1 MS and
    medications_section 1..1 MS and
    problem_section 1..1 MS and
    reason_for_referral_section 1..1 MS and
    functional_status_section 0..1 MS and
    mental_status_section 0..1 MS and
    nutrition_section 0..1 MS and
    plan_of_treatment_section 0..1 MS and
    results_section 0..1 MS and
    assessment_and_plan_section 0..1 MS and
    advance_directives_section 0..1 MS and
    assessment_section 0..1 MS and
    family_history_section 0..1 MS and
    general_status_section 0..1 MS and
    past_medical_history_section 0..1 MS and
    history_of_present_illness_section 0..1 MS and
    immunizations_section 0..1 MS and
    medical_equipment_section 0..1 MS and
    physical_exam_section 0..1 MS and
    procedures_section 0..1 MS and
    review_of_systems_section 0..1 MS and
    social_history_section 0..1 MS and
    vital_signs_section 0..1 MS and
    goals_section 0..1 MS and
    health_concerns_section 0..1 MS
* section[allergies_and_intolerances_section] ^label = "Allergies and Intolerances Section"
  * ^short = "Allergies and Intolerances Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#48765-2
    * ^short = "code"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry[allergies_and_intolerances_entry] only Reference($us-core-allergyintolerance)
    * ^sliceName = "allergies_and_intolerances_entry"
    * ^mustSupport = true
* section[medications_section] ^label = "Medications Section"
  * ^short = "Medications Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#10160-0
    * ^short = "code"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
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
  * entry[problem_entry] only Reference($us-core-condition)
    * ^sliceName = "problem_entry"
    * ^mustSupport = true
* section[reason_for_referral_section] ^label = "Reason for Referral Section"
  * ^short = "Reason for Referral Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#42349-1
    * ^short = "code"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry[reason_for_referral_entry] only Reference(ServiceRequest)
    * ^sliceName = "reason_for_referral_entry"
    * ^mustSupport = true
* section[functional_status_section] ^label = "Functional Status Section"
  * ^short = "Functional Status Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#47420-5
    * ^short = "code"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry[functional_status_entry] only Reference(Observation)
    * ^sliceName = "functional_status_entry"
    * ^short = "This section contains unprofiled resources not covered by US Core. Please refer to C-CDA R2.1 for guidance on terminology, etc."
    * ^mustSupport = true
* section[mental_status_section] ^label = "Mental Status Section"
  * ^short = "Mental Status Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#10190-7
    * ^short = "code"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry[mental_status_entry] only Reference(Observation)
    * ^sliceName = "mental_status_entry"
    * ^short = "This section contains unprofiled resources not covered by US Core. Please refer to C-CDA R2.1 for guidance on terminology, etc."
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
  * entry[nutrition_entry] only Reference(Observation)
    * ^sliceName = "nutrition_entry"
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
  * entry[plan_of_treatment_entry] only Reference($us-core-goal or $us-core-medicationrequest or $us-core-encounter or Communication or Appointment or CommunicationRequest or DeviceRequest or NutritionOrder or Task or ServiceRequest or VisionPrescription or RequestGroup)
    * ^sliceName = "sliceEntry"
    * ^short = "This section contains unprofiled resources not covered by US Core. Please refer to C-CDA R2.1 for guidance on terminology, etc."
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
  * entry[results_entry] only Reference($us-core-observation-lab)
    * ^sliceName = "results_entry"
    * ^mustSupport = true
* section[assessment_and_plan_section] ^label = "Assessment and Plan Section"
  * ^short = "Assessment and Plan Section. This section represents the clinicianâs conclusions and working assumptions that will guide treatment of the patient. The Assessment and Plan Section may be combined or separated to meet local policy requirements."
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#51847-2
    * ^label = "Assessment and plan"
    * ^short = "Assessment and plan"
  * text 1..
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
  * entry[assessment_and_plan_entry] only Reference($us-core-condition or Observation or Communication)
    * ^sliceName = "assessment_and_plan_entry"
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
  * entry[advance_directive_entry] only Reference(Consent)
    * ^sliceName = "advance_directive_entry"
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
  * entry[family_history_entry] only Reference(FamilyMemberHistory)
    * ^sliceName = "family_history_entry"
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
* section[past_medical_history_section] ^label = "Past Medical History Section"
  * ^short = "Past Medical History Section"
  * title 1..
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
  * entry[past_medical_history_entry] only Reference($us-core-condition)
    * ^sliceName = "past_medical_history_entry"
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
  * entry[medical_equipment_entry] only Reference(Device or $us-core-procedure)
    * ^sliceName = "medical_equipment_entry"
    * ^short = "This section contains unprofiled resources not covered by US Core. Please refer to C-CDA R2.1 for guidance on terminology, etc."
    * ^mustSupport = true
* section[physical_exam_section] ^label = "Physical Exam Section"
  * ^short = "Physical Exam Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#29545-1
    * ^short = "code"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry[physical_exam_entry] only Reference(Observation)
    * ^sliceName = "physical_exam_entry"
    * ^short = "This section contains unprofiled resources not covered by US Core. Please refer to C-CDA R2.1 for guidance on terminology, etc."
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
  * entry[procedures_entry] only Reference($us-core-procedure)
    * ^sliceName = "procedures_entry"
    * ^mustSupport = true
* section[review_of_systems_section] ^label = "Review of Systems Section"
  * ^short = "Review of Systems Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#10187-3
    * ^short = "code"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
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
  * entry[social_history_entry] only Reference($us-core-smokingstatus)
    * ^sliceName = "social_history_entry"
    * ^short = "Smoking status"
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
  * entry[vital_signs_entry] only Reference($vitalsigns)
    * ^sliceName = "vital_signs_entry"
    * ^short = "This section contains unprofiled resources not covered by US Core. Please refer to C-CDA R2.1 for guidance on terminology, etc."
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
  * entry[health_concerns_entry] only Reference($us-core-allergyintolerance or $us-core-condition or $us-core-observation-lab or $us-core-smokingstatus or $vitalsigns or ClinicalImpression or Observation or RiskAssessment or List or DocumentReference)
    * ^sliceName = "health_concerns_entry"
    * ^short = "This section contains unprofiled resources not covered by US Core. Please refer to C-CDA R2.1 for guidance on terminology, etc."
    * ^mustSupport = true