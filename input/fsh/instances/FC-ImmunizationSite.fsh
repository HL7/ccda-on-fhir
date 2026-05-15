Instance: FC-ImmunizationSite
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/FC-ImmunizationSite"
* version = "4.0.1"
* name = "FHIRtoCCDAImmunizationSite"
* title = "FHIR Immunization Site to C-CDA Immunization approachSiteCode"
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
* description = "FHIR Immunization Site to C-CDA Immunization approachSiteCode. Note that the FHIR valueset is example and may be incomplete (only 2 codes)"
* sourceUri = "http://hl7.org/fhir/ValueSet/immunization-site"
* targetUri = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.88.12.3221.8.9"
* group
  * source = "http://terminology.hl7.org/CodeSystem/v3-ActSite|4.0.0"
  * target = "http://snomed.info/sct"
  * element[0]
    * code = #LA
    * display = "left arm"
    * target
      * code = #368208006
      * display = "Left upper arm structure"
      * equivalence = #equivalent
  * element[+]
    * code = #RA
    * display = "right arm"
    * target
      * code = #368209003
      * display = "Right upper arm structure"
      * equivalence = #equivalent