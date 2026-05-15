Instance: FC-ProcedureStatus
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/FC-ProcedureStatus"
* version = "4.0.1"
* name = "FHIRtoCCDAProcedureStatus"
* title = "FHIR to C-CDA Procedure Status"
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
* description = "FHIR to C-CDA Procedure Status"
* sourceUri = "http://hl7.org/fhir/ValueSet/event-status"
* group[0]
  * source = "http://hl7.org/fhir/event-status"
  * target = "http://terminology.hl7.org/CodeSystem/v3-ActStatus|4.0.0"
  * element[0]
    * code = #preparation
    * display = "Preparation"
    * target
      * equivalence = #unmatched
      * comment = "See additional group for nullFlavor mapping"
  * element[+]
    * code = #in-progress
    * display = "In Progress"
    * target
      * code = #active
      * display = "active"
      * equivalence = #equivalent
  * element[+]
    * code = #not-done
    * display = "Not Done"
    * target
      * code = #cancelled
      * display = "cancelled"
      * equivalence = #equivalent
  * element[+]
    * code = #on-hold
    * display = "On Hold"
    * target
      * equivalence = #unmatched
      * comment = "See additional group for nullFlavor mapping"
  * element[+]
    * code = #stopped
    * display = "Stopped"
    * target
      * code = #aborted
      * display = "aborted"
      * equivalence = #equivalent
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
      * equivalence = #unmatched
      * comment = "See additional group for nullFlavor mapping"
  * element[+]
    * code = #unknown
    * display = "Unknown"
    * target
      * equivalence = #unmatched
      * comment = "See additional group for nullFlavor mapping"
* group[+]
  * source = "http://hl7.org/fhir/event-status"
  * target = "http://terminology.hl7.org/CodeSystem/v3-NullFlavor|4.0.0"
  * element[0]
    * code = #preparation
    * display = "Preparation"
    * target
      * code = #OTH
      * display = "other"
      * equivalence = #wider
      * comment = "This value must be mapped into @nullFlavor attribute"
  * element[+]
    * code = #on-hold
    * display = "On Hold"
    * target
      * code = #OTH
      * display = "other"
      * equivalence = #wider
      * comment = "This value must be mapped into @nullFlavor attribute"
  * element[+]
    * code = #entered-in-error
    * display = "Entered in Error"
    * target
      * code = #OTH
      * display = "other"
      * equivalence = #wider
      * comment = "This value must be mapped into @nullFlavor attribute"
  * element[+]
    * code = #unknown
    * display = "Unknown"
    * target
      * code = #UNK
      * display = "unknown"
      * equivalence = #equivalent
      * comment = "This value must be mapped into @nullFlavor attribute"