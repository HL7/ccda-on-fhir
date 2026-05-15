Instance: FC-ImmunizationStatus
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/FC-ImmunizationStatus"
* version = "4.0.1"
* name = "FHIRtoCCDAImmunizationStatus"
* title = "FHIR to C-CDA Immunization Status"
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
* description = "FHIR to C-CDA Immunization Status"
* sourceUri = "http://hl7.org/fhir/ValueSet/immunization-status"
* targetUri = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.1.11.15933"
* group
  * source = "http://hl7.org/fhir/event-status"
  * target = "http://terminology.hl7.org/CodeSystem/v3-ActStatus|4.0.0"
  * element[0]
    * code = #not-done
    * display = "Not Done"
    * target[0]
      * code = #completed
      * display = "completed"
      * equivalence = #wider
      * comment = "Only use when paired with negation indication and a refusal reason in CDA. Use negation when activity is no longer planned but documentation of refusal is desired."
    * target[+]
      * code = #aborted
      * display = "aborted"
      * equivalence = #narrower
      * comment = "When negation is not intended, cancelled would be recommended status although this code may be appropriate in some circumstances."
    * target[+]
      * code = #cancelled
      * display = "cancelled"
      * equivalence = #narrower
      * comment = "When negation is not intended, this may be default code."
    * target[+]
      * code = #held
      * display = "held"
      * equivalence = #narrower
      * comment = "When negation is not intended, cancelled would be recommended status although this code may be appropriate in some circumstances."
    * target[+]
      * code = #new
      * display = "new"
      * equivalence = #narrower
      * comment = "When negation is not intended, cancelled would be recommended status although this code may be appropriate in some circumstances."
    * target[+]
      * code = #obsolete
      * display = "obsolete"
      * equivalence = #narrower
      * comment = "When negation is not intended, cancelled would be recommended status although this code may be appropriate in some circumstances."
    * target[+]
      * code = #suspended
      * display = "suspended"
      * equivalence = #narrower
      * comment = "When negation is not intended, cancelled would be recommended status although this code may be appropriate in some circumstances."
  * element[+]
    * code = #entered-in-error
    * display = "Entered in Error"
    * target
      * code = #nullified
      * display = "nullified"
      * equivalence = #equivalent
  * element[+]
    * code = #completed
    * display = "Completed"
    * target
      * code = #completed
      * display = "completed"
      * equivalence = #equivalent