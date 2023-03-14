<style>
td, th {
   border: 1px solid black!important;
}
</style>

{% include stu-note-cerner.xml %}

This page provides a mapping from FHIR to CDA. For the CDA to FHIR mapping, please refer to [Patient CDA → FHIR](./CF-patient.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html)

### FHIR to C-CDA

|FHIR<br/>[Patient](http://hl7.org/fhir/us/core/StructureDefinition-us-core-patient.html#profile)|C-CDA¹<br/>[US Realm Header recordTarget](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.1.1.html)|Transform Steps|
|:----|:----|:----|
|.extension.extension (race)<br/>```url=http://hl7.org/fhir/us/core/StructureDefinition/us-core-race```|/patientRole/patient/raceCode<br/>&<br/>/patientRole/patient/sdtc:raceCode|only one ombCategory extension goes in raceCode; other values go in sdtc:raceCode|
|.extension.extension (ethnicity)<br/>```url=http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity```|/patientRole/patient/ethnicGroupCode<br/>&<br/>/patientRole/patient/sdtc:ethnicGroupCode|only one ombCategory extension goes in ethnicGroupCode; other values go in sdtc:ethnicGroupCode|
|.extension.extension (birth sex)<br/>```url=http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex```|**[Birth Sex](https://www.hl7.org/ccdasearch/templates/2.16.840.1.113883.10.20.22.4.200.html)**|This is not in the header recordTarget in CDA|
|.identifer|/patientRole/id|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|.name|/patientRole/patient/name|[CDA name ↔ FHIR name ](mappingGuidance.html#fhir-name--cda-name)|
|.telecom|/patientRole/telecom|[CDA telecom ↔ FHIR telecom](mappingGuidance.html#fhir-telecom--cda-telecom)|
|.gender|/patientRole/patient/administrativeGenderCode|[FHIR gender → CDA administrativeGender](ConceptMap-FC-AdministrativeGender.html)|
|.birthdate|/patientRole/patient/birthTime|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|.deceasedDateTime|/patientRole/patient/sdtc:deceasedTime|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|.address|/patientRole/addr|[CDA addr ↔ FHIR address ](mappingGuidance.html#fhir-address---cda-addr)|
|.maritalStatus|/patientRole/patient/maritalStatus|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|.communication.language|/patientRole/patient/languageCommunication/languageCode||
|.communication.preferred|/patientRole/patient/languageCommunication/preferenceInd||
|.managingOrganization|/patientRole/providerOrganization||

1\. XPath abbrievated for C-CDA US Realm recordTarget as: <br/> ```ClinicalDocument/recordTarget/```

### Illustrative example

#### Links to example content

No examples available (of FHIR to C-CDA) at this time.  

### Prior work and Expanded Spreadsheets

As reviewed in the methodology, a more comprehensive review was performed via spreadsheets. These spreadsheets have been consolidated and further revised in the tables above but are provided for [reference here](https://github.com/HL7/ccda-on-fhir/blob/Feb2023/mappings/FC/FHIR-CCDA%20Patient.csv)