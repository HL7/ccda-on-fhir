Instance: FC-AddressUse
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/FC-AddressUse"
* version = "4.0.1"
* name = "FHIRtoCCDAAddressUse"
* title = "FHIR to C-CDA Address Use"
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
* description = "FHIR to C-CDA Address Use. Based on http://hl7.org/fhir/cm-address-use-v3.html"
* sourceUri = "http://hl7.org/fhir/ValueSet/address-use"
* targetUri = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.1.11.10637"
* group
  * source = "http://hl7.org/fhir/address-use"
  * target = "http://terminology.hl7.org/CodeSystem/v3-AddressUse|4.0.0"
  * element[0]
    * code = #home
    * display = "Home"
    * target
      * code = #H
      * display = "home address"
      * equivalence = #equivalent
  * element[+]
    * code = #work
    * display = "Work"
    * target
      * code = #WP
      * display = "work place"
      * equivalence = #equivalent
  * element[+]
    * code = #temp
    * display = "Temporary"
    * target
      * code = #TMP
      * display = "temporary address"
      * equivalence = #equivalent
  * element[+]
    * code = #old
    * display = "Old / Incorrect"
    * target
      * code = #BAD
      * display = "bad address"
      * equivalence = #wider
  * element[+]
    * code = #billing
    * display = "Billing"
    * target
      * code = #PST
      * display = "postal address"
      * equivalence = #narrower
      * comment = "Used to send mail"