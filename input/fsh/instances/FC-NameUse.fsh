Instance: FC-NameUse
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/FC-NameUse"
* version = "4.0.1"
* name = "FHIRtoCCDANameUse"
* title = "FHIR to C-CDA NameUse"
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
* description = "FHIR to C-CDA NameUse. Based on http://hl7.org/fhir/cm-name-use-v3.html"
* sourceUri = "http://hl7.org/fhir/ValueSet/name-use"
* targetUri = "http://terminology.hl7.org/ValueSet/v3-EntityNameUse"
* group
  * source = "http://hl7.org/fhir/name-use"
  * target = "http://terminology.hl7.org/CodeSystem/v3-EntityNameUse|4.0.0"
  * element[0]
    * code = #usual
    * display = "Usual"
    * target
      * code = #L
      * display = "Legal"
      * equivalence = #equal
      * comment = "Known as/conventional/the one you normally use"
  * element[+]
    * code = #official
    * display = "Official"
    * target[0]
      * code = #C
      * display = "License"
      * equivalence = #equivalent
      * comment = "If another name exists with use=usual, then the official name is equivalent to a license"
    * target[+]
      * code = #L
      * display = "Legal"
      * equivalence = #equivalent
      * comment = "If no other name exist, official may be called \"legal name\""
  * element[+]
    * code = #temp
    * display = "Temp"
    * target.equivalence = #unmatched
  * element[+]
    * code = #nickname
    * display = "Nickname"
    * target
      * code = #P
      * display = "pseudonym"
      * equivalence = #inexact
      * comment = "In CDA, nicknames are identified by a use code of P and qualifiers on name parts of CL (callme)"
  * element[+]
    * code = #anonymous
    * display = "Anonymous"
    * target
      * code = #P
      * display = "pseudonym"
      * equivalence = #equivalent
  * element[+]
    * code = #old
    * display = "Old"
    * target.equivalence = #unmatched
  * element[+]
    * code = #maiden
    * display = "Name changed for Marriage"
    * target.equivalence = #unmatched