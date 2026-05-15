Instance: CF-ConditionClinicalStatus
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/CF-ConditionClinicalStatus"
* version = "4.0.1"
* name = "CCDAtoFHIRConditionClinicalStatus"
* title = "CCDA Problem Concern Status to FHIR Condition Clinical Status"
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
* description = "CCDA Problem Concern Status to FHIR Condition Clinical Status"
* sourceUri = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.11.20.9.19"
* targetUri = "http://hl7.org/fhir/ValueSet/condition-clinical"
* group
  * source = "http://terminology.hl7.org/CodeSystem/v3-ActStatus|4.0.0"
  * target = "http://terminology.hl7.org/CodeSystem/condition-clinical|3.0.0"
  * element[0]
    * code = #aborted
    * display = "aborted"
    * target
      * code = #inactive
      * display = "inactive"
      * equivalence = #wider
  * element[+]
    * code = #active
    * display = "active"
    * target
      * code = #active
      * display = "active"
      * equivalence = #equivalent
  * element[+]
    * code = #completed
    * display = "completed"
    * target
      * code = #inactive
      * display = "inactive"
      * equivalence = #wider
  * element[+]
    * code = #suspended
    * display = "suspended"
    * target
      * code = #inactive
      * display = "inactive"
      * equivalence = #wider