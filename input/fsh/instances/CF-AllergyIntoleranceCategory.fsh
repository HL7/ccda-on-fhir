Instance: CF-AllergyIntoleranceCategory
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/CF-AllergyIntoleranceCategory"
* version = "4.0.1"
* name = "CCDAtoFHIRAllergyIntoleranceCategory"
* title = "CCDA to FHIR Allergy Intolerance Category"
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
* description = "C-CDA Allergy Intolerance Observation value elements to FHIR category codes"
* sourceUri = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.88.12.3221.6.2"
* targetUri = "http://hl7.org/fhir/ValueSet/allergy-intolerance-category"
* group
  * source = "http://snomed.info/sct"
  * target = "http://hl7.org/fhir/allergy-intolerance-category"
  * element[0]
    * code = #418038007
    * display = "Propensity to adverse reactions to substance"
    * target.equivalence = #unmatched
  * element[+]
    * code = #419199007
    * display = "Allergy to substance"
    * target.equivalence = #unmatched
  * element[+]
    * code = #420134006
    * display = "Propensity to adverse reaction"
    * target.equivalence = #unmatched
  * element[+]
    * code = #235719002
    * display = "Intolerance to food"
    * target
      * code = #food
      * display = "Food"
      * equivalence = #equivalent
  * element[+]
    * code = #414285001
    * display = "Allergy to food"
    * target
      * code = #food
      * display = "Food"
      * equivalence = #equivalent
  * element[+]
    * code = #418471000
    * display = "Propensity to adverse reactions to food"
    * target
      * code = #food
      * display = "Food"
      * equivalence = #equivalent
  * element[+]
    * code = #416098002
    * display = "Allergy to drug"
    * target
      * code = #medication
      * display = "Medication"
      * equivalence = #equivalent
  * element[+]
    * code = #419511003
    * display = "Propensity to adverse reactions to drug"
    * target
      * code = #medication
      * display = "Medication"
      * equivalence = #equivalent
  * element[+]
    * code = #59037007
    * display = "Intolerance to drug"
    * target
      * code = #medication
      * display = "Medication"
      * equivalence = #equivalent