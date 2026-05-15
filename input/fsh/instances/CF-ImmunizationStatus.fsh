Instance: CF-ImmunizationStatus
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/CF-ImmunizationStatus"
* version = "4.0.1"
* name = "CCDAtoFHIRImmunizationStatus"
* title = "C-CDA to FHIR Immunization Status"
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
* description = "C-CDA to FHIR Immunization Status"
* sourceUri = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.1.11.15933"
* targetUri = "http://hl7.org/fhir/ValueSet/immunization-status"
* group
  * source = "http://terminology.hl7.org/CodeSystem/v3-ActStatus|4.0.0"
  * target = "http://hl7.org/fhir/event-status"
  * element[0]
    * code = #aborted
    * display = "aborted"
    * target
      * code = #not-done
      * display = "Not Done"
      * equivalence = #wider
  * element[+]
    * code = #cancelled
    * display = "cancelled"
    * target
      * code = #not-done
      * display = "Not Done"
      * equivalence = #wider
  * element[+]
    * code = #completed
    * display = "completed"
    * target[0]
      * code = #completed
      * display = "Completed"
      * equivalence = #equivalent
    * target[+]
      * code = #not-done
      * display = "Not Done"
      * equivalence = #wider
      * comment = "Only map to not-done when CDA negation is present and true."
  * element[+]
    * code = #held
    * display = "held"
    * target
      * code = #not-done
      * display = "Not Done"
      * equivalence = #wider
  * element[+]
    * code = #new
    * display = "new"
    * target
      * code = #not-done
      * display = "Not Done"
      * equivalence = #wider
  * element[+]
    * code = #nullified
    * display = "nullified"
    * target
      * code = #entered-in-error
      * display = "Entered in Error"
      * equivalence = #equivalent
  * element[+]
    * code = #obsolete
    * display = "obsolete"
    * target
      * code = #not-done
      * display = "Not Done"
      * equivalence = #wider
  * element[+]
    * code = #suspended
    * display = "suspended"
    * target
      * code = #not-done
      * display = "Not Done"
      * equivalence = #wider