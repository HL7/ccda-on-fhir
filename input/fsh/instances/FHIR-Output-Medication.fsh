Instance: FHIR-Output-Medication
InstanceOf: Medication
Usage: #example
Description: "Medication resource for the CDA-to-FHIR mapping example (referenced by FHIR-Output-MedicationRequest per decision D-med-4): code from consumable/manufacturedMaterial, form from administrationUnitCode, manufacturer from manufacturerOrganization, drug vehicle as inactive ingredient."
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-medication"
* code = $rxnorm#1190220 "albuterol 0.1 MG/ACTUAT / ipratropium bromide 0.02 MG/ACTUAT Metered Dose Inhalation Spray, 120 ACTUAT"
* form = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C48501 "INHALATION"
* manufacturer.display = "Good Pharma Inc"
* ingredient
  * itemCodeableConcept = $sct#387390002 "sodium chloride"
  * isActive = false
