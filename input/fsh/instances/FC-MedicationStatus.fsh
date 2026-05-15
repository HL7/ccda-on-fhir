Instance: FC-MedicationStatus
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/FC-MedicationStatus"
* version = "4.0.1"
* name = "FHIRtoCCDAMedicationStatus"
* title = "FHIR to C-CDA Medication Status"
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
* description = "FHIR to C-CDA Medication Status. Based on http://cdasearch.hl7.org/examples/view/Medications/Medication%20statusCodes"
* sourceUri = "http://hl7.org/fhir/ValueSet/medicationrequest-status"
* targetUri = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1099.11"
* group
  * source = "http://hl7.org/fhir/CodeSystem/medicationrequest-status"
  * target = "http://terminology.hl7.org/CodeSystem/v3-ActStatus|4.0.0"
  * element[0]
    * code = #active
    * display = "Active"
    * target
      * code = #active
      * display = "active"
      * equivalence = #equivalent
  * element[+]
    * code = #on-hold
    * display = "On Hold"
    * target
      * code = #suspended
      * display = "suspended"
      * equivalence = #equivalent
  * element[+]
    * code = #cancelled
    * display = "Cancelled"
    * target.equivalence = #unmatched
  * element[+]
    * code = #completed
    * display = "Completed"
    * target
      * code = #completed
      * display = "completed"
      * equivalence = #equivalent
  * element[+]
    * code = #entered-in-error
    * display = "Entered in Error"
    * target
      * code = #nullified
      * display = "nullified"
      * equivalence = #equivalent
  * element[+]
    * code = #stopped
    * display = "Stopped"
    * target
      * code = #aborted
      * display = "aborted"
      * equivalence = #equivalent
  * element[+]
    * code = #draft
    * display = "Draft"
    * target.equivalence = #unmatched
  * element[+]
    * code = #unknown
    * display = "Unknown"
    * target.equivalence = #unmatched