Instance: CF-Criticality
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/CF-Criticality"
* version = "4.0.1"
* name = "CCDAtoFHIRCriticality"
* title = "CCDA Criticality to FHIR Criticality"
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
* description = "C-CDA Criticality to FHIR Criticality"
* sourceUri = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.1.11.20549"
* targetUri = "http://hl7.org/fhir/ValueSet/allergy-intolerance-criticality"
* group
  * source = "http://terminology.hl7.org/CodeSystem/v3-ObservationValue|5.0.0"
  * target = "http://hl7.org/fhir/allergy-intolerance-criticality"
  * element[0]
    * code = #CRITH
    * display = "high criticality"
    * target
      * code = #high
      * display = "High Risk"
      * equivalence = #equivalent
  * element[+]
    * code = #CRITL
    * display = "low criticality"
    * target
      * code = #low
      * display = "Low Risk"
      * equivalence = #equivalent
  * element[+]
    * code = #CRITU
    * display = "unable to assess criticality"
    * target
      * code = #unable-to-assess
      * display = "Unable to Assess Risk"
      * equivalence = #equivalent