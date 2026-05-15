Instance: CF-ResultStatus
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/CF-ResultStatus"
* version = "4.0.1"
* name = "CCDAtoFHIRResultStatus"
* title = "CCDA ResultStatus to FHIR Observation Status"
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
* description = "C-CDA Result Status to FHIR Observation Status"
* sourceUri = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.11.20.9.39"
* targetUri = "http://hl7.org/fhir/ValueSet/observation-status"
* group
  * source = "http://terminology.hl7.org/CodeSystem/v3-ActStatus|4.0.0"
  * target = "http://hl7.org/fhir/observation-status"
  * element[0]
    * code = #aborted
    * display = "aborted"
    * target
      * code = #cancelled
      * display = "Cancelled"
      * equivalence = #wider
  * element[+]
    * code = #active
    * display = "active"
    * target
      * code = #registered
      * display = "Registered"
      * equivalence = #inexact
      * comment = "Caution: Multiple values map to the FHIR concept of registered."
  * element[+]
    * code = #cancelled
    * display = "cancelled"
    * target
      * code = #cancelled
      * display = "Cancelled"
      * equivalence = #equal
  * element[+]
    * code = #completed
    * display = "completed"
    * target
      * code = #final
      * display = "Final"
      * equivalence = #equal
  * element[+]
    * code = #held
    * display = "held"
    * target
      * code = #registered
      * display = "Registered"
      * equivalence = #inexact
      * comment = "Caution: Multiple values map to the FHIR concept of registered."
  * element[+]
    * code = #suspended
    * display = "suspended"
    * target
      * code = #registered
      * display = "Registered"
      * equivalence = #inexact
      * comment = "Caution: Multiple values map to the FHIR concept of registered."