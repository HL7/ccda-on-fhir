Instance: FC-Severity
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/FC-Severity"
* version = "4.0.1"
* name = "FHIRtoCCDASeverity"
* title = "FHIR Severity to C-CDA Severity"
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
* description = "FHIR Severity to C-CDA Severity"
* sourceUri = "http://hl7.org/fhir/ValueSet/reaction-event-severity"
* targetUri = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.88.12.3221.6.8"
* group
  * source = "http://hl7.org/fhir/reaction-event-severity"
  * target = "http://snomed.info/sct"
  * element[0]
    * code = #mild
    * display = "Mild"
    * target
      * code = #255604002
      * display = "Mild"
      * equivalence = #equivalent
  * element[+]
    * code = #moderate
    * display = "Moderate"
    * target
      * code = #6736007
      * display = "Moderate"
      * equivalence = #equivalent
  * element[+]
    * code = #severe
    * display = "Severe"
    * target
      * code = #24484000
      * display = "Severe"
      * equivalence = #equivalent