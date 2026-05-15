Instance: FC-AllergyStatus
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/FC-AllergyStatus"
* version = "4.0.1"
* name = "FHIRtoCCDAAllergyStatus"
* title = "FHIR to C-CDA Allergy Status"
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
* description = "FHIR to C-CDA Allergy Status"
* sourceUri = "http://hl7.org/fhir/ValueSet/allergyintolerance-clinical"
* targetUri = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1099.29"
* group
  * source = "http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical|1.0.1"
  * target = "http://snomed.info/sct"
  * element[0]
    * code = #resolved
    * display = "Resolved"
    * target
      * code = #413322009
      * display = "Problem Resolved"
      * equivalence = #equivalent
  * element[+]
    * code = #inactive
    * display = "Inactive"
    * target
      * code = #73425007
      * display = "Inactive"
      * equivalence = #equivalent
  * element[+]
    * code = #active
    * display = "Active"
    * target
      * code = #55561003
      * display = "Active"
      * equivalence = #equivalent