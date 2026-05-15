Instance: CF-AddressUse
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/CF-AddressUse"
* version = "4.0.1"
* name = "CCDAtoFHIRAddressUse"
* title = "C-CDA to FHIR Address Use"
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
* description = "C-CDA to FHIR Address Use"
* sourceUri = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.1.11.10637"
* targetUri = "http://hl7.org/fhir/ValueSet/address-use"
* group
  * source = "http://terminology.hl7.org/CodeSystem/v3-AddressUse|4.0.0"
  * target = "http://hl7.org/fhir/address-use"
  * element[0]
    * code = #BAD
    * display = "bad address"
    * target
      * code = #old
      * display = "Old / Incorrect"
      * equivalence = #wider
  * element[+]
    * code = #CONF
    * display = "confidential address"
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
    * code = #TMP
    * display = "temporary address"
    * target
      * code = #temp
      * display = "Temporary"
      * equivalence = #equivalent
  * element[+]
    * code = #WP
    * display = "work place"
    * target
      * code = #work
      * display = "Work"
      * equivalence = #equivalent
  * element[+]
    * code = #DIR
    * display = "direct"
    * target
      * code = #work
      * display = "Work"
      * equivalence = #wider
  * element[+]
    * code = #PUB
    * display = "public"
    * target
      * code = #work
      * display = "Work"
      * equivalence = #wider
  * element[+]
    * code = #PHYS
    * display = "physical visit address"
    * target.equivalence = #unmatched
  * element[+]
    * code = #PST
    * display = "postal address"
    * target.equivalence = #unmatched