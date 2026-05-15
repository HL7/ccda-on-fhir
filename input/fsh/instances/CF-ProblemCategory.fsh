Instance: CF-ProblemCategory
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/CF-ProblemCategory"
* version = "4.0.1"
* name = "CCDAtoFHIRProblemCategory"
* title = "C-CDA section to FHIR Condition category code"
* status = #active
* experimental = false
* publisher = "HL7 International"
* contact
  * name = "HL7 International"
  * telecom[0]
    * system = #phone
    * value = "+1 734 677 7777"
  * telecom[+]
    * system = #fax
    * value = "+1 734 677 6622"
  * telecom[+]
    * system = #email
    * value = "info@hl7.org"
* description = "C-CDA section code to FHIR Condition category"
* group[0]
  * source = "http://loinc.org"
  * target = "http://terminology.hl7.org/CodeSystem/condition-category|2.0.0"
  * element[0]
    * code = #46240-8
    * display = "History of Hospitalizations+Outpatient visits Narrative"
    * target
      * code = #encounter-diagnosis
      * display = "Encounter Diagnosis"
      * equivalence = #equivalent
  * element[+]
    * code = #11450-4
    * display = "Problem List - Reported"
    * target
      * code = #problem-list-item
      * display = "Problem List Item"
      * equivalence = #equivalent
* group[+]
  * source = "http://loinc.org"
  * target = "http://hl7.org/fhir/us/core/CodeSystem/condition-category"
  * element
    * code = #75310-3
    * display = "Health concerns Document"
    * target
      * code = #health-concern
      * display = "Health Concern"
      * equivalence = #equivalent