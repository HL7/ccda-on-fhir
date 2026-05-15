Instance: CF-ProblemStatus
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/CF-ProblemStatus"
* version = "4.0.1"
* name = "CCDAtoFHIRProblemStatus"
* title = "C-CDA Problem Status value to FHIR Condition clinicalStatus"
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
* description = "C-CDA Problem Status value to FHIR Condition clinicalStatus"
* sourceUri = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.88.12.80.68"
* targetUri = "http://hl7.org/fhir/ValueSet/condition-clinical"
* group
  * source = "http://snomed.info/sct"
  * target = "http://terminology.hl7.org/CodeSystem/condition-clinical|3.0.0"
  * element[0]
    * code = #246455001
    * display = "Recurrence"
    * target
      * code = #recurrence
      * display = "Recurrence"
      * equivalence = #equivalent
  * element[+]
    * code = #263855007
    * display = "Relapse phase"
    * target
      * code = #relapse
      * display = "Relapse"
      * equivalence = #equivalent
  * element[+]
    * code = #277022003
    * display = "Remission phase"
    * target
      * code = #remission
      * display = "Remission"
      * equivalence = #equivalent
  * element[+]
    * code = #413322009
    * display = "Problem resolved"
    * target
      * code = #resolved
      * display = "Resolved"
      * equivalence = #equivalent
  * element[+]
    * code = #55561003
    * display = "Active"
    * target
      * code = #active
      * display = "Active"
      * equivalence = #equivalent
  * element[+]
    * code = #73425007
    * display = "Inactive"
    * target
      * code = #inactive
      * display = "Inactive"
      * equivalence = #equivalent