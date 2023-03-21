<style>
td, th {
   border: 1px solid black!important;
}
</style>

This page provides a mapping from CDA to FHIR. For the FHIR to CDA mapping, please refer to [Patient FHIR → CDA](./FC-patient.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html)

<br />
<br />
### C-CDA to FHIR

|C-CDA¹<br/>[US Realm Header recordTarget](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.1.1.html)|FHIR<br/>[Patient](http://hl7.org/fhir/us/core/StructureDefinition-us-core-patient.html#profile)|Transform Steps|
|:----|:----|:----|
|/patientRole/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/patientRole/addr|.address|[CDA addr ↔ FHIR address ](mappingGuidance.html#cda-addr--fhir-address)|
|/patientRole/telecom|.telecom|[CDA telecom ↔ FHIR telecom](mappingGuidance.html#cda-telecom--fhir-telecom)|
|/patientRole/patient/name|.name|[CDA name ↔ FHIR name ](mappingGuidance.html#cda-name--fhir-name)|
|/patientRole/patient/administrativeGenderCode|.gender|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>[CDA administrativeGender → FHIR gender](ConceptMap-CF-AdministrativeGender.html)|
|/patientRole/patient/birthTime|.birthDate|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|/patientRole/patient/maritalStatusCode|.maritalStatus|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/patientRole/patient/raceCode|.extension:us-core-race|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>This should map to ombCategory extension|
|/patientRole/patient/sdtc:raceCode|.extension:us-core-race|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/patientRole/patient/ethnicGroupCode|.extension:us-core-ethnicity|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>This should map to ombCategory extension|
|/patientRole/patient/sdtc:ethnicGroupCode|.extension:us-core-ethnicity|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/patientRole/patient/languageCommunication/languageCode|.communication.language||
|/patientRole/patient/languageCommunication/preferenceInd|.communication.preferred||
|/patientRole/providerOrganization|.managingOrganization|

1\. XPath abbrievated for C-CDA US Realm recordTarget as: <br/> ```ClinicalDocument/recordTarget/```

### Illustrative example

{% include examplebutton.html example="CF_patient_example" b_title = "Click on Here To See Highlighted Example" %}

#### Links to example content

The consensus mapping example developed through multiple vendors are available below:
* [Patient CDA example](./Binary-CF-patient.html)
* [Patient FHIR example](./Patient-CF-patient.html)

### Prior work and Expanded Spreadsheets

As reviewed in the methodology, a more comprehensive review was performed via spreadsheets. These spreadsheets have been consolidated and further revised in the tables above but are provided for [reference here](https://github.com/HL7/ccda-on-fhir/blob/Feb2023/mappings/CF/CCDA-FHIR%20Patient.csv) 