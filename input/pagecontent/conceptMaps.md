This page includes terminology mapping from CDA to FHIR and FHIR to CDA in two separate sections. This is terminology mapping. For structural transformations, please refer to the [general guidance](mappingGuidance.html) 

### CDA to FHIR Terminology Mapping

#### **Entry Specific CDA to FHIR ConceptMaps** 
- [Allergy Intolerance Observation value (CDA) → AllergyIntolerance type (FHIR)](./ConceptMap-CF-AllergyIntoleranceType.html)
- [Allergy Intolerance Observation value (CDA) → AllergyIntolerance category (FHIR)](./ConceptMap-CF-AllergyIntoleranceCategory.html)
- [Allergy Status Observation (CDA) → AllergyIntolerance clinicalStatus (FHIR)](./ConceptMap-CF-AllergyStatus.html)
- [Criticality value (CDA) → criticality (FHIR)](./ConceptMap-CF-Criticality.html)
- [Immunization Activity statusCode (CDA) → Immunization status (FHIR)](./ConceptMap-CF-ImmunizationStatus.html)
- [Immunization Refusal Reason (CDA) → Immunization statusReason (FHIR)](./ConceptMap-CF-ImmunizationRefusal.html)
- [Medication Activity statusCode (CDA) → MedicationRequest status (FHIR)](./ConceptMap-CF-MedicationStatus.html)
- [No Known Allergies (CDA) → negated code (FHIR)](./ConceptMap-CF-NoKnownAllergies.html)
- [Problem Status Observation value (CDA) → Condition clinicalStatus (FHIR)](./ConceptMap-CF-ProblemStatus.html)
- [Procedure Status (CDA) → Procedure status (FHIR)](./ConceptMap-CF-ProcedureStatus.html)
- [Section code (CDA) → Condition category (FHIR)](./ConceptMap-CF-ProblemCategory.html)
- [Severity Observation value (CDA) → Reaction Event severity (FHIR)](./ConceptMap-CF-Severity.html)

#### **General CDA to FHIR ConceptMaps** 
- [Addr use  (CDA) → Address use (FHIR)](./ConceptMap-CF-AddressUse.html)
- [Administrative Gender (CDA) → Patient gender (FHIR)](./ConceptMap-CF-AdministrativeGender.html)
- [Name use (CDA) → Name use (FHIR)](./ConceptMap-CF-NameUse.html)
- [NullFlavor (CDA) → Data Absent Reason code (FHIR)](./ConceptMap-CF-NullFlavorDataAbsentReason.html)
- [Telecom use (CDA) → telecom contact point use (FHIR)](./ConceptMap-CF-TelecomUse.html)
- [Telecom value (CDA) → telecom contact point type (FHIR)](./ConceptMap-CF-TelecomType.html)

### FHIR to CDA Terminology Mapping

#### **Resource Specific FHIR to CDA ConceptMaps** 
- [AllergyIntolerance type (FHIR) → Allergy Intolerance Observation value (CDA)](./ConceptMap-FC-AllergyIntoleranceType.html)
- [AllergyIntolerance category (FHIR) → Allergy Intolerance Observation value (CDA)](./ConceptMap-FC-AllergyIntoleranceCategory.html)
- [AllergyIntolerance clinicalStatus (FHIR) → Allergy Status Observation (CDA)](./ConceptMap-FC-AllergyStatus.html) 
- [Criticality (FHIR) → Criticality value (CDA)](./ConceptMap-FC-Criticality.html)
- [Immunization status (FHIR) → Immunization Activity statusCode (CDA)](./ConceptMap-FC-ImmunizationStatus.html)
- [Immunization statusReason (FHIR) → Immunization Refusal Reason (CDA)](./ConceptMap-FC-ImmunizationRefusal.html)
- [MedicationRequest status(FHIR) → Medication Activity statusCode (CDA)](./ConceptMap-FC-MedicationStatus.html)
- [Negated code (FHIR) → No Known Allergies (CDA)](./ConceptMap-FC-NoKnownAllergies.html)
- [Condition clinicalStatus (FHIR) → Problem Status Observation value (CDA)](./ConceptMap-FC-ProblemStatus.html)
- [Procedure status (FHIR) → Procedure Status (CDA)](./ConceptMap-FC-ProcedureStatus.html)
- [Condition category (FHIR) → Section code (CDA)](./ConceptMap-FC-ProblemCategory.html)
- [Reaction Event severity (FHIR) → Severity Observation value (CDA)](./ConceptMap-FC-Severity.html)

#### **General FHIR to CDA ConceptMaps** 
- [Address use (FHIR) → Addr use (CDA)](./ConceptMap-FC-AddressUse.html)
- [Administrative gender (FHIR) → Administrative Gender (CDA)](./ConceptMap-FC-AdministrativeGender.html)
- [Data Absent Reason code (FHIR) → NullFlavor (CDA)](./ConceptMap-FC-DataAbsentReasonNullFlavor.html)
- [Name use (FHIR) → Name use (CDA)](./ConceptMap-FC-NameUse.html)
- [Telecom contact point type (FHIR) → Telecom value (CDA)](./ConceptMap-FC-TelecomType.html) 
- [Telecom contact point use (FHIR) → Telecom use (CDA)](./ConceptMap-FC-TelecomUse.html) 
