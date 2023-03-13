<style>
td, th {
   border: 1px solid black!important;
}
</style>

{% include stu-note-cerner.xml %}

This page provides a mapping from FHIR to CDA. For the CDA to FHIR mapping, please refer to [Patient CDA → FHIR](./CF-patient.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html)

### FHIR to C-CDA

|FHIR<br/>[Patient](http://hl7.org/fhir/us/core/StructureDefinition-us-core-patient.html#profile)|C-CDA¹<br/>[US Realm Header recordTarget]()|Transform Steps|
|:----|:----|:----|
|.extension.extension (race)<br/>```url=http://hl7.org/fhir/us/core/StructureDefinition/us-core-race```|/patientRole/patient/raceCode<br/>&<br/>/patientRole/patient/sdtc:raceCode|ombCategory extension goes in raceCode; other values go in sdtc:raceCode|
|.extension.extension (ethnicity)<br/>```url=http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity```|/patientRole/patient/ethnicGroupCode<br/>&<br/>/patientRole/patient/sdtc:ethnicGroupCode|ombCategory extension goes in ethnicGroupCode; other values go in sdtc:ethnicGroupCode|
|.extension.extension (birth sex)<br/>```url=http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex```|**[Birth Sex]()**|This is not in the header recordTarget in CDA|
|.identifer|/patientRole/id|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|.name|/patientRole/patient/name|[CDA name ↔ FHIR name ](mappingGuidance.html#fhir-name--cda-name)|
|.telecom|/patientRole/telecom|[CDA telecom ↔ FHIR telecom](mappingGuidance.html#fhir-telecom--cda-telecom)|
|.gender|/patientRole/patient/administrativeGenderCode|[FHIR gender → CDA administrativeGender]()|
|.birthdate|/patientRole/patient/birthTime|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|.deceasedDateTime|/patientRole/patient/sdtc:deceasedTime|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|.address|/patientRole/addr|[CDA addr ↔ FHIR address ](mappingGuidance.html#fhir-address---cda-addr)|
|.maritalStatus|/patientRole/patient/maritalStatus|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|.communication.language|/patientRole/patient/languageCommunication/languageCode||
|.communication.preferred|/patientRole/patient/languageCommunication/preferenceInd||
|.generalPractitioner||<mark>**Needs clarification**</mark>|
|.managingOrganization||<mark>**Needs clarification**</mark>|

1\. XPath abbrievated for C-CDA US Realm recordTarget as: <br/> ```ClinicalDocument/recordTarget/```

### Illustrative example

#### Links to example content