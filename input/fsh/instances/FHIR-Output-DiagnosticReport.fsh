Instance: FHIR-Output-DiagnosticReport
InstanceOf: DiagnosticReport
Usage: #example
Description: "FHIR resource produced by the CDA-to-FHIR mapping example for the Results organizer (Myra Jones v8 urinalysis battery). NOTE: issued is required by us-core-9 but has no source in this organizer (no author participation); value synthesized from effectiveTime/high — flagged for committee (see D-result-2)."
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-diagnosticreport-lab"
* identifier
  * system = "urn:oid:1.3.6.1.4.1.22812.20.1.1.4.5"
  * value = "1"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/v2-0074#LAB "Laboratory"
* code = $loinc#24357-6 "Urinalysis macro (dipstick) panel - Urine"
* subject = Reference(FHIR-Output-Patient)
* effectivePeriod
  * start = "2015-06-22"
  * end = "2015-06-22"
* issued = "2015-06-22T00:00:00-05:00"
* performer.display = "Value Labs"
* result = Reference(FHIR-Output-Observation-Lab)
