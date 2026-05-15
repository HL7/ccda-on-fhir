Instance: CF-Severity
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/CF-Severity"
* version = "4.0.1"
* name = "CCDAtoFHIRSeverity"
* title = "C-CDA Severity to FHIR Severity"
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
* description = "C-CDA Severity to FHIR Severity"
* sourceUri = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.88.12.3221.6.8"
* targetUri = "http://hl7.org/fhir/ValueSet/reaction-event-severity"
* group
  * source = "http://snomed.info/sct"
  * target = "http://hl7.org/fhir/reaction-event-severity"
  * element[0]
    * code = #255604002
    * display = "Mild"
    * target
      * code = #mild
      * display = "Mild"
      * equivalence = #equivalent
  * element[+]
    * code = #6736007
    * display = "Moderate"
    * target
      * code = #moderate
      * display = "Moderate"
      * equivalence = #equivalent
  * element[+]
    * code = #24484000
    * display = "Severe"
    * target
      * code = #severe
      * display = "Severe"
      * equivalence = #equivalent