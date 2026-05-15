Instance: CF-TelecomUse
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/CF-TelecomUse"
* version = "4.0.1"
* name = "CCDAtoFHIRTelecomUse"
* title = "C-CDA to FHIR Telecom Use"
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
* description = "C-CDA to FHIR Telecom Use"
* sourceUri = "http://terminology.hl7.org/ValueSet/v3-TelecommunicationAddressUse"
* targetUri = "http://hl7.org/fhir/ValueSet/contact-point-use"
* group
  * source = "http://terminology.hl7.org/CodeSystem/v3-AddressUse|4.0.0"
  * target = "http://hl7.org/fhir/contact-point-use"
  * element[0]
    * code = #AS
    * display = "answering service"
    * target
      * code = #work
      * display = "Work"
      * equivalence = #wider
  * element[+]
    * code = #BAD
    * display = "bad address"
    * target
      * code = #old
      * display = "Old"
      * equivalence = #wider
  * element[+]
    * code = #DIR
    * display = "direct"
    * target
      * code = #work
      * display = "Work"
      * equivalence = #wider
  * element[+]
    * code = #EC
    * display = "emergency contact"
    * target.equivalence = #unmatched
  * element[+]
    * code = #H
    * display = "home address"
    * target
      * code = #home
      * display = "Home"
      * equivalence = #equivalent
  * element[+]
    * code = #HP
    * display = "primary home"
    * target
      * code = #home
      * display = "Home"
      * equivalence = #wider
  * element[+]
    * code = #HV
    * display = "vacation home"
    * target
      * code = #home
      * display = "Home"
      * equivalence = #wider
  * element[+]
    * code = #MC
    * display = "mobile contact"
    * target
      * code = #mobile
      * display = "Mobile"
      * equivalence = #equivalent
  * element[+]
    * code = #PG
    * display = "pager"
    * target
      * code = #mobile
      * display = "Mobile"
      * equivalence = #wider
  * element[+]
    * code = #PUB
    * display = "public"
    * target
      * code = #work
      * display = "Work"
      * equivalence = #wider
  * element[+]
    * code = #TMP
    * display = "temporary address"
    * target
      * code = #temp
      * display = "Temp"
      * equivalence = #equivalent
  * element[+]
    * code = #WP
    * display = "work place"
    * target
      * code = #work
      * display = "Work"
      * equivalence = #equivalent