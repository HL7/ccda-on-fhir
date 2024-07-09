<style>
td, th {
   border: 1px solid black!important;
}
</style>

This page provides a mapping from CDA to FHIR. For the FHIR to CDA mapping, please refer to [Patient FHIR → CDA](./FC-patient.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html)

<br />
<br />
### C-CDA to FHIR

|C-CDA¹<br/>[US Realm Header recordTarget](https://hl7.org/cda/us/ccda/2024Jan/StructureDefinition-USRealmHeader.html)|FHIR<br/>[Patient](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-patient.html#profile)|Transform Steps|
|:----|:----|:----|
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/addr|.address|[CDA addr ↔ FHIR address ](mappingGuidance.html#cda-addr--fhir-address)|
|/telecom|.telecom|[CDA telecom ↔ FHIR telecom](mappingGuidance.html#cda-telecom--fhir-telecom)|
|/patient/name|.name|[CDA name ↔ FHIR name ](mappingGuidance.html#cda-name--fhir-name)|
|/patient/administrativeGenderCode|.gender|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>[CDA administrativeGender → FHIR gender](ConceptMap-CF-AdministrativeGender.html)|
|/patient/birthTime|.birthDate|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates) <br/>**Note:** the FHIR birthDate element is less precise than the CDA birthtime element. Precision can be preserved by also using the extension [`patient-birthTime`](https://hl7.org/fhir/R4/extension-patient-birthtime.html).|
|/patient/sdtc:deceasedInd|.deceasedBoolean|**Note:** Only one of `deceasedBoolean` or `deceasedDateTime` may exist. If both are present in CDA, use deceasedDateTime.
|/patient/sdtc:deceasedTime|.deceasedDateTime|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/patient/maritalStatusCode|.maritalStatus|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/patient/raceCode|.extension:[us-core-race](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-race.html): ombCategory|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>This should be a category and map to the ombCategory sub-extension. But if it is a detailed race, then it should go in the detailed sub-extension.|
|/patient/sdtc:raceCode|.extension:[us-core-race](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-race.html)|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>If code is in [OMB category](http://hl7.org/fhir/us/core/ValueSet/omb-race-category), use us-core-race: ombCategory; else use us-core-race: detailed.<br/>If the detailed race is under a different OMB category that the non-sdtc:raceCode element, then an additional OMB category sub-extension should be included as well.|
|/patient/raceCode/originalText<br/>and<br/>/patient/sdtc:raceCode/originalText|.extension:[us-core-race](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-race.html): text|The race extension's text sub-extension is required but may only exist once. Recommendation is to comma-delimit all originalText / displayNames available, taking care to not duplicate values.
|/patient/ethnicGroupCode|.extension:[us-core-ethnicity](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-ethnicity.html)|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>This should be a category and map to the ombCategory sub-extension. But if it is a detailed race, then it should go in the detailed sub-extension.|
|/patient/sdtc:ethnicGroupCode|.extension:[us-core-ethnicity](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-ethnicity.html) : detailed|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>Used for detailed ethnicity|
|/patient/guardian/code<br/>and<br/>/patient/guardian/guardianPerson/sdtc:asPatientRelationship/code|.contact.relationship|First, add a fixed relationship code of  `GUARD` from [v3 RoleCode](http://terminology.hl7.org/CodeSystem/v3-RoleCode) (`http://terminology.hl7.org/CodeSystem/v3-RoleCode`) to preserve the CDA guardian relationship. Then map the two fields to additional relationship entries using [CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)
|/patient/guardian/addr|.contact.address|[CDA addr ↔ FHIR address ](mappingGuidance.html#cda-addr--fhir-address)|
|/patient/guardian/telecom|.contact.telecom|[CDA telecom ↔ FHIR telecom](mappingGuidance.html#cda-telecom--fhir-telecom)|
|/patient/guardian/guardianPerson/name|.contact.name|[CDA name ↔ FHIR name ](mappingGuidance.html#cda-name--fhir-name)|
|/patient/languageCommunication/languageCode|.communication.language||
|/patient/languageCommunication/preferenceInd|.communication.preferred||
|/providerOrganization|.managingOrganization|

1\. XPath abbrievated for C-CDA US Realm recordTarget as: <br/> ClinicalDocument/recordTarget/patientRole

### Illustrative example

{% include examplebutton.html example="CF_patient_example" b_title = "Click Here To See Highlighted Example" %}

#### Links to example content

The consensus mapping example developed through multiple vendors are available below:
* [Patient CDA example](./Binary-CF-patient.html)
* [Patient FHIR example](./Patient-CF-patient.html)

### Prior work and Expanded Spreadsheets

As reviewed in the methodology, a more comprehensive review was performed via spreadsheets. These spreadsheets have been consolidated and further revised in the tables above but are provided for [reference here](https://github.com/HL7/ccda-on-fhir/blob/master/mappings/CF/CCDA-FHIR%20Patient.csv) 