Instance: FC-TelecomType
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/FC-TelecomType"
* version = "4.0.1"
* name = "FHIRtoCCDATelecomType"
* title = "FHIR to C-CDA Telecom Type"
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
* description = "FHIR to C-CDA Telecom Type. In CDA, these are prefixes inside the value attribute."
* sourceUri = "http://hl7.org/fhir/ValueSet/contact-point-system"
* group
  * source = "http://hl7.org/fhir/contact-point-system"
  * target = "http://terminology.hl7.org/CodeSystem/v3-URLScheme|4.0.0"
  * element[0]
    * code = #email
    * display = "Email"
    * target
      * code = #mailto
      * display = "Mailto"
      * equivalence = #equivalent
  * element[+]
    * code = #url
    * display = "URL"
    * target
      * code = #http
      * display = "HTTP"
      * equivalence = #equivalent
  * element[+]
    * code = #phone
    * display = "Phone"
    * target
      * code = #tel
      * display = "Telephone"
      * equivalence = #wider
  * element[+]
    * code = #pager
    * display = "Pager"
    * target
      * code = #tel
      * display = "Telephone"
      * equivalence = #wider
      * comment = "Note that the @use should be set to PG"
  * element[+]
    * code = #fax
    * display = "Fax"
    * target
      * code = #x-text-fax
      * display = "Fax"
      * equivalence = #equivalent