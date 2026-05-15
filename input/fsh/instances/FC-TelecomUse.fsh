Instance: FC-TelecomUse
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/FC-TelecomUse"
* version = "4.0.1"
* name = "FHIRtoCCDATelecomUse"
* title = "FHIR to C-CDA Telecom Use"
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
* description = "FHIR to C-CDA Telecom Use. Note that CDA's PG use code is equivalent to FHIR's ContactPoint.system of 'pager'."
* sourceUri = "http://hl7.org/fhir/ValueSet/contact-point-use"
* targetUri = "http://terminology.hl7.org/ValueSet/v3-TelecommunicationAddressUse"
* group
  * source = "http://hl7.org/fhir/contact-point-use"
  * target = "http://terminology.hl7.org/CodeSystem/v3-AddressUse|4.0.0"
  * element[0]
    * code = #home
    * display = "Home"
    * target[0]
      * code = #HP
      * display = "primary home"
      * equivalence = #narrower
      * comment = "Primary home would be recommended default."
    * target[+]
      * code = #HV
      * display = "vacation home"
      * equivalence = #narrower
      * comment = "Primary home would be recommended default."
  * element[+]
    * code = #work
    * display = "Work"
    * target
      * code = #WP
      * display = "work place"
      * equivalence = #equivalent
  * element[+]
    * code = #temp
    * display = "Temp"
    * target
      * code = #TMP
      * display = "temporary address"
      * equivalence = #equivalent
  * element[+]
    * code = #old
    * display = "Old"
    * target
      * code = #BAD
      * display = "bad address"
      * equivalence = #narrower
      * comment = "Age is not implied in CDA value"
  * element[+]
    * code = #mobile
    * display = "Mobile"
    * target
      * code = #MC
      * display = "mobile contact"
      * equivalence = #equivalent