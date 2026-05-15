Instance: FC-NoKnownAllergies
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/FC-NoKnownAllergies"
* version = "4.0.1"
* name = "FHIRtoCCDANoKnownAllergies"
* title = "FHIR to C-CDA No Known Allergies"
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
* description = "FHIR negated code for No Known Allergies to C-CDA Allergy Intolerance Observation value.\n\nNote that when placing the target code in the C-CDA AllergyIntolerance Observation, the Observation must have @negationInd=true."
* sourceUri = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1186.8"
* targetUri = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.88.12.3221.6.2"
* group
  * source = "http://snomed.info/sct"
  * target = "http://snomed.info/sct"
  * element[0]
    * code = #429625007
    * display = "No known food allergy"
    * target
      * code = #414285001
      * display = "Allergy to food"
      * equivalence = #equivalent
      * comment = "Set @negationInd=true"
  * element[+]
    * code = #409137002
    * display = "No known drug allergy"
    * target
      * code = #416098002
      * display = "Allergy to drug"
      * equivalence = #equivalent
      * comment = "Set @negationInd=true"
  * element[+]
    * code = #716186003
    * display = "No known allergy"
    * target
      * code = #419199007
      * display = "Allergy to substance"
      * equivalence = #equivalent
      * comment = "Set @negationInd=true"
  * element[+]
    * code = #428607008
    * display = "No known environmental allergy"
    * target
      * equivalence = #unmatched
      * comment = "There is no clear match that conforms to valueset binding of C-CDA Allergy Intolerance value. Feedback welcome"