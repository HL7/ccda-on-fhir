Profile: ContinuityOfCareDocument
Parent: USRealmHeader
Id: Continuity-of-Care-Document
Title: "Continuity of Care Document"
Description: """This profile was originally based on the Continuity of Care Document (CCD) Release 1.1 which itself was derived from HITSP C32 and CCD Release 1.0.

The Continuity of Care Document (CCD) profile represents a core data set of the most relevant administrative, demographic, and clinical information facts about a patient's healthcare, covering one or more healthcare encounters. It provides a means for one healthcare practitioner, system, or setting to aggregate all of the pertinent data about a patient and forward it to another to support the continuity of care.  

The primary use case for the CCD is to provide a snapshot in time containing the germane clinical, demographic, and administrative data for a specific patient. The key characteristic of a CCD is that the Composition.event.code is constrained to "PCPR". This means it does not function to report new services associated with performing care. It reports on care that has already been provided. The CCD provides a historical tally of the care over a range of time and is not a record of new services delivered.

More specific use cases, such as a Discharge Summary, Transfer Summary, Referral Note, Consultation Note, or Progress Note, are available as alternative profiles."""
* ^meta.versionId = "14"
* ^meta.lastUpdated = "2020-08-12T21:30:20.464+00:00"
* ^meta.source = "#csn482LCsnDWyxbW"
* ^publisher = "Lantana Consulting Group"
* ^contact[0].name = "Sarah Gaunt"
* ^contact[=].telecom[0].system = #phone
* ^contact[=].telecom[=].value = "+6-141-029-2506"
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
* type = $loinc#34133-9
* type MS
  * ^label = "Summary of episode note"
  * ^short = "Summary of episode note"
* event 1..1 MS
  * ^label = "serviceEvent"
  * ^short = "serviceEvent"
  * code ^short = "code"
  * period 1..
    * ^short = "period"
    * start 1..
      * ^short = "start"
    * end 1..
      * ^short = "end"
* section ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "code"
  * ^slicing.rules = #open
* section contains
    allergies_and_intolerances_section 1..1 MS and
    medications_section 1..1 MS and
    problem_section 1..1 MS and
    results_section 1..1 MS and
    social_history_section 1..1 MS and
    vital_signs_section 1..1 MS and
    plan_of_treatment_section 0..1 MS and
    procedures_section 0..1 MS and
    family_history_section 0..1 MS and
    advance_directives_section 0..1 MS and
    encounters_section 0..1 MS and
    functional_status_section 0..1 MS and
    immunizations_section 0..1 MS and
    nutrition_section 0..1 MS and
    mental_status_section 0..1 MS and
    medical_equipment_section 0..1 MS and
    payers_section 0..1 MS and
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
  * entry MS
    * ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains allergy_entry 0..*
  * entry[allergy_entry] only Reference($us-core-allergyintolerance)
    * ^sliceName = "allergy_entry"
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
  * entry contains medication_entry 0..*
  * entry[medication_entry] only Reference(MedicationStatement or $us-core-medication or $us-core-medicationrequest)
    * ^sliceName = "medication_entry"
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
  * entry contains problems_entry 0..*
  * entry[problems_entry] only Reference($us-core-condition)
    * ^sliceName = "problems_entry"
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
  * entry contains sliceEntry 0..*
  * entry[sliceEntry] only Reference($us-core-observation-lab)
    * ^sliceName = "sliceEntry"
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
  * entry contains smoking_status_entry 0..*
  * entry[smoking_status_entry] only Reference($us-core-smokingstatus)
    * ^sliceName = "smoking_status_entry"
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
  * entry contains vital_signs_entry 0..*
  * entry[vital_signs_entry] only Reference($vitalsigns)
    * ^sliceName = "vital_signs_entry"
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
  * entry contains procedure_entry 0..*
  * entry[procedure_entry] only Reference($us-core-procedure)
    * ^sliceName = "procedure_entry"
    * ^mustSupport = true
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
  * entry contains encounter_entry 0..*
  * entry[encounter_entry] only Reference($us-core-encounter)
    * ^sliceName = "encounter_entry"
    * ^short = "This section contains unprofiled resources not covered by US Core. Please refer to C-CDA R2.1 for guidance on terminology, etc."
    * ^mustSupport = true
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
  * entry contains immunization_entry 0..*
  * entry[immunization_entry] only Reference($us-core-immunization)
    * ^sliceName = "immunization_entry"
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
  * entry[nutrition_entry] only Reference(NutritionOrder or ClinicalImpression or Observation)
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
  * entry MS
    * ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains medical_equipment_entry 0..*
  * entry[medical_equipment_entry] only Reference(Device or $us-core-procedure)
    * ^sliceName = "medical_equipment_entry"
    * ^short = "This section contains unprofiled resources not covered by US Core. Please refer to C-CDA R2.1 for guidance on terminology, etc."
    * ^mustSupport = true
* section[payers_section] ^label = "Payers Section"
  * ^short = "Payers Section"
  * ^comment = "Payers Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#48768-6
    * ^label = "Payers"
    * ^short = "Payers"
  * text 1.. MS
    * ^short = "text"
  * entry MS
    * ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains coverage_entry 0..*
  * entry[coverage_entry] only Reference(Coverage)
    * ^sliceName = "coverage_entry"
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
