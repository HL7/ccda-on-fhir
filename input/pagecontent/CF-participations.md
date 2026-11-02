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
|/**assignedAuthoringDevice**<br/>([AuthoringDevice](https://hl7.org/cda/stds/core/StructureDefinition-AuthoringDevice.html))<br/>(Author only)|||||/**playingDevice**<br/>([Device](https://hl7.org/cda/stds/core/StructureDefinition-Device.html))
|//`@classCode=DEV`|||||//`@classCode=DEV`
||||||//code
|//manufacturerModelName|||||//manufacturerModelName
|//softwareName|||||//softwareName
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

- If the device element is populated, create a **Device** resource: base R4 Device for an authoring device, US Core Implantable Device for a product instance. See [CDA to FHIR Device](#cda-to-fhir-device).
- If the relatedPerson element is present (Informant only), the `<asPatientRelationship>` element is present, or Participant/@typeCode indicates a non-clinical Person, create a **[RelatedPerson](https://hl7.org/fhir/us/core/StructureDefinition-us-core-relatedperson.html)** resource. Note that RelatedPerson has no Organization component, so if CDA conveys an organization, an additional Person resource may need to be created with a `level4` link to RelatedPerson.
- If the @typeCode (Participant only) indicates a physical location, create a **[Location](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-location.html)** resource.
- If there is no person element present and only an organization element is present, create an **[Organization](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-organization.html)** resource.
- If there is both a person element and either an organization or a person/code element (see below for more details), create a **[PractitionerRole](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-practitionerrole.html)** and **[Practitioner](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-practitioner.html)** resource. If there is an organization, also create an **[Organization](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-organization.html)** resource. Document authors always get a PractitionerRole, even one holding only the practitioner reference, so that `Composition.author` has a single shape.

In some cases a specific FHIR resource type may not be allowed (for example, a `.recorder` that can reference Practitioner or PractitionerRole but not Device). Implementers should be aware of requirements and make adjustments accordingly.

### Mapping functionCode & time
In most cases the `<functionCode>` and `<time>` properties correspond to fields in the resource that is referencing the practitioner. For example, Encounter.participant.individual points to Practitioner, while CDA's `<functionCode>` would map to Encounter.participant.type. Likewise, `<time>` often maps to fields like `recorded` or `assertedDate`. For a document author, `<time>` maps to the `author-time` extension on `Composition.author` (see the [US Realm Header](StructureDefinition-US-Realm-Header.html) profile) and to `Provenance.recorded`.

### Mapping id
Though the `<id>` element in CDA is recorded at the role level, it is used to represent the id of the person, not their role. For example, clinicians' NPI's are recorded here. For this reason, the `<id>` should be mapped to Practitioner.identifier or RelatedPerson.identifier, not to PractitionerRole.identifier. The exception is an id known to identify the role rather than the person (a local role id distinct from the NPI); that one goes to PractitionerRole.identifier and is the key for collapsing duplicate roles

Note that this is different than the `<id>` underneath `<representedOrganization>` or `<scopingOrganization>` which maps to the identifier in an Organization resource.

### Mapping code
The `<code>` element in CDA is ambiguous and mapping to FHIR often depends on context and/or the coding system used. Common mappings to FHIR locations include:

- **PractitionerRole.code** - role the participant is playing
- **PractitionerRole.specialty** - specific specialty of the provider
- **RelatedPerson.relationship** - when talking about a non-provider (though `<asPatientRelationship>/<code>` is a more appropriate location, it is a recently-added extension and not commonly populated)
- **Practitioner**.qualification.code - uncommon; this is more commonly found in name/suffix

Additionally, if there is a `<representedOrganization>` or `<scopingOrganization>` with *only* a `<standardIndustryClassCode>` populated, this could also indicate specialty.

### Practitioner vs PractitionerRole
When there is information about a person AND an organization, the PractitionerRole resource should be created to represent the role that person plays at that organization.

Additionally, if `<code>` corresponds to role code or specialty, the PractitionerRole resource is the only way to convey this information.

### CDA to FHIR Organization
Note when the only field populated is `<standardIndustryClassCode>`, the Organization resource can be omitted and simply populate the PractitionerRole.specialty.

|CDA [Organization](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-Organization.html)|CDA [Participant/scopingEntity](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-Entity.html)<br/>(Only when `@classCode` = `ORG` or a similar class)|FHIR [Organization](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-organization.html)|Transform Steps|
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

A Practitioner carries what belongs to the person independent of any role: identifiers of the person, the person's own name, and the person's own contact details. Everything that belongs to the role (organization, specialty, work address and telecom) goes to [PractitionerRole](#cda-to-fhir-practitionerrole).

|[AssignedAuthor](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-AssignedAuthor.html)<br/>[AssignedEntity](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-AssignedEntity.html)<br/>[AssociatedEntity](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-AssociatedEntity.html)<br/>[ParticipantRole](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-ParticipantRole.html)|[Practitioner](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-practitioner.html)|Transform Steps|
|:----|:----|:----|
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)<br/>Identifiers of the person belong here: NPI (root `2.16.840.1.113883.4.6` → system `http://hl7.org/fhir/sid/us-npi`), DEA, state license. They are the key for [collapsing duplicates](#entity-collapse-across-participations). See [Mapping id](#mapping-id).|
|/code||See [Mapping code](#mapping-code). A `<code>` describes the role or specialty and is carried on PractitionerRole, not Practitioner.|
|/addr|.address|[CDA addr ↔ FHIR address](mappingGuidance.html#cda-addr--fhir-address)<br/>Only an address of the person (typically `@use="H"`). A work address (`@use="WP"`) belongs to the role; see PractitionerRole.|
|/telecom|.telecom|[CDA telecom ↔ FHIR telecom](mappingGuidance.html#cda-telecom--fhir-telecom)<br/>Only contact points of the person (`@use="H"`, `@use="MC"`). Work contact points (`@use="WP"`) belong to the role; see PractitionerRole.|
|**[Person](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-Person.html)<br/>[PlayingEntity](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-PlayingEntity.html)**||Person is the CDA type of `<assignedPerson>` and `<associatedPerson>`; PlayingEntity is the type of entry participants.|
|//name|.name|[CDA name ↔ FHIR name](mappingGuidance.html#cda-name--fhir-name)|
|//name/suffix|.qualification.code|Only when the suffix is a credential (MD, PhD, CNP). Generational suffixes (Jr., III) stay in `.name.suffix`.|
|//sdtc:desc|.qualification.code<br/>or<br/>.text|Only map to a qualification when the description is a credential; otherwise carry it in the narrative.|
|/assignedAuthoringDevice|—|An authoring device becomes a **Device**, not a Practitioner.|
|/sdtc:patient/id|—|An author identified as the patient is the **Patient** resource, not a Practitioner.|

### CDA to FHIR PractitionerRole

Create a PractitionerRole whenever the participation carries role-scoped content: an organization, a role or specialty code, a role identifier, or work contact details. Document authors always get a PractitionerRole, even one holding only the practitioner reference, so that `Composition.author` has a single shape.

The target is base R4 [PractitionerRole](https://hl7.org/fhir/R4/practitionerrole.html). Assert the [US Core PractitionerRole](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-practitionerrole.html) profile in addition when the role carries a telecom or endpoint; US Core's invariant `pd-1` rejects a role with neither.

|[AssignedAuthor](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-AssignedAuthor.html)<br/>[AssignedEntity](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-AssignedEntity.html)<br/>[AssociatedEntity](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-AssociatedEntity.html)<br/>[ParticipantRole](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-ParticipantRole.html)|[PractitionerRole](https://hl7.org/fhir/R4/practitionerrole.html)|Transform Steps|
|:----|:----|:----|
|(the participation)|.practitioner → **Practitioner**|Reference to the Practitioner created from the same participation. Always present.|
||.active|`true`|
|/id|.identifier|Only when the id identifies the role rather than the person (a local or organizational role id). An NPI goes to `Practitioner.identifier`. When in doubt, prefer Practitioner. Role identifiers are the key for collapsing duplicate roles.|
|/code|.specialty|When the code is from a specialty vocabulary such as the NUCC Healthcare Provider Taxonomy (`2.16.840.1.113883.6.101`).<br/>[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/code|.code|When the code names the role played (RoleCode, ParticipationFunction, SNOMED CT occupation).<br/>[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/addr|.location → contained **Location**.address|A work address (`@use="WP"`) or any address that belongs to the role. The Location is contained in the PractitionerRole because a role's address has no identity of its own.<br/>[CDA addr ↔ FHIR address](mappingGuidance.html#cda-addr--fhir-address)|
|/telecom|.telecom|Work contact points (`@use="WP"`).<br/>[CDA telecom ↔ FHIR telecom](mappingGuidance.html#cda-telecom--fhir-telecom)|
|/representedOrganization<br/>/scopingOrganization|.organization → **Organization**|See [CDA to FHIR Organization](#cda-to-fhir-organization).|
|/representedOrganization/standardIndustryClassCode<br/>(when it is the only organization field)|.specialty|The Organization resource may be omitted.<br/>[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|../functionCode<br/>../sdtc:functionCode|—|No PractitionerRole slot. Map to the participant type of the referencing resource; see [Mapping functionCode & time](#mapping-functioncode--time).|
|../time|—|Map to the date element of the referencing resource; see [Mapping functionCode & time](#mapping-functioncode--time).|

### CDA to FHIR RelatedPerson

A person who participates without a provider role is a RelatedPerson: an informant represented by `<relatedEntity>`, the patient's `<guardian>`, and header or entry participants whose role class is a personal relationship (`PRS`, `NOK`, `ECON`, `CAREGIVER`, `AGNT`, `GUARD`) or whose playing entity is a non-clinical person.

Guardian has two homes. The [Patient](CF-patient.html) page maps `recordTarget/patientRole/patient/guardian` to `Patient.contact`, which remains the primary representation. Create a RelatedPerson for the guardian in addition only when another resource must reference the guardian, for example as informant or author, and give it the same identifier so the two can be reconciled.

|[RelatedEntity](https://hl7.org/cda/stds/core/StructureDefinition-RelatedEntity.html)<br/>[Guardian](https://hl7.org/cda/stds/core/StructureDefinition-Guardian.html)<br/>[AssociatedEntity](https://hl7.org/cda/stds/core/StructureDefinition-AssociatedEntity.html)<br/>[ParticipantRole](https://hl7.org/cda/stds/core/StructureDefinition-ParticipantRole.html)|[RelatedPerson](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-relatedperson.html)|Transform Steps|
|:----|:----|:----|
||.patient → **Patient**|Reference to the document's Patient. Required by US Core.|
||.active|`true`|
|/@classCode|.relationship|When the class is a relationship (`PRS`, `NOK`, `ECON`, `CAREGIVER`, `AGNT`, `GUARD`), map the RoleClass code as one `relationship` coding. For a guardian use `GUARD`, optionally adding SNOMED CT `394619001` (Guardian). Generic classes (`ROL`, `ASSIGNED`) are not mapped.|
|/code|.relationship|The personal relationship (RoleCode `FTH`, `MTH`, `SPS`, and so on) as an additional `relationship` repetition.<br/>[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|//asPatientRelationship/code|.relationship|Preferred source when present; rarely populated.|
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/addr|.address|[CDA addr ↔ FHIR address](mappingGuidance.html#cda-addr--fhir-address)|
|/telecom|.telecom|[CDA telecom ↔ FHIR telecom](mappingGuidance.html#cda-telecom--fhir-telecom)|
|/effectiveTime (RelatedEntity)<br/>../time (Participant)|.period|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|/relatedPerson/name<br/>guardianPerson/name<br/>/associatedPerson/name<br/>/playingEntity/name|.name|[CDA name ↔ FHIR name](mappingGuidance.html#cda-name--fhir-name)<br/>US Core requires a name or a relationship; a nameless related person must carry a relationship.|
|/playingEntity/sdtc:birthTime|.birthDate|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|guardianOrganization<br/>/scopingOrganization|—|RelatedPerson cannot reference an organization. When the organization matters (an agency acting as guardian), create an **Organization** and reference it from the resource that referenced the participation; see the note under [Mapping to different FHIR resource types](#mapping-to-different-fhir-resource-types).|

### CDA to FHIR Device

Devices appear in two unrelated places in a C-CDA document, and they map to different FHIR shapes.

- **Authoring device.** An Author participation (header or entry) whose `<assignedAuthor>` carries `<assignedAuthoringDevice>` instead of `<assignedPerson>`: the EHR or other software that produced the content. The target is base R4 [Device](https://hl7.org/fhir/R4/device.html). It is referenced from `Composition.author` or `Provenance.agent.who` exactly as a PractitionerRole would be.
- **Product instance.** An entry participant with `@typeCode="DEV"` and the [Product Instance](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-ProductInstance.html) template, usually inside a Procedure Activity, identifying a device used on or implanted in the patient. The target is [US Core Implantable Device](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-implantable-device.html). The [UDI Organizer](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-UDIOrganizer.html), when present, carries the parsed UDI components for the same device and fills the remaining profile elements.

#### Authoring device to Device

|C-CDA<br/>[AssignedAuthor](https://hl7.org/cda/stds/core/2.0.0-sd/StructureDefinition-AssignedAuthor.html)|FHIR<br/>[Device](https://hl7.org/fhir/R4/device.html)|Transform Steps|
|:----|:----|:----|
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
||.type|Not available in CDA. Omit, or use a local code for software.|
|/assignedAuthoringDevice/manufacturerModelName|.deviceName.name<br/>with .deviceName.type = `model-name`|Also usable as `.modelNumber` when the content is a model number rather than a name.|
|/assignedAuthoringDevice/softwareName|.deviceName.name<br/>with .deviceName.type = `other`|When the string is a version, `.version.value` is the better home.|
|/representedOrganization|.owner → **Organization**|See [CDA to FHIR Organization](#cda-to-fhir-organization).|
|/addr<br/>/telecom|—|A device has no contact details of its own in FHIR R4. Carry them on the owning Organization when present; otherwise drop.|
|../time|—|Author time: see [Mapping functionCode & time](#mapping-functioncode--time).|

#### Product Instance to Implantable Device

The UDI is carried in `participantRole/id`: the `@root` identifies the issuing agency (FDA UDI, `2.16.840.1.113883.3.3719`) and the `@extension` is the full UDI in human-readable form. The Device must reference the patient; US Core requires both `.patient` and `.type`.

|C-CDA<br/>[Product Instance](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-ProductInstance.html)<br/>/participant[@typeCode="DEV"]/participantRole|FHIR<br/>[Implantable Device](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-implantable-device.html)|Transform Steps|
|:----|:----|:----|
|/id|.udiCarrier.carrierHRF|The full UDI string. Set `.udiCarrier.issuer` to the URI for the agency named by `@root` (FDA UDI → `http://hl7.org/fhir/NamingSystem/fda-udi`). When the UDI can be parsed, also populate `.udiCarrier.deviceIdentifier` and the production identifiers (lot, serial, dates) below.|
|/id|.identifier|Ids whose `@root` is not a UDI issuing agency are ordinary identifiers.<br/>[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/playingDevice/code|.type|Required by US Core. If the CDA code is absent, derive from the UDI Device Identifier (GUDID lookup) or use the Procedure's context.<br/>[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/playingDevice/manufacturerModelName|.deviceName.name<br/>with .deviceName.type = `model-name`||
|/playingDevice/softwareName|.version.value||
|/scopingEntity/id|—|Identifies the UDI issuing agency; consumed by `.udiCarrier.issuer` above.|
|/scopingEntity/desc|.manufacturer|When present.|
||.patient → **Patient**|Required by US Core.|
|(the containing procedure)||Reference the Device from `Procedure.focalDevice.manipulated` when the device was implanted, removed or adjusted, otherwise from `Procedure.usedReference`. See [Procedures](CF-procedures.html).|

#### UDI Organizer to Implantable Device

The organizer (template `2.16.840.1.113883.10.20.22.4.311`, LOINC `74711-3`) groups one Device Identifier Observation with optional component observations, each coded with an NCI Thesaurus code. All of them map onto the single Device created for the product instance. Match the organizer to the product instance by the Device Identifier.

|C-CDA<br/>[UDI Organizer](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-UDIOrganizer.html)<br/>/component/observation[code/@code=…]|FHIR<br/>[Implantable Device](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-implantable-device.html)|Transform Steps|
|:----|:----|:----|
|`C101722` Device Identifier<br/>/value[xsi:type=II]|.udiCarrier.deviceIdentifier|`@extension` holds the UDI-DI; `@root` names the issuing agency.|
|`C101672` Lot or Batch Number<br/>/value|.lotNumber||
|`C101671` Serial Number<br/>/value|.serialNumber||
|`C101669` Manufacturing Date<br/>/value|.manufactureDate|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|`C101670` Expiration Date<br/>/value|.expirationDate|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|`C113843` Distinct Identification Code<br/>/value|.distinctIdentifier||
|`C71898` Brand Name<br/>/value|.deviceName.name<br/>with .deviceName.type = `manufacturer-name`||
|`C99285` Model Number<br/>/value|.modelNumber||
|`C99286` Catalog Number<br/>/value|.property<br/>with .property.type = `C99286`, .property.valueCode.text = value|R4 Device has no catalog number element.|
|`C54131` Company Name<br/>/value|.manufacturer||
|`C106044` MRI Safety<br/>/value|.property<br/>with .property.type = `C106044`, .property.valueCode = value|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|`C160938` Latex Safety<br/>/value|.property<br/>with .property.type = `C160938`, .property.valueCode = value|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|`C160939` Implantable Device Status<br/>/value|**Not Supported**|FHIR `Device.status` describes the record, not the implant. Carry the status in the narrative, or on the Procedure that implanted or removed the device.|

### Entity collapse across participations

CDA cannot let one participation refer to another, so the same person is restated at every participation. The transform collapses these restatements by the following rules.

- Match by identifier only: exact `root` and `extension` equality. Names and demographics are never used to match. No identifier, no match.
- Match at the right tier. Person identifiers (NPI) merge Practitioners; role identifiers merge PractitionerRoles. The same person in two roles yields one Practitioner and two PractitionerRoles. Identifiers match only within one resource type, so an entity that is a Practitioner in one participation and a RelatedPerson in another is not merged.
- On a match, merge as a superset: equal elements once, elements present in one instance only are kept, disagreeing repeating elements are unioned.
- A disagreement in a single-cardinality element blocks the collapse. Instantiate both with the same identifier and let each participation reference its own instance.
- Scope is one document. Reconciliation across documents belongs to the receiver.
