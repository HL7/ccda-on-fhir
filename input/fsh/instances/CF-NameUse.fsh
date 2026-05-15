Instance: CF-NameUse
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/CF-NameUse"
* version = "4.0.1"
* name = "CCDAtoFHIRNameUse"
* title = "C-CDA to FHIR NameUse"
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
* description = "C-CDA to FHIR NameUse"
* sourceUri = "http://terminology.hl7.org/ValueSet/v3-EntityNameUse"
* targetUri = "http://hl7.org/fhir/ValueSet/name-use"
* group
  * source = "http://terminology.hl7.org/CodeSystem/v3-EntityNameUse|4.0.0"
  * target = "http://hl7.org/fhir/name-use"
  * element[0]
    * code = #A
    * display = "Artist/Stage"
    * target
      * code = #nickname
      * display = "Nickname"
      * equivalence = #inexact
      * comment = "If a name part - e.g. given - contains a qualifier of CL (callme), then this name is a nickname"
  * element[+]
    * code = #ABC
    * display = "Alphabetic"
    * target.equivalence = #unmatched
  * element[+]
    * code = #ASGN
    * display = "assigned"
    * target.equivalence = #unmatched
  * element[+]
    * code = #C
    * display = "License"
    * target
      * code = #official
      * display = "Official"
      * equivalence = #wider
      * comment = "Official name which might not be commonly used. Generally C is only present if different from L."
  * element[+]
    * code = #IDE
    * display = "Ideographic"
    * target.equivalence = #unmatched
  * element[+]
    * code = #L
    * display = "Legal"
    * target
      * code = #usual
      * display = "Usual"
      * equivalence = #equal
      * comment = "Known as/conventional/the one you normally use"
  * element[+]
    * code = #P
    * display = "pseudonym"
    * target[0]
      * code = #nickname
      * display = "Nickname"
      * equivalence = #inexact
      * comment = "If a name part - e.g. given - contains a qualifier of CL (callme), then this name is a nickname"
    * target[+]
      * code = #anonymous
      * display = "Anonymous"
      * equivalence = #narrower
      * comment = "Pseudonyms without a CL qualifier"
  * element[+]
    * code = #PHON
    * display = "phonetic"
    * target.equivalence = #unmatched
  * element[+]
    * code = #R
    * display = "Religious"
    * target.equivalence = #unmatched
  * element[+]
    * code = #SNDX
    * display = "Soundex"
    * target.equivalence = #unmatched
  * element[+]
    * code = #SRCH
    * display = "search"
    * target.equivalence = #unmatched
  * element[+]
    * code = #SYL
    * display = "Syllabic"
    * target.equivalence = #unmatched