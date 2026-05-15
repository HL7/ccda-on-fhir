Instance: FC-ImmunizationRefusal
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/FC-ImmunizationRefusal"
* version = "4.0.1"
* name = "FHIRtoCCDAImmunizationRefusal"
* title = "FHIR Immunization Status Reason to C-CDA Immunization Refusal"
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
* description = "FHIR Immunization Status Reason to C-CDA Immunization Refusal"
* sourceUri = "http://hl7.org/fhir/ValueSet/immunization-status-reason"
* targetUri = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.1.11.19717"
* group[0]
  * source = "http://terminology.hl7.org/CodeSystem/v3-ActReason|4.0.0"
  * target = "http://terminology.hl7.org/CodeSystem/v3-ActReason|4.0.0"
  * element[0]
    * code = #IMMUNE
    * display = "immunity"
    * target
      * code = #IMMUNE
      * display = "immunity"
      * equivalence = #equivalent
  * element[+]
    * code = #MEDPREC
    * display = "medical precaution"
    * target
      * code = #MEDPREC
      * display = "medical precaution"
      * equivalence = #equivalent
  * element[+]
    * code = #OSTOCK
    * display = "product out of stock"
    * target
      * code = #OSTOCK
      * display = "product out of stock"
      * equivalence = #equivalent
  * element[+]
    * code = #PATOBJ
    * display = "patient objection"
    * target
      * code = #PATOBJ
      * display = "patient objection"
      * equivalence = #equivalent
* group[+]
  * source = "http://snomed.info/sct"
  * target = "http://terminology.hl7.org/CodeSystem/v3-ActReason|4.0.0"
  * element[0]
    * code = #171257003
    * display = "No consent - Tetanus/low dose diphtheria vaccine"
    * target
      * code = #PATOBJ
      * display = "patient objection"
      * equivalence = #wider
  * element[+]
    * code = #171265000
    * display = "Pertussis vaccine refused"
    * target
      * code = #PATOBJ
      * display = "patient objection"
      * equivalence = #wider
  * element[+]
    * code = #171266004
    * display = "No consent - diphtheria immunization"
    * target
      * code = #PATOBJ
      * display = "patient objection"
      * equivalence = #wider
  * element[+]
    * code = #171267008
    * display = "No consent - tetanus immunization"
    * target
      * code = #PATOBJ
      * display = "patient objection"
      * equivalence = #wider
  * element[+]
    * code = #171268003
    * display = "Polio immunization refused"
    * target
      * code = #PATOBJ
      * display = "patient objection"
      * equivalence = #wider
  * element[+]
    * code = #171269006
    * display = "No consent - measles immunization"
    * target
      * code = #PATOBJ
      * display = "patient objection"
      * equivalence = #wider
  * element[+]
    * code = #171270007
    * display = "No consent - rubella immunization"
    * target
      * code = #PATOBJ
      * display = "patient objection"
      * equivalence = #wider
  * element[+]
    * code = #171271006
    * display = "No consent - BCG"
    * target
      * code = #PATOBJ
      * display = "patient objection"
      * equivalence = #wider
  * element[+]
    * code = #171272004
    * display = "No consent - influenza immunization"
    * target
      * code = #PATOBJ
      * display = "patient objection"
      * equivalence = #wider
  * element[+]
    * code = #171280006
    * display = "No consent for MMR"
    * target
      * code = #PATOBJ
      * display = "patient objection"
      * equivalence = #wider
  * element[+]
    * code = #171283008
    * display = "No consent for any primary immunization"
    * target
      * code = #PATOBJ
      * display = "patient objection"
      * equivalence = #wider
  * element[+]
    * code = #171285001
    * display = "No consent - pre-school vaccinations"
    * target
      * code = #PATOBJ
      * display = "patient objection"
      * equivalence = #wider
  * element[+]
    * code = #171286000
    * display = "No consent - school exit vaccinations"
    * target
      * code = #PATOBJ
      * display = "patient objection"
      * equivalence = #wider
  * element[+]
    * code = #171291004
    * display = "No consent - Haemophilus influenzae type B immunization"
    * target
      * code = #PATOBJ
      * display = "patient objection"
      * equivalence = #wider
  * element[+]
    * code = #171292006
    * display = "No consent pneumococcal immunization"
    * target
      * code = #PATOBJ
      * display = "patient objection"
      * equivalence = #wider
  * element[+]
    * code = #171293001
    * display = "No consent for MR - Measles/rubella vaccine"
    * target
      * code = #PATOBJ
      * display = "patient objection"
      * equivalence = #wider
  * element[+]
    * code = #268559007
    * display = "No consent for any immunization"
    * target
      * code = #PATOBJ
      * display = "patient objection"
      * equivalence = #wider
  * element[+]
    * code = #310839003
    * display = "No consent for MMR1"
    * target
      * code = #PATOBJ
      * display = "patient objection"
      * equivalence = #wider
  * element[+]
    * code = #310840001
    * display = "No consent for second measles, mumps and rubella vaccine"
    * target
      * code = #PATOBJ
      * display = "patient objection"
      * equivalence = #wider
  * element[+]
    * code = #314768003
    * display = "No consent diphtheria, tetanus, pertussis immunization"
    * target
      * code = #PATOBJ
      * display = "patient objection"
      * equivalence = #wider
  * element[+]
    * code = #314769006
    * display = "No consent tetanus plus diphtheria immunization"
    * target
      * code = #PATOBJ
      * display = "patient objection"
      * equivalence = #wider
  * element[+]
    * code = #314936001
    * display = "No consent for meningitis C immunization"
    * target
      * code = #PATOBJ
      * display = "patient objection"
      * equivalence = #wider
  * element[+]
    * code = #407598009
    * display = "No consent for 3rd HIB booster"
    * target
      * code = #PATOBJ
      * display = "patient objection"
      * equivalence = #wider