Instance: CF-TelecomType
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/CF-TelecomType"
* version = "4.0.1"
* name = "CCDAtoFHIRTelecomType"
* title = "C-CDA to FHIR Telecom Type"
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
* description = "C-CDA to FHIR Telecom Type. In CDA, these are prefixes inside the value attribute. "
* sourceUri = "http://terminology.hl7.org/ValueSet/v3-URLScheme"
* targetUri = "http://hl7.org/fhir/ValueSet/contact-point-system"
* group
  * source = "http://terminology.hl7.org/CodeSystem/v3-URLScheme|4.0.0"
  * target = "http://hl7.org/fhir/contact-point-system"
  * element[0]
    * code = #mailto
    * display = "Mailto"
    * target
      * code = #email
      * display = "Email"
      * equivalence = #equivalent
  * element[+]
    * code = #http
    * display = "HTTP"
    * target
      * code = #url
      * display = "URL"
      * equivalence = #equivalent
  * element[+]
    * code = #tel
    * display = "Telephone"
    * target[0]
      * code = #phone
      * display = "Phone"
      * equivalence = #narrower
      * comment = "Use phone when the @use is not PG (pager)"
    * target[+]
      * code = #pager
      * display = "Pager"
      * equivalence = #narrower
      * comment = "Use pager when the @use is PG (Pager)"
  * element[+]
    * code = #fax
    * display = "Fax"
    * target
      * code = #fax
      * display = "Fax"
      * equivalence = #equivalent
      * comment = "While mappings are provided for both fax and x-text-fax, the latter is the preferred prefix in CDA"
  * element[+]
    * code = #x-text-fax
    * display = "Fax"
    * target
      * code = #fax
      * display = "Fax"
      * equivalence = #equivalent
      * comment = "While mappings are provided for both fax and x-text-fax, the latter is the preferred prefix in CDA"
  * element[+].target
    * code = #sms
    * display = "SMS"
    * equivalence = #narrower
    * comment = "While sms: is not technically designated in CDA, if it's included as such, we recommend mapping to sms in FHIR"