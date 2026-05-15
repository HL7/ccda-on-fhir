Instance: FC-Criticality
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/FC-Criticality"
* version = "4.0.1"
* name = "FHIRtoCCDACriticality"
* title = "FHIR Criticality to C-CDA Criticality"
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
* description = "FHIR Criticality to C-CDA Criticality"
* sourceUri = "http://hl7.org/fhir/ValueSet/allergy-intolerance-criticality"
* targetUri = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.1.11.20549"
* group
  * source = "http://hl7.org/fhir/allergy-intolerance-criticality"
  * target = "http://terminology.hl7.org/CodeSystem/v3-ObservationValue|5.0.0"
  * element[0]
    * code = #high
    * display = "High Risk"
    * target
      * code = #CRITH
      * display = "high criticality"
      * equivalence = #equivalent
  * element[+]
    * code = #low
    * display = "Low Risk"
    * target
      * code = #CRITL
      * display = "low criticality"
      * equivalence = #equivalent
  * element[+]
    * code = #unable-to-assess
    * display = "Unable to Assess Risk"
    * target
      * code = #CRITU
      * display = "unable to assess criticality"
      * equivalence = #equivalent