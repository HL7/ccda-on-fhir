Profile: ProcedureNote
Parent: USRealmHeader
Id: Procedure-Note
Title: "Procedure Note"
Description: """A Procedure Note encompasses many types of non-operative procedures including interventional cardiology, gastrointestinal endoscopy, osteopathic manipulation, and many other specialty fields. Procedure Notes are differentiated from Operative Notes because they do not involve incision or excision as the primary act.

The Procedure Note is created immediately following a non-operative procedure. It records the indications for the procedure and, when applicable, postprocedure diagnosis, pertinent events of the procedure, and the patients tolerance for the procedure. It should be detailed enough to justify the procedure, describe the course of the procedure, and provide continuity of care."""
* ^meta.versionId = "9"
* ^meta.lastUpdated = "2020-08-19T06:54:38.107+00:00"
* ^meta.source = "#b9WEhafsbLr7h0uf"
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
* type from $2.16.840.1.113883.11.20.6.1 (required)
  * ^label = "Procedure Note"
  * ^short = "Procedure Note"
* event 1.. MS
  * ^label = "serviceEvent"
  * ^short = "serviceEvent"
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
    complications_section 1..1 MS and
    procedure_description_section 1..1 MS and
    procedure_indications_section 1..1 MS and
    postprocedure_diagnosis_section 1..1 MS and
    allergies_and_intolerances_section 0..1 MS and
    assessment_section 0..1 MS and
    assessment_and_plan_section 0..1 MS and
    anesthesia_section 0..1 MS and
    chief_complaint_and_reason_for_visit_section 0..1 MS and
    chief_complaint_section 0..1 MS and
    family_history_section 0..1 MS and
    past_medical_history_section 0..1 MS and
    history_of_present_illness_section 0..1 MS and
    medical_history_section 0..1 MS and
    medications_section 0..1 MS and
    medications_administered_section 0..1 MS and
    physical_exam_section 0..1 MS and
    plan_of_treatment_section 0..1 MS and
    planned_procedure_section 0..1 MS and
    procedure_disposition_section 0..1 MS and
    procedure_estimated_blood_loss_section 0..1 MS and
    procedure_findings_section 0..1 MS and
    procedure_implants_section 0..1 MS and
    procedure_specimens_taken_section 0..1 MS and
    procedures_section 0..1 MS and
    reason_for_visit_section 0..1 MS and
    review_of_systems_section 0..1 MS and
    social_history_section 0..1 MS
* section[complications_section] ^label = "Complications Section"
  * ^short = "Complications Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#55109-3
    * ^label = "Complications"
    * ^short = "Complications"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry[complications_entry] only Reference($us-core-condition)
    * ^sliceName = "complications_entry"
    * ^mustSupport = true
* section[procedure_description_section] ^label = "Procedure Description Section"
  * ^short = "Procedure Description Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#29554-3
    * ^label = "Procedure description"
    * ^short = "Procedure description"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[procedure_indications_section] ^label = "Procedure Indications Section"
  * ^short = "Procedure Indications Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#59768-2
    * ^label = "Procedure indications"
    * ^short = "Procedure indications"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[postprocedure_diagnosis_section] ^label = "Postprocedure Diagnosis Section"
  * ^short = "Postprocedure Diagnosis Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#59769-0
    * ^label = "Postprocedure diagnosis"
    * ^short = "Postprocedure diagnosis"
  * text 1.. MS
    * ^short = "text"
  * entry MS
    * ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry[postprocedure_diagnosis_entry] only Reference($us-core-condition)
    * ^sliceName = "postprocedure_diagnosis_entry"
    * ^mustSupport = true
* section[allergies_and_intolerances_section] ^label = "Allergies and Intolerances Section"
  * ^short = "Allergies and Intolerances Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#48765-2
    * ^label = "Allergies and/or adverse reactions"
    * ^short = "Allergies and/or adverse reactions"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry[allergies_and_intolerances_entry] only Reference($us-core-allergyintolerance)
    * ^sliceName = "allergies_and_intolerances_entry"
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
* section[assessment_and_plan_section] ^label = "Assessment and Plan Section"
  * ^short = "Assessment and Plan Section. This section represents the clinician's conclusions and working assumptions that will guide treatment of the patient. The Assessment and Plan Section may be combined or separated to meet local policy requirements."
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
  * entry[assessment_and_plan_entry] only Reference($us-core-condition or Observation or Communication)
    * ^sliceName = "assessment_and_plan_entry"
    * ^short = "This section contains unprofiled resources not covered by US Core. Please refer to C-CDA R2.1 for guidance on terminology, etc."
    * ^mustSupport = true
* section[anesthesia_section] ^label = "Anesthesia Section"
  * ^short = "Anesthesia Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#59774-0
    * ^label = "Anesthesia"
    * ^short = "Anesthesia"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry[anesthesia_entry] only Reference(MedicationStatement or $us-core-medication or $us-core-medicationrequest or $us-core-procedure)
    * ^sliceName = "anesthesia_entry"
    * ^mustSupport = true
* section[chief_complaint_and_reason_for_visit_section] ^label = "Chief Complaint and Reason for Visit Section"
  * ^short = "Chief Complaint and Reason for Visit Section. This section records the patient's chief complaint (the patient's own description) and/or the reason for the patient's visit (the provider's description of the reason for visit). Local policy determines whether the information is divided into two sections or recorded in one section serving both purposes."
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
  * entry[family_history_entry] only Reference(FamilyMemberHistory)
    * ^sliceName = "family_history_entry"
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
* section[medical_history_section] ^label = "Medical (General) History Section"
  * ^short = "Medical (General) History Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#11329-0
    * ^label = "Medical (general) history"
    * ^short = "Medical (general) history"
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
  * entry[medications_entry] only Reference(MedicationStatement or $us-core-medication or $us-core-medicationrequest)
    * ^sliceName = "medications_entry"
    * ^mustSupport = true
* section[medications_administered_section] ^label = "Medications Administered Section"
  * ^short = "Medications Administered Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#29549-3
    * ^label = "Medications administered"
    * ^short = "Medications administered"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry[medications_administered_entry] only Reference(MedicationStatement or $us-core-medication or $us-core-medicationrequest)
    * ^sliceName = "medications_administered_entry"
    * ^mustSupport = true
* section[physical_exam_section] ^label = "Physical Exam Section"
  * ^short = "Physical Exam Section"
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
* section[planned_procedure_section] ^label = "Planned Procedure Section"
  * ^short = "Planned Procedure Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#59772-4
    * ^label = "Planned procedure"
    * ^short = "Planned procedure"
  * text 1.. MS
    * ^short = "text"
* section[procedure_disposition_section] ^label = "Procedure Disposition Section"
  * ^short = "Procedure Disposition Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#59775-7
    * ^label = "Procedure disposition"
    * ^short = "Procedure disposition"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[procedure_estimated_blood_loss_section] ^label = "Procedure Estimated Blood Loss Section"
  * ^short = "Procedure Estimated Blood Loss Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#59770-8
    * ^label = "Procedure estimated blood loss"
    * ^short = "Procedure estimated blood loss"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[procedure_findings_section] ^label = "Procedure Findings Section"
  * ^short = "Procedure Findings Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#59776-5
    * ^label = "Procedure findings"
    * ^short = "Procedure findings"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[procedure_implants_section] ^label = "Procedure Implants Section"
  * ^short = "Procedure Implants Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#59771-6
    * ^label = "Procedure implants"
    * ^short = "Procedure implants"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[procedure_specimens_taken_section] ^label = "Procedure Specimens Taken Section"
  * ^short = "Procedure Specimens Taken Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#59773-2
    * ^label = "Procedure specimens taken"
    * ^short = "Procedure specimens taken"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
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
  * entry[procedures_entry] only Reference($us-core-procedure)
    * ^sliceName = "procedures_entry"
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
  * entry[social_history_entry] only Reference($us-core-smokingstatus)
    * ^sliceName = "social_history_entry"
    * ^short = "Smoking status"
    * ^mustSupport = true