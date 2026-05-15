Instance: FC-AllergyIntoleranceType
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/FC-AllergyIntoleranceType"
* version = "4.0.1"
* name = "FHIRtoCCDAAllergyIntoleranceType"
* title = "FHIR Allergy Intolerance Type to CCDA value"
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
* description = "FHIR type codes to C-CDA Allergy Intolerance Observation value"
* sourceUri = "http://hl7.org/fhir/ValueSet/allergy-intolerance-type"
* targetUri = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.88.12.3221.6.2"
* group
  * source = "http://hl7.org/fhir/allergy-intolerance-type"
  * target = "http://snomed.info/sct"
  * element[0]
    * code = #intolerance
    * display = "Intolerance"
    * target[0]
      * code = #235719002
      * display = "Intolerance to food"
      * equivalence = #narrower
      * comment = "Use this when .category is food"
    * target[+]
      * code = #59037007
      * display = "Intolerance to drug"
      * equivalence = #narrower
      * comment = "Use this when .category is medication"
  * element[+]
    * code = #allergy
    * display = "Allergy"
    * target[0]
      * code = #414285001
      * display = "Allergy to food"
      * equivalence = #narrower
      * comment = "Use this when .category is food"
    * target[+]
      * code = #416098002
      * display = "Allergy to drug"
      * equivalence = #narrower
      * comment = "Use this when .category is medication"
    * target[+]
      * code = #419199007
      * display = "Allergy to substance"
      * equivalence = #narrower
      * comment = "Use this when .category is biologic or environmental"
  * unmapped
    * mode = #fixed
    * code = #420134006
    * display = "Propensity to adverse reaction"