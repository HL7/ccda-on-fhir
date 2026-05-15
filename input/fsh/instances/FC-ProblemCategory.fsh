Instance: FC-ProblemCategory
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/FC-ProblemCategory"
* version = "4.0.1"
* name = "FHIRtoCCDAProblemCategory"
* title = "FHIR Condition category to C-CDA section code"
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
* description = "FHIR Condition category to C-CDA section code"
* group[0]
  * source = "http://terminology.hl7.org/CodeSystem/condition-category|2.0.0"
  * target = "http://loinc.org"
  * element[0]
    * code = #encounter-diagnosis
    * display = "Encounter Diagnosis"
    * target
      * code = #46240-8
      * display = "History of Hospitalizations+Outpatient visits Narrative"
      * equivalence = #equivalent
  * element[+]
    * code = #problem-list-item
    * display = "Problem List Item"
    * target
      * code = #11450-4
      * display = "Problem List - Reported"
      * equivalence = #equivalent
* group[+]
  * source = "http://hl7.org/fhir/us/core/CodeSystem/condition-category"
  * target = "http://loinc.org"
  * element
    * code = #health-concern
    * display = "Health Concern"
    * target
      * code = #75310-3
      * display = "Health concerns Document"
      * equivalence = #equivalent