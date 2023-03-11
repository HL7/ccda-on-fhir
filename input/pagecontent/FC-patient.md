<style>
td, th {
   border: 1px solid black!important;
}
</style>

{% include stu-note.xml %}

This page provides a mapping from FHIR to CDA. For the CDA to FHIR mapping, please refer to [Patient CDA → FHIR](./CF-patient.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html)

### FHIR to C-CDA

|FHIR|CDA|Transform Steps|
|:----|:----|:----|
|us-core-race|raceCode||
|us-core-race|raceCode|First value goes in schema element; additional values go in extension|
|us-core-race|sdtc:raceCode||
|us-core-ethnicity|ethnicGroupCode||
|us-core-ethnicity|ethnicGroupCode||
|us-core-ethnicity|sdtc:ethnicGroupCode||
|us-core-birthsex|value|Confirm Social History is the right section|
|Identifer|id||
|name|/name||
|telecom|/telecom||
|gender|/administrativeGenderCode||
|gender||We could leave these two out and rely on the Null/Absent map|
|gender|||
|birthdate|/birthTime||
|deceasedDateTime|/effectiveTime||
|address|/addr||
|maritalStatus|/maritalStatus||
|maritalStatus|/maritalStatus|"C-to-F will have one more value|
|communication.language|/languageCommunication/languageCode||
|communication.preferred|/languageCommunication/preferenceInd||
|generalPractitioner|/providerOrganization||
|managingOrganization|/custodian||


### Illustrative example

#### Links to example content