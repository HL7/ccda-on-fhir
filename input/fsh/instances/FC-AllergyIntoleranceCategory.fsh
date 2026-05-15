Instance: FC-AllergyIntoleranceCategory
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/FC-AllergyIntoleranceCategory"
* version = "4.0.1"
* name = "FHIRtoCCDAAllergyIntoleranceCategory"
* title = "FHIR to CCDA Allergy Intolerance Category"
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
* description = "FHIR AllergyIntolerance category code to C-CDA Allergy Intolerance Observation value"
* sourceUri = "http://hl7.org/fhir/ValueSet/allergy-intolerance-category"
* targetUri = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.88.12.3221.6.2"
* group
  * source = "http://hl7.org/fhir/allergy-intolerance-category"
  * target = "http://snomed.info/sct"
  * element[0]
    * code = #food
    * display = "Food"
    * target[0]
      * code = #235719002
      * display = "Intolerance to food"
      * equivalence = #narrower
      * comment = "Use this when .type is intolerance"
    * target[+]
      * code = #414285001
      * display = "Allergy to food"
      * equivalence = #narrower
      * comment = "Use this when .type is allergy"
    * target[+]
      * code = #418471000
      * display = "Propensity to adverse reactions to food"
      * equivalence = #narrower
      * comment = "Use this when .type is not present"
  * element[+]
    * code = #medication
    * display = "Medication"
    * target[0]
      * code = #59037007
      * display = "Intolerance to drug"
      * equivalence = #narrower
      * comment = "Use this when .type is intolerance"
    * target[+]
      * code = #416098002
      * display = "Allergy to drug"
      * equivalence = #narrower
      * comment = "Use this when .type is allergy"
    * target[+]
      * code = #419511003
      * display = "Propensity to adverse reactions to drug"
      * equivalence = #narrower
      * comment = "Use this when .type is not present"
  * element[+]
    * code = #environment
    * display = "Environment"
    * target[0]
      * code = #419199007
      * display = "Allergy to substance"
      * equivalence = #narrower
      * comment = "Use this when .type is allergy"
    * target[+]
      * code = #418038007
      * display = "Propensity to adverse reaction to substance"
      * equivalence = #narrower
      * comment = "Use this when .type is intolerance or not present"
  * element[+]
    * code = #biologic
    * display = "Biologic"
    * target[0]
      * code = #419199007
      * display = "Allergy to substance"
      * equivalence = #narrower
      * comment = "Use this when .type is allergy"
    * target[+]
      * code = #418038007
      * display = "Propensity to adverse reaction to substance"
      * equivalence = #narrower
      * comment = "Use this when .type is intolerance or not present"
  * unmapped
    * mode = #fixed
    * code = #420134006
    * display = "Propensity to adverse reaction"