This page includes terminology mapping from CDA to FHIR and FHIR to CDA in two separate sections. This is terminology mapping. For structural transformations, please refer to the [general guidance](mappingGuidance.html) 

### CDA to FHIR Terminology Mapping

#### **Entry Specific CDA to FHIR ConceptMaps** 
- [Allergy Intolerance Observation value (CDA) → AllergyIntolerance type (FHIR)]
- [Allergy Intolerance Observation value (CDA) → AllergyIntolerance category (FHIR)](./ConceptMap-CF-AllergyIntoleranceCategory.html)
- [Criticality value (CDA) → criticality (FHIR)]
- [Immunization Activity statusCode (CDA) → Immunization status (FHIR)]
- [Immunization Refusal Reason (CDA) → Immunization statusReason (FHIR)]
- [Medication Activity statusCode (CDA) → (FHIR)]
- [Problem Status (CDA) → Condition clinicalStatus (FHIR)]
- [Procedure Status (CDA) → Procedure status (FHIR)]
- [Section code (CDA) → Condition category (FHIR)]
- [Severity Observation value (CDA) → Reaction Event severity (FHIR)]

#### **General CDA to FHIR ConceptMaps** 
- [Administrative Gender (CDA) → Patient gender (FHIR)]
- [Addr use  (CDA) → Address use (FHIR)]
- [Name use (CDA) → Name use (FHIR)]
- [NullFlavor (CDA) → Data Absent Reason code (FHIR)](./ConceptMap-CF-NullFlavorDataAbsentReason.html)
- [Telecom use (CDA) → telecom contact point use (FHIR)]
- [Telecom value (CDA) → telecom contact point type (FHIR)]

### FHIR to CDA Terminology Mapping

#### **Resource Specific FHIR to CDA ConceptMaps** 
- [AllergyIntolerance type (FHIR) → Allergy Intolerance Observation value (CDA)]
- [AllergyIntolerance category (FHIR) → Allergy Intolerance Observation value (CDA)]
- [criticality (FHIR) → Criticality value (CDA) ]
- [Immunization status (FHIR) → Immunization Activity statusCode (CDA)]
- [Immunization statusReason (FHIR) → Immunization Refusal Reason (CDA)]
- [ MedicationRequest status(FHIR) → Medication Activity statusCode (CDA)]
- [Condition clinicalStatus (FHIR) → Problem Status (CDA)]
- [Procedure status (FHIR) → Procedure Status (CDA)]
- [Condition category (FHIR) → Section code (CDA)]
- [Reaction Event severity (FHIR) → Severity Observation value (CDA)]

#### **General FHIR to CDA ConceptMaps** 
- [ Patient gender (FHIR) → Administrative Gender (CDA)]
- [Address use (FHIR) → Addr use (CDA)]
- [Name use (FHIR) → Name use (CDA)]
- [Data Absent Reason code (FHIR) → NullFlavor (CDA)]
- [Telecom contact point type (FHIR) → Telecom value (CDA)] 
- [Telecom contact point use (FHIR) → Telecom use (CDA)] 
