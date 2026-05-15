Instance: FC-ProblemStatus
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/FC-ProblemStatus"
* version = "4.0.1"
* name = "FHIRtoCCDAProblemStatus"
* title = "FHIR Condition clinicalStatus to C-CDA Problem Status value"
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
* description = "FHIR Condition clinicalStatus to C-CDA Problem Status value"
* sourceUri = "http://hl7.org/fhir/ValueSet/condition-clinical"
* targetUri = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.88.12.80.68"
* group
  * source = "http://terminology.hl7.org/CodeSystem/condition-clinical|3.0.0"
  * target = "http://snomed.info/sct"
  * element[0]
    * code = #recurrence
    * display = "Recurrence"
    * target
      * code = #246455001
      * display = "Recurrence"
      * equivalence = #equivalent
  * element[+]
    * code = #relapse
    * display = "Relapse"
    * target
      * code = #263855007
      * display = "Relapse phase"
      * equivalence = #equivalent
  * element[+]
    * code = #remission
    * display = "Remission"
    * target
      * code = #277022003
      * display = "Remission phase"
      * equivalence = #equivalent
  * element[+]
    * code = #resolved
    * display = "Resolved"
    * target
      * code = #413322009
      * display = "Problem resolved"
      * equivalence = #equivalent
  * element[+]
    * code = #active
    * display = "Active"
    * target
      * code = #55561003
      * display = "Active"
      * equivalence = #equivalent
  * element[+]
    * code = #inactive
    * display = "Inactive"
    * target
      * code = #73425007
      * display = "Inactive"
      * equivalence = #equivalent