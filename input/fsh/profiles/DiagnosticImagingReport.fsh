Profile: DiagnosticImagingReport
Parent: USRealmHeader
Id: Diagnostic-Imaging-Report
Title: "Diagnostic Imaging Report"
Description: "A Diagnostic Imaging Report (DIR) is a document that contains a consulting specialist's interpretation of image data. It conveys the interpretation to the referring (ordering) physician and becomes part of the patient's medical record. It is for use in Radiology, Endoscopy, Cardiology, and other imaging specialties. Note: this document type overlaps with the FHIR DiagnosticReport resource. Most use cases will want to use the specific resource type, but this document type is still useful for CDA to FHIR conversion and other such use cases."
* ^meta.versionId = "7"
* ^meta.lastUpdated = "2020-08-19T06:51:30.422+00:00"
* ^meta.source = "#KLkt9mqJ1KVD1c7X"
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
* type from $1.3.6.1.4.1.12009.10.2.5 (preferred)
  * ^label = "Diagnostic Imaging Report"
  * ^short = "Diagnostic Imaging Report"
* section ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "code"
  * ^slicing.rules = #open
* section contains
    findings_section 1..1 MS and
    dicom_object_catalog_section 0..1 MS and
    history_section 0..1 MS and
    request_section 0..1 MS and
    current_procedure_descriptions_section 0..1 MS and
    prior_procedure_descriptions_section 0..1 MS and
    previous_findings_section 0..1 MS and
    impressions_section 0..1 MS and
    recommendations_section 0..1 MS and
    conclusions_section 0..1 MS
* section[findings_section] ^label = "Findings Section"
  * ^short = "Findings Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $DCM#121070
    * ^label = "Functional Status"
    * ^short = "Functional Status"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry[findings_entry] only Reference(Observation)
    * ^sliceName = "findings_entry"
    * ^short = "This section contains unprofiled resources not covered by US Core. Please refer to C-CDA R2.1 for guidance on terminology, etc."
    * ^mustSupport = true
* section[dicom_object_catalog_section] ^label = "DICOM Object Catalog Section"
  * ^short = "DICOM Object Catalog Section"
  * title 1.. MS
    * ^short = "title"
  * code 1.. MS
  * code = $DCM#121181
    * ^label = "Dicom Object Catalog"
    * ^short = "Dicom Object Catalog"
  * text 1.. MS
    * ^short = "text"
  * entry ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
    * ^short = "entry"
  * entry[dicom_object_catalog_entry] only Reference(ImagingStudy)
    * ^sliceName = "dicom_object_catalog_entry"
    * ^short = "This section contains unprofiled resources not covered by US Core. Please refer to C-CDA R2.1 for guidance on terminology, etc."
    * ^mustSupport = true
* section[history_section] only BackboneElement
  * ^short = "History Section"
  * ^definition = "The root of the sections that make up the composition."
  * ^base.path = "Composition.section"
  * ^base.min = 0
  * ^base.max = "*"
  * ^isModifier = false
  * ^isSummary = false
  * title MS
    * ^short = "title"
  * code 1.. MS
  * code = $DCM#121060
  * text 1.. MS
* section[request_section] only BackboneElement
  * ^short = "Request Section"
  * ^definition = "The root of the sections that make up the composition."
  * ^base.path = "Composition.section"
  * ^base.min = 0
  * ^base.max = "*"
  * ^isModifier = false
  * ^isSummary = false
  * title MS
    * ^short = "title"
  * code 1.. MS
  * code = $DCM#121062
  * text 1.. MS
* section[current_procedure_descriptions_section] only BackboneElement
  * ^short = "Current Procedure Descriptions Section"
  * ^definition = "The root of the sections that make up the composition."
  * ^base.path = "Composition.section"
  * ^base.min = 0
  * ^base.max = "*"
  * ^isModifier = false
  * ^isSummary = false
  * title MS
    * ^short = "title"
  * code 1.. MS
  * code = $DCM#121064
  * text 1.. MS
* section[prior_procedure_descriptions_section] only BackboneElement
  * ^short = "Prior Procedure Descriptions Section"
  * ^definition = "The root of the sections that make up the composition."
  * ^base.path = "Composition.section"
  * ^base.min = 0
  * ^base.max = "*"
  * ^isModifier = false
  * ^isSummary = false
  * title MS
    * ^short = "title"
  * code 1.. MS
  * code = $DCM#121066
  * text 1.. MS
* section[previous_findings_section] only BackboneElement
  * ^short = "Previous Findings Section"
  * ^definition = "The root of the sections that make up the composition."
  * ^base.path = "Composition.section"
  * ^base.min = 0
  * ^base.max = "*"
  * ^isModifier = false
  * ^isSummary = false
  * title MS
    * ^short = "title"
  * code 1.. MS
  * code = $DCM#121068
  * text 1.. MS
* section[impressions_section] only BackboneElement
  * ^short = "Impressions Section"
  * ^definition = "The root of the sections that make up the composition."
  * ^base.path = "Composition.section"
  * ^base.min = 0
  * ^base.max = "*"
  * ^isModifier = false
  * ^isSummary = false
  * title MS
    * ^short = "title"
  * code 1.. MS
  * code = $DCM#121072
  * text 1.. MS
* section[recommendations_section] only BackboneElement
  * ^short = "Impressions Section"
  * ^definition = "The root of the sections that make up the composition."
  * ^base.path = "Composition.section"
  * ^base.min = 0
  * ^base.max = "*"
  * ^isModifier = false
  * ^isSummary = false
  * title MS
    * ^short = "title"
  * code 1.. MS
  * code = $DCM#121074
  * text 1.. MS
* section[conclusions_section] only BackboneElement
  * ^short = "Conclusions Section"
  * ^definition = "The root of the sections that make up the composition."
  * ^base.path = "Composition.section"
  * ^base.min = 0
  * ^base.max = "*"
  * ^isModifier = false
  * ^isSummary = false
  * title MS
    * ^short = "title"
  * code 1.. MS
  * code = $DCM#121076
  * text 1.. MS