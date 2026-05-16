Profile: OperativeNote
Parent: USRealmHeader
Id: Operative-Note
Title: "Operative Note"
Description: """The Operative Note is a frequently used type of procedure note with specific requirements set forth by regulatory agencies.

The Operative Note is created immediately following a surgical or other high-risk procedure. It records the pre- and post-surgical diagnosis, pertinent events of the procedure, as well as the condition of the patient following the procedure. The report should be sufficiently detailed to support the diagnoses, justify the treatment, document the course of the procedure, and provide continuity of care."""
* ^meta.versionId = "8"
* ^meta.lastUpdated = "2020-08-19T06:53:59.107+00:00"
* ^meta.source = "#d3bmkvD1SJvgcAtp"
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
* type from $2.16.840.1.113883.11.20.1.1 (required)
  * ^short = "type"
* section ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "code"
  * ^slicing.rules = #open
* section contains
    anesthesia_section 1..1 MS and
    complications_section 1..1 MS and
    preoperative_diagnosis_section 1..1 MS and
    procedure_estimated_blood_loss_section 1..1 MS and
    procedure_findings_section 1..1 MS and
    procedure_specimens_taken_section 1..1 MS and
    postoperative_diagnosis_section 1..1 MS and
    procedure_description_section 1..1 MS and
    operative_note_surgical_procedure_section 0..1 MS and
    operative_note_fluids_section 0..1 MS and
    plan_of_treatment_section 0..1 MS and
    planned_procedure_section 0..1 MS and
    procedure_disposition_section 0..1 MS and
    procedure_indications_section 0..1 MS and
    procedure_implants_section 0..1 MS and
    surgical_drains_section 0..1 MS
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
  * entry contains anesthesia_entry 0..*
  * entry[anesthesia_entry] only Reference(MedicationStatement or $us-core-medication or $us-core-medicationrequest or $us-core-procedure)
    * ^sliceName = "anesthesia_entry"
    * ^mustSupport = true
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
  * entry contains complications_entry 0..*
  * entry[complications_entry] only Reference($us-core-condition)
    * ^sliceName = "complications_entry"
    * ^mustSupport = true
* section[preoperative_diagnosis_section] ^label = "Preoperative Diagnosis Section"
  * ^short = "Preoperative Diagnosis Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#10219-4
    * ^label = "Preoperative Diagnosis"
    * ^short = "Preoperative Diagnosis"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains preoperative_diagnosis_entry 0..*
  * entry[preoperative_diagnosis_entry] only Reference($us-core-condition)
    * ^sliceName = "preoperative_diagnosis_entry"
    * ^mustSupport = true
* section[procedure_estimated_blood_loss_section] ^label = "Procedure Estimated Blood Loss Section"
  * ^short = "Procedure Estimated Blood Loss Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#59770-8
    * ^label = "Procedure Estimated Blood Loss"
    * ^short = "Procedure Estimated Blood Loss"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[procedure_findings_section] ^label = "Procedure Findings Section"
  * ^short = "Procedure Findings Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#59776-5
    * ^label = "Procedure Findings"
    * ^short = "Procedure Findings"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains procedure_findings_entry 0..*
  * entry[procedure_findings_entry] only Reference($us-core-condition)
    * ^sliceName = "procedure_findings_entry"
    * ^mustSupport = true
* section[procedure_specimens_taken_section] ^label = "Procedure Specimens Taken Section"
  * ^short = "Procedure Specimens Taken Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#59773-2
    * ^label = "Procedure Specimens Taken"
    * ^short = "Procedure Specimens Taken"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[postoperative_diagnosis_section] ^label = "Postoperative Diagnosis Section"
  * ^short = "Postoperative Diagnosis Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#10218-6
    * ^label = "Postoperative Diagnosis"
    * ^short = "Postoperative Diagnosis"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[procedure_description_section] ^label = "Procedure Description Section"
  * ^short = "Procedure Description Section"
  * title 1..
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#29554-3
    * ^label = "Procedure Description"
    * ^short = "Procedure Description"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[operative_note_surgical_procedure_section] ^label = "Operative Note Surgical Procedure Section"
  * ^short = "Operative Note Surgical Procedure Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#10223-6
    * ^label = "Operative Note Surgical Procedure"
    * ^short = "Operative Note Surgical Procedure"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[operative_note_fluids_section] ^label = "Operative Note Fluids Section"
  * ^short = "Operative Note Fluids Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#10216-0
    * ^label = "Operative Note Fluids"
    * ^short = "Operative Note Fluids"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
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
  * entry MS
    * ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains plan_of_treatment_entry 0..*
  * entry[plan_of_treatment_entry] only Reference($us-core-goal or $us-core-medicationrequest or $us-core-encounter or Communication or Appointment or CommunicationRequest or DeviceRequest or NutritionOrder or Task or ServiceRequest or VisionPrescription or RequestGroup)
    * ^short = "This section contains unprofiled resources not covered by US Core. Please refer to C-CDA R2.1 for guidance on terminology, etc."
* section[planned_procedure_section] ^label = "Planned Procedure Section"
  * ^short = "Planned Procedure Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#59772-4
    * ^label = "Planned Procedure"
    * ^short = "Planned Procedure"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains planned_procedure_entry 0..*
  * entry[planned_procedure_entry] only Reference(ServiceRequest)
    * ^sliceName = "planned_procedure_entry"
    * ^short = "This section contains unprofiled resources not covered by US Core. Please refer to C-CDA R2.1 for guidance on terminology, etc."
    * ^mustSupport = true
* section[procedure_disposition_section] ^label = "Procedure Disposition Section"
  * ^short = "Procedure Disposition Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#59775-7
    * ^label = "Procedure Disposition"
    * ^short = "Procedure Disposition"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[procedure_indications_section] ^label = "Procedure Indications Section"
  * ^short = "Procedure Indications Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#59768-2
    * ^label = "Procedure Indications"
    * ^short = "Procedure Indications"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[procedure_implants_section] ^label = "Procedure Implants Section"
  * ^short = "Procedure Implants Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#59771-6
    * ^label = "Procedure Implants"
    * ^short = "Procedure Implants"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
* section[surgical_drains_section] ^label = "Surgical Drains Section"
  * ^short = "Surgical Drains Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#11537-8
    * ^label = "Surgical Drains"
    * ^short = "Surgical Drains"
  * text 1.. MS
    * ^short = "This section contains only human readable content"
