Instance: CF-AdministrativeGender
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/CF-AdministrativeGender"
* version = "4.0.1"
* name = "CCDAtoFHIRAdminsitrativeGender"
* title = "C-CDA to FHIR Administrative Gender"
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
* description = "C-CDA to FHIR Administrative Gender"
* sourceUri = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.1.11.1"
* targetUri = "http://hl7.org/fhir/ValueSet/administrative-gender"
* group
  * source = "http://terminology.hl7.org/CodeSystem/v3-AdministrativeGender|4.0.0"
  * target = "http://hl7.org/fhir/administrative-gender"
  * element[0]
    * code = #M
    * display = "Male"
    * target
      * code = #male
      * display = "Male"
      * equivalence = #equivalent
  * element[+]
    * code = #F
    * display = "Female"
    * target
      * code = #female
      * display = "Female"
      * equivalence = #equivalent
  * element[+]
    * code = #UN
    * display = "Undifferentiated"
    * target
      * code = #other
      * display = "Other"
      * equivalence = #wider
  * unmapped
    * mode = #fixed
    * code = #unknown
    * display = "Unknown"