### USCDI Scope and Coverage

This page indexes the [USCDI](https://www.healthit.gov/isp/united-states-core-data-interoperability-uscdi) data elements against the maps in this guide. The guide targets USCDI v3, plus the document header and provenance. The maps are organized by C-CDA section rather than by USCDI class, so this index is the place to find where a given USCDI element is handled.

#### How to read the table

- **USCDI**: the version in which the element first appeared. Elements that USCDI later removed stay in the table so their fate is visible; the removal is noted.
- **Status**: *Mapped* (a map exists in the version shown), *Planned* (committed for the version shown), *Deferred* (introduced after USCDI v3; not yet scheduled), or *Not planned* (removed from USCDI before this guide addressed it).
- **Version**: the guide version in which the map first appeared, or the version in which a planned map is due.
- **Map**: the page carrying the map. Status is assessed on the C-CDA → FHIR direction; FHIR → C-CDA pages exist for a subset of domains.
- **Moved elements**: USCDI has reorganized its classes several times. Each element is listed once, under its *current* class, with the version in which it first appeared under any class; the note records the earlier home. Elements that USCDI split or replaced (Care Team Member) are listed in their current form.
- **v3.1** denotes the USCDI v3 element list as subsequently amended through ONC rulemaking rather than by a USCDI publication.

#### Summary

|Status|Elements|
|:----|----:|
|Mapped|79|
|Planned|29|
|Deferred|25|
|Not planned|5|
|**Total**|**138**|

Of the 95 elements from USCDI v1–v3 that remain in USCDI, 66 are mapped and 29 are planned for 2.1.0. Of the 38 elements introduced in v4–v6, 13 were mapped in the course of related work and 25 are deferred.

Mapped elements by guide version:

|Version|Elements|
|:----|----:|
|1.2.0|33|
|2.0.0|46|

#### Element index

|Class|Element|USCDI|Status|Version|Map|Notes|
|:----|:----|:----|:----|:----|:----|:----|
|Allergies and Intolerances|Substance (Medication)|v1|Mapped|1.2.0|[Allergies](CF-allergies.html)||
|Allergies and Intolerances|Substance (Drug Class)|v1|Mapped|1.2.0|[Allergies](CF-allergies.html)||
|Allergies and Intolerances|Reaction|v1|Mapped|1.2.0|[Allergies](CF-allergies.html)||
|Allergies and Intolerances|Substance (Non-Medication)|v4|Mapped|1.2.0|[Allergies](CF-allergies.html)|The map does not distinguish medication from non-medication substances.|
|Care Team Members|Care Team Member Name|v2|Planned|2.1.0||USCDI v1 defined a single Care Team Member element; v2 replaced it with these five.|
|Care Team Members|Care Team Member Identifier|v2|Planned|2.1.0|||
|Care Team Members|Care Team Member Role|v2|Planned|2.1.0|||
|Care Team Members|Care Team Member Location|v2|Planned|2.1.0|||
|Care Team Members|Care Team Member Telecom|v2|Planned|2.1.0|||
|Clinical Notes|Consultation Note|v1|Mapped|2.0.0|[Notes](CF-notes.html)||
|Clinical Notes|Discharge Summary Note|v1|Mapped|2.0.0|[Notes](CF-notes.html)||
|Clinical Notes|History & Physical|v1|Mapped|2.0.0|[Notes](CF-notes.html)||
|Clinical Notes|Procedure Note|v1|Mapped|2.0.0|[Notes](CF-notes.html)||
|Clinical Notes|Progress Note|v1|Mapped|2.0.0|[Notes](CF-notes.html)||
|Clinical Notes|Emergency Department Note|v5|Mapped|2.0.0|[Notes](CF-notes.html)||
|Clinical Notes|Operative Note|v5|Mapped|2.0.0|[Notes](CF-notes.html)||
|Clinical Notes|Imaging Narrative|v1|Not planned|||Removed from USCDI in v2.|
|Clinical Notes|Laboratory Report Narrative|v1|Not planned|||Removed from USCDI in v2.|
|Clinical Notes|Pathology Report Narrative|v1|Not planned|||Removed from USCDI in v2.|
|Clinical Tests|Clinical Test|v2|Mapped|2.0.0|[Results](CF-results.html)||
|Clinical Tests|Clinical Test Result/Report|v2|Mapped|2.0.0|[Results](CF-results.html)||
|Diagnostic Imaging|Diagnostic Imaging Test|v2|Planned|2.1.0|||
|Diagnostic Imaging|Diagnostic Imaging Report|v2|Planned|2.1.0|||
|Encounter Information|Encounter Type|v2|Mapped|2.0.0|[Encounters](CF-encounters.html)||
|Encounter Information|Encounter Identifier|v4|Mapped|2.0.0|[Encounters](CF-encounters.html)||
|Encounter Information|Encounter Diagnosis|v2|Mapped|2.0.0|[Encounters](CF-encounters.html)||
|Encounter Information|Encounter Time|v2|Mapped|2.0.0|[Encounters](CF-encounters.html)||
|Encounter Information|Encounter Location|v2|Mapped|2.0.0|[Encounters](CF-encounters.html)||
|Encounter Information|Encounter Disposition|v2|Mapped|2.0.0|[Encounters](CF-encounters.html)||
|Facility Information|Facility Identifier|v4|Deferred||||
|Facility Information|Facility Type|v4|Deferred||||
|Facility Information|Facility Name|v4|Deferred||||
|Facility Information|Facility Address|v6|Deferred||||
|Goals|Patient Goals|v1|Planned|2.1.0|||
|Goals|SDOH Goals|v2|Planned|2.1.0|||
|Goals|Treatment Intervention Preference|v4|Deferred||||
|Goals|Care Experience Preference|v4|Deferred||||
|Health Insurance|Coverage Status|v3|Planned|2.1.0|||
|Health Insurance|Coverage Type|v3|Planned|2.1.0|||
|Health Insurance|Relationship to Subscriber|v3|Planned|2.1.0|||
|Health Insurance|Member Identifier|v3|Planned|2.1.0|||
|Health Insurance|Subscriber Identifier|v3|Planned|2.1.0|||
|Health Insurance|Group Identifier|v3|Planned|2.1.0|||
|Health Insurance|Payer Identifier|v3|Planned|2.1.0|||
|Health Status Assessments|Health Concerns|v1|Mapped|1.2.0|[Problems](CF-problems.html)|Its own class in v1–v2; moved here in v3.|
|Health Status Assessments|Functional Status|v3|Planned|2.1.0|||
|Health Status Assessments|Disability Status|v3|Planned|2.1.0|||
|Health Status Assessments|Mental/Cognitive Status|v3|Planned|2.1.0|||
|Health Status Assessments|Pregnancy Status|v3|Mapped|2.0.0|[Social History](CF-social.html)||
|Health Status Assessments|Smoking Status|v1|Mapped|2.0.0|[Social History](CF-social.html)|Its own class in v1–v2; moved here in v3.|
|Health Status Assessments|SDOH Assessment|v2|Planned|2.1.0||In Assessment and Plan of Treatment v2–v3; moved here in v4.|
|Health Status Assessments|Alcohol Use|v4|Deferred||||
|Health Status Assessments|Substance Use|v4|Deferred||||
|Health Status Assessments|Physical Activity|v4|Deferred||||
|Immunizations|Immunizations|v1|Mapped|1.2.0|[Immunizations](CF-immunizations.html)||
|Immunizations|Lot Number|v5|Mapped|1.2.0|[Immunizations](CF-immunizations.html)||
|Laboratory|Tests|v1|Mapped|2.0.0|[Results](CF-results.html)||
|Laboratory|Values/Results|v1|Mapped|2.0.0|[Results](CF-results.html)||
|Laboratory|Specimen Type|v3|Mapped|2.0.0|[Results](CF-results.html)||
|Laboratory|Result Status|v3|Mapped|2.0.0|[Results](CF-results.html)||
|Laboratory|Result Unit of Measure|v4|Mapped|2.0.0|[Results](CF-results.html)||
|Laboratory|Result Reference Range|v4|Mapped|2.0.0|[Results](CF-results.html)||
|Laboratory|Result Interpretation|v4|Mapped|2.0.0|[Results](CF-results.html)||
|Laboratory|Specimen Source Site|v4|Mapped|2.0.0|[Results](CF-results.html)||
|Laboratory|Specimen Identifier|v4|Mapped|2.0.0|[Results](CF-results.html)||
|Laboratory|Specimen Condition Acceptability|v4|Deferred||||
|Laboratory|Test Kit Unique Device Identifier|v5|Not planned|||Removed from USCDI in v6.|
|Medical Devices|Unique Device Identifier – Implantable|v1|Planned|2.1.0||Its own class in v1–v3; moved here in v4.|
|Medications|Medications|v1|Mapped|1.2.0|[Medications](CF-medications.html)||
|Medications|Dose|v3|Mapped|1.2.0|[Medications](CF-medications.html)||
|Medications|Dose Units of Measure|v3|Mapped|1.2.0|[Medications](CF-medications.html)||
|Medications|Indication|v3|Mapped|1.2.0|[Medications](CF-medications.html)||
|Medications|Fill Status|v3|Planned|2.1.0|||
|Medications|Medication Instructions|v4|Mapped|1.2.0|[Medications](CF-medications.html)||
|Medications|Medication Adherence|v4|Deferred||||
|Medications|Route|v5|Mapped|1.2.0|[Medications](CF-medications.html)||
|Observations|Advance Directive Observation|v5|Deferred||||
|Observations|Sex Parameter for Clinical Use|v5|Not planned|||Removed from USCDI in v6.|
|Orders|Medication Order|v5|Deferred||||
|Orders|Laboratory Order|v5|Deferred||||
|Orders|Diagnostic Imaging Order|v5|Deferred||||
|Orders|Clinical Test Order|v5|Deferred||||
|Orders|Procedure Order|v5|Deferred||||
|Orders|Portable Medical Order|v6|Deferred||||
|Patient Demographics/Information|First Name|v1|Mapped|1.2.0|[Patient](CF-patient.html)||
|Patient Demographics/Information|Last Name|v1|Mapped|1.2.0|[Patient](CF-patient.html)||
|Patient Demographics/Information|Middle Name (including middle initial)|v1|Mapped|1.2.0|[Patient](CF-patient.html)||
|Patient Demographics/Information|Suffix|v1|Mapped|1.2.0|[Patient](CF-patient.html)||
|Patient Demographics/Information|Previous Name|v1|Mapped|1.2.0|[Structural Guidance](mappingGuidance.html)|Carried by name/@use; see the name mapping in structural guidance.|
|Patient Demographics/Information|Date of Birth|v1|Mapped|1.2.0|[Patient](CF-patient.html)||
|Patient Demographics/Information|Date of Death|v3|Mapped|2.0.0|[Patient](CF-patient.html)||
|Patient Demographics/Information|Race|v1|Mapped|1.2.0|[Patient](CF-patient.html)||
|Patient Demographics/Information|Ethnicity|v1|Mapped|1.2.0|[Patient](CF-patient.html)||
|Patient Demographics/Information|Tribal Affiliation|v3|Mapped|2.0.0|[Social History](CF-social.html)||
|Patient Demographics/Information|Birth Sex|v1|Mapped|2.0.0|[Social History](CF-social.html)|Removed from USCDI in v3, replaced by Sex.|
|Patient Demographics/Information|Sex|v3.1|Mapped|2.0.0|[Social History](CF-social.html)||
|Patient Demographics/Information|Sexual Orientation|v2|Mapped|2.0.0|[Social History](CF-social.html)|Removed from USCDI in v3.1.|
|Patient Demographics/Information|Gender Identity|v2|Mapped|2.0.0|[Social History](CF-social.html)|Removed from USCDI in v3.1.|
|Patient Demographics/Information|Preferred Language|v1|Mapped|1.2.0|[Patient](CF-patient.html)||
|Patient Demographics/Information|Interpreter Needed|v5|Deferred||||
|Patient Demographics/Information|Current Address|v1|Mapped|1.2.0|[Patient](CF-patient.html)||
|Patient Demographics/Information|Previous Address|v1|Mapped|1.2.0|[Structural Guidance](mappingGuidance.html)|Carried by addr/@use; see the address mapping in structural guidance.|
|Patient Demographics/Information|Phone Number|v1|Mapped|1.2.0|[Patient](CF-patient.html)||
|Patient Demographics/Information|Phone Number Type|v1|Mapped|1.2.0|[Patient](CF-patient.html)||
|Patient Demographics/Information|Email Address|v1|Mapped|1.2.0|[Patient](CF-patient.html)||
|Patient Demographics/Information|Related Person’s Name|v3|Mapped|2.0.0|[Participations](CF-participations.html)||
|Patient Demographics/Information|Related Person’s Relationship|v3|Mapped|2.0.0|[Participations](CF-participations.html)||
|Patient Demographics/Information|Occupation|v3|Planned|2.1.0|||
|Patient Demographics/Information|Occupation Industry|v3|Planned|2.1.0|||
|Patient Summary and Plan|Assessment and Plan of Treatment|v1|Planned|2.1.0||Its own class in v1–v3; moved here in v4.|
|Patient Summary and Plan|Care Plan|v6|Deferred||||
|Problems|Problems|v1|Mapped|1.2.0|[Problems](CF-problems.html)||
|Problems|SDOH Problems/Health Concerns|v2|Mapped|1.2.0|[Problems](CF-problems.html)||
|Problems|Date of Diagnosis|v2|Mapped|1.2.0|[Problems](CF-problems.html)||
|Problems|Date of Resolution|v2|Mapped|1.2.0|[Problems](CF-problems.html)||
|Problems|Date of Onset|v6|Deferred||||
|Problems|Family Health History|v6|Deferred||||
|Procedures|Procedures|v1|Mapped|1.2.0|[Procedures](CF-procedures.html)||
|Procedures|SDOH Interventions|v2|Planned|2.1.0||The generic procedure map applies; SDOH-specific guidance is pending.|
|Procedures|Reason for Referral|v3|Planned|2.1.0|||
|Procedures|Performance Time|v4|Mapped|1.2.0|[Procedures](CF-procedures.html)||
|Provenance|Author Time Stamp|v1|Planned|2.1.0||High-level provenance guidance since 1.2.0; element-level map pending.|
|Provenance|Author Organization|v1|Planned|2.1.0||High-level provenance guidance since 1.2.0; element-level map pending.|
|Provenance|Author|v5|Deferred||||
|Provenance|Author Role|v5|Deferred||||
|Vital Signs|Systolic Blood Pressure|v1|Mapped|2.0.0|[Vital Signs](CF-vitals.html)||
|Vital Signs|Diastolic Blood Pressure|v1|Mapped|2.0.0|[Vital Signs](CF-vitals.html)||
|Vital Signs|Heart Rate|v1|Mapped|2.0.0|[Vital Signs](CF-vitals.html)||
|Vital Signs|Respiratory Rate|v1|Mapped|2.0.0|[Vital Signs](CF-vitals.html)||
|Vital Signs|Body Temperature|v1|Mapped|2.0.0|[Vital Signs](CF-vitals.html)||
|Vital Signs|Body Height|v1|Mapped|2.0.0|[Vital Signs](CF-vitals.html)||
|Vital Signs|Body Weight|v1|Mapped|2.0.0|[Vital Signs](CF-vitals.html)||
|Vital Signs|Pulse Oximetry|v1|Mapped|2.0.0|[Vital Signs](CF-vitals.html)||
|Vital Signs|Inhaled Oxygen Concentration|v1|Mapped|2.0.0|[Vital Signs](CF-vitals.html)||
|Vital Signs|BMI Percentile (2–20 years)|v1|Mapped|2.0.0|[Vital Signs](CF-vitals.html)||
|Vital Signs|Weight-for-length Percentile (Birth–36 months)|v1|Mapped|2.0.0|[Vital Signs](CF-vitals.html)||
|Vital Signs|Head Occipital-frontal Circumference Percentile (Birth–36 months)|v1|Mapped|2.0.0|[Vital Signs](CF-vitals.html)||
|Vital Signs|Average Blood Pressure|v4|Deferred||||

This index was reconciled against the published STU2 (2.0.0) maps and the 2.1.0 work in progress.
