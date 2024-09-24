<style>
td, th {
   border: 1px solid black!important;
}
</style>

CDA defines participants in a number of elements, but the structure is often similar. These represent people (usually providers), organizations, and in some cases devices, locations, or some combination of all of the above.

The FHIR equivalent of these fields are most commonly Practitioner, Organization, and PractitionerRole resources. Occasionally RelatedPerson, Device, or Location may be appropriate targets of CDA participants as well.

The following table shows the common and unique fields of each CDA participation type. Since all (except Participant) are just specific flavors of participation, they can all be mapped to FHIR fairly similarly. For Participant mapping, the `@typeCode` and `@classCode` attributes are key in determining the type of FHIR resource to create.

|[Author](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-Author.html)<br/>(Non-Device)|[Data Enterer](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-DataEnterer.html)|[Informant](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-Informant.html)|[Performer](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-Performer2.html) / <br/>[Performer (Service Event)](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-Performer1.html)|[Participant](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-Participant1.html)<br/>(ClinicalDocument)|[Participant](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-Participant2.html)<br/>(Everywhere Else)|
|:----|:----|:----|:----|:----|:----|
|`@typeCode=AUT`|`@typeCode=ENT`|`@typeCode=INF`|`@typeCode=PRF`|@typeCode|@typeCode
|functionCode|||sdtc:functionCode<br/>(no sdtc: in ServiceEvent)|functionCode|sdtc:functionCode
|time|time||time|time|time
||||modeCode (not in serviceEvent)||awarenessCode
|**assignedAuthor**|**assignedEntity**|**assignedEntity**<br/>or<br/>**relatedEntity**|**assignedEntity**|**associatedEntity**|**participantRole**
|`/@classCode=ASSIGNED`|`/@classCode=ASSIGNED`|/@classCode<br/>(assignedEntity = `ASSIGNED`)|/`@classCode=ASSIGNED`|/@classCode|/@classCode
|/id|/id|/id (not in related)|/id|/id|/id
|/code|/code|/code|/code|/code|/code
|/addr|/addr|/addr|/addr|/addr|/addr
|/telecom|/telecom|/telecom|/telecom|/telecom|/telecom
|||/effectiveTime (only in related)
||/sdtc:patient/id|/sdtc:patient/id (not in related)|/sdtc:patient/id
|/**assignedPerson**|/**assignedPerson**|/**assignedPerson**<br/>or<br/>/**relatedPerson**|/**assignedPerson**|/**associatedPerson**|/**playingEntity**
|//`@classCode=PSN`|//`@classCode=PSN`|//`@classCode=PSN`|//`@classCode=PSN`|//`@classCode=PSN`|//@classCode
|//name|//name|//name|//name|//name|//name
|//sdtc:desc|//sdtc:desc|//sdtc:desc|//sdtc:desc|//sdtc:desc|//desc
|//asPatientRelationship/code|//asPatientRelationship/code|//asPatientRelationship/code|//asPatientRelationship/code|//asPatientRelationship/code
||||||//quantity
||||||//sdtc:birthTime
|/**representedOrganization**|/**representedOrganization**|/**representedOrganization**<br/>(not in related)|/**representedOrganization**|/**scopingOrganization**|/**scopingEntity**
|/`@classCode=ORG`|/`@classCode=ORG`|/`@classCode=ORG`|/`@classCode=ORG`|/`@classCode=ORG`|//@classCode
|//id|//id|//id|//id|//id|//id
|//name|//name|//name|//name|//name|//desc
|//telecom|//telecom|//telecom|//telecom|//telecom
|//addr|//addr|//addr|//addr|//addr
|//standardIndustryClassCode|//standardIndustryClassCode|//standardIndustryClassCode|//standardIndustryClassCode|//standardIndustryClassCode|//code
|//asOrganizationPartOf (recursive)|//asOrganizationPartOf (recursive)|//asOrganizationPartOf (recursive)|//asOrganizationPartOf (recursive)|//asOrganizationPartOf

The general process for creating FHIR resources from CDA Participations is as follows:

- If the device element is populated (Author and Participation), create a **Device** resource
- If the relatedPerson element is present (Informant only) or Participant/@typeCode indicates a non-clinical Person, create a **RelatedPerson** resource
- If the @typeCode (Participant only) indicates a physical location, create a **Location** resource
- If there is no person element present and only an organization element is present, create an **Organization** resource.
- If there is both a person element and either an organization or a person/code element, create a **PractitionerRole** and **Practitioner** resource. If there is an organization, also create an **Organization** resource.

*TODO: Tables for each of the above*