Instance: CF-AllergyStatus
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/CF-AllergyStatus"
* version = "4.0.1"
* name = "CCDAtoFHIRAllergyStatus"
* title = "C-CDA to FHIR Allergy Status"
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
* description = "C-CDA to FHIR Allergy Status"
* sourceUri = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1099.29"
* targetUri = "http://hl7.org/fhir/ValueSet/allergyintolerance-clinical"
* group
  * source = "http://snomed.info/sct"
  * target = "http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical|1.0.1"
  * element[0]
    * code = #413322009
    * display = "Problem Resolved"
    * target
      * code = #resolved
      * display = "Resolved"
      * equivalence = #equivalent
  * element[+]
    * code = #73425007
    * display = "Inactive"
    * target
      * code = #inactive
      * display = "Inactive"
      * equivalence = #equivalent
  * element[+]
    * code = #55561003
    * display = "Active"
    * target
      * code = #active
      * display = "Active"
      * equivalence = #equivalent