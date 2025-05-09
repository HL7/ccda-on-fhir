<link rel="stylesheet" href="colors.css">

CDA defines participants in a number of elements, but the structure is often similar. These represent people (usually providers), organizations, and in some cases devices, locations, or some combination of all of the above.

The FHIR equivalent of these fields are most commonly Practitioner, Organization, and PractitionerRole resources. Occasionally RelatedPerson, Device, or Location may be appropriate targets of CDA participants as well.

### Comparison of CDA Participant elements

The following table shows the common and unique fields of each CDA participation type. Since all (except Participant) are just specific flavors of participation, they can all be mapped to FHIR fairly similarly. For Participant mapping, the `@typeCode` and `@classCode` attributes are key in determining the type of FHIR resource to create.

|[Author](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-Author.html) (Non-Device)<br/>[Authenticator](https://hl7.org/cda/stds/core/StructureDefinition-Authenticator.html)<br/>[Data Enterer](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-DataEnterer.html)<br/>[EncounterParticipant](https://hl7.org/cda/stds/core/StructureDefinition-EncounterParticipant.html)<br/>[Informant](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-Informant.html) (Non-related)<br/>[LegalAuthenticator](https://hl7.org/cda/stds/core/StructureDefinition-LegalAuthenticator.html)<br/>[Performer](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-Performer2.html)<br/>[Performer (Service Event)](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-Performer1.html)|[Guardian](https://hl7.org/cda/stds/core/StructureDefinition-Guardian.html)|[Informant](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-Informant.html) (Related)|[InformationRecipient](https://hl7.org/cda/stds/core/StructureDefinition-InformationRecipient.html)|[Participant](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-Participant1.html)<br/>(Header)|[Participant](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-Participant2.html)<br/>(Entries)|
|:----|:----|:----|:----|:----|:----|
|`@typeCode=[fixed]`<br/>(single code in all but EncounterParticipant)||`@typeCode=INF`|@typeCode|@typeCode|@typeCode
|functionCode (in some)||||functionCode|sdtc:functionCode
|time (not in INF)||||time|time
|modeCode (PRF only)<br>signatureCode (Authenticators)|||||awarenessCode
|**[assignedAuthor](https://hl7.org/cda/stds/core/StructureDefinition-AssignedAuthor.html)/[Entity](https://hl7.org/cda/stds/core/StructureDefinition-AssignedEntity.html)**||**[relatedEntity](https://hl7.org/cda/stds/core/StructureDefinition-RelatedEntity.html)**|**[intendedRecipient](https://hl7.org/cda/stds/core/StructureDefinition-IntendedRecipient.html)**|**[associatedEntity](https://hl7.org/cda/stds/core/StructureDefinition-AssociatedEntity.html)**|**[participantRole](https://hl7.org/cda/stds/core/StructureDefinition-ParticipantRole.html)**
|`/@classCode=ASSIGNED`|`@classCode=GUARD`|/@classCode|/@classCode|/@classCode|/@classCode
|/id|id||/id|/id|/id
|/code|code|/code||/code|/code
|/addr|addr|/addr|/addr|/addr|/addr
|/telecom|telecom|/telecom|/telecom|/telecom|/telecom
|||/effectiveTime|
|/sdtc:patient/id|(only person or org, <br/>not both)|||
|/**assignedPerson**<br/>([Person](https://hl7.org/cda/stds/core/StructureDefinition-Person.html))|**guardianPerson**<br/>([Person](https://hl7.org/cda/stds/core/StructureDefinition-Person.html))|/**relatedPerson**<br/>([Person](https://hl7.org/cda/stds/core/StructureDefinition-Person.html))|/**informationRecipient**<br/>([Person](https://hl7.org/cda/stds/core/StructureDefinition-Person.html))|/**associatedPerson**<br/>([Person](https://hl7.org/cda/stds/core/StructureDefinition-Person.html))|/**[playingEntity](https://hl7.org/cda/stds/core/StructureDefinition-PlayingEntity.html)**
|//`@classCode=PSN`|/`@classCode=PSN`|//`@classCode=PSN`|//`@classCode=PSN`|//`@classCode=PSN`|//@classCode
|//name|/name|//name|//name|//name|//name
|//sdtc:desc|/sdtc:desc|//sdtc:desc|//sdtc:desc|//sdtc:desc|//desc
|//asPatientRelationship/code|/asPatientRelationship/code|//asPatientRelationship/code|//asPatientRelationship/code|//asPatientRelationship/code
||||||//code
||||||//quantity
||||||//sdtc:birthTime
|/**representedOrganization**<br/>([Organization](https://hl7.org/cda/stds/core/StructureDefinition-Organization.html))|**guardianOrganization**<br/>([Organization](https://hl7.org/cda/stds/core/StructureDefinition-Organization.html))||/**receivedOrganization**<br/>([Organization](https://hl7.org/cda/stds/core/StructureDefinition-Organization.html))|/**scopingOrganization**<br/>([Organization](https://hl7.org/cda/stds/core/StructureDefinition-Organization.html))|/**scopingEntity**<br/>([Entity](https://hl7.org/cda/stds/core/StructureDefinition-Entity.html))
|//`@classCode=ORG`|/`@classCode=ORG`||//`@classCode=ORG`|//`@classCode=ORG`|//@classCode
|//id|/id||//id|//id|//id
//name|/name||//name|//name|//desc
//telecom|/telecom||//telecom|//telecom
//addr|/addr||//addr|//addr
|//standardIndustryClassCode|/standardIndustryClassCode||//standardIndustryClassCode|//standardIndustryClassCode|//code
|//asOrganizationPartOf (recursive)|/asOrganizationPartOf||//asOrganizationPartOf|//asOrganizationPartOf

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

#### Example - CDA to FHIR Organization
Note - the CDA tag could be any number of organization tags like `<representedOrganization>`, `<scopingOrganization>`, etc.
<table><tr><th>CDA Organization</th><th>FHIR Organization</th></tr>
<tr><td>
<div id="cda" class="border codeArea">&lt;<span class="field">Organization</span>&gt;
  &lt;<span class="field">id</span> <span class="attrib">extension=</span><mark class="color10"><span class="value">"3"</span></mark>
    <span class="attrib">root=</span><span class="value">"<mark class="color11">1.3.6.1.4.1.22812.3.2009316.3</mark>"</span> /&gt;
  &lt;<span class="field">name</span>&gt;<mark class="color12">Primary Care Partners Test</mark>&lt;/<span class="field">name</span>&gt;
  &lt;<span class="field">telecom</span> <span class="attrib">use=</span><mark class="color13"><span class="value">"WP"</span></mark> 
    <span class="attrib">value=</span><span class="value">"tel:<mark class="color14">+1-(676)857-6769</mark>"</span> /&gt;
  &lt;<span class="field">addr</span> <span class="attrib">use=</span><mark class="color13"><span class="value">"WP"</span></mark>&gt;
    &lt;<span class="field">streetAddressLine</span>&gt;<mark class="color15">123 main street</mark>&lt;/<span class="field">streetAddressLine</span>&gt;
    &lt;<span class="field">city</span>&gt;<mark class="color16">Chicago</mark>&lt;/<span class="field">city</span>&gt;
    &lt;state<mark class="color17">&gt;IL&lt;</mark>/state&gt;
    &lt;<span class="field">postalCode</span>&gt;<mark class="color18">60629</mark>&lt;/<span class="field">postalCode</span>&gt;
  &lt;/<span class="field">addr</span>&gt;
&lt;/<span class="field">Organization</span>&gt;</div>
</td><td>
<div id="fhir" class="border codeArea">{
  "<span class="field">resourceType</span>": "<span class="value">Organization</span>",
  "<span class="field">identifier</span>": [{
    "<span class="field">value</span>": <mark class="color10">"3"</mark>,
    "<span class="field">system</span>": "<span class="value">urn:oid:<mark class="color11">1.3.6.1.4.1.22812.3.2009316.3</mark></span>"
  }],
  "<span class="field">name</span>": "<span class="value"><mark class="color12">Primary Care Partners Test</mark></span>",
  "<span class="field">address</span>": [{
    "<span class="field">use</span>": "<span class="value"><mark class="color13">work</mark></span>",
    "<span class="field">line</span>": [ "<mark class="color15">123 main street</mark>" ],
    "<span class="field">city</span>": "<span class="value"><mark class="color16">Chicago</mark></span>",
    "<span class="field">state</span>": <mark class="color17">"IL"</mark>,
    "<span class="field">postalCode</span>": "<span class="value"><mark class="color18">60629</mark></span>"
  }],
  "<span class="field">telecom</span>": [{
    "<span class="field">value</span>": "<span class="value"><mark class="color14">+1-(676)857-6769</mark></span>",
    "<span class="field">use</span>": "<span class="value"><mark class="color13">work</mark></span>",
    "<span class="field">system</span>": "<span class="value">phone</span>"
  }],
  "<span class="field">active</span>": true
}</div>
</td></tr></table>

### CDA to FHIR Practitioner

|[AssignedAuthor](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-AssignedAuthor.html)<br/>[AssignedEntity](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-AssignedEntity.html)<br/>[AssociatedEntity](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-AssociatedEntity.html)<br/>[ParticipantRole](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-ParticipantRole.html)|[Practitioner](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-practitioner.html)|Transform Steps|
|:----|:----|:----|
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/code||See [See Mapping code](#mapping-code)<br/>In most cases, the presence of a `<code>` requires a PractitionerRole resource.|
|/addr|.address|[CDA id ↔ FHIR address](mappingGuidance.html#cda-addr--fhir-address)<br/>In FHIR this is a non-role-specific, such as a home address.<br/>If this represents a role address, this should go into PractitionerRole.address.|
|/telecom|.telecom|[CDA id ↔ FHIR telecom](mappingGuidance.html#cda-telecom--fhir-telecom)|
|**[Person](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-Person.html)<br/>[PlayingEntity](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-PlayingEntity.html)**||Person is the CDA data type for `<assignedPerson>` and `<associatedPerson>`.|
|//name|.name|[CDA name ↔ FHIR name](mappingGuidance.html#cda-name--fhir-name)|
|//name/suffix|.qualification.code|If the suffix contains a qualifier like PhD, CNP, etc.|
|//desc|.qualification.code<br/>or<br/>.text|Only map to qualifier if desc contains a qualifier.
