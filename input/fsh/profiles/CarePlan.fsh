Profile: CarePlan
Parent: USRealmHeader
Id: Care-Plan-Document
Title: "Care Plan"
Description: """CARE PLAN FRAMEWORK: A Care Plan (including Home Health Plan of Care (HHPoC)) is a consensus-driven dynamic plan that represents a patient and Care Team Members prioritized concerns, goals, and planned interventions. It serves as a blueprint shared by all Care Team Members (including the patient, their caregivers and providers), to guide the patients care. A Care Plan integrates multiple interventions proposed by multiple providers and disciplines for multiple conditions.

A Care Plan represents one or more Plan(s) of Care and serves to reconcile and resolve conflicts between the various Plans of Care developed for a specific patient by different providers. While both a plan of care and a care plan include the patient's life goals and require Care Team Members (including patients) to prioritize goals and interventions, the reconciliation process becomes more complex as the number of plans of care increases. The Care Plan also serves to enable longitudinal coordination of care.

The Care Plan represents an instance of this dynamic Care Plan at a point in time. The composition itself is NOT dynamic.

Key differentiators between a Care Plan profile and CCD  profile (another snapshot in time document):

*  Requires relationships between various concepts:

        *  Health Concerns

        *  Interventions

        *  Goals

        *  Outcomes

*  Provides the ability to identify patient and provider priorities with each act

*  Provides a header participant to indicate occurrences of Care Plan review"""
* ^meta.versionId = "6"
* ^meta.lastUpdated = "2020-08-19T06:50:24.489+00:00"
* ^meta.source = "#fHnxrwoyrdUYLnFF"
* ^publisher = "HL7 Structured Documents Working Group"
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
* type MS
* type from $2.16.840.1.113762.1.4.1099.10 (required)
  * ^short = "Care Plan Document"
* event ..1 MS
  * period 1.. MS
  * detail MS
    * ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "reference"
    * ^slicing.rules = #open
  * detail contains care_plan 0..*
  * detail[care_plan] only Reference($us-core-careplan)
    * ^short = "Care Plan Detail"
    * ^mustSupport = false
* section ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "code"
  * ^slicing.rules = #open
  * ^mustSupport = false
* section contains
    health_concerns_section 1..1 MS and
    goals_section 1..1 MS and
    interventions_section 0..1 MS and
    eval_outcomes_section 0..1 MS
* section[health_concerns_section] ^short = "Health Concerns Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#75310-3
    * ^short = "Health concerns section code"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "reference"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains health_concerns_entry 0..*
  * entry[health_concerns_entry] only Reference($us-core-allergyintolerance or $us-core-condition or $us-core-observation-lab or $us-core-smokingstatus or $vitalsigns or ClinicalImpression or Observation or RiskAssessment or List or DocumentReference)
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
    * ^slicing.discriminator.path = "reference"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains goals_entry 0..*
  * entry[goals_entry] only Reference($us-core-goal)
    * ^short = "entry"
    * ^mustSupport = true
* section[interventions_section] ^short = "Interventions Section"
  * ^comment = "Interventions Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#62387-6
    * ^short = "Interventions provided"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "reference"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains interventions_entry 0..*
  * entry[interventions_entry] only Reference(List or RequestGroup or MedicationDispense or Communication or ServiceRequest or $us-core-procedure or MedicationStatement or $us-core-medication or $us-core-medicationrequest)
    * ^short = "This section contains unprofiled resources not covered by US Core. Please refer to C-CDA R2.1 for guidance on terminology, etc."
    * ^mustSupport = true
* section[eval_outcomes_section] ^short = "Health Status Evaluations and Outcomes Section"
  * ^comment = "Health Status Evaluations and Outcomes Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $loinc#11383-7
    * ^short = "Patient problem outcome"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "reference"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry contains eval_outcomes_entry 0..*
  * entry[eval_outcomes_entry] only Reference(Observation)
    * ^short = "This section contains unprofiled resources not covered by US Core. Please refer to C-CDA R2.1 for guidance on terminology, etc."
    * ^mustSupport = true
