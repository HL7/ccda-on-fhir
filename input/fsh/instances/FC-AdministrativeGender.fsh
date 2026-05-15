Instance: FC-AdministrativeGender
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/FC-AdministrativeGender"
* version = "4.0.1"
* name = "FHIRtoCCDAAdminsitrativeGender"
* title = "FHIR to C-CDA Administrative Gender"
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
* description = "FHIR to C-CDA Administrative Gender. Based on http://hl7.org/fhir/cm-administrative-gender-v3.html"
* sourceUri = "http://hl7.org/fhir/ValueSet/administrative-gender"
* targetUri = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.1.11.1"
* group
  * source = "http://hl7.org/fhir/administrative-gender"
  * target = "http://terminology.hl7.org/CodeSystem/v3-AdministrativeGender|4.0.0"
  * element[0]
    * code = #male
    * display = "Male"
    * target
      * code = #M
      * display = "Male"
      * equivalence = #equivalent
  * element[+]
    * code = #female
    * display = "Female"
    * target
      * code = #F
      * display = "Female"
      * equivalence = #equivalent
  * element[+]
    * code = #other
    * display = "Other"
    * target
      * code = #UN
      * display = "Undifferentiated"
      * equivalence = #narrower
      * comment = "Consider using CDA nullFlavor concepts in this instance"