Instance: CF-EncounterStatus
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/CF-EncounterStatus"
* version = "1.2.0"
* name = "CCDAtoFHIREncounterStatus"
* title = "C-CDA to FHIR Encounter Status"
* status = #active
* experimental = false
* date = "2024-09-22T17:40:28+00:00"
* publisher = "HL7 International / Cross-Group Projects"
* contact
  * name = "HL7 International / Cross-Group Projects"
  * telecom
    * system = #url
    * value = "http://www.hl7.org/Special/committees/cgp"
* description = "C-CDA to FHIR Encounter Status"
* jurisdiction = urn:iso:std:iso:3166#US
* sourceUri = "http://terminology.hl7.org/ValueSet/v3-ActStatus"
* targetUri = "http://hl7.org/fhir/ValueSet/encounter-status"
* group
  * source = "http://terminology.hl7.org/CodeSystem/v3-ActStatus|4.0.0"
  * target = "http://hl7.org/fhir/encounter-status"
  * element[0]
    * code = #aborted
    * display = "Aborted"
    * target
      * code = #unknown
      * display = "Unknown"
      * equivalence = #wider
      * comment = "Semantically this could be 'finished', but that might imply completion."
  * element[+]
    * code = #active
    * display = "Active"
    * target
      * code = #in-progress
      * display = "In Progress"
      * equivalence = #equal
  * element[+]
    * code = #cancelled
    * display = "Cancelled"
    * target
      * code = #cancelled
      * display = "Cancelled"
      * equivalence = #equal
  * element[+]
    * code = #completed
    * display = "Completed"
    * target
      * code = #finished
      * display = "Finished"
      * equivalence = #equal
  * element[+]
    * code = #held
    * display = "Held"
    * target
      * code = #planned
      * display = "Planned"
      * equivalence = #wider
      * comment = "Held encounters have been planned, but intent to execute has been suspended."
  * element[+]
    * code = #new
    * display = "New"
    * target
      * code = #unknown
      * display = "Unknown"
      * equivalence = #wider
      * comment = "This is not Planned, because New  encounters have been planned but may or may not have been started. 'Planned' encounters in FHIR have not been started."
  * element[+]
    * code = #suspended
    * display = "Suspended"
    * target
      * code = #onleave
      * display = "On Leave"
      * equivalence = #narrower
      * comment = "Suspended encounters have been started, but intent to execute has been temporarily stopped. On-leave is a special case of this circumstance."
  * element[+]
    * code = #nullified
    * display = "Nullified"
    * target
      * code = #entered-in-error
      * display = "Entered in Error"
      * equivalence = #equal