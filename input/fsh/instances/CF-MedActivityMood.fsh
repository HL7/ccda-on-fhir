Instance: CF-MedActivityMood
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/CF-MedActivityMood"
* version = "4.0.1"
* name = "CCDAtoFHIRMedActivityMood"
* title = "CCDA Medication Activity Mood to FHIR MedicationRequest.intent"
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
* description = "CCDA Medication Activity Mood to FHIR MedicationRequest.intent"
* sourceUri = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.11.20.9.18"
* targetUri = "http://hl7.org/fhir/ValueSet/medicationrequest-intent"
* group
  * source = "http://terminology.hl7.org/CodeSystem/v3-ActMood|4.0.0"
  * target = "http://hl7.org/fhir/CodeSystem/medicationrequest-intent"
  * element[0]
    * code = #EVN
    * display = "event (occurrence)"
    * target
      * code = #plan
      * display = "plan"
      * equivalence = #inexact
      * comment = "CDA mood codes are more general than FHIR intent codes, and there may be special cases where this inexact map does not work."
  * element[+]
    * code = #INT
    * display = "intent"
    * target
      * code = #order
      * display = "order"
      * equivalence = #inexact
      * comment = "CDA mood codes are more general than FHIR intent codes, and there may be special cases where this inexact map does not work."