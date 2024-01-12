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
|/patientRole/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/patientRole/addr|.address|[CDA addr ↔ FHIR address ](mappingGuidance.html#cda-addr--fhir-address)|
|/patientRole/telecom|.telecom|[CDA telecom ↔ FHIR telecom](mappingGuidance.html#cda-telecom--fhir-telecom)|
|/patientRole/patient/name|.name|[CDA name ↔ FHIR name ](mappingGuidance.html#cda-name--fhir-name)|
|/patientRole/patient/administrativeGenderCode|.gender|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>[CDA administrativeGender → FHIR gender](ConceptMap-CF-AdministrativeGender.html)|
|/patientRole/patient/birthTime|.birthDate|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates) <br/>**Note:** the FHIR birthDate element is less precise than the CDA birthtime element. Precision can be preserved by also using the extension [`patient-birthTime`](https://hl7.org/fhir/R4/extension-patient-birthtime.html).|
|/patientRole/patient/sdtc:deceasedInd|.deceasedBoolean|**Note:** Only one of `deceasedBoolean` or `deceasedDateTime` may exist. If both are present in CDA, use deceasedDateTime.
|/patientRole/patient/sdtc:deceasedTime|.deceasedDateTime|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/patientRole/patient/maritalStatusCode|.maritalStatus|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/patientRole/patient/raceCode|.extension:[us-core-race](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-race.html): ombCategory|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>This should be a category and map to the ombCategory sub-extension. But if it is a detailed race, then it should go in the detailed sub-extension.|
|/patientRole/patient/sdtc:raceCode|.extension:[us-core-race](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-race.html)|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>If code is in [OMB category](http://hl7.org/fhir/us/core/STU4/ValueSet/omb-race-category), use us-core-race: ombCategory; else use us-core-race: detailed.<br/>If the detailed race is under a different OMB category that the non-sdtc:raceCode element, then an additional OMB category sub-extension should be included as well.|
|/patientRole/patient/ethnicGroupCode|.extension:[us-core-ethnicity](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-ethnicity.html)|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>This should be a category and map to the ombCategory sub-extension. But if it is a detailed race, then it should go in the detailed sub-extension.|
|/patientRole/patient/sdtc:ethnicGroupCode|.extension:[us-core-ethnicity](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-ethnicity.html) : detailed|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>Used for detailed ethnicity|
|/patientRole/patient/languageCommunication/languageCode|.communication.language||
|/patientRole/patient/languageCommunication/preferenceInd|.communication.preferred||
|/patientRole/providerOrganization|.managingOrganization|

1\. XPath abbrievated for C-CDA US Realm recordTarget as: <br/> ClinicalDocument/recordTarget/

### Illustrative example

{% include examplebutton.html example="CF_patient_example" b_title = "Click on Here To See Highlighted Example" %}

#### Links to example content

The consensus mapping example developed through multiple vendors are available below:
* [Patient CDA example](./Binary-CF-patient.html)
* [Patient FHIR example](./Patient-CF-patient.html)

### Prior work and Expanded Spreadsheets

As reviewed in the methodology, a more comprehensive review was performed via spreadsheets. These spreadsheets have been consolidated and further revised in the tables above but are provided for [reference here](https://github.com/HL7/ccda-on-fhir/blob/master/mappings/CF/CCDA-FHIR%20Patient.csv) 