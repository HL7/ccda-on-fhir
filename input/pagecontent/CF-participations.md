<link rel="stylesheet" href="colors.css">

CDA defines participants in a number of elements, but the structure is often similar. These represent people (usually providers), organizations, and in some cases devices, locations, or some combination of all of the above.

The FHIR equivalent of these fields are most commonly Practitioner, Organization, and PractitionerRole resources. Occasionally RelatedPerson, Device, or Location may be appropriate targets of CDA participants as well.

### Comparison of CDA Participant elements

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
||||||//code
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

### Mapping to different FHIR resource types

The general process for creating FHIR resources from CDA Participations is as follows:

- If the device element is populated (Author and Participation), create a **[Device](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-implantable-device.html)** resource
- If the relatedPerson element is present (Informant only), the `<asPatientRelationship>` element is present, or Participant/@typeCode indicates a non-clinical Person, create a **[RelatedPerson](https://hl7.org/fhir/us/core/StructureDefinition-us-core-relatedperson.html)** resource. Note that RelatedPerson has no Organization component, so if CDA conveys an organization, an additional Person resource may need to be created with a `level4` link to RelatedPerson.
- If the @typeCode (Participant only) indicates a physical location, create a **[Location](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-location.html)** resource.
- If there is no person element present and only an organization element is present, create an **[Organization](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-organization.html)** resource.
- If there is both a person element and either an organization or a person/code element (see below for more details), create a **[PractitionerRole](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-practitionerrole.html)** and **[Practitioner](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-practitioner.html)** resource. If there is an organization, also create an **[Organization](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-organization.html)** resource.

In some cases a specific FHIR resource type may not be allowed (for example, a `.recorder` that can reference Practitioner or PractitionerRole but not Device). Implementers should be aware of requirements and make adjustments accordingly.

### Mapping functionCode & time
In most cases the `<functionCode>` and `<time>` properties correspond to fields in the resource that is referencing the practitioner. For example, Encounter.participant.individual points to Practitioner, while CDA's `<functionCode>` would map to Encounter.participant.type. Likewise, `<time>` often maps to fields like `recorded` or `assertedDate`.

### Mapping id
Though the `<id>` element in CDA is recorded at the role level, it is used to represent the id of the person, not their role. For example, clinicians' NPI's are recorded here. For this reason, the `<id>` should always be mapped to Practitioner.identifier or RelatedPerson.identifier, not to PractitionerRole.identifier

Note that this is different than the `<id>` underneath `<representedOrganization>` or `<scopingOrganization>` which maps to the identifier in an Organization resource.

### Mapping code
The `<code>` element in CDA is ambiguous and mapping to FHIR often depends on context and/or the coding system used. Common mappings to FHIR locations include:

- **PractitionerRole.code** - role the participant is playing
- **PractitionerRole.specialty** - specific specialty of the provider
- **RelatedPerson.relationship** - when talking about a non-provider (though `<asPatientRelationship>/<code>` is a more appropriate location, it is a recently-added extension and not commonly populated)
- **Practitioner**.qualification.code - uncommon; this is more commonly found in name/suffix

Additionally, if there is a `<representedOrganization>` or `<scopingOrganization>` with *only* a `<standardIndustryClassCode>` populated, this could also indicate specialty.

### Practitioner vs ParticipantRole
When there is information about a person AND an organization, the PractitionerRole resource should be created to represent the role that person plays at that organization.

Additionally, if `<code>` corresponds to role code or specialty, the PractitionerRole resource is the only way to convey this information.

### CDA to FHIR Organization
Note when the only field populated is `<standardIndustryClassCode>`, the Organization resource can be omitted and simply populate the PractitionerRole.specialty.

|CDA [Organization](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-Organization.html)|CDA [Participant/scopingEntity](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-Entity.html)<br/>(Only when `@classCode` = `ORG` or a similar class)|FHIR [Organization](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-organization.html)|Transform Steps|
|:----|:----|:---|:---|
|/id|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/name|/desc|.name|This is just a string in FHIR
|/telecom|/telecom|.telecom|[CDA id ↔ FHIR telecom](mappingGuidance.html#cda-telecom--fhir-telecom)|
|/addr|/addr|.address|[CDA id ↔ FHIR address](mappingGuidance.html#cda-addr--fhir-address)|
|/standardIndustryClassCode|/code|.type|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)
|/asOrganizationPartOf|/asOrganizationPartOf|.partOf|Recursive Organization reference

### CDA to FHIR Practitioner

|[AssignedAuthor](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-AssignedAuthor.html)<br/>[AssignedEntity](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-AssignedEntity.html)<br/>[AssociatedEntity](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-AssociatedEntity.html)<br/>[ParticipantRole](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-ParticipantRole.html)|[Practitioner](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-practitioner.html)|Transform Steps|
|:----|:----|:----|
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/code||[See Mapping code](#mapping-code)|
|/addr|.address|[CDA id ↔ FHIR address](mappingGuidance.html#cda-addr--fhir-address)|
|/telecom|.telecom|[CDA id ↔ FHIR telecom](mappingGuidance.html#cda-telecom--fhir-telecom)|
|**[Person](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-Person.html)<br/>[PlayingEntity](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-PlayingEntity.html)**||Person is the CDA data type for `<assignedPerson>` and `<associatedPerson>`.|
|//name|.name|[CDA name ↔ FHIR name](mappingGuidance.html#cda-name--fhir-name)|
|//name/suffix|.qualification.code|If the suffix contains a qualifier like PhD, CNP, etc.|
|//desc|.qualification.code<br/>or<br/>.text|Only map to qualifier if desc contains a qualifier.
