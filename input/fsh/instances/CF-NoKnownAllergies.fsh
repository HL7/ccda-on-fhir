Instance: CF-NoKnownAllergies
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/CF-NoKnownAllergies"
* version = "4.0.1"
* name = "CCDAtoFHIRNoKnownAllergies"
* title = "C-CDA to FHIR No Known Allergies"
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
* description = "C-CDA Allergy Intolerance Observation value to FHIR code for No Known Allergies"
* sourceUri = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.88.12.3221.6.2"
* targetUri = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1186.8"
* group
  * source = "http://snomed.info/sct"
  * target = "http://snomed.info/sct"
  * element[0]
    * code = #414285001
    * display = "Allergy to food"
    * target
      * code = #429625007
      * display = "No known food allergy"
      * equivalence = #equivalent
  * element[+]
    * code = #416098002
    * display = "Allergy to drug"
    * target
      * code = #409137002
      * display = "No known drug allergy"
      * equivalence = #equivalent
  * element[+]
    * code = #419199007
    * display = "Allergy to substance"
    * target
      * code = #716186003
      * display = "No known allergy"
      * equivalence = #equivalent
  * element[+]
    * code = #235719002
    * display = "Intolerance to food"
    * target
      * equivalence = #unmatched
      * comment = "Best practices from CDA are not to have this as the negated value, comments welcome if this should be mapped."
  * element[+]
    * code = #418038007
    * display = "Propensity to adverse reactions to substance"
    * target
      * equivalence = #unmatched
      * comment = "Best practices from CDA are not to have this as the negated value, comments welcome if this should be mapped."
  * element[+]
    * code = #418471000
    * display = "Propensity to adverse reactions to food (finding)"
    * target
      * equivalence = #unmatched
      * comment = "Best practices from CDA are not to have this as the negated value, comments welcome if this should be mapped."
  * element[+]
    * code = #419511003
    * display = "Propensity to adverse reactions to drug"
    * target
      * equivalence = #unmatched
      * comment = "Best practices from CDA are not to have this as the negated value, comments welcome if this should be mapped."
  * element[+]
    * code = #420134006
    * display = "Propensity to adverse reaction"
    * target
      * equivalence = #unmatched
      * comment = "Best practices from CDA are not to have this as the negated value, comments welcome if this should be mapped."