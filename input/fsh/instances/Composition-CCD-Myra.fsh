Instance: Composition-CCD-Myra
InstanceOf: ContinuityOfCareDocument
Title: "CCD Composition Example (Myra Jones)"
Usage: #example
Description: "Composition mapped from the Myra Jones (v8) CCD header, demonstrating the C-CDA header -> FHIR Composition maps and seeding the complete document example. Header elements absent from v8 (setId/versionNumber, legalAuthenticator, dataEnterer, informant) are noted in the decision log as v8-amendment candidates. Section entries reference the shared standalone map-example instances."
* identifier
  * system = "urn:ietf:rfc:3986"
  * value = "urn:uuid:973c7e16-05dd-484f-a780-e80904fd8ff0"
* status = #final
* type = $loinc#34133-9 "Summary of episode note"
* subject = Reference(FHIR-Output-Patient)
* encounter = Reference(FHIR-Output-Encounter)
* date = "2016-10-03T18:27:10+00:00"
* author.display = "Provider abc"
* title = "Continuity of Care Document"
* confidentiality = #N
* language = #en-US
* custodian.display = "Primary Care's Partners Test"
* event
  * code = http://terminology.hl7.org/CodeSystem/v3-ActClass#PCPR "care provision"
  * period
    * start = "2016-10-03"
    * end = "2016-10-03"
* section[allergies_and_intolerances_section]
  * title = "Allergies and Adverse Reactions"
  * code = $loinc#48765-2
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Aspirin (wheal, severe, high criticality); peanut (food allergy).</div>"
  * entry = Reference(FHIR-Output-AllergyIntolerance)
* section[medications_section]
  * title = "Medications"
  * code = $loinc#10160-0
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Albuterol/ipratropium inhalation spray, 2 puffs every 4-6 hours as needed.</div>"
  * entry = Reference(FHIR-Output-MedicationRequest)
* section[problem_section]
  * title = "Problems"
  * code = $loinc#11450-4
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Pneumonia (active, onset 2012-08-06); additional problems in source.</div>"
  * entry = Reference(FHIR-Output-Condition)
* section[results_section]
  * title = "Results"
  * code = $loinc#30954-2
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Urinalysis: specific gravity 1.015 (normal).</div>"
  * entry = Reference(FHIR-Output-DiagnosticReport)
* section[social_history_section]
  * title = "Social History"
  * code = $loinc#29762-2
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Current every day smoker (recorded 2014-06-06).</div>"
  * entry = Reference(FHIR-Output-Observation-SmokingStatus)
* section[vital_signs_section]
  * title = "Vital Signs"
  * code = $loinc#8716-3
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">2014-05-20: HR 80/min, BP 128/78 mmHg.</div>"
  * entry = Reference(FHIR-Output-Observation-HeartRate)
