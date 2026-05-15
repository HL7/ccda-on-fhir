Instance: CF-AllergyIntoleranceType
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/CF-AllergyIntoleranceType"
* version = "4.0.1"
* name = "CCDAtoFHIRAllergyIntoleranceType"
* title = "CCDA to FHIR Allergy Intolerance Type"
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
* description = "C-CDA Allergy Intolerance Observation value elements to FHIR type codes"
* sourceUri = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.88.12.3221.6.2"
* targetUri = "http://hl7.org/fhir/ValueSet/allergy-intolerance-type"
* group
  * source = "http://snomed.info/sct"
  * target = "http://hl7.org/fhir/allergy-intolerance-type"
  * element[0]
    * code = #235719002
    * display = "Intolerance to food"
    * target
      * code = #intolerance
      * display = "Intolerance"
      * equivalence = #equivalent
  * element[+]
    * code = #414285001
    * display = "Allergy to food"
    * target
      * code = #allergy
      * display = "Allergy"
      * equivalence = #equivalent
  * element[+]
    * code = #416098002
    * display = "Allergy to drug"
    * target
      * code = #allergy
      * display = "Allergy"
      * equivalence = #equivalent
  * element[+]
    * code = #418038007
    * display = "Propensity to adverse reactions to substance"
    * target.equivalence = #unmatched
  * element[+]
    * code = #418471000
    * display = "Propensity to adverse reactions to food"
    * target.equivalence = #unmatched
  * element[+]
    * code = #419199007
    * display = "Allergy to substance"
    * target
      * code = #allergy
      * display = "Allergy"
      * equivalence = #equivalent
  * element[+]
    * code = #419511003
    * display = "Propensity to adverse reactions to drug"
    * target.equivalence = #unmatched
  * element[+]
    * code = #420134006
    * display = "Propensity to adverse reaction"
    * target.equivalence = #unmatched
  * element[+]
    * code = #59037007
    * display = "Intolerance to drug"
    * target
      * code = #intolerance
      * display = "Intolerance"
      * equivalence = #equivalent