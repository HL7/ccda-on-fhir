Instance: CF-MedicationStatus
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/CF-MedicationStatus"
* version = "4.0.1"
* name = "CCDAtoFHIRMedicationStatus"
* title = "C-CDA to FHIR Medication Status"
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
* description = "C-CDA to FHIR Medication Status. Based on http://cdasearch.hl7.org/examples/view/Medications/Medication%20statusCodes"
* sourceUri = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1099.11"
* targetUri = "http://hl7.org/fhir/ValueSet/medicationrequest-status"
* group
  * source = "http://terminology.hl7.org/CodeSystem/v3-ActStatus|4.0.0"
  * target = "http://hl7.org/fhir/CodeSystem/medicationrequest-status"
  * element[0]
    * code = #active
    * display = "active"
    * target
      * code = #active
      * display = "Active"
      * equivalence = #equivalent
  * element[+]
    * code = #suspended
    * display = "suspended"
    * target
      * code = #on-hold
      * display = "On Hold"
      * equivalence = #equivalent
  * element[+]
    * code = #aborted
    * display = "aborted"
    * target
      * code = #stopped
      * display = "Stopped"
      * equivalence = #equivalent
  * element[+]
    * code = #completed
    * display = "completed"
    * target
      * code = #completed
      * display = "Completed"
      * equivalence = #equivalent
  * element[+]
    * code = #nullified
    * display = "nullified"
    * target
      * code = #entered-in-error
      * display = "Entered in Error"
      * equivalence = #equivalent